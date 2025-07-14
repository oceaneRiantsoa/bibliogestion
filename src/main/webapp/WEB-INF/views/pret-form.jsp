<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Faire un prêt</title>
    <link rel="stylesheet" href="/css/pretForm.css">
</head>
<body>
    <h1>Faire un prêt</h1>

    <c:if test="${param.success != null}">
        <p style="color:green;">Prêt enregistré avec succès !</p>
    </c:if>

    <form method="post" action="/prets">
        <label>Adhérent :</label>
        <select name="adherentId" required>
            <c:forEach var="adherent" items="${adherents}">
                <option value="${adherent.idAdherent}">${adherent.nom} ${adherent.prenom}</option>
            </c:forEach>
        </select>

        <label>Exemplaire :</label>
        <select name="exemplaireId" required>
            <c:forEach var="ex" items="${exemplaires}">
                <option value="${ex.idExemplaire}">${ex.livre.titre} (${ex.etat})</option>
            </c:forEach>
        </select>

        <label>Date retour prévue :</label>
        <input type="date" name="dateRetourPrevue" required />

        <label>Emplacement :</label>
        <select name="emplacementId" required>
            <c:forEach var="emp" items="${emplacements}">
                <option value="${emp.idEmplacement}">${emp.typeEmplacement}</option>
            </c:forEach>
        </select>

        <button type="submit">Valider le prêt</button>
    </form>

    <c:if test="${not empty error}">
        <p style="color:red;">${error}</p>
    </c:if>

    <a href="/adherents">Retour</a>
</body>
</html>
