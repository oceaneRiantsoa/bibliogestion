package com.example.biblio.model.dto;

import java.time.LocalDate;

public class AbonnementDto {
    private Long idAbonnement;
    private Long adherentId;
    private String nomAdherent;
    private String prenomAdherent;
    private LocalDate dateDebut;
    private LocalDate dateFin;

    // Getters et setters
    public Long getIdAbonnement() { return idAbonnement; }
    public void setIdAbonnement(Long idAbonnement) { this.idAbonnement = idAbonnement; }

    public Long getAdherentId() { return adherentId; }
    public void setAdherentId(Long adherentId) { this.adherentId = adherentId; }

    public String getNomAdherent() { return nomAdherent; }
    public void setNomAdherent(String nomAdherent) { this.nomAdherent = nomAdherent; }

    public String getPrenomAdherent() { return prenomAdherent; }
    public void setPrenomAdherent(String prenomAdherent) { this.prenomAdherent = prenomAdherent; }

    public LocalDate getDateDebut() { return dateDebut; }
    public void setDateDebut(LocalDate dateDebut) { this.dateDebut = dateDebut; }

    public LocalDate getDateFin() { return dateFin; }
    public void setDateFin(LocalDate dateFin) { this.dateFin = dateFin; }

}
