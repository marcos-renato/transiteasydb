-- transiteasydb.estados definition

CREATE TABLE `estados` (
  `idEstado` int(11) NOT NULL AUTO_INCREMENT,
  `idPais` int(11) NOT NULL DEFAULT 5,
  `nmEstado` varchar(100) NOT NULL,
  `uf` varchar(2) NOT NULL,
  `snAtivo` varchar(1) NOT NULL DEFAULT 'S',
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`idEstado`),
  KEY `estado_FK` (`idPais`),
  CONSTRAINT `estado_FK` FOREIGN KEY (`idPais`) REFERENCES `pais` (`idPais`)
) ENGINE=InnoDB AUTO_INCREMENT=106 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
