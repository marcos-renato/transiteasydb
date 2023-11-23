-- transiteasydb.possuirveiculos definition

CREATE TABLE `possuirveiculos` (
  `idVeiculo` int(11) NOT NULL,
  `idUsuario` int(11) NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`idVeiculo`,`idUsuario`),
  KEY `possuirVeiculos_FK` (`idUsuario`),
  CONSTRAINT `possuirVeiculos_FK` FOREIGN KEY (`idUsuario`) REFERENCES `usuarios` (`idUsuario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;