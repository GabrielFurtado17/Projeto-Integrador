<?php
    session_start();
    $banco = include "../pdo.php"; //conecta com o banco
    if(!isset($_SESSION['idusuario'])){
        die(json_encode(array('authenticated'=>false)));
    }else{
        session_destroy();
        die(json_encode(array('authenticated'=>true)));
    }