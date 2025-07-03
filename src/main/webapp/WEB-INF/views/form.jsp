<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<html>
<head>
    <title>${adherent.idAdherent == null ? 'Ajouter' : 'Modifier'} un adhérent</title>
</head>
<body>
    <h1>${adherent.idAdherent == null ? 'Ajouter un adhérent' : 'Modifier un adhérent'}</h1>
    <form method="post" action="${adherent.idAdherent == null ? '/adherents' : '/adherents/update/' += adherent.idAdherent}">
        <label>Nom: </label>
        <input type="text" name="nom" value="${adherent.nom}" required><br>
        <label>Prénom: </label>
        <input type="text" name="prenom" value="${adherent.prenom}" required><br>
        <label>Âge: </label>
        <input type="number" name="age" value="${adherent.age}" required><br>
        <label>Email: </label>
        <input type="email" name="email" value="${adherent.email}" required><br>
        <label>Numéro: </label>
        <input type="text" name="numero" value="${adherent.numero}"><br>
        <label>Statut: </label>
        <select name="statut" required>
            <option value="actif" ${adherent.statut == 'actif' ? 'selected' : ''}>Actif</option>
            <option value="inactif" ${adherent.statut == 'inactif' ? 'selected' : ''}>Inactif</option>
        </select><br>
        <label>Profil :</label>
        <select name="profilId" required>
            <c:forEach var="profil" items="${profils}">
                <option value="${profil.idProfil}" <c:if test="${adherent.profil != null && adherent.profil.idProfil == profil.idProfil}">selected</c:if>>
                    ${profil.nomProfil}
                </option>
            </c:forEach>
        </select><br>
        <button type="submit">Enregistrer</button>
    </form>
    <a href="/adherents">Retour à la liste</a>
</body>
</html>