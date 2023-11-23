-- transiteasydb.tipofrequencias definition

CREATE TABLE `tipofrequencias` (
  `idTipoFrequencia` int(11) NOT NULL,
  `dsTipoFrequencia` varchar(100) NOT NULL,
  `frequencia` varchar(100) NOT NULL,
  `snAtivo` varchar(1) NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`idTipoFrequencia`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;