package com.example.biblio.service;

import com.example.biblio.model.entity.Adherent;
import com.example.biblio.repository.AdherentRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class AdherentService {
    @Autowired
    private AdherentRepository adherentRepository;

    public List<Adherent> findAll() {
        return adherentRepository.findAll();
    }

    public Optional<Adherent> findById(Long id) {
        return adherentRepository.findById(id);
    }

    public Adherent save(Adherent adherent) {
        return adherentRepository.save(adherent);
    }

    public void deleteById(Long id) {
        adherentRepository.deleteById(id);
    }
}
