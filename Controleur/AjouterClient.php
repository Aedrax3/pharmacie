<?php 

if(isset($_POST['submit']) OR !empty($_POST['submit'])){

    $nom=$_POST['nom'];
    $prenom=$_POST['prenom'];
    $securite=$_POST['securite'];
    $mutuelle=$_POST['mutuelle'];
    $naissance=$_POST['date_naissance'];

    if(ajoutClient($nom,$prenom,$securite,$mutuelle,$naissance)==true){
        ?>   
        <script>
            alert('Le client a bien été ajouté');
            document.location.href="http://pharmacie/";
        </script>
    <?php }

}else{

include 'Vue/include/head.html';
include 'Vue/vueAddClient.html';
include 'Vue/include/footer.html';

}
?>