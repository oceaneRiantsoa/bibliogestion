<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Connexion Admin</title>
    <head>
    <title>Liste des exemplaires</title>
<link rel="stylesheet" type="text/css" href="/css/login.css">
</head>
</head>
<body>
    <div class="container">
        <div class="header">
            <h1>Connexion Admin</h1>
        </div>
        <div class="form-container">
            <form method="post" action="/login-admin">
                <div class="form-group">
                    <label>Nom d'utilisateur :</label>
                    <input type="text" name="nom_utilisateur" required>
                </div>
                <div class="form-group">
                    <label>Mot de passe :</label>
                    <input type="password" name="mot_de_passe" required>
                </div>
                <button type="submit" class="btn">Se connecter</button>
            </form>
            <c:if test="${not empty error}">
                <div class="error">${error}</div>
            </c:if>
            <a href="/" class="back-link">Retour</a>
        </div>
    </div>
</body>
</html>