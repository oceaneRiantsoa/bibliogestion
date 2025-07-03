<!-- filepath: src/main/webapp/WEB-INF/views/admin-liste-prolongements.jsp -->
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Demandes de prolongement</title>
</head>
<body>
    <h1>Demandes de prolongement</h1>
    <table border="1">
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
                        <form method="post" action="/admin/prolongements/${p.idProlongement}/accepter" style="display:inline;">
                            <button type="submit">Accepter</button>
                        </form>
                        <form method="post" action="/admin/prolongements/${p.idProlongement}/refuser" style="display:inline;">
                            <button type="submit">Refuser</button>
                        </form>
                    </c:if>
                </td>
            </tr>
        </c:forEach>
    </table>
       <a href="/adherents">Retour a l acceuil</a>
</body>
</html>