package com.example.biblio.controller;

import com.example.biblio.model.entity.Adherent;
import com.example.biblio.model.entity.Profil;
import com.example.biblio.service.AdherentService;
import com.example.biblio.repository.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@Controller
@RequestMapping("/adherents")
public class AdherentController {
    @Autowired
    private AdherentService adherentService;

    @Autowired
    private ProfilRepository profilRepository;

    @GetMapping
    public String listAdherents(Model model) {
        model.addAttribute("adherents", adherentService.findAll());
        return "liste"; // Correspond à WEB-INF/views/liste.jsp
    }

    @GetMapping("/new")
    public String showCreateForm(Model model) {
        model.addAttribute("adherent", new Adherent());
        model.addAttribute("profils", profilRepository.findAll());
        return "form"; // Correspond à WEB-INF/views/form.jsp
    }

    @PostMapping
    public String createAdherent(@ModelAttribute Adherent adherent, @RequestParam Long profilId) {
        Profil profil = profilRepository.findById(profilId).orElseThrow();
        adherent.setProfil(profil);
        adherentService.save(adherent);
        return "redirect:/adherents";
    }

    @GetMapping("/edit/{id}")
    public String showEditForm(@PathVariable Long id, Model model) {
        model.addAttribute("adherent",
                adherentService.findById(id).orElseThrow(() -> new IllegalArgumentException("Adhérent non trouvé")));
        model.addAttribute("profils", profilRepository.findAll());
        return "form"; // Correspond à WEB-INF/views/form.jsp
    }

    @PostMapping("/update/{id}")
    public String updateAdherent(@PathVariable Long id, @ModelAttribute Adherent adherent) {
        adherent.setIdAdherent(id);
        adherentService.save(adherent);
        return "redirect:/adherents";
    }

    @GetMapping("/delete/{id}")
    public String deleteAdherent(@PathVariable Long id) {
        adherentService.deleteById(id);
        return "redirect:/adherents";
    }

    @GetMapping("/{id:\\d+}")
    public String viewAdherent(@PathVariable Long id, Model model) {
        model.addAttribute("adherent",
                adherentService.findById(id).orElseThrow(() -> new IllegalArgumentException("Adhérent non trouvé")));
        return "detail";
    }
}