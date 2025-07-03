<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<html>
<head>
    <title>Détails de l'adhérent</title>
</head>
<body>
    <h1>Détails de l'adhérent</h1>
    <p><strong>ID:</strong> ${adherent.idAdherent}</p>
    <p><strong>Nom:</strong> ${adherent.nom}</p>
    <p><strong>Prénom:</strong> ${adherent.prenom}</p>
    <p><strong>Âge:</strong> ${adherent.age}</p>
    <p><strong>Email:</strong> ${adherent.email}</p>
    <p><strong>Numéro:</strong> ${adherent.numero}</p>
    <p><strong>Statut:</strong> ${adherent.statut}</p>
    <p><strong>Profil:</strong> ${adherent.profil != null ? adherent.profil.nomProfil : 'Aucun'}</p>
    <a href="/adherents">Retour à la liste</a>
</body>
</html>