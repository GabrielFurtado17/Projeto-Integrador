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

-- INSERT INTO `saidacigarro` (`idsaidaCigarro`, `idusuario`, `dataSaida`) VALUES ('2', '1', '2018-10-02 00:00:00');
-- INSERT INTO `saidacigarro` (`idsaidaCigarro`, `idusuario`, `dataSaida`) VALUES ('3', '1', '2018-10-02 00:00:00');

-- INSERT INTO `saidacigarro` (`idsaidaCigarro`, `idusuario`, `dataSaida`) VALUES ('4', '1', '2018-10-03 00:00:00');
-- INSERT INTO `saidacigarro` (`idsaidaCigarro`, `idusuario`, `dataSaida`) VALUES ('5', '1', '2018-10-03 00:00:00');
-- INSERT INTO `saidacigarro` (`idsaidaCigarro`, `idusuario`, `dataSaida`) VALUES ('6', '1', '2018-10-03 00:00:00');

-- INSERT INTO `saidacigarro` (`idsaidaCigarro`, `idusuario`, `dataSaida`) VALUES ('7', '1', '2018-10-04 00:00:00');
-- INSERT INTO `saidacigarro` (`idsaidaCigarro`, `idusuario`, `dataSaida`) VALUES ('8', '1', '2018-10-04 00:00:00');
-- INSERT INTO `saidacigarro` (`idsaidaCigarro`, `idusuario`, `dataSaida`) VALUES ('9', '1', '2018-10-04 00:00:00');
-- INSERT INTO `saidacigarro` (`idsaidaCigarro`, `idusuario`, `dataSaida`) VALUES ('10', '1', '2018-10-04 00:00:00');

-- INSERT INTO `saidacigarro` (`idsaidaCigarro`, `idusuario`, `dataSaida`) VALUES ('11', '1', '2018-10-05 00:00:00');
-- INSERT INTO `saidacigarro` (`idsaidaCigarro`, `idusuario`, `dataSaida`) VALUES ('12', '1', '2018-10-05 00:00:00');
-- INSERT INTO `saidacigarro` (`idsaidaCigarro`, `idusuario`, `dataSaida`) VALUES ('13', '1', '2018-10-05 00:00:00');
-- INSERT INTO `saidacigarro` (`idsaidaCigarro`, `idusuario`, `dataSaida`) VALUES ('14', '1', '2018-10-05 00:00:00');
-- INSERT INTO `saidacigarro` (`idsaidaCigarro`, `idusuario`, `dataSaida`) VALUES ('15', '1', '2018-10-05 00:00:00');

-- INSERT INTO `saidacigarro` (`idsaidaCigarro`, `idusuario`, `dataSaida`) VALUES ('16', '1', '2018-10-06 00:00:00');
-- INSERT INTO `saidacigarro` (`idsaidaCigarro`, `idusuario`, `dataSaida`) VALUES ('17', '1', '2018-10-06 00:00:00');
-- INSERT INTO `saidacigarro` (`idsaidaCigarro`, `idusuario`, `dataSaida`) VALUES ('18', '1', '2018-10-06 00:00:00');
-- INSERT INTO `saidacigarro` (`idsaidaCigarro`, `idusuario`, `dataSaida`) VALUES ('19', '1', '2018-10-06 00:00:00');
-- INSERT INTO `saidacigarro` (`idsaidaCigarro`, `idusuario`, `dataSaida`) VALUES ('20', '1', '2018-10-06 00:00:00');
-- INSERT INTO `saidacigarro` (`idsaidaCigarro`, `idusuario`, `dataSaida`) VALUES ('21', '1', '2018-10-06 00:00:00');

-- INSERT INTO `saidacigarro` (`idsaidaCigarro`, `idusuario`, `dataSaida`) VALUES ('22', '1', '2018-10-07 00:00:00');
-- INSERT INTO `saidacigarro` (`idsaidaCigarro`, `idusuario`, `dataSaida`) VALUES ('23', '1', '2018-10-07 00:00:00');
-- INSERT INTO `saidacigarro` (`idsaidaCigarro`, `idusuario`, `dataSaida`) VALUES ('24', '1', '2018-10-07 00:00:00');
-- INSERT INTO `saidacigarro` (`idsaidaCigarro`, `idusuario`, `dataSaida`) VALUES ('25', '1', '2018-10-07 00:00:00');
-- INSERT INTO `saidacigarro` (`idsaidaCigarro`, `idusuario`, `dataSaida`) VALUES ('26', '1', '2018-10-07 00:00:00');
-- INSERT INTO `saidacigarro` (`idsaidaCigarro`, `idusuario`, `dataSaida`) VALUES ('27', '1', '2018-10-07 00:00:00');
-- INSERT INTO `saidacigarro` (`idsaidaCigarro`, `idusuario`, `dataSaida`) VALUES ('28', '1', '2018-10-07 00:00:00');

-- INSERT INTO `saidacigarro` (`idsaidaCigarro`, `idusuario`, `dataSaida`) VALUES ('29', '1', '2018-10-08 00:00:00');
-- INSERT INTO `saidacigarro` (`idsaidaCigarro`, `idusuario`, `dataSaida`) VALUES ('30', '1', '2018-10-08 00:00:00');
-- INSERT INTO `saidacigarro` (`idsaidaCigarro`, `idusuario`, `dataSaida`) VALUES ('31', '1', '2018-10-08 00:00:00');
-- INSERT INTO `saidacigarro` (`idsaidaCigarro`, `idusuario`, `dataSaida`) VALUES ('32', '1', '2018-10-08 00:00:00');
-- INSERT INTO `saidacigarro` (`idsaidaCigarro`, `idusuario`, `dataSaida`) VALUES ('33', '1', '2018-10-08 00:00:00');
-- INSERT INTO `saidacigarro` (`idsaidaCigarro`, `idusuario`, `dataSaida`) VALUES ('34', '1', '2018-10-08 00:00:00');
-- INSERT INTO `saidacigarro` (`idsaidaCigarro`, `idusuario`, `dataSaida`) VALUES ('35', '1', '2018-10-08 00:00:00');
-- INSERT INTO `saidacigarro` (`idsaidaCigarro`, `idusuario`, `dataSaida`) VALUES ('36', '1', '2018-10-08 00:00:00');

-- INSERT INTO `saidacigarro` (`idsaidaCigarro`, `idusuario`, `dataSaida`) VALUES ('37', '1', '2018-10-09 00:00:00');
-- INSERT INTO `saidacigarro` (`idsaidaCigarro`, `idusuario`, `dataSaida`) VALUES ('38', '1', '2018-10-09 00:00:00');
-- INSERT INTO `saidacigarro` (`idsaidaCigarro`, `idusuario`, `dataSaida`) VALUES ('39', '1', '2018-10-09 00:00:00');
-- INSERT INTO `saidacigarro` (`idsaidaCigarro`, `idusuario`, `dataSaida`) VALUES ('40', '1', '2018-10-09 00:00:00');
-- INSERT INTO `saidacigarro` (`idsaidaCigarro`, `idusuario`, `dataSaida`) VALUES ('41', '1', '2018-10-09 00:00:00');
-- INSERT INTO `saidacigarro` (`idsaidaCigarro`, `idusuario`, `dataSaida`) VALUES ('42', '1', '2018-10-09 00:00:00');
-- INSERT INTO `saidacigarro` (`idsaidaCigarro`, `idusuario`, `dataSaida`) VALUES ('43', '1', '2018-10-09 00:00:00');
-- INSERT INTO `saidacigarro` (`idsaidaCigarro`, `idusuario`, `dataSaida`) VALUES ('44', '1', '2018-10-09 00:00:00');
-- INSERT INTO `saidacigarro` (`idsaidaCigarro`, `idusuario`, `dataSaida`) VALUES ('45', '1', '2018-10-09 00:00:00');

-- INSERT INTO `saidacigarro` (`idsaidaCigarro`, `idusuario`, `dataSaida`) VALUES ('46', '1', '2018-10-10 00:00:00');
-- INSERT INTO `saidacigarro` (`idsaidaCigarro`, `idusuario`, `dataSaida`) VALUES ('47', '1', '2018-10-10 00:00:00');
-- INSERT INTO `saidacigarro` (`idsaidaCigarro`, `idusuario`, `dataSaida`) VALUES ('48', '1', '2018-10-10 00:00:00');
-- INSERT INTO `saidacigarro` (`idsaidaCigarro`, `idusuario`, `dataSaida`) VALUES ('49', '1', '2018-10-10 00:00:00');
-- INSERT INTO `saidacigarro` (`idsaidaCigarro`, `idusuario`, `dataSaida`) VALUES ('50', '1', '2018-10-10 00:00:00');
-- INSERT INTO `saidacigarro` (`idsaidaCigarro`, `idusuario`, `dataSaida`) VALUES ('51', '1', '2018-10-10 00:00:00');
-- INSERT INTO `saidacigarro` (`idsaidaCigarro`, `idusuario`, `dataSaida`) VALUES ('52', '1', '2018-10-10 00:00:00');
-- INSERT INTO `saidacigarro` (`idsaidaCigarro`, `idusuario`, `dataSaida`) VALUES ('53', '1', '2018-10-10 00:00:00');
-- INSERT INTO `saidacigarro` (`idsaidaCigarro`, `idusuario`, `dataSaida`) VALUES ('54', '1', '2018-10-10 00:00:00');
-- INSERT INTO `saidacigarro` (`idsaidaCigarro`, `idusuario`, `dataSaida`) VALUES ('55', '1', '2018-10-10 00:00:00');
