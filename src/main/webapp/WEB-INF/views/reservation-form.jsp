<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Réserver un exemplaire</title>
</head>
<body>
    <h1>Réserver l'exemplaire : ${exemplaire.livre.titre}</h1>
    <form method="post" action="/reservation/${exemplaire.idExemplaire}">
        <label for="dateReservation">Date de réservation :</label>
        <input type="date" name="dateReservation" required />
        <button type="submit">Valider</button>
        <a href="/liste-exemplaires">Annuler</a>
    </form>
</body>
</html>