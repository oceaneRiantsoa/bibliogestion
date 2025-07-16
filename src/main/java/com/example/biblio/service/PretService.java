package com.example.biblio.service;

import com.example.biblio.model.entity.Adherent;
import com.example.biblio.model.entity.Exemplaire;
import com.example.biblio.model.entity.Penalite;
import com.example.biblio.model.entity.Emplacement;
import com.example.biblio.model.entity.Pret;
import com.example.biblio.model.entity.Statut;
import com.example.biblio.repository.PretRepository;
import com.example.biblio.repository.AbonnementRepository;
import com.example.biblio.repository.ExemplaireRepository;
import com.example.biblio.repository.PenaliteRepository;
import com.example.biblio.repository.ProlongementRepository;
import com.example.biblio.repository.StatutRepository;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.time.LocalDate;
import java.time.temporal.ChronoUnit;


@Service
public class PretService {
    @Autowired
    private PretRepository pretRepository;
    @Autowired
    private ExemplaireRepository exemplaireRepository;
    @Autowired
    private PenaliteRepository penaliteRepository;
    @Autowired
    private AbonnementRepository abonnementRepository;
    @Autowired
    private ProlongementRepository prolongementRepository;
    @Autowired
    private StatutRepository statutRepository;

    // ...existing code...
    public Pret fairePret(Adherent adherent, Exemplaire exemplaire, LocalDate datePret, LocalDate dateRetourPrevue, Emplacement emplacement, Statut statut) {
        // Vérifier la pénalité à la date du prêt
        Penalite penalite = penaliteRepository
            .findFirstByAdherentAndLeveeFalseOrderByDateFinDesc(adherent)
            .orElse(null);

        if (penalite != null && datePret.isBefore(penalite.getDateFin().plusDays(1))) {
            throw new IllegalStateException(
                "Cet adhérent est pénalisé jusqu'au " + penalite.getDateFin() + " et ne peut pas emprunter."
            );
        }

        // Vérifier l'abonnement actif à la date du prêt
        boolean abonne = abonnementRepository.existsByAdherentAndDateDebutLessThanEqualAndDateFinGreaterThanEqual(
            adherent, datePret, datePret);
        if (!abonne) {
            throw new IllegalStateException("Cet adhérent n'a pas d'abonnement actif.");
        }

        // Vérifier le quota de prêts à la date du prêt
        long nbPretsEnCours = pretRepository.countByAdherentAndStatut_LibelleAndDatePretLessThanEqualAndDateRetourPrevueGreaterThanEqual(
            adherent, "en_cours", datePret, datePret);
        int quotaMax = adherent.getProfil() != null ? adherent.getProfil().getQuotaMaxPret() : 0;
        if (nbPretsEnCours >= quotaMax) {
            throw new IllegalStateException("Quota de prêts atteint pour cet adhérent à cette date.");
        }

        // Vérifier la disponibilité de l'exemplaire à la date du prêt
        boolean dejaPris = pretRepository.existsByExemplaireAndStatut_LibelleAndDatePretLessThanEqualAndDateRetourPrevueGreaterThanEqual(
            exemplaire, "en_cours", datePret, datePret);
        if (dejaPris || !exemplaire.getDisponible()) {
            throw new IllegalStateException("Ce livre est déjà emprunté à la date choisie.");
        }

        // Vérifier l'âge minimum requis par le livre
        int ageAdherent = adherent.getAge() != null ? adherent.getAge() : 0;
        int ageMinLivre = exemplaire.getLivre().getAgeMinimum() != null ? exemplaire.getLivre().getAgeMinimum() : 0;
        if (ageAdherent < ageMinLivre) {
            throw new IllegalStateException("L'âge de l'adhérent est inférieur à l'âge minimum requis pour ce livre.");
        }

        // Création du prêt
        Pret pret = new Pret();
        pret.setAdherent(adherent);
        pret.setExemplaire(exemplaire);
        pret.setDatePret(datePret);
        pret.setDateRetourPrevue(dateRetourPrevue);
        pret.setEmplacement(emplacement);
        Statut statutEnCours = statutRepository.findByLibelle("en_cours")
            .orElseThrow(() -> new IllegalStateException("Statut 'en_cours' non trouvé"));
        pret.setStatut(statutEnCours);

        // Rendre l'exemplaire indisponible si le prêt commence aujourd'hui
        if (datePret.equals(LocalDate.now())) {
            exemplaire.setDisponible(false);
            exemplaireRepository.save(exemplaire);
        }

        return pretRepository.save(pret);
    }
// ...existing code...

      public String rendrePret(Pret pret, LocalDate dateRendu) {
    Exemplaire exemplaire = pret.getExemplaire();
    Adherent adherent = pret.getAdherent();

    long retard = ChronoUnit.DAYS.between(pret.getDateRetourPrevue(), dateRendu);
    String message;

    if (retard > 0) {
        // Récupérer le nombre de jours de pénalité selon le profil
        int joursPenalite = 1; // Valeur par défaut
        if (adherent.getProfil() != null && adherent.getProfil().getJourPenalite() != null) {
            joursPenalite = adherent.getProfil().getJourPenalite();
        }
        Penalite penalite = new Penalite();
        penalite.setAdherent(adherent);
        penalite.setRaison("Retard de retour");
        penalite.setDatePenalite(dateRendu);
        penalite.setDateFin(dateRendu.plusDays(joursPenalite));
        penalite.setLevee(false);
        penaliteRepository.save(penalite);
        message = "Livre rendu avec " + retard + " jour(s) de retard. Vous êtes pénalisé pour " + joursPenalite + " jour(s).";
    } else {
        message = "Livre rendu à temps. Merci !";
    }

    // Mettre à jour le statut du prêt à "termine" avant suppression
    Statut statutTermine = statutRepository.findByLibelle("termine").orElseThrow(() -> new IllegalStateException("Statut 'termine' non trouvé"));
    pret.setStatut(statutTermine);
    pretRepository.save(pret);

    // Supprimer les prolongements liés (optionnel)
    prolongementRepository.deleteAll(
        prolongementRepository.findAll().stream()
            .filter(p -> p.getPret().getIdPret().equals(pret.getIdPret()))
            .toList()
    );

    exemplaire.setDisponible(true);
    exemplaireRepository.save(exemplaire);

    return message;
}
}
