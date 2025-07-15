<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<html>
<head>
    <title>Liste des adhérents</title>
    <link rel="stylesheet" href="/css/listeAdm.css">
</head>
<body>
    <h1>Liste des adhérents</h1>
    
    <div class="actions-container">
        <a href="/adherents/new" class="action-btn primary">Ajouter un adhérent</a>
        <a href="/prets/new" class="action-btn">Faire un prêt</a>
        <a href="/prets/return" class="action-btn">Rendre un livre</a>
        <a href="/admin/prolongements" class="action-btn">Valider les demandes de prolongement</a>
    </div>
    
    <div class="table-container">
        <table>
            <tr>
                <th>Nom</th>
                <th>Prénom</th>
                <th>Profil</th>
                <th>Actions</th>
            </tr>
            <c:forEach var="adherent" items="${adherents}">
                <tr>
                    <td>${adherent.nom}</td>
                    <td>${adherent.prenom}</td>
                    <td>${adherent.profil != null ? adherent.profil.nomProfil : ''}</td>
                    <td>
                        <a href="/adherents/${adherent.idAdherent}" class="table-action details">Détails</a>
                        <a href="/adherents/edit/${adherent.idAdherent}" class="table-action edit">Modifier</a>
                        <a href="/adherents/delete/${adherent.idAdherent}" class="table-action delete"
                           onclick="return confirm('Voulez-vous vraiment supprimer cet adhérent ?');">Supprimer</a>
                        <a href="/abonnements/new/${adherent.idAdherent}" class="table-action subscribe">Faire abonnement</a>
                    </td>
                </tr>
            </c:forEach>
        </table>
    </div>
    
    <div class="footer">
        <a href="/" class="logout-link">Déconnexion</a>
    </div>
</body>
</html>