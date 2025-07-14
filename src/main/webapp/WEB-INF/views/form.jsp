<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<html>
<head>
    <title>${adherent.idAdherent == null ? 'Ajouter' : 'Modifier'} un adhérent</title>
    <link rel="stylesheet" href="/css/formAdherent.css">
</head>
<body>
    <h1>${adherent.idAdherent == null ? 'Ajouter un adhérent' : 'Modifier un adhérent'}</h1>

    <form method="post" action="${adherent.idAdherent == null ? '/adherents' : '/adherents/update/' += adherent.idAdherent}">
        <label>Nom:</label>
        <input type="text" name="nom" value="${adherent.nom}" required>

        <label>Prénom:</label>
        <input type="text" name="prenom" value="${adherent.prenom}" required>

        <label>Âge:</label>
        <input type="number" name="age" value="${adherent.age}" required>

        <label>Email:</label>
        <input type="email" name="email" value="${adherent.email}" required>

        <label>Numéro:</label>
        <input type="text" name="numero" value="${adherent.numero}">

        <label>Statut:</label>
        <select name="statut" required>
            <option value="actif" ${adherent.statut == 'actif' ? 'selected' : ''}>Actif</option>
            <option value="inactif" ${adherent.statut == 'inactif' ? 'selected' : ''}>Inactif</option>
        </select>

        <label>Profil:</label>
        <select name="profilId" required>
            <c:forEach var="profil" items="${profils}">
                <option value="${profil.idProfil}" <c:if test="${adherent.profil != null && adherent.profil.idProfil == profil.idProfil}">selected</c:if>>
                    ${profil.nomProfil}
                </option>
            </c:forEach>
        </select>

        <button type="submit">Enregistrer</button>
    </form>

    <a href="/adherents">Retour à la liste</a>
</body>
</html>
