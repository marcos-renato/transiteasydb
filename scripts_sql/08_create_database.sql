-- transiteasydb.horario definition

CREATE TABLE `horario` (
  `idHorario` int(11) NOT NULL,
  `dsTitulo` varchar(100) NOT NULL,
  `idTipoEncontro` int(11) NOT NULL,
  `idVeiculo` int(11) NOT NULL,
  `idPonto` int(11) NOT NULL,
  `valorCobrado` decimal(10,0) NOT NULL,
  `dtInicio` datetime NOT NULL,
  `hrInicio` datetime NOT NULL,
  `idTipoFrequencia` int(11) NOT NULL,
  `idUsuario` int(11) NOT NULL,
  `dtCriacao` datetime NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`idHorario`),
  KEY `horarios_FK` (`idTipoFrequencia`),
  CONSTRAINT `horarios_FK` FOREIGN KEY (`idTipoFrequencia`) REFERENCES `tipofrequencias` (`idTipoFrequencia`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
