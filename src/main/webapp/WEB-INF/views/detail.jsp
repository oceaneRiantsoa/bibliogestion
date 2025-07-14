<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<html>
<head>
    <title>Détails de l'adhérent</title>
    <style>
        body {
            font-family: 'Poppins', Arial, sans-serif;
            background-color: #FFF8F8;
            color: #800020;
            margin: 0;
            padding: 30px;
        }
        h1 {
            text-align: center;
            font-size: 32px;
            margin-bottom: 40px;
        }
        p {
            font-size: 18px;
            margin: 12px auto;
            max-width: 600px;
            background: white;
            padding: 15px 25px;
            border-radius: 12px;
            box-shadow: 0 4px 10px rgba(128, 0, 32, 0.15);
            font-weight: 600;
        }
        p strong {
            color: #D46A6A;
        }
        a {
            display: block;
            text-align: center;
            margin-top: 40px;
            font-weight: bold;
            color: #800020;
            text-decoration: none;
            font-size: 18px;
            transition: color 0.3s ease;
        }
        a:hover {
            color: #D46A6A;
        }
    </style>
</head>
<body>
    <h1>Détails de l'adhérent</h1>
    <p><strong>ID:</strong> ${adherent.idAdherent}</p>
    <p><strong>Nom:</strong> ${adherent.nom}</p>
    <p><strong>Prénom:</strong> ${adherent.prenom}</p>
    <p><strong>Âge:</strong> ${adherent.age}</p>
    <p><strong>Email:</strong> ${adherent.email}</p>
    <p><strong>Numéro:</strong> ${adherent.numero}</p>
    <p><strong>Statut:</strong> ${adherent.statut}</p>
    <p><strong>Profil:</strong> ${adherent.profil != null ? adherent.profil.nomProfil : 'Aucun'}</p>
    <a href="/adherents">Retour à la liste</a>
</body>
</html>
