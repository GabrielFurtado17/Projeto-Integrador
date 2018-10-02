<?php
    $banco = include "../pdo.php"; //conecta com o banco

    $strRecebido = file_get_contents('php://input'); // pega parada
    //echo($strRecebido); // to testando a parada que veio, pra ver se veio mesmo
    $objRecebido = json_decode($strRecebido);// tirando json
    $respostaParaOCliente = array();
    // array_push() ai ele adiciona no final do arrays
    if (!property_exists($objRecebido, 'nome')/*testa se o nome nao ta sem nada*/ || empty($objRecebido->nome)/* teste, se ter nome, pra ver se ele nao ta "sem nada"*/ ) {
        array_push($respostaParaOCliente,"Faltou colocar o nome");
    }
    if (!property_exists($objRecebido, 'email')/*testa se o email nao ta sem nada*/ || empty($objRecebido->email)/* teste, se ter email, pra ver se ele nao ta "sem nada"*/ ) {
        array_push($respostaParaOCliente,"Faltou colocar o email");
    }
    if (!property_exists($objRecebido, 'senha')/*testa se o senha nao ta sem nada*/ || empty($objRecebido->senha)/* teste, se ter senha, pra ver se ele nao ta "sem nada"*/ ) {
        array_push($respostaParaOCliente,"Faltou colocar o senha");
    }
    if (!property_exists($objRecebido, 'qtdMediaFumada')/*testa se o qtdMediaFumada nao ta sem nada*/ || empty($objRecebido->qtdMediaFumada)/* teste, se ter qtdMediaFumada, pra ver se ele nao ta "sem nada"*/ ) {
        array_push($respostaParaOCliente,"Faltou informar quantos cigarros voce fuma");
    }
    if (!property_exists($objRecebido, 'preco')/*testa se o preco nao ta sem nada*/ || empty($objRecebido->preco)/* teste, se ter preco, pra ver se ele nao ta "sem nada"*/ ) {
        array_push($respostaParaOCliente,"Faltou informar o preço da carteira");
    }
    if(!empty($respostaParaOCliente)){
        die(json_encode($respostaParaOCliente));
    }

    $sqlteste = 'SELECT idusuario FROM usuario WHERE email=:email';
    $statement = $banco->prepare($sqlteste);
            $statement->execute([
                "email" => $objRecebido         ->email ,
    ]);
    $result = $statement->fetch(PDO::FETCH_ASSOC);
    if(!empty($result)){
        array_push($respostaParaOCliente,"E-mail já cadastrado.");
        die(json_encode($respostaParaOCliente));
        //die("MAMA EU AQUI QUE DEU MERDA.");
    }else{
        try{
            $sql = "INSERT INTO usuario (nome, email, senha, qtdMediaFumada, preco) 
                        Values (:nome, :email, :senha, :qtdMediaFumada, :preco)";
            $statement = $banco->prepare($sql);
            $statement->execute([
                "nome" => $objRecebido          ->nome ,
                "email" => $objRecebido         ->email ,
                "senha" => $objRecebido         ->senha,
                "qtdMediaFumada" => $objRecebido->qtdMediaFumada,
                "preco" => $objRecebido         ->preco 
            ]);
            die(json_encode(array('authenticated'=>true)));
    
        } catch (Exception $erro) {
            die("algo deu errado parceiro $erro");
        }
    }
        
    