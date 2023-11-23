-- transiteasydb.cores definition

CREATE TABLE `cores` (
  `idCor` int(11) NOT NULL AUTO_INCREMENT,
  `cor` varchar(30) NOT NULL,
  `snAtivo` varchar(1) NOT NULL DEFAULT 'S',
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`idCor`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;