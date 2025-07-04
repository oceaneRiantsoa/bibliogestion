<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Réserver un exemplaire</title>
    <style>
        /* Style général */
        body {
            font-family: 'Poppins', Arial, sans-serif;
            background-color: #FFF8F8;
            color: #800020;
            margin: 50px auto;
            width: 60%;
        }
        h1 {
            text-align: center;
            color: #800020;
            margin-bottom: 30px;
        }
        form {
            display: flex;
            flex-direction: column;
            align-items: center;
            gap: 20px;
            background-color: #FDF0F0;
            padding: 30px;
            border-radius: 15px;
            box-shadow: 0 5px 15px rgba(128, 0, 32, 0.1);
        }
        label {
            font-weight: 600;
            font-size: 16px;
        }
        input[type="date"] {
            padding: 8px 12px;
            border: 1px solid #D46A6A;
            border-radius: 8px;
            width: 60%;
        }
        button, a {
            padding: 10px 20px;
            border-radius: 25px;
            text-decoration: none;
            font-weight: 600;
            cursor: pointer;
            transition: background-color 0.3s ease, transform 0.2s ease;
        }
        button {
            background-color: #800020;
            color: white;
            border: none;
        }
        button:hover {
            background-color: #D46A6A;
            transform: scale(1.05);
        }
        a {
            background-color: #F0D9D9;
            color: #800020;
        }
        a:hover {
            background-color: #D46A6A;
            color: white;
            transform: scale(1.05);
        }
    </style>
</head>
<body>
    <h1>Réserver l'exemplaire : ${exemplaire.livre.titre}</h1>
    <form method="post" action="/reservation/${exemplaire.idExemplaire}">
        <label for="dateReservation">Date de réservation :</label>
        <input type="date" name="dateReservation" required />
        <button type="submit">Valider</button>
        <a href="/liste-exemplaires">Annuler</a>
    </form>
</body>
</html>
