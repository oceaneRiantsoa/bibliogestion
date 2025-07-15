package com.example.biblio.repository;

import com.example.biblio.model.entity.Exemplaire;
import org.springframework.data.jpa.repository.JpaRepository;
import java.util.List;

public interface ExemplaireRepository extends JpaRepository<Exemplaire, Long> {
    List<Exemplaire> findByDisponibleTrue();
    List<Exemplaire> findByDisponibleTrueAndLivre_TitreContainingIgnoreCaseOrLivre_AuteurContainingIgnoreCase(String titre, String auteur);
    List<Exemplaire> findByLivre_IdLivre(Long id);
}