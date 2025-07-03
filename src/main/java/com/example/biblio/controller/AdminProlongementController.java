package com.example.biblio.controller;

import com.example.biblio.model.entity.Prolongement;
import com.example.biblio.repository.ProlongementRepository;
import com.example.biblio.repository.PretRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@Controller
@RequestMapping("/admin/prolongements")
public class AdminProlongementController {
    @Autowired
    private ProlongementRepository prolongementRepository;
    @Autowired
    private PretRepository pretRepository;

    @GetMapping
    public String listeDemandes(Model model) {
        model.addAttribute("demandes", prolongementRepository.findAll());
        return "admin-liste-prolongements";
    }

    @PostMapping("/{id}/accepter")
    public String accepter(@PathVariable Long id) {
        Prolongement p = prolongementRepository.findById(id).orElseThrow();
        p.setStatutValidation("accepte");
        // Mettre à jour la date de retour du prêt
        p.getPret().setDateRetourPrevue(p.getNouvelleDateRetour());
        pretRepository.save(p.getPret());
        prolongementRepository.save(p);
        return "redirect:/admin/prolongements";
    }

    @PostMapping("/{id}/refuser")
    public String refuser(@PathVariable Long id) {
        Prolongement p = prolongementRepository.findById(id).orElseThrow();
        p.setStatutValidation("refuse");
        prolongementRepository.save(p);
        return "redirect:/admin/prolongements";
    }
}