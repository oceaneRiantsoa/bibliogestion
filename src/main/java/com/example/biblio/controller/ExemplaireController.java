package com.example.biblio.controller;

import com.example.biblio.service.ExemplaireService;
import com.example.biblio.model.entity.Adherent;
import com.example.biblio.model.entity.Pret;
import com.example.biblio.model.entity.Prolongement;
import com.example.biblio.repository.PretRepository;
import com.example.biblio.repository.ProlongementRepository;

import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/liste-exemplaires")
public class ExemplaireController {
    @Autowired
    private ExemplaireService exemplaireService;
    @Autowired
    private PretRepository pretRepository;
    @Autowired
    private ProlongementRepository prolongementRepository;

    @GetMapping
public String listExemplairesDisponibles(Model model, HttpSession session) {
    model.addAttribute("exemplaires", exemplaireService.findAllDisponibles());

    Adherent adherent = (Adherent) session.getAttribute("adherent");
    if (adherent != null) {
        List<Pret> prets = pretRepository.findByAdherent(adherent);
        model.addAttribute("prets", prets);
        // Récupérer les prolongements pour chaque prêt
        Map<Long, Prolongement> prolongements = new HashMap<>();
        for (Pret pret : prets) {
            Prolongement p = prolongementRepository.findAll().stream()
                .filter(prol -> prol.getPret().getIdPret().equals(pret.getIdPret()))
                .reduce((first, second) -> second) // Prend le dernier s'il y en a plusieurs
                .orElse(null);
            if (p != null) {
                prolongements.put(pret.getIdPret(), p);
            }
        }
        model.addAttribute("prolongements", prolongements);
    }
    return "liste-exemplaires";
}
}