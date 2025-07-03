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


    public Pret fairePret(Adherent adherent, Exemplaire exemplaire, LocalDate dateRetourPrevue, Emplacement emplacement, Statut statut) {
    // 1. Vérifier la pénalité en cours
    boolean penalise = penaliteRepository.existsByAdherentAndLeveeFalseAndDateFinAfter(adherent, LocalDate.now());
    if (penalise) {
        throw new IllegalStateException("Cet adhérent est pénalisé et ne peut pas emprunter pour le moment.");
    }

    // 2. Vérifier l'abonnement actif
    boolean abonne = abonnementRepository.existsByAdherentAndDateDebutLessThanEqualAndDateFinGreaterThanEqual(
        adherent, LocalDate.now(), LocalDate.now());
    if (!abonne) {
        throw new IllegalStateException("Cet adhérent n'a pas d'abonnement actif.");
    }

   // 3. Vérifier le quota de prêts
    long nbPretsEnCours = pretRepository.countByAdherentAndStatut_Libelle(adherent, "en_cours");
    int quotaMax = adherent.getProfil() != null ? adherent.getProfil().getQuotaMaxPret() : 0;
    if (nbPretsEnCours >= quotaMax) {
        throw new IllegalStateException("Quota de prêts atteint pour cet adhérent.");
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
    pret.setDatePret(LocalDate.now());
    pret.setDateRetourPrevue(dateRetourPrevue);
    pret.setEmplacement(emplacement);
    pret.setStatut(statut);

    exemplaire.setDisponible(false);
    exemplaireRepository.save(exemplaire);

    return pretRepository.save(pret);
}

      public String rendrePret(Pret pret, LocalDate dateRendu) {
    Exemplaire exemplaire = pret.getExemplaire();
    Adherent adherent = pret.getAdherent();

    long retard = ChronoUnit.DAYS.between(pret.getDateRetourPrevue(), dateRendu);
    String message;

    if (retard > 0) {
        Penalite penalite = new Penalite();
        penalite.setAdherent(adherent);
        penalite.setRaison("Retard de retour");
        penalite.setDatePenalite(dateRendu);
        penalite.setDateFin(dateRendu.plusDays(retard));
        penalite.setLevee(false);
        penaliteRepository.save(penalite);
        message = "Livre rendu avec " + retard + " jour(s) de retard. Vous êtes pénalisé pour " + retard + " jour(s).";
    } else {
        message = "Livre rendu à temps. Merci !";
    }

    // Supprimer les prolongements liés AVANT de supprimer le prêt
    prolongementRepository.deleteAll(
        prolongementRepository.findAll().stream()
            .filter(p -> p.getPret().getIdPret().equals(pret.getIdPret()))
            .toList()
    );

    pretRepository.delete(pret);
    exemplaire.setDisponible(true);
    exemplaireRepository.save(exemplaire);

    return message;
}
}
