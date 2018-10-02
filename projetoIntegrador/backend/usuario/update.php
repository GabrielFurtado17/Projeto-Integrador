<?php 
    session_start();
    $banco = include "../pdo.php"; //conecta com o banco
    if( !isset($_SESSION['idusuario']) ){
        die(json_encode(array('authenticated'=>false)));
    }else{
        $strRecebido = file_get_contents('php://input'); // pega parada
        echo($strRecebido); // to testando a parada que veio, pra ver se veio mesmo
        $objRecebido = json_decode($strRecebido);// tirando json
        $respostaParaOCliente = array();

        if (!property_exists($objRecebido, 'senhanova')/*testa se o senha nova nao ta sem nada*/ || empty($objRecebido->senhanova)/* teste, se ter senhanova, pra ver se ele nao ta "sem nada"*/ ) {
            array_push($respostaParaOCliente,"Faltou colocar o senha nova");
        }
        if(!empty($respostaParaOCliente)){
            die(json_encode($respostaParaOCliente));
        }

        $sql = 'UPDATE FROM cliente 
                    SET senha = :senhanova
        WHERE idusuario = :idusuario AND senha = :senha' ;
        $statement = $banco->prepare($sql);
        $statement->execute([
            "senha" => $objRecebido ->senhanova,
            "idusuario" => $_SESSION['idusuario'],
            "senha" => $_SESSION['senha'],

        ]);	

        die(json_encode(array('authenticated'=>true)));
    }