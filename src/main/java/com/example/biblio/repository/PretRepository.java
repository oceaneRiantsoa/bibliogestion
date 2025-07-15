package com.example.biblio.repository;

import com.example.biblio.model.entity.Adherent;
import com.example.biblio.model.entity.Exemplaire;
import com.example.biblio.model.entity.Pret;
import org.springframework.data.jpa.repository.JpaRepository;

import java.time.LocalDate;
import java.util.List;

public interface PretRepository extends JpaRepository<Pret, Long> {
    long countByAdherentAndStatut_Libelle(Adherent adherent, String libelle);
     List<Pret> findByAdherent(Adherent adherent);

    // ...existing code...
    long countByAdherentAndStatut_LibelleAndDatePretLessThanEqualAndDateRetourPrevueGreaterThanEqual(
        Adherent adherent, String statut, LocalDate datePret, LocalDate datePret2);

    boolean existsByExemplaireAndStatut_LibelleAndDatePretLessThanEqualAndDateRetourPrevueGreaterThanEqual(
        Exemplaire exemplaire, String statut, LocalDate datePret, LocalDate datePret2);
// ...existing code...

    }