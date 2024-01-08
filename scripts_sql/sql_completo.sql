CREATE DATABASE `transiteasydb` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci */;

-- transiteasydb.pais definition

CREATE TABLE `pais` (
  `idPais` int(11) NOT NULL AUTO_INCREMENT,
  `nmPais` varchar(100) NOT NULL,
  `snAtivo` varchar(1) NOT NULL DEFAULT 'S',
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`idPais`)
) ENGINE=InnoDB AUTO_INCREMENT=129 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

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

-- transiteasydb.cores definition

CREATE TABLE `cores` (
  `idCor` int(11) NOT NULL AUTO_INCREMENT,
  `cor` varchar(30) NOT NULL,
  `snAtivo` varchar(1) NOT NULL DEFAULT 'S',
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`idCor`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;


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

-- transiteasydb.usuarios definition

CREATE TABLE `usuarios` (
  `idUsuario` int(11) NOT NULL AUTO_INCREMENT,
  `cpf` varchar(11) NOT NULL,
  `celPessoal` varchar(14) DEFAULT NULL,
  `celProfissional` varchar(14) NOT NULL,
  `nome` varchar(100) NOT NULL,
  `numRg` varchar(11) NOT NULL,
  `orgaoExpedidorRg` varchar(100) NOT NULL,
  `habilitacao` varchar(11) DEFAULT NULL,
  `imgFoto` blob DEFAULT NULL,
  `dtNascimento` date NOT NULL,
  `email` varchar(100) NOT NULL,
  `idCidade` int(11) NOT NULL,
  `Bairro` varchar(100) NOT NULL,
  `referencia` varchar(200) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`idUsuario`),
  UNIQUE KEY `usuarios_UN` (`cpf`),
  KEY `usuarios_idUsuario_IDX` (`idUsuario`) USING BTREE,
  KEY `usuario_FK` (`idCidade`),
  CONSTRAINT `usuario_FK` FOREIGN KEY (`idCidade`) REFERENCES `cidades` (`idCidade`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;


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

-- transiteasydb.pontos definition

CREATE TABLE `pontos` (
  `idPonto` int(11) NOT NULL,
  `dsPonto` varchar(200) NOT NULL,
  `imgPonto` blob DEFAULT NULL,
  `idUsuario` int(11) NOT NULL,
  `dtCriacao` date NOT NULL,
  `idTipoLocal` int(11) NOT NULL,
  `idCidade` int(11) NOT NULL,
  `bairro` varchar(100) NOT NULL,
  `referencia` varchar(150) DEFAULT NULL,
  `idHorario` int(11) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`idPonto`),
  KEY `Pontos_idPonto_IDX` (`idPonto`) USING BTREE,
  KEY `Pontos_FK` (`idCidade`),
  KEY `Pontos_FK_1` (`idHorario`),
  KEY `Pontos_FK_2` (`idUsuario`),
  CONSTRAINT `Pontos_FK_1` FOREIGN KEY (`idHorario`) REFERENCES `horario` (`idHorario`),
  CONSTRAINT `Pontos_FK_2` FOREIGN KEY (`idUsuario`) REFERENCES `usuarios` (`idUsuario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

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
