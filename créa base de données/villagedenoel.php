<?php
//CONNEXION A LA BASE DE DONNEES
$bdd = new PDO('mysql:host=localhost;dbname=village_pere_noel;charset=utf8', 'root', '');
//VERIFIER LES INFOS DU FORMULAIRE
if (!empty($_POST['cadeaux'])) {
    //RECUPERE LES CADEAUX SELECTIONNES
    $cadeaux = $_POST['cadeaux'];
    //PREPARATION DE LA REQUETE SQL
    $req = $bdd->prepare("INSERT INTO cadeaux (categorie_cadeau) VALUES (?)");
    //INSERRER CHAQUE CADEAU SELECTIONNE DANS LA BASE DE DONNEES
    foreach ($cadeaux as $categorie_cadeau) {
        $req->execute(array($categorie_cadeau));
    }
    echo '<p class="success">Afin de valider votre commande...<a href="listedenoel.php"> VOYEZ VOTRE LISTE !</a></p>';
}
?>

<!DOCTYPE html>
<html lang="fr-FR">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link rel="stylesheet" type ="text/css" href="SRC/style.css">

    <title>C'EST POUR LA BELLE NUIT DE NOEL....Oh! Oh! Oh!</title>
</head>
<body>
<form method="post" action="">
    <div class="container">
        <div class="row">
            <div class="col-md-4">
                <div class="square" style="background-image: url('IMG/camion de pompier.jpg');"></div>
                <div class="sous-titre">Véhicules</div> 
                <div class="checkbox-container">
                    <input type="checkbox" name="cadeaux[]" value="Un camion de pompier">
                </div>
            </div>
            <div class="col-md-4">
                <div class="square" style="background-image: url('IMG/console de jeux.jpg');"></div>
                <div class="sous-titre">Une console de jeux vidéo</div> 
                <div class="checkbox-container">
                    <input type="checkbox" name="cadeaux[]" value="Une console de jeux">
                </div>
            </div>
            <div class="col-md-4">
                <div class="square" style="background-image: url('IMG/cuisine.jpg');"></div>
                <div class="sous-titre">Tout pour faire la cuisine</div> 
                <div class="checkbox-container">
                    <input type="checkbox" name="cadeaux[]" value="Tout pour la cuisine">
                </div>
            </div>
        </div>

        <div class="row">
            <div class="col-md-4">
                <div class="square" style="background-image: url('IMG/livres.jpg');"></div>
                <div class="sous-titre">Un livre</div> 
                <div class="checkbox-container">
                    <input type="checkbox" name="cadeaux[]" value="Des livres, bandes-dessinée...">
                </div>
            </div>
            <div class="col-md-4">
                <div class="square" style="background-image: url('IMG/pelluche.jpg');"></div>
                <div class="sous-titre">Une pelluche</div> 
                <div class="checkbox-container">
                    <input type="checkbox" name="cadeaux[]" value="Une pelluche">
                </div>
            </div>
            <div class="col-md-4">
                <div class="square" style="background-image: url('IMG/poupée.jpg');"></div>
                <div class="sous-titre">Une poupée</div> 
                <div class="checkbox-container">
                    <input type="checkbox" name="cadeaux[]" value="Une poupée">
                </div>
            </div>
        </div>

        <div class="row">
            <div class="col-md-4">
                <div class="square" style="background-image: url('IMG/super heros.jpg');"></div>
                <div class="sous-titre">Un habit de Super Héros</div> 
                <div class="checkbox-container">
                    <input type="checkbox" name="cados[]" value="Un habit de Super Heros">
                </div>
            </div>
            <div class="col-md-4">
                <div class="square" style="background-image: url('IMG/train electrique.jpg');"></div>
                <div class="sous-titre">Jeux d'éveil</div> 
                <div class="checkbox-container">
                    <input type="checkbox" name="cados[]" value="Un train electrique">
                </div>
            </div>
            <div class="col-md-4">
                <div class="square" style="background-image: url('IMG/artiste.jpg');"></div>
                <div class="sous-titre">Tout pour le dessin, la peiture...</div> 
                <div class="checkbox-container">
                    <input type="checkbox" name="cados[]" value="Tout pour être artiste">
                </div>
            </div>
        </div>
    </div>

    <div class="button text-center">
        <button type="submit">Je valide ma demande !</button>
        
    </div>
</form>
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.3/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

</body>
</html>