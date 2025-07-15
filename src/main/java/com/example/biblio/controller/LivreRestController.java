package com.example.biblio.controller;

import com.example.biblio.model.entity.Exemplaire;
import com.example.biblio.model.entity.Livre;
import com.example.biblio.repository.LivreRepository;
import com.example.biblio.repository.ExemplaireRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@RestController
@RequestMapping("/livre")
public class LivreRestController {

    @Autowired
    private LivreRepository livreRepository;
    @Autowired
    private ExemplaireRepository exemplaireRepository;

    @GetMapping("/{id}")
    public Map<String, Object> getLivreDetails(@PathVariable Long id) {
    Livre livre = livreRepository.findById(id).orElseThrow();
    List<Exemplaire> exemplaires = exemplaireRepository.findByLivre_IdLivre(id);

    long nbExemplaires = exemplaires.size();

    List<Map<String, Object>> exemplairesJson = new ArrayList<>();
    for (Exemplaire ex : exemplaires) {
        Map<String, Object> exJson = new HashMap<>();
        exJson.put("idExemplaire", ex.getIdExemplaire());
        exJson.put("etat", ex.getEtat());
        exJson.put("disponible", ex.getDisponible());
        exemplairesJson.add(exJson);
    }

    Map<String, Object> result = new HashMap<>();
    result.put("id", livre.getIdLivre());
    result.put("titre", livre.getTitre());
    result.put("auteur", livre.getAuteur());
    result.put("genre", livre.getGenre());
    result.put("annee", livre.getAnnee());
    result.put("ageMinimum", livre.getAgeMinimum());
    result.put("nombreExemplaires", nbExemplaires);
    result.put("exemplaires", exemplairesJson);
    return result;
}
}