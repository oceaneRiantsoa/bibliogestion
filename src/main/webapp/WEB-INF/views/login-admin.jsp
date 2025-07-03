<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Connexion Admin</title>
</head>
<body>
    <h1>Connexion Admin</h1>
    <form method="post" action="/login-admin">
        <label>Nom d'utilisateur :</label>
        <input type="text" name="nom_utilisateur" required><br>
        <label>Mot de passe :</label>
        <input type="password" name="mot_de_passe" required><br>
        <button type="submit">Se connecter</button>
    </form>
    <c:if test="${not empty error}">
        <p style="color:red;">${error}</p>
    </c:if>
    <a href="/">Retour</a>
</body>
</html>
