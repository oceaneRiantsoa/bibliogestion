<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Connexion Adhérent</title>
</head>
<body>
    <h1>Connexion Adhérent</h1>
    <form method="post" action="/login-adherent">
        <label>Nom :</label>
        <input type="text" name="nom" required><br>
        <label>Email :</label>
        <input type="email" name="email" required><br>
        <button type="submit">Se connecter</button>
    </form>
    <c:if test="${not empty error}">
        <p style="color:red;">${error}</p>
    </c:if>
    <a href="/">Retour</a>
</body>
</html>
