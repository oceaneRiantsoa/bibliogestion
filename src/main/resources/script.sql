-- Table des administrateurs
CREATE TABLE IF NOT EXISTS Admin (
    id_admin SERIAL PRIMARY KEY,
    nom_utilisateur VARCHAR(100) UNIQUE NOT NULL,
    mot_de_passe VARCHAR(255) NOT NULL
);

-- Table des profils
CREATE TABLE IF NOT EXISTS Profil (
    id_profil SERIAL PRIMARY KEY,
    nom_profil VARCHAR(50) NOT NULL UNIQUE,
    quota_max_pret INT NOT NULL,
    quota_max_reservation INT NOT NULL
);

-- Table des adhérents
CREATE TABLE IF NOT EXISTS Adherent (
    id_adherent SERIAL PRIMARY KEY,
    nom VARCHAR(100) NOT NULL,
    prenom VARCHAR(100) NOT NULL,
    age INT NOT NULL,
    numero VARCHAR(20),
    email VARCHAR(100) UNIQUE NOT NULL,
    statut VARCHAR(20) DEFAULT 'actif',
    id_profil INT REFERENCES Profil(id_profil)
);

-- Table des jours fériés
CREATE TABLE IF NOT EXISTS Jour_Ferie (
    id_jour SERIAL PRIMARY KEY,
    date_ferie DATE UNIQUE NOT NULL,
    description VARCHAR(100)
);

-- Table des statuts
CREATE TABLE IF NOT EXISTS Statut (
    id_statut SERIAL PRIMARY KEY,
    libelle VARCHAR(20) NOT NULL UNIQUE
);

-- Table des livres
CREATE TABLE IF NOT EXISTS Livre (
    id_livre SERIAL PRIMARY KEY,
    titre VARCHAR(255) NOT NULL,
    genre VARCHAR(100),
    auteur VARCHAR(100),
    annee INT,
    age_minimum INT
);

-- Table des exemplaires physiques
CREATE TABLE IF NOT EXISTS Exemplaire (
    id_exemplaire SERIAL PRIMARY KEY,
    id_livre INT REFERENCES Livre(id_livre),
    etat VARCHAR(50),
    disponible BOOLEAN
);

-- Table des emplacements de prêt
CREATE TABLE IF NOT EXISTS Emplacement (
    id_emplacement SERIAL PRIMARY KEY,
    type_emplacement VARCHAR(20) NOT NULL UNIQUE
);

-- Table des prêts
CREATE TABLE IF NOT EXISTS Pret (
    id_pret SERIAL PRIMARY KEY,
    id_adherent INT REFERENCES Adherent(id_adherent),
    id_exemplaire INT REFERENCES Exemplaire(id_exemplaire),
    date_pret DATE NOT NULL,
    date_retour_prevue DATE NOT NULL,
    id_emplacement INT REFERENCES Emplacement(id_emplacement),
    id_statut INT REFERENCES Statut(id_statut)
);

-- Table des abonnements
CREATE TABLE IF NOT EXISTS Abonnement (
    id_abonnement SERIAL PRIMARY KEY,
    id_adherent INT REFERENCES Adherent(id_adherent),
    date_debut DATE NOT NULL,
    date_fin DATE NOT NULL
);

-- Table des prolongements de prêt
CREATE TABLE IF NOT EXISTS Prolongement (
    id_prolongement SERIAL PRIMARY KEY,
    id_pret INT REFERENCES Pret(id_pret),
    date_prolongement DATE NOT NULL,
    nouvelle_date_retour DATE NOT NULL,
    id_statut INT REFERENCES Statut(id_statut)
);

-- Table des réservations
CREATE TABLE IF NOT EXISTS Reservation (
    id_reservation SERIAL PRIMARY KEY,
    id_adherent INT REFERENCES Adherent(id_adherent),
    id_exemplaire INT REFERENCES Exemplaire(id_exemplaire),
    date_reservation DATE NOT NULL,
    id_statut INT REFERENCES Statut(id_statut)
);

-- Table des pénalités
CREATE TABLE IF NOT EXISTS Penalite (
    id_penalite SERIAL PRIMARY KEY,
    id_adherent INT REFERENCES Adherent(id_adherent),
    raison VARCHAR(255) NOT NULL,
    date_penalite DATE NOT NULL,
    date_fin DATE,
    levee BOOLEAN
);
