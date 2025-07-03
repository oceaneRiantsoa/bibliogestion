package com.example.biblio.controller;

import com.example.biblio.model.dto.AbonnementDto;
import com.example.biblio.model.entity.Adherent;
import com.example.biblio.repository.AdherentRepository;
import com.example.biblio.service.AbonnementService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@Controller
@RequestMapping("/abonnements")
public class AbonnementController {
    @Autowired
    private AdherentRepository adherentRepository;
    @Autowired
    private AbonnementService abonnementService;

    @GetMapping("/new/{adherentId}")
    public String showForm(@PathVariable Long adherentId, Model model) {
        Adherent adherent = adherentRepository.findById(adherentId).orElseThrow();
        AbonnementDto dto = new AbonnementDto();
        dto.setAdherentId(adherent.getIdAdherent());
        dto.setNomAdherent(adherent.getNom());
        dto.setPrenomAdherent(adherent.getPrenom());
        model.addAttribute("abonnement", dto);
        return "abonnement-form";
    }

    @PostMapping("/create")
    public String createAbonnement(@ModelAttribute("abonnement") AbonnementDto dto) {
        abonnementService.creerAbonnement(dto);
        return "redirect:/adherents";
    }
}