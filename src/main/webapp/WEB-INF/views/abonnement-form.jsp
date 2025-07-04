<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Créer un abonnement</title>
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
            font-size: 28px;
            margin-bottom: 35px;
            color: #800020;
        }
        form {
            max-width: 450px;
            margin: auto;
            background: white;
            padding: 30px 40px;
            border-radius: 15px;
            box-shadow: 0 4px 15px rgba(128, 0, 32, 0.15);
            text-align: center;
        }
        label {
            display: block;
            margin-top: 20px;
            font-weight: 600;
            font-size: 16px;
            text-align: left;
            color: #D46A6A;
        }
        input[type="date"] {
            width: 100%;
            padding: 10px;
            margin-top: 8px;
            border: 1px solid #F0D9D9;
            border-radius: 10px;
            font-size: 16px;
            transition: border-color 0.3s ease;
        }
        input[type="date"]:focus {
            border-color: #800020;
            outline: none;
        }
        button {
            margin-top: 30px;
            background-color: #800020;
            color: white;
            border: none;
            padding: 12px 28px;
            font-size: 16px;
            font-weight: 700;
            border-radius: 25px;
            cursor: pointer;
            transition: background-color 0.3s ease, transform 0.2s ease;
        }
        button:hover {
            background-color: #D46A6A;
            transform: scale(1.05);
        }
        a {
            display: inline-block;
            margin-top: 25px;
            color: #800020;
            font-weight: bold;
            text-decoration: none;
            font-size: 16px;
            transition: color 0.3s ease;
        }
        a:hover {
            color: #D46A6A;
        }
    </style>
</head>
<body>
    <h1>Créer un abonnement pour ${abonnement.nomAdherent} ${abonnement.prenomAdherent}</h1>
    <form method="post" action="/abonnements/create">
        <input type="hidden" name="adherentId" value="${abonnement.adherentId}" />
        <label>Date début :</label>
        <input type="date" name="dateDebut" required />
        <label>Date fin :</label>
        <input type="date" name="dateFin" required />
        <button type="submit">Valider</button><br>
        <a href="/adherents">Annuler</a>
    </form>
</body>
</html>
