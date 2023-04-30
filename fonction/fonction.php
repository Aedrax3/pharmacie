<?php
include_once 'Modèle/connexion_bd.php';


function afficheAllclient(){
    $resultat = array();

    try {
        $cnx = connexionPDO();
        $req = $cnx->prepare("SELECT c.*
            FROM client c");
     
     $req->execute([]);

        $resultat = $req->fetchall(PDO::FETCH_ASSOC);
    } catch (PDOException $e) {
        print "Erreur !: " . $e->getMessage();
        die();
    }
    return $resultat;
}

function conversionAge($date_naissance){
    $date1=time();
    $date2=strtotime($date_naissance);
    $age=$date1 - $date2;
    $age=floor($age/(60*60*24)/364);
    return $age;
}

function getMutuelle($mutuelle){

    try{
    $cnx = connexionPDO();
     $req1 = $cnx->prepare('select numero from mutuelle WHERE nom = ?');
     $req1->bindParam(1, $mutuelle);
     $req1->execute();

     $resultat = $req1->fetch(PDO::FETCH_ASSOC);
    } catch (PDOException $e) {
        print "Erreur !: " . $e->getMessage();
        die();
    }
    return $resultat;
}


function ajoutClient($nom,$prenom,$securite,$mutuelle,$naissance){
    try {
     $cnx = connexionPDO();
     $idM=getMutuelle($mutuelle);
     $age=conversionAge($naissance);

     $req = $cnx->prepare('insert into client (nom,prenom,age,securite_social,id_mutuelle) VALUES (?,?,?,?,?)');
     $req->bindParam(1, $nom);
     $req->bindParam(2, $prenom);
     $req->bindParam(3, $age);
     $req->bindParam(4, $securite);
     $req->bindParam(5, $idM['numero']);

  $req->execute();

  return true;

 } catch (PDOException $e) {
     print "Erreur !: " . $e->getMessage();
     die();
 }
}

?>