-- transiteasydb.viagem definition

CREATE TABLE `viagem` (
  `idViagem` int(11) NOT NULL,
  `idPonto` int(11) NOT NULL,
  `idHorario` int(11) NOT NULL,
  `snReservado` varchar(1) NOT NULL,
  `idUsuario` int(11) NOT NULL,
  `snPago` varchar(1) NOT NULL,
  `snCancelado` varchar(1) NOT NULL,
  `dtCancelamento` datetime DEFAULT NULL,
  `idUsuarioCancelamento` int(11) DEFAULT NULL,
  `motivoCancelamento` varchar(100) DEFAULT NULL,
  `idVeiculo` int(11) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`idViagem`),
  KEY `viagens_FK` (`idPonto`),
  KEY `viagens_FK_1` (`idUsuario`),
  KEY `viagens_FK_2` (`idVeiculo`),
  CONSTRAINT `viagens_FK` FOREIGN KEY (`idPonto`) REFERENCES `pontos` (`idPonto`),
  CONSTRAINT `viagens_FK_1` FOREIGN KEY (`idUsuario`) REFERENCES `usuarios` (`idUsuario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
