package com.example.biblio.repository;

import com.example.biblio.model.entity.Abonnement;
import com.example.biblio.model.entity.Adherent;
import org.springframework.data.jpa.repository.JpaRepository;

import java.time.LocalDate;
import java.util.List;

public interface AbonnementRepository extends JpaRepository<Abonnement, Long> {
    List<Abonnement> findByAdherent(Adherent adherent);
    boolean existsByAdherentAndDateDebutLessThanEqualAndDateFinGreaterThanEqual(Adherent adherent, LocalDate now1, LocalDate now2);
} {
    
}
