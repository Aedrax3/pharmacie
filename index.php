<?php
include_once "Controleur/Action.php";
include_once 'fonction/fonction.php';


if (isset($_GET["action"])){
    $action = $_GET["action"];
}
else{
    
    $action = "defaut";
}

$fichier = Actions($action);
include "Controleur/$fichier";




?>