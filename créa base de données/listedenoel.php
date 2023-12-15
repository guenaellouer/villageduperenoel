<?php 
//CONNEXION A LA BASE DE DONNEES
$bdd = new PDO('mysql:host=localhost;dbname=village_pere_noel;charset=utf8', 'root', '');

//RECUPERATION DES DONNEES DE LA TABLE CADOS
$req = $bdd->query('SELECT categorie_cadeau FROM cadeaux');

$compteur=0;

//VERIFIER SI LE FORMULAIRE A ETE SOUMIS
if (isset($_POST['submit'])) {
    // AFFICHER LE BANDEAU
    echo '<p class="success">Votre commande auprès du Père Noël a bien été prise en compte !<a href="perenoel29.php"> POUR REVENIR AU MAGASIN DU PERE NOËL !</a></p>';
}

if (isset($_POST['vider_votre_liste'])) {
    //REQUETE POUR VIDER LA LISTE DES CADEAUX
    $sqlDelete = "DELETE FROM cadeaux";
    $bdd->exec($sqlDelete);

    echo "Votre liste au Père Noël a été vidée avec succès.";
    header('location: villagedenoel.php');
}
?>

<!DOCTYPE html>
<html lang="fr-FR">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
  <link rel="stylesheet" type ="text/css" href="SRC/style.css">
  <title>Grille de Boutons avec Cadeaux de Noël</title>
</head>
<body>
<form method="post" action="">
<!--AFFICHAGE DE LA LISTE AU PERE-NOEL-->
    <table border>
        <tr>
            <th>Votre liste au Père Noël</th>
        </tr>
        <!--BOUCLE WHILE POUR AFFICHER LES DONNEES DE LA BASE DE DONNEES-->
    <?php 
        while ($donnees = $req->fetch()){
            $compteur++;
            echo' <tr>
                <td>'.$compteur.'.'.$donnees['categorie_cadeau'].'</td>
            </tr>';
            
        }
    ?>    
        <div>
            <button type="submit" name="vider_votre_liste">Vider la liste</button>
        </div>

</form>        
        <div class="button text-center">
            <button type="submit" name="submit">Je valide ma demande !</button>
        </div>
</body>
</html>





