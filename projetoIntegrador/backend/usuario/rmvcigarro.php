<?php
    session_start();
    $banco = include "../pdo.php"; //conecta com o banco
    //if( !isset($_SESSION['idusuario']) ){
    //    die(json_encode(array('authenticated'=>false)));
    //}else{
    try{
        $sql = "INSERT INTO saidaCigarro (idusuario) Values (:idusuario)" ;
        $statement = $banco->prepare($sql);
        $statement->execute([
            "idusuario" => $_GET['id']
        ]);
        die(json_encode(array('authenticated'=>true)));
    }catch(Exception $erro) {
        die("algo deu errado parceiro $erro");
    }