-- transiteasydb.pontos definition

CREATE TABLE `pontos` (
  `idPonto` int(11) NOT NULL,
  `dsPonto` varchar(200) NOT NULL,
  `imgPonto` blob DEFAULT NULL,
  `idUsuario` int(11) NOT NULL,
  `dtCriacao` date NOT NULL,
  `idTipoLocal` int(11) NOT NULL,
  `idCidade` int(11) NOT NULL,
  `bairro` varchar(100) NOT NULL,
  `referencia` varchar(150) DEFAULT NULL,
  `idHorario` int(11) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`idPonto`),
  KEY `Pontos_idPonto_IDX` (`idPonto`) USING BTREE,
  KEY `Pontos_FK` (`idCidade`),
  KEY `Pontos_FK_1` (`idHorario`),
  KEY `Pontos_FK_2` (`idUsuario`),
  CONSTRAINT `Pontos_FK_1` FOREIGN KEY (`idHorario`) REFERENCES `horario` (`idHorario`),
  CONSTRAINT `Pontos_FK_2` FOREIGN KEY (`idUsuario`) REFERENCES `usuarios` (`idUsuario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
