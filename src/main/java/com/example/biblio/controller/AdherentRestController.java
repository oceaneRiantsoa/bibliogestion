package com.example.biblio.controller;

import com.example.biblio.model.entity.Adherent;
import com.example.biblio.model.entity.Abonnement;
import com.example.biblio.model.entity.Penalite;
import com.example.biblio.repository.AdherentRepository;
import com.example.biblio.repository.AbonnementRepository;
import com.example.biblio.repository.PenaliteRepository;
import com.example.biblio.repository.PretRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.*;

@RestController
@RequestMapping("/adherent")
public class AdherentRestController {

    @Autowired
    private AdherentRepository adherentRepository;
    @Autowired
    private AbonnementRepository abonnementRepository;
    @Autowired
    private PenaliteRepository penaliteRepository;
    @Autowired
    private PretRepository pretRepository;

    @GetMapping("/{id}")
public Map<String, Object> getAdherentInfos(@PathVariable Long id) {
    Adherent adherent = adherentRepository.findById(id).orElseThrow();

    Map<String, Object> result = new HashMap<>();
    result.put("id", adherent.getIdAdherent());
    result.put("nom", adherent.getNom());
    result.put("prenom", adherent.getPrenom());
    result.put("profil", adherent.getProfil() != null ? adherent.getProfil().getNomProfil() : null);

    // Quota
    int quotaMax = adherent.getProfil() != null ? adherent.getProfil().getQuotaMaxPret() : 0;
    long nbPrets = pretRepository.countByAdherentAndStatut_Libelle(adherent, "en_cours");
    int quotaRestant = quotaMax - (int) nbPrets;
    result.put("quotaMaxPret", quotaMax);
    result.put("nbPretsEnCours", nbPrets);
    result.put("quotaRestant", quotaRestant);

    // Abonnement actif (le plus récent)
    Optional<Abonnement> abonnementOpt = abonnementRepository.findByAdherent(adherent)
        .stream()
        .max(Comparator.comparing(Abonnement::getDateFin));
    if (abonnementOpt.isPresent()) {
        Abonnement ab = abonnementOpt.get();
        Map<String, Object> abMap = new HashMap<>();
        abMap.put("dateDebut", ab.getDateDebut());
        abMap.put("dateFin", ab.getDateFin());
        result.put("abonnement", abMap);
    } else {
        result.put("abonnement", null);
    }

    // Pénalité en cours (la plus récente non levée)
    Optional<Penalite> penaliteOpt = penaliteRepository.findFirstByAdherentAndLeveeFalseOrderByDateFinDesc(adherent);
    if (penaliteOpt.isPresent()) {
        Penalite p = penaliteOpt.get();
        Map<String, Object> penMap = new HashMap<>();
        penMap.put("raison", p.getRaison());
        penMap.put("dateDebut", p.getDatePenalite());
        penMap.put("dateFin", p.getDateFin());
        result.put("penalite", penMap);
    } else {
        result.put("penalite", null);
    }

    return result;
}
}