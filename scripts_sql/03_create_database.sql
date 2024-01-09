-- transiteasydb.cidades definition

CREATE TABLE `cidades` (
  `idCidade` int(11) NOT NULL AUTO_INCREMENT,
  `idEstado` int(11) NOT NULL DEFAULT 1,
  `nmCidade` varchar(100) NOT NULL,
  `snAtivo` varchar(1) NOT NULL DEFAULT 'S',
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`idCidade`),
  KEY `cidade_FK` (`idEstado`),
  CONSTRAINT `cidade_FK` FOREIGN KEY (`idEstado`) REFERENCES `estados` (`idEstado`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
