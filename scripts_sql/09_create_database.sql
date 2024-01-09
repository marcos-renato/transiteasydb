-- transiteasydb.tipoveiculos definition

CREATE TABLE `tipoveiculos` (
  `idTipoVeiculo` int(11) NOT NULL,
  `nrVagas` int(11) NOT NULL,
  `imgAssociadaVagasVeiculos` blob NOT NULL,
  `snAtivo` varchar(1) NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`idTipoVeiculo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
