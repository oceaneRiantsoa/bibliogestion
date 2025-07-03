<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Exemplaires disponibles</title>
</head>
<body>
    <a href="/prolongement/form/${pret.idPret}">Demander un prolongement</a>
    <h1>Liste des exemplaires disponibles</h1>
    <table border="1">
        <tr>
            <th>ID Exemplaire</th>
            <th>Titre Livre</th>
            <th>Auteur</th>
            <th>Genre</th>
            <th>Année</th>
            <th>État</th>
            <th>Réserver</th>
        </tr>
        <c:forEach var="ex" items="${exemplaires}">
            <tr>
                <td>${ex.idExemplaire}</td>
                <td>${ex.livre.titre}</td>
                <td>${ex.livre.auteur}</td>
                <td>${ex.livre.genre}</td>
                <td>${ex.livre.annee}</td>
                <td>${ex.etat}</td>
                <td>
                    <a href="/reservation/form/${ex.idExemplaire}">Réserver</a>
                </td>
            </tr>
        </c:forEach>
    </table>
</body>
</html>