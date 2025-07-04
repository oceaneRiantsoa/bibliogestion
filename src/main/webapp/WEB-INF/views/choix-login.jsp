<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Choix du type de connexion</title>
    <link rel="stylesheet" href="/css/choix.css">
</head>
<body>
    <div class="container">
        <div class="header">
            <h1>Bienvenue à la Bibliothèque</h1>
            <p>Choisissez votre type de connexion</p>
        </div>
        
        <div class="choices-container">
            <a href="/login-admin" class="choice-card admin-card">
                <div class="icon">🔐</div>
                <h2>Administrateur</h2>
                <p>Accès à la gestion complète de la bibliothèque, des livres et des utilisateurs</p>
            </a>
            
            <a href="/login-adherent" class="choice-card adherent-card">
                <div class="icon">📚</div>
                <h2>Adhérent</h2>
                <p>Accès à votre espace personnel, consultation et réservation de livres</p>
            </a>
        </div>
        
        <div class="footer">
            <p>Première visite ? Contactez l'accueil pour créer votre compte</p>
            <a href="/" class="back-link">← Retour à l'accueil</a>
        </div>
    </div>
</body>
</html>