<?php
$pseudo = $_GET['pseudo'] ?? ''; // Récupération du pseudo dans la commande
?>

<!DOCTYPE html>
<html lang="fr">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Mini Twitter</title>
    <link rel="stylesheet" href="css/styles.css">
</head>

<body>
    <h1 style="text-align: center;">Mini Twitter</h1> 
    <div style="text-align: center;">
        <h3>Je suis <?= $pseudo ?></h3>
    </div>

<!-- Formulaire pour s'inscrire-->
<h3>Inscription</h3>
<form method="post" action="Minitwitter.php?pseudo=<?= $pseudo ?>">
    <input type="hidden" name="pseudoinscription" value="<?= $pseudo ?>"> 
    Mot de passe: <input type="password" name="password"><br>
    Email: <input type="email" name="email"><br><br>
    <button type="submit" class="button-ovale">"S’inscrire"</button>
</form>

<!--                                                -->
<!--                     INSCRIPTION                -->
<!--                                                -->
<?php
$ID = null;

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    // Vérifier si le formulaire a déjà été rempli
    if (isset($_POST['pseudoinscription']) && isset($_POST['email']) && isset($_POST['password'])) {
        $pseudoinscription = $_POST['pseudoinscription'];
        $email = $_POST['email'];
        $password = $_POST['password'];

        // Vérifier si les champs ne sont pas vides
        if (!empty($pseudoinscription) && !empty($email) && !empty($password)) {
   
        // Connexion à la base de données minitwitter
        $pdo = new PDO('mysql:host=localhost;dbname=minitwitter', 'root', '');
        
        // Vérifier si le pseudo existe déjà
            $requete_verif_pseudo = $pdo->prepare('SELECT COUNT(*) AS count FROM user WHERE pseudo = ?');
            $requete_verif_pseudo->execute([$pseudoinscription]);
            $resultat_verif_pseudo = $requete_verif_pseudo->fetch();

            if ($resultat_verif_pseudo['count'] > 0) {
               // Le pseudo existe déjà
                echo "Ce pseudo existe déjà";
            } else {
                    // Ajout d’un utilisateur dans la table user
                     $requete = $pdo->prepare('INSERT INTO user (pseudo, email, password) VALUES (?, ?, ?)');
                    $requete->execute([$pseudoinscription, $email, $password]);

                    echo "Inscription réussie";
        } 
     } else {
        // Afficher un message si des données sont manquantes
        echo "Echec : données manquantes";
        }
    }
}
?>
<!--                                                -->
<!--                     TWEETER                    -->
<!--                                                -->
<!-- Formulaire pour tweeter-->

<div style="margin: 0 auto; width: fit-content;">
    <form method="post" id="tweetForm" action="Minitwitter.php?pseudo=<?= $pseudo ?>">
        <input type="hidden" name="pseudo" value="<?= $pseudo ?>"> 
        <textarea name="tweet" placeholder="Quoi de neuf" style="font-style: italic;"></textarea> <br> <br>
        <button type="submit" class="button-ovale">Tweeter</button>
    </form>
</div>

<br>

<?php
// Ajout d'un tweet
if ($_SERVER["REQUEST_METHOD"] == "POST" && isset($_POST['tweet'])) {
     $tweet = $_POST['tweet'];

    // Connexion à la base de données minitwitter
    $pdo = new PDO('mysql:host=localhost;dbname=minitwitter', 'root', '');

     // Récupération de l'ID de ce pseudo dans la base de données user
    $requete = $pdo->prepare('SELECT ID FROM user WHERE pseudo = ?');
    $requete->execute([$pseudo]);
    $resultat = $requete->fetch();

    if ($resultat) {
        $user_id = $resultat['ID'];

        // Ajout d’un tweet dans la table tweet pour l'user_id du pseudo choisi
         $requete = $pdo->prepare('INSERT INTO tweet (tweet, heure, user_id) VALUES (?, NOW(), ?)');
        $requete->execute([$tweet, $user_id]);
         echo "Tweet ajouté";
        } 
        else {
            echo "Ce pseudo n'existe pas";
        }
    }   
?>
<!--                                                -->
<!--                     FEED                        -->
<!--                                                -->
<!-- Formulaire pour afficher tous les tweets-->
<div style="margin: 0 auto; width: fit-content;">
<form method="post" action="Minitwitter.php?pseudo=<?= $pseudo ?>">
    <input type="hidden" name="pseudoaffichage" value="<?= $pseudo ?>"> 
    <button type="submit" name="FeedButton" class="button-ovale">Actualiser le feed</button>    
</form>
</div>
<div style="margin: 0 auto; width: fit-content;">
<?php

// Afficher tous les tweets
if ($_SERVER["REQUEST_METHOD"] == "POST" && isset($_POST['FeedButton']) ){
    $pseudoaffichage = $_POST['pseudoaffichage'];

    // Connexion à la base de données minitwitter
    $pdo = new PDO('mysql:host=localhost;dbname=minitwitter', 'root', '');

    // Récupération de ID de ce pseudo dans la base de donnée user
    $requete = $pdo->prepare('SELECT ID FROM user WHERE pseudo = ? ');
    $requete->execute([$pseudoaffichage]);
    $resultat = $requete->fetch();

    if ($resultat) {
        $user_id = $resultat['ID'];

        // Récupération des tweets du pseudo choisi triés du plus récent au plus ancien
        $requete = $pdo->prepare('SELECT tweet.tweet, user.pseudo FROM tweet INNER JOIN user ON tweet.user_id = user.ID ORDER BY tweet.id DESC');
        $requete->execute();
        $tweets = $requete->fetchAll();

        if (count($tweets) > 0) {
            foreach ($tweets as $tweet) {
                // Affichage des tweets du pseudo choisi
                echo "Pseudo: " . $tweet["pseudo"] . "  Tweet: " . $tweet["tweet"] . "<br>";
             }
         } else {
            echo "Pas de tweet pour ce pseudo.";
            }
     } else {
            echo "Ce pseudo n'existe pas";
    }
} 
?>
</div>
<!--                                                            -->
<!--                      SUPPRESSION DE MES TWEETS             -->
<!--                                                            -->

<!-- Bouton pour supprimer tous mes tweets -->
<form method="post" action="Minitwitter.php?pseudo=<?= $pseudo ?>">
    <input type="hidden" name="pseudosuppression" value="<?= $pseudo ?>">
    <button type="submit" name="SupprimerButton" class="button-ovale">Supprimer tous mes tweets</button>
</form>

<?php
// Supprimer mes tweets
if ($_SERVER["REQUEST_METHOD"] == "POST" && isset($_POST['SupprimerButton']) ){
    $pseudosuppression = $_POST['pseudosuppression'];

    // Connexion à la base de données minitwitter
    $pdo = new PDO('mysql:host=localhost;dbname=minitwitter', 'root', '');

    // Récupération de ID de ce pseudo dans la base de donnée user
    $requete = $pdo->prepare('SELECT ID FROM user WHERE pseudo = ? ');
    $requete->execute([$pseudo]);
    $resultat = $requete->fetch();

    if ($resultat) {
        $user_id = $resultat['ID'];

         // Compter le nombre de tweets du pseudo
        $requete_count = $pdo->prepare('SELECT COUNT(*) AS nb_tweets FROM tweet WHERE user_id = ?');
        $requete_count->execute([$user_id]);
        $resultat_count = $requete_count->fetch();

        if ($resultat_count && $resultat_count['nb_tweets'] > 0) {
            // Suppression des tweets du pseudo choisi
            $requete_suppression = $pdo->prepare('DELETE FROM tweet WHERE user_id = ?');
            $requete_suppression->execute([$user_id]);
            echo "Tweets supprimés";
        } else {
            echo "Pas de tweet à supprimer pour ce pseudo.";
        }
    }   
} 
?>

</body>
</html>
