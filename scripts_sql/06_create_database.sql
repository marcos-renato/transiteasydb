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
