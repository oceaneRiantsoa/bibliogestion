<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Liste des exemplaires</title>
    <link rel="stylesheet" href="/css/listeExemplaires.css" />
</head>
<body>
    <h1>Liste des exemplaires disponibles</h1>
    <form method="get" action="/liste-exemplaires">
        <input type="text" name="q" placeholder="Rechercher un livre..." value="${param.q != null ? param.q : ''}" />
        <button type="submit">Rechercher</button>
    </form>
    <table border="1">
        <thead>
            <tr>
                <th>Titre</th>
                <th>Auteur</th>
                <th>État</th>
                <th>Action</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach var="ex" items="${exemplaires}">
                <tr>
                    <td>${ex.livre.titre}</td>
                    <td>${ex.livre.auteur}</td>
                    <td>${ex.etat}</td>
                    <td><a class="btn-reserver" href="/reservation/form/${ex.idExemplaire}">Réserver</a></td>
                </tr>
            </c:forEach>
        </tbody>
    </table>

    <h2>Mes prêts en cours</h2>
    <c:if test="${not empty prets}">
        <table class="table-prets">
            <thead>
                <tr>
                    <th>Livre</th>
                    <th>Date de prêt</th>
                    <th>Date retour prévue</th>
                    <th>Prolongement</th>
                    <th>Statut prolongement</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="pret" items="${prets}">
                    <tr>
                        <td>${pret.exemplaire.livre.titre}</td>
                        <td>${pret.datePret}</td>
                        <td>${pret.dateRetourPrevue}</td>
                        <td><a class="btn-prolongement" href="/prolongement/form/${pret.idPret}">Demander prolongement</a></td>
                        <td>
                            <c:choose>
                                <c:when test="${prolongements[pret.idPret] != null}">
                                    <c:out value="${prolongements[pret.idPret].statutValidation}" />
                                </c:when>
                                <c:otherwise>-</c:otherwise>
                            </c:choose>
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </c:if>

    <a href="/" class="btn-deconnexion">Déconnexion</a>
</body>
</html>