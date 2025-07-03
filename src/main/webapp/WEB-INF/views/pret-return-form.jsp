<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Rendre un livre</title>
</head>
<body>
    <h1>Rendre un livre</h1>
    <c:if test="${not empty message}">
        <p style="color:blue;">${message}</p>
    </c:if>
    <form method="post" action="/prets/return">
        <label>Prêt à rendre :</label>
        <select name="pretId" required>
            <c:forEach var="pret" items="${prets}">
                <option value="${pret.idPret}">
                    ${pret.adherent.nom} ${pret.adherent.prenom} - ${pret.exemplaire.livre.titre} (Retour prévu: ${pret.dateRetourPrevue})
                </option>
            </c:forEach>
        </select><br>
        <label>Date de rendu :</label>
        <input type="date" name="dateRendu" required /><br>
        <button type="submit">Valider le rendu</button>
    </form>
    <a href="/adherents">Retour</a>
</body>
</html>