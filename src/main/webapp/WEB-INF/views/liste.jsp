<!-- filepath: src/main/webapp/WEB-INF/views/liste.jsp -->
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<html>
<head>
    <title>Liste des adhérents</title>
</head>
<body>
    <h1>Liste des adhérents</h1>
    <a href="/adherents/new">Ajouter un adhérent</a>
    <a href="/prets/new">Faire un prêt</a>
    <a href="/prets/return">Rendre un livre</a>
    <a href="/admin/prolongements">
        <button>Valider les demandes de prolongement</button>
    </a>
    <table border="1">
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
                    <a href="/adherents/${adherent.idAdherent}">Détails</a>
                    <a href="/adherents/edit/${adherent.idAdherent}">Modifier</a>
                    <a href="/adherents/delete/${adherent.idAdherent}" 
                       onclick="return confirm('Voulez-vous vraiment supprimer cet adhérent ?');">Supprimer</a>
                    <a href="/abonnements/new/${adherent.idAdherent}">Faire abonnement</a>
                </td>
            </tr>
        </c:forEach>
    </table>
        <a href="/" style="float:right; color:red; margin-left:20px;">Déconnexion</a>
    
</body>
</html>