<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Demandes de prolongement</title>
    <link rel="stylesheet" href="/css/adminListeProlongements.css">
</head>
<body>
    <h1>Demandes de prolongement</h1>
    <table>
        <tr>
            <th>Prêt</th>
            <th>Date demandée</th>
            <th>Nouvelle date retour</th>
            <th>Statut</th>
            <th>Actions</th>
        </tr>
        <c:forEach var="p" items="${demandes}">
            <tr>
                <td>${p.pret.idPret}</td>
                <td>${p.dateProlongement}</td>
                <td>${p.nouvelleDateRetour}</td>
                <td>${p.statutValidation}</td>
                <td>
                    <c:if test="${p.statutValidation == 'en_attente'}">
                        <form method="post" action="/admin/prolongements/${p.idProlongement}/accepter" >
                            <button type="submit">Accepter</button>
                        </form>
                        <form method="post" action="/admin/prolongements/${p.idProlongement}/refuser" >
                            <button type="submit">Refuser</button>
                        </form>
                    </c:if>
                </td>
            </tr>
        </c:forEach>
    </table>
    <a href="/adherents">Retour à l’accueil</a>
</body>
</html>
