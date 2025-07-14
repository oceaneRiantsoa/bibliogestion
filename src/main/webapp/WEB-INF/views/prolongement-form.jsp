<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Demander un prolongement</title>
    <link rel="stylesheet" href="/css/prolongementForm.css">
</head>
<body>
    <h1>Demander un prolongement pour le livre : ${pret.exemplaire.livre.titre}</h1>

    <form method="post" action="/prolongement/${pret.idPret}">
        <label for="nouvelleDateRetour">Nouvelle date de retour :</label>
        <input type="date" name="nouvelleDateRetour" required />

        <button type="submit">Valider</button>
        <a href="/liste-exemplaires">Annuler</a>
    </form>
</body>
</html>
