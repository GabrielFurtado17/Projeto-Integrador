<?php
    session_start();
    $banco = include "../pdo.php"; //conecta com o banco
    if( !isset($_SESSION['idusuario']) ){
        die(json_encode(array('authenticated'=>false)));
    }else{
        $sql = 'DELETE FROM usuario WHERE idusuario = :idusuario ';
        $statement = $banco->prepare($sql);
        $statement->execute([
            "idusuario" => $_SESSION['idusuario']
        ]);
        die(json_encode(array('authenticated'=>true)));
        session_destroy();
    }