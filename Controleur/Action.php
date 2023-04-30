<?php

function Actions($action) {
    $lesActions = array();
    $lesActions["defaut"] = "Navigation.php";
    $lesActions["add"] = "AjouterClient.php";
    $lesActions["listeClient"] = "ListeClient.php";
    $lesActions["déconnexion"] = "déconnexion.php";
    

    if (array_key_exists($action, $lesActions)) {
        return $lesActions[$action];
    } else {
        return $lesActions["defaut"];
    }
}