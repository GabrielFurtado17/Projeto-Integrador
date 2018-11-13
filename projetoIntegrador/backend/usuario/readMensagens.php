<?php
    session_start();
    $banco = include "../pdo.php"; //conecta com o banco
    if( !isset($_SESSION['idusuario']) ){
        die(json_encode(array('authenticated'=>false)));
    }else{
        $strRecebido = file_get_contents('php://input'); // pega parada
        // echo($strRecebido); // to testando a parada que veio, pra ver se veio mesmo
        $objRecebido = json_decode($strRecebido);// tirando json

        try{
            $sql = "
               SELECT texto FROM mensagens
            ";
            $statement = $banco->prepare($sql);
            $statement->execute();
            $result = $statement->fetchAll(PDO::FETCH_ASSOC);
            die (json_encode($result));
        }catch(Exception $erro) {
            die("algo deu errado parceiro $erro");
        }
    }
        
