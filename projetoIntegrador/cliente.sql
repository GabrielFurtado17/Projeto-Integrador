CREATE TABLE usuario(
    idusuario int NOT NULL AUTO_INCREMENT,
    nome varchar (150) NOT NULL,
    email varchar(150) NOT NULL,
    senha varchar(40) NOT NULL,
    qtdMediaFumada int(40) NOT NULL,
    preco double NOT NULL,
    primary key (idusuario)
);
CREATE TABLE saidaCigarro(
    idsaidaCigarro int NOT NULL AUTO_INCREMENT,
    idusuario int NOT NULL,
    dataSaida timestamp NOT NULL default  CURRENT_TIMESTAMP(),
    primary key (idsaidaCigarro),
    FOREIGN KEY (idusuario) REFERENCES usuario(idusuario) ON DELETE CASCADE
);
CREATE TABLE entradaCigarro(
    identradaCigarro int NOT NULL AUTO_INCREMENT,
    idusuario int NOT NULL,
    dataEntrada timestamp NOT NULL default  CURRENT_TIMESTAMP(),
    primary key (identradaCigarro),
    FOREIGN KEY (idusuario) REFERENCES usuario(idusuario) ON DELETE CASCADE
);
CREATE TABLE mensagens(
    idmensagem int NOT NULL AUTO_INCREMENT,
    texto varchar(255) NOT NULL,
    primary key (idmensagem)
)


--  try{
--      $sql = 'SELECT count(sc.idusuario) FROM saidaCigarro sc
--          INNER JOIN usuario u 
--          ON u.idusuario = sc.idusuario 
--              WHERE sc.saiu LIKE ':data'';
--      $statement = $banco->prepare($sql);
--      $statement->execute([
--         "data" => arr=>'data'
--      ]); 
--      $result = $statement->fetch(PDO::FETCH_ASSOC);
--      echo json_encode($result)
--  }
-- Ajuda aqui:: document.querySelector('[data-date]').dataset
-- Sketch up

-- SELECT saiu, COUNT(saiu)  FROM `saidacigarro` WHERE MONTH('2018-09-10') GROUP BY DAY(saiu)
-- SELECT saiu AS 'data', COUNT(saiu) AS 'qtd'  FROM `saidacigarro` WHERE MONTH('2018-9-1') GROUP BY DAY(saiu)

-- var d = $('#calendar').fullCalendar('getDate')
-- var sendDate = `${d.year()}-${d.month()+1}-${d.day()}`
-- console.log(sendDate)

-- INSERT INTO `saidacigarro` (`idusuario`, `dataSaida`) VALUES ('1004', '2018-11-02 00:00:00');
-- INSERT INTO `saidacigarro` (`idusuario`, `dataSaida`) VALUES ('1004', '2018-11-02 00:00:00');

-- INSERT INTO `saidacigarro` (`idusuario`, `dataSaida`) VALUES ('1004', '2018-11-03 00:00:00');
-- INSERT INTO `saidacigarro` (`idusuario`, `dataSaida`) VALUES ('1004', '2018-11-03 00:00:00');
-- INSERT INTO `saidacigarro` (`idusuario`, `dataSaida`) VALUES ('1004', '2018-11-03 00:00:00');

-- INSERT INTO `saidacigarro` (`idusuario`, `dataSaida`) VALUES ('1004', '2018-11-04 00:00:00');
-- INSERT INTO `saidacigarro` (`idusuario`, `dataSaida`) VALUES ('1004', '2018-11-04 00:00:00');
-- INSERT INTO `saidacigarro` (`idusuario`, `dataSaida`) VALUES ('1004', '2018-11-04 00:00:00');
-- INSERT INTO `saidacigarro` (`idusuario`, `dataSaida`) VALUES ('1004', '2018-11-04 00:00:00');

-- INSERT INTO `saidacigarro` (`idusuario`, `dataSaida`) VALUES ('1004', '2018-11-05 00:00:00');
-- INSERT INTO `saidacigarro` (`idusuario`, `dataSaida`) VALUES ('1004', '2018-11-05 00:00:00');
-- INSERT INTO `saidacigarro` (`idusuario`, `dataSaida`) VALUES ('1004', '2018-11-05 00:00:00');
-- INSERT INTO `saidacigarro` (`idusuario`, `dataSaida`) VALUES ('1004', '2018-11-05 00:00:00');
-- INSERT INTO `saidacigarro` (`idusuario`, `dataSaida`) VALUES ('1004', '2018-11-05 00:00:00');

-- INSERT INTO `saidacigarro` (`idusuario`, `dataSaida`) VALUES ('1004', '2018-11-06 00:00:00');
-- INSERT INTO `saidacigarro` (`idusuario`, `dataSaida`) VALUES ('1004', '2018-11-06 00:00:00');
-- INSERT INTO `saidacigarro` (`idusuario`, `dataSaida`) VALUES ('1004', '2018-11-06 00:00:00');
-- INSERT INTO `saidacigarro` (`idusuario`, `dataSaida`) VALUES ('1004', '2018-11-06 00:00:00');
-- INSERT INTO `saidacigarro` (`idusuario`, `dataSaida`) VALUES ('1004', '2018-11-06 00:00:00');
-- INSERT INTO `saidacigarro` (`idusuario`, `dataSaida`) VALUES ('1004', '2018-11-06 00:00:00');

-- INSERT INTO `saidacigarro` (`idusuario`, `dataSaida`) VALUES ('1004', '2018-11-07 00:00:00');
-- INSERT INTO `saidacigarro` (`idusuario`, `dataSaida`) VALUES ('1004', '2018-11-07 00:00:00');
-- INSERT INTO `saidacigarro` (`idusuario`, `dataSaida`) VALUES ('1004', '2018-11-07 00:00:00');
-- INSERT INTO `saidacigarro` (`idusuario`, `dataSaida`) VALUES ('1004', '2018-11-07 00:00:00');
-- INSERT INTO `saidacigarro` (`idusuario`, `dataSaida`) VALUES ('1004', '2018-11-07 00:00:00');
-- INSERT INTO `saidacigarro` (`idusuario`, `dataSaida`) VALUES ('1004', '2018-11-07 00:00:00');
-- INSERT INTO `saidacigarro` (`idusuario`, `dataSaida`) VALUES ('1004', '2018-11-07 00:00:00');

-- INSERT INTO `saidacigarro` (`idusuario`, `dataSaida`) VALUES ('1004', '2018-11-08 00:00:00');
-- INSERT INTO `saidacigarro` (`idusuario`, `dataSaida`) VALUES ('1004', '2018-11-08 00:00:00');
-- INSERT INTO `saidacigarro` (`idusuario`, `dataSaida`) VALUES ('1004', '2018-11-08 00:00:00');
-- INSERT INTO `saidacigarro` (`idusuario`, `dataSaida`) VALUES ('1004', '2018-11-08 00:00:00');
-- INSERT INTO `saidacigarro` (`idusuario`, `dataSaida`) VALUES ('1004', '2018-11-08 00:00:00');
-- INSERT INTO `saidacigarro` (`idusuario`, `dataSaida`) VALUES ('1004', '2018-11-08 00:00:00');
-- INSERT INTO `saidacigarro` (`idusuario`, `dataSaida`) VALUES ('1004', '2018-11-08 00:00:00');
-- INSERT INTO `saidacigarro` (`idusuario`, `dataSaida`) VALUES ('1004', '2018-11-08 00:00:00');

-- INSERT INTO `saidacigarro` (`idusuario`, `dataSaida`) VALUES ('1004', '2018-11-09 00:00:00');
-- INSERT INTO `saidacigarro` (`idusuario`, `dataSaida`) VALUES ('1004', '2018-11-09 00:00:00');
-- INSERT INTO `saidacigarro` (`idusuario`, `dataSaida`) VALUES ('1004', '2018-11-09 00:00:00');
-- INSERT INTO `saidacigarro` (`idusuario`, `dataSaida`) VALUES ('1004', '2018-11-09 00:00:00');
-- INSERT INTO `saidacigarro` (`idusuario`, `dataSaida`) VALUES ('1004', '2018-11-09 00:00:00');
-- INSERT INTO `saidacigarro` (`idusuario`, `dataSaida`) VALUES ('1004', '2018-11-09 00:00:00');
-- INSERT INTO `saidacigarro` (`idusuario`, `dataSaida`) VALUES ('1004', '2018-11-09 00:00:00');
-- INSERT INTO `saidacigarro` (`idusuario`, `dataSaida`) VALUES ('1004', '2018-11-09 00:00:00');
-- INSERT INTO `saidacigarro` (`idusuario`, `dataSaida`) VALUES ('1004', '2018-11-09 00:00:00');

-- INSERT INTO `saidacigarro` (`idusuario`, `dataSaida`) VALUES ('1004', '2018-11-10 00:00:00');
-- INSERT INTO `saidacigarro` (`idusuario`, `dataSaida`) VALUES ('1004', '2018-11-10 00:00:00');
-- INSERT INTO `saidacigarro` (`idusuario`, `dataSaida`) VALUES ('1004', '2018-11-10 00:00:00');
-- INSERT INTO `saidacigarro` (`idusuario`, `dataSaida`) VALUES ('1004', '2018-11-10 00:00:00');
-- INSERT INTO `saidacigarro` (`idusuario`, `dataSaida`) VALUES ('1004', '2018-11-10 00:00:00');
-- INSERT INTO `saidacigarro` (`idusuario`, `dataSaida`) VALUES ('1004', '2018-11-10 00:00:00');
-- INSERT INTO `saidacigarro` (`idusuario`, `dataSaida`) VALUES ('1004', '2018-11-10 00:00:00');
-- INSERT INTO `saidacigarro` (`idusuario`, `dataSaida`) VALUES ('1004', '2018-11-10 00:00:00');
-- INSERT INTO `saidacigarro` (`idusuario`, `dataSaida`) VALUES ('1004', '2018-11-10 00:00:00');
-- INSERT INTO `saidacigarro` (`idusuario`, `dataSaida`) VALUES ('1004', '2018-11-10 00:00:00');

-- MENSAGENS


-- INSERT INTO `mensagens` (`texto`) VALUES ('Texto 4');
-- INSERT INTO `mensagens` (`texto`) VALUES ('Texto 4');
-- INSERT INTO `mensagens` (`texto`) VALUES ('Texto 4');
-- INSERT INTO `mensagens` (`texto`) VALUES ('Texto 4');
-- INSERT INTO `mensagens` (`texto`) VALUES ('Texto 4');
-- INSERT INTO `mensagens` (`texto`) VALUES ('Texto 4');
-- INSERT INTO `mensagens` (`texto`) VALUES ('Texto 4');
-- INSERT INTO `mensagens` (`texto`) VALUES ('Texto 4');
-- INSERT INTO `mensagens` (`texto`) VALUES ('Texto 4');
-- INSERT INTO `mensagens` (`texto`) VALUES ('Texto 4');
-- INSERT INTO `mensagens` (`texto`) VALUES ('Texto 4');
-- INSERT INTO `mensagens` (`texto`) VALUES ('Texto 4');
-- INSERT INTO `mensagens` (`texto`) VALUES ('Texto 4');
-- INSERT INTO `mensagens` (`texto`) VALUES ('Texto 4');
-- INSERT INTO `mensagens` (`texto`) VALUES ('Texto 4');
-- INSERT INTO `mensagens` (`texto`) VALUES ('Texto 4');
-- INSERT INTO `mensagens` (`texto`) VALUES ('Texto 4');
-- INSERT INTO `mensagens` (`texto`) VALUES ('Texto 4');
-- INSERT INTO `mensagens` (`texto`) VALUES ('Texto 4');
-- INSERT INTO `mensagens` (`texto`) VALUES ('Texto 4');
-- INSERT INTO `mensagens` (`texto`) VALUES ('Texto 4');
-- INSERT INTO `mensagens` (`texto`) VALUES ('Texto 4');
-- INSERT INTO `mensagens` (`texto`) VALUES ('Texto 4');
-- INSERT INTO `mensagens` (`texto`) VALUES ('Texto 4');
-- INSERT INTO `mensagens` (`texto`) VALUES ('Texto 4');
-- INSERT INTO `mensagens` (`texto`) VALUES ('Texto 4');
-- INSERT INTO `mensagens` (`texto`) VALUES ('Texto 4');
-- INSERT INTO `mensagens` (`texto`) VALUES ('Texto 4');
-- INSERT INTO `mensagens` (`texto`) VALUES ('Texto 4');
-- INSERT INTO `mensagens` (`texto`) VALUES ('Texto 4');
-- INSERT INTO `mensagens` (`texto`) VALUES ('Texto 4');
-- INSERT INTO `mensagens` (`texto`) VALUES ('Texto 4');
-- INSERT INTO `mensagens` (`texto`) VALUES ('Texto 4');
-- INSERT INTO `mensagens` (`texto`) VALUES ('Texto 4');
