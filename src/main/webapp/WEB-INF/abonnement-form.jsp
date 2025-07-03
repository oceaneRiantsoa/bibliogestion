<!-- filepath: src/main/webapp/WEB-INF/views/abonnement-form.jsp -->
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Créer un abonnement</title>
</head>
<body>
    <h1>Créer un abonnement pour ${abonnement.nomAdherent} ${abonnement.prenomAdherent}</h1>
    <form method="post" action="/abonnements/create">
        <input type="hidden" name="adherentId" value="${abonnement.adherentId}" />
        <label>Date début :</label>
        <input type="date" name="dateDebut" required /><br>
        <label>Date fin :</label>
        <input type="date" name="dateFin" required /><br>
        <button type="submit">Valider</button>
        <a href="/liste">Annuler</a>
    </form>
</body>
</html>