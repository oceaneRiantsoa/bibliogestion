<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Connexion Adhérent</title>
    <link rel="stylesheet" href="/css/login-styles.css">
</head>
<body>
    <div class="container">
        <div class="header">
            <h1>Connexion Adhérent</h1>
        </div>
        <div class="form-container">
            <form method="post" action="/login-adherent">
                <div class="form-group">
                    <label>Nom :</label>
                    <input type="text" name="nom" required>
                </div>
                <div class="form-group">
                    <label>Email :</label>
                    <input type="email" name="email" required>
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