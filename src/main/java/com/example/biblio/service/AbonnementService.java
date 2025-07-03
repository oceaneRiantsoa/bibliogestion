package com.example.biblio.service;

import com.example.biblio.model.dto.AbonnementDto;
import com.example.biblio.model.entity.Abonnement;
import com.example.biblio.model.entity.Adherent;
import com.example.biblio.repository.AbonnementRepository;
import com.example.biblio.repository.AdherentRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class AbonnementService {
    @Autowired
    private AbonnementRepository abonnementRepository;
    @Autowired
    private AdherentRepository adherentRepository;

    public void creerAbonnement(AbonnementDto dto) {
        Adherent adherent = adherentRepository.findById(dto.getAdherentId()).orElseThrow();
        Abonnement abonnement = new Abonnement();
        abonnement.setAdherent(adherent);
        abonnement.setDateDebut(dto.getDateDebut());
        abonnement.setDateFin(dto.getDateFin());
        abonnementRepository.save(abonnement);
    }
}