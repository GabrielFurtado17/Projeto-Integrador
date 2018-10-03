<?php
    $banco = include "../pdo.php"; //conecta com o banco
    $strRecebido = file_get_contents('php://input'); // pega parada
    //echo($strRecebido); // to testando a parada que veio, pra ver se veio mesmo
    $objRecebido = json_decode($strRecebido);// tirando json
    $respostaParaOCliente = array();

    if (!property_exists($objRecebido, 'email')/*testa se o email nao ta sem nada*/ || empty($objRecebido->email)/* teste, se ter email, pra ver se ele nao ta "sem nada"*/ ) {
        array_push($respostaParaOCliente,"Faltou colocar o email");
    }
    if (!property_exists($objRecebido, 'senha')/*testa se o senha nao ta sem nada*/ || empty($objRecebido->senha)/* teste, se ter senha, pra ver se ele nao ta "sem nada"*/ ) {
        array_push($respostaParaOCliente,"Faltou colocar o senha");
    }
    if(!empty($respostaParaOCliente)){
        die(json_encode($respostaParaOCliente));
    }
    
    try{
        $sql = 'SELECT idusuario, qtdMediaFumada FROM usuario 
            WHERE email=:email AND senha = :senha';
        $statement = $banco->prepare($sql);
        $statement->execute([
            "email" => $objRecebido ->email,
            "senha" => $objRecebido ->senha
        ]);
        $result = $statement->fetch(PDO::FETCH_ASSOC);
        if(empty($result)){
            die(json_encode(array('authenticated'=>false)));
            //die("MAMA EU AQUI QUE DEU MERDA.");
        }else{
            session_start();
            $_SESSION['idusuario'] = $result['idusuario'];
            $_SESSION['qtdMediaFumada'] = $result['qtdMediaFumada'];
            $_SESSION['preco'] = $result['preco'];
            $_SESSION['email'] = $objRecebido->email;
            $_SESSION['senha'] = $objRecebido->senha;
            die(json_encode(array('authenticated'=>true)));
        }
    }catch (Exception $erro) {
        die("algo deu errado parceiro $erro");
    }
