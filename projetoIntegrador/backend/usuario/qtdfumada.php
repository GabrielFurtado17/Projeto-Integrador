<?php
    session_start();
    $banco = include "../pdo.php"; //conecta com o banco
    if( !isset($_SESSION['idusuario']) ){
        die(json_encode(array('authenticated'=>false)));
    }else{
        $strRecebido = file_get_contents('php://input'); // pega parada
        // echo($strRecebido); // to testando a parada que veio, pra ver se veio mesmo
        $objRecebido = json_decode($strRecebido);// tirando json
        // echo($objRecebido);
        try{
            $sql = 'SELECT dataSaida as data, COUNT(dataSaida) as qtd  FROM saidacigarro sc
                INNER JOIN usuario u 
                    ON u.idusuario = sc.idusuario
            WHERE MONTH(:sendDate) AND u.idusuario =:idusuario GROUP BY DAY(dataSaida)';
            $statement = $banco->prepare($sql);
            $statement->execute([
                "idusuario" => $_SESSION['idusuario'],
                "sendDate" => $objRecebido
            ]);
            $result = $statement->fetchAll(PDO::FETCH_ASSOC);
            // echo ($_SESSION['qtdMediaFumada']);
            die (json_encode((object)[
                'media'=>$_SESSION['qtdMediaFumada'],
                'preco'=>$_SESSION['preco']
                'result'=>$result]));
        }catch(Exception $erro) {
            die("algo deu errado parceiro $erro");
        }
    }
        
