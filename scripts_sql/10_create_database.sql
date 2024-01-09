-- transiteasydb.veiculo definition

CREATE TABLE `veiculo` (
  `idVeiculo` int(11) NOT NULL AUTO_INCREMENT,
  `dsVeiculo` varchar(100) NOT NULL,
  `dtCriacao` datetime NOT NULL,
  `idUsuario` int(11) NOT NULL,
  `imgVeiculo` blob NOT NULL,
  `idTipoVeiculo` int(11) NOT NULL,
  `dsAno` varchar(9) NOT NULL,
  `idCor` int(11) NOT NULL,
  `dsModelo` varchar(100) NOT NULL,
  `dsPlaca` varchar(10) NOT NULL,
  `snAtivo` varchar(1) NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`idVeiculo`),
  KEY `veiculos_FK_1` (`idUsuario`),
  KEY `veiculos_FK_2` (`idTipoVeiculo`),
  CONSTRAINT `veiculos_FK_1` FOREIGN KEY (`idUsuario`) REFERENCES `usuarios` (`idUsuario`),
  CONSTRAINT `veiculos_FK_2` FOREIGN KEY (`idTipoVeiculo`) REFERENCES `tipoveiculos` (`idTipoVeiculo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
