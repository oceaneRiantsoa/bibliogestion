package com.example.biblio.repository;

import com.example.biblio.model.entity.Adherent;
import com.example.biblio.model.entity.Pret;
import org.springframework.data.jpa.repository.JpaRepository;
import java.util.List;

public interface PretRepository extends JpaRepository<Pret, Long> {
    long countByAdherentAndStatut_Libelle(Adherent adherent, String libelle);
     List<Pret> findByAdherent(Adherent adherent);
}