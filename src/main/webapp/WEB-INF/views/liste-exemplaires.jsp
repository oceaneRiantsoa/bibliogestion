<!-- filepath: src/main/webapp/WEB-INF/views/liste-exemplaires.jsp -->
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Liste des exemplaires</title>
</head>
<body>
    <h1>Liste des exemplaires disponibles</h1>
    <table border="1">
        <tr>
            <th>Titre</th>
            <th>Auteur</th>
            <th>État</th>
            <th>Action</th>
        </tr>
        <c:forEach var="ex" items="${exemplaires}">
            <tr>
                <td>${ex.livre.titre}</td>
                <td>${ex.livre.auteur}</td>
                <td>${ex.etat}</td>
                <td>
                    <a href="/reservation/form/${ex.idExemplaire}">Réserver</a>
                </td>
            </tr>
        </c:forEach>
    </table>

    <h2>Mes prêts en cours</h2>
    <c:if test="${not empty prets}">
        <table border="1">
            <tr>
                <th>Livre</th>
                <th>Date de prêt</th>
                <th>Date retour prévue</th>
                <th>Prolongement</th>
            </tr>
            <c:forEach var="pret" items="${prets}">
                <tr>
                    <td>${pret.exemplaire.livre.titre}</td>
                    <td>${pret.datePret}</td>
                    <td>${pret.dateRetourPrevue}</td>
                    <td>
                        <a href="/prolongement/form/${pret.idPret}">Demander prolongement</a>
                    </td>
                </tr>
            </c:forEach>
        </table>
    </c:if>
</body>
</html>