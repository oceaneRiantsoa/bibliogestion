package com.example.biblio.repository;

import com.example.biblio.model.entity.Penalite;
import com.example.biblio.model.entity.Adherent;
import org.springframework.data.jpa.repository.JpaRepository;

import java.time.LocalDate;

public interface PenaliteRepository extends JpaRepository<Penalite, Long> {
    boolean existsByAdherentAndLeveeFalseAndDateFinAfter(Adherent adherent, LocalDate date);
}