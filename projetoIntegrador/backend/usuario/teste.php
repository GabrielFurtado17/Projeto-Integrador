<?php
try{
    $sql = 'SELECT nome FROM cliente WHERE email=:email AND senha = :senha';
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
        echo $result[idusuario];
        $_SESSION['idusuario'] = $result['idusuario'];
        $_SESSION['email'] = $objRecebido->email;
        $_SESSION['senha'] = $objRecebido->senha;
        die(json_encode(array('authenticated'=>true)));
    }
    }catch (Exception $erro) {
        die("algo deu errado parceiro $erro");
    }
