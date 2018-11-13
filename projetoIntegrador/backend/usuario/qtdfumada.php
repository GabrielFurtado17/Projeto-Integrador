<?php
    session_start();
    $banco = include "../pdo.php"; //conecta com o banco
    if( !isset($_SESSION['idusuario']) ){
        die(json_encode(array('authenticated'=>false)));
    }else{
        $strRecebido = file_get_contents('php://input'); // pega parada
        // echo($strRecebido); // to testando a parada que veio, pra ver se veio mesmo
        $objRecebido = json_decode($strRecebido);// tirando json
        if(!isset($objRecebido)){
            $resultado = read();
        }
        else{
            $resultado = read($objRecebido);
        }

        // function read ($objRecebido=null){
        //     if (!isset($objRecebido)) {
        //         $sql = 'SELECT dataSaida as `data`, COUNT(dataSaida) AS qtd
        //             FROM saidacigarro
        //             WHERE 1 AND idusuario = :idusuario
        //             GROUP BY
        //                 DAY(dataSaida)';
        //         $statement = $banco->prepare($sql);
        //     }else {
        //         $sql = 'SELECT dataSaida as `data`, COUNT(dataSaida) AS qtd
        //             FROM saidacigarro
        //             WHERE 1 AND dataSaida >= :sendDate AND MONTH(dataSaida) < (MONTH(:sendDate)+1) AND idusuario = :idusuario
        //             GROUP BY
        //                 DAY(dataSaida)';
        //         $statement = $banco->prepare($sql);
        //     }
        //     $statement->execute([
        //         "idusuario" => $_SESSION['idusuario'],
        //         "sendDate" => $objRecebido
        //     ]);
        //     $resultado = $statement->fetchAll(PDO::FETCH_ASSOC);
        //     return $resultado;
        // }
    }
    
    function read ($objRecebido=null){
        if (!isset($objRecebido)) {
            $banco = include "../pdo.php"; //conecta com o banco
            $sql = "
            SELECT dataSaida AS `data`, COUNT(dataSaida) AS qtd
                FROM saidacigarro
                WHERE 1 AND idusuario = :idusuario
                GROUP BY
                    DAY(dataSaida)"
                    ;
            $statement = $banco->prepare($sql);
            $statement->execute([
                "idusuario" => $_SESSION['idusuario']
            ]);
            $result = $statement->fetchAll(PDO::FETCH_ASSOC);
            die (json_encode($result));
        }else {
            $banco = include "../pdo.php"; //conecta com o banco
            $sql = "
                SELECT dataSaida AS `data`, COUNT(dataSaida) AS qtd
                FROM saidacigarro
                WHERE 1 AND dataSaida >= :sendDate AND MONTH(dataSaida) < (MONTH(:sendDate)+1) AND idusuario = :idusuario
                GROUP BY
                DAY(dataSaida)";
            $statement = $banco->prepare($sql);
            $statement->execute([
                "idusuario" => $_SESSION['idusuario'],
                "sendDate" => $objRecebido
            ]);
            $result = $statement->fetchAll(PDO::FETCH_ASSOC);
            // echo ($_SESSION['qtdMediaFumada']);
            die (json_encode((object)[
                'media'=>$_SESSION['qtdMediaFumada'],
                'preco'=>$_SESSION['preco'],
                'result'=>$result]));
        }
        $resultado = $statement->fetchAll(PDO::FETCH_ASSOC);
        return $resultado;
    }
    //     try{
    //         // $sql = 'SELECT dataSaida as data, COUNT(dataSaida) as qtd  FROM saidacigarro sc
    //         //     INNER JOIN usuario u 
    //         //         ON u.idusuario = sc.idusuario
    //         // WHERE MONTH(:sendDate) AND u.idusuario =:idusuario GROUP BY DAY(dataSaida)';

    //         $sql = 'SELECT dataSaida as `data`, COUNT(dataSaida) AS qtd
    //             FROM saidacigarro
    //             WHERE 1 AND dataSaida >= :sendDate AND MONTH(dataSaida) < (MONTH(:sendDate)+1) AND idusuario = :idusuario
    //             GROUP BY
    //                 DAY(dataSaida)';
    //         $statement = $banco->prepare($sql);
    //         $statement->execute([
    //             "idusuario" => $_SESSION['idusuario'],
    //             "sendDate" => $objRecebido
    //         ]);
    //         
    //     }catch(Exception $erro) {
    //         die("algo deu errado parceiro $erro");
    //     }
    // }
        
