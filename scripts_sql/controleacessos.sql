-- transiteasydb.controleacessos definition

CREATE TABLE `controleacessos` (
  `idControle` int(11) NOT NULL,
  `password` varchar(100) NOT NULL,
  `snAtivo` varchar(1) NOT NULL DEFAULT 'S',
  `dtRegistro` datetime NOT NULL,
  `idUsuario` int(11) NOT NULL,
  `idUsuarioAdm` int(11) DEFAULT NULL,
  `dtInativacao` datetime DEFAULT NULL,
  `motivoInativacao` varchar(200) DEFAULT NULL,
  `observacao` varchar(200) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`idControle`),
  KEY `controleAcesso_FK` (`idUsuario`),
  CONSTRAINT `controleAcesso_FK` FOREIGN KEY (`idUsuario`) REFERENCES `usuarios` (`idUsuario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;