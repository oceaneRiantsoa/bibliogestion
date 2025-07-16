-- PROFILS
INSERT INTO Profil (nom_profil, quota_max_pret, quota_max_reservation, quota_prolongement, jour_penalite) VALUES
('Etudiant', 2, 1, 3, 10),
('Enseignant', 3, 2, 5, 9),
('Professionnel', 4, 3, 7, 8);

-- ADMINISTRATEURS
INSERT INTO Admin (nom_utilisateur, mot_de_passe) VALUES
('admin1', 'admin123'),
('admin2', 'admin456'),
('admin3', 'admin789');

-- ADHERENTS
INSERT INTO Adherent (nom, prenom, age, numero, email, statut, id_profil) VALUES
-- Etudiants
('Bensaid', 'Amine', 20, 'ETU001', 'amine@example.com', 'actif', 1),
('El Khattabi', 'Sarah', 21, 'ETU002', 'sarah@example.com', 'actif', 1),
('Moujahid', 'Youssef', 22, 'ETU003', 'youssef@example.com', 'actif', 1),
-- Enseignants
('Benali', 'Nadia', 35, 'ENS001', 'nadia@example.com', 'actif', 2),
('Haddadi', 'Karim', 40, 'ENS002', 'karim@example.com', 'actif', 2),
('Touhami', 'Salima', 37, 'ENS003', 'salima@example.com', 'actif', 2),
-- Professionnels
('El Mansouri', 'Rachid', 45, 'PROF001', 'rachid@example.com', 'actif', 3),
('Zerouali', 'Amina', 38, 'PROF002', 'amina@example.com', 'actif', 3);

-- ABONNEMENTS
INSERT INTO Abonnement (id_adherent, date_debut, date_fin) VALUES
(1, '2025-02-01', '2025-07-24'),
(2, '2025-02-01', '2025-07-01'),
(3, '2025-04-01', '2025-12-01'),
(4, '2025-07-01', '2026-07-01'),
(5, '2025-08-01', '2026-05-01'),
(6, '2025-07-01', '2026-06-01'),
(7, '2025-06-01', '2025-12-01'),
(8, '2024-10-01', '2025-06-01');

-- LIVRES
INSERT INTO Livre (titre, genre, auteur, annee, age_minimum) VALUES
('Les Miserables', 'Litterature classique', 'Victor Hugo', 1862, 12),
('L''Etranger', 'Philosophie', 'Albert Camus', 1942, 15),
('Harry Potter a l''ecole des sorciers', 'Jeunesse / Fantastique', 'J.K. Rowling', 1997, 10);

-- EXEMPLAIRES
INSERT INTO Exemplaire (id_livre, etat, disponible) VALUES
-- Les Miserables
(1, 'Bon', TRUE), (1, 'Bon', TRUE), (1, 'Bon', TRUE),
-- L'Etranger
(2, 'Bon', TRUE), (2, 'Bon', TRUE),
-- Harry Potter
(3, 'Bon', TRUE);

-- JOURS FERIES
INSERT INTO Jour_Ferie (date_ferie, description) VALUES
('2025-07-13', 'Dimanche'),
('2025-07-19', 'Jour ferie'),
('2025-07-20', 'Dimanche'),
('2025-07-26', 'Jour ferie'),
('2025-07-27', 'Dimanche'),
('2025-08-03', 'Dimanche'),
('2025-08-10', 'Dimanche'),
('2025-08-17', 'Dimanche');

-- PENALITES
INSERT INTO Penalite (id_adherent, raison, date_penalite, date_fin, levee) VALUES
-- Etudiants : 10 jours
(1, 'Retard', '2025-07-01', '2025-07-11', FALSE),
(2, 'Retard', '2025-07-01', '2025-07-11', FALSE),
(3, 'Retard', '2025-07-01', '2025-07-11', FALSE),
-- Enseignants : 9 jours
(4, 'Retard', '2025-07-01', '2025-07-10', FALSE),
(5, 'Retard', '2025-07-01', '2025-07-10', FALSE),
(6, 'Retard', '2025-07-01', '2025-07-10', FALSE),
-- Professionnels : 8 jours
(7, 'Retard', '2025-07-01', '2025-07-09', FALSE),
(8, 'Retard', '2025-07-01', '2025-07-09', FALSE);
