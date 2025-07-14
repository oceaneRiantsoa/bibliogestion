package com.example.biblio.repository;

import java.util.Optional;
import com.example.biblio.model.entity.Adherent;
import com.example.biblio.model.entity.Penalite;
import org.springframework.data.jpa.repository.JpaRepository;

public interface PenaliteRepository extends JpaRepository<Penalite, Long> {
    Optional<Penalite> findFirstByAdherentAndLeveeFalseOrderByDateFinDesc(Adherent adherent);
}