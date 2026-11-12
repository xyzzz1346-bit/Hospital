-- ============================================================
-- hospital_dump.sql
-- Banco: hospital (MySQL 8)
-- Contém: criação do schema, 10 tabelas e dados de teste
-- ============================================================

DROP DATABASE IF EXISTS `hospital`;
CREATE DATABASE `hospital` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */;
USE `hospital`;

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ------------------------------------------------------------
-- Tabela: especialidade
-- ------------------------------------------------------------
DROP TABLE IF EXISTS `especialidade`;
CREATE TABLE `especialidade` (
  `id_especialidade` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(100) NOT NULL,
  PRIMARY KEY (`id_especialidade`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

INSERT INTO `especialidade` VALUES
(1,'Cardiologia'),
(2,'Cardiologia Pediátrica'),
(3,'Ortopedia'),
(4,'Clínica Geral');

-- ------------------------------------------------------------
-- Tabela: convenio
-- ------------------------------------------------------------
DROP TABLE IF EXISTS `convenio`;
CREATE TABLE `convenio` (
  `id_convenio` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(100) NOT NULL,
  PRIMARY KEY (`id_convenio`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

INSERT INTO `convenio` VALUES
(1,'Unimed Saúde'),
(2,'Bradesco Saúde'),
(3,'Unimed Paulista'),
(4,'SulAmérica');

-- ------------------------------------------------------------
-- Tabela: paciente
-- ------------------------------------------------------------
DROP TABLE IF EXISTS `paciente`;
CREATE TABLE `paciente` (
  `id_paciente` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(100) NOT NULL,
  PRIMARY KEY (`id_paciente`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

INSERT INTO `paciente` VALUES
(1,'Maria Silva'),
(2,'João Silva'),
(3,'Marcos Souza'),
(4,'Mariana Lima'),
(5,'Ana Santos'),
(6,'Silvana Rocha');

-- ------------------------------------------------------------
-- Tabela: medico
-- ------------------------------------------------------------
DROP TABLE IF EXISTS `medico`;
CREATE TABLE `medico` (
  `id_medico` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(100) NOT NULL,
  `id_especialidade` int NOT NULL,
  PRIMARY KEY (`id_medico`),
  KEY `id_especialidade` (`id_especialidade`),
  CONSTRAINT `medico_ibfk_1` FOREIGN KEY (`id_especialidade`) REFERENCES `especialidade` (`id_especialidade`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

INSERT INTO `medico` VALUES
(1,'Dr. Carlos Almeida',1),
(2,'Dra. Paula Mendes',2),
(3,'Dr. Roberto Dias',3),
(4,'Dra. Fernanda Costa',4);

-- ------------------------------------------------------------
-- Tabela: tipo_quarto
-- ------------------------------------------------------------
DROP TABLE IF EXISTS `tipo_quarto`;
CREATE TABLE `tipo_quarto` (
  `id_tipo_quarto` int NOT NULL AUTO_INCREMENT,
  `descricao` varchar(50) NOT NULL,
  PRIMARY KEY (`id_tipo_quarto`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

INSERT INTO `tipo_quarto` VALUES
(1,'Enfermaria'),
(2,'Apartamento'),
(3,'UTI');

-- ------------------------------------------------------------
-- Tabela: quarto
-- ------------------------------------------------------------
DROP TABLE IF EXISTS `quarto`;
CREATE TABLE `quarto` (
  `id_quarto` int NOT NULL AUTO_INCREMENT,
  `id_tipo_quarto` int NOT NULL,
  PRIMARY KEY (`id_quarto`),
  KEY `id_tipo_quarto` (`id_tipo_quarto`),
  CONSTRAINT `quarto_ibfk_1` FOREIGN KEY (`id_tipo_quarto`) REFERENCES `tipo_quarto` (`id_tipo_quarto`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

INSERT INTO `quarto` VALUES
(1,1),
(2,2),
(3,3),
(4,3);

-- ------------------------------------------------------------
-- Tabela: medicamento
-- ------------------------------------------------------------
DROP TABLE IF EXISTS `medicamento`;
CREATE TABLE `medicamento` (
  `id_medicamento` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(100) NOT NULL,
  PRIMARY KEY (`id_medicamento`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

INSERT INTO `medicamento` VALUES
(1,'Dipirona 500mg'),
(2,'Paracetamol 750mg'),
(3,'Amoxicilina 500mg'),
(4,'Ibuprofeno 600mg');

-- ------------------------------------------------------------
-- Tabela: consulta
-- ------------------------------------------------------------
DROP TABLE IF EXISTS `consulta`;
CREATE TABLE `consulta` (
  `id_consulta` int NOT NULL AUTO_INCREMENT,
  `id_paciente` int NOT NULL,
  `id_medico` int NOT NULL,
  `id_convenio` int NOT NULL,
  `valor` decimal(10,2) NOT NULL,
  `status` varchar(30) NOT NULL,
  PRIMARY KEY (`id_consulta`),
  KEY `id_paciente` (`id_paciente`),
  KEY `id_medico` (`id_medico`),
  KEY `id_convenio` (`id_convenio`),
  CONSTRAINT `consulta_ibfk_1` FOREIGN KEY (`id_paciente`) REFERENCES `paciente` (`id_paciente`),
  CONSTRAINT `consulta_ibfk_2` FOREIGN KEY (`id_medico`) REFERENCES `medico` (`id_medico`),
  CONSTRAINT `consulta_ibfk_3` FOREIGN KEY (`id_convenio`) REFERENCES `convenio` (`id_convenio`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

INSERT INTO `consulta` VALUES
(1,1,1,1,300.00,'Realizada'),
(2,2,1,2,350.00,'Finalizada'),
(3,3,2,3,280.00,'Realizada'),
(4,4,3,3,200.00,'Cancelada'),
(5,5,4,4,150.00,'Realizada'),
(6,1,4,1,180.00,'Finalizada'),
(7,4,1,3,320.00,'Realizada'),
(8,3,3,2,220.00,'Agendada');

-- ------------------------------------------------------------
-- Tabela: internacao
-- ------------------------------------------------------------
DROP TABLE IF EXISTS `internacao`;
CREATE TABLE `internacao` (
  `id_internacao` int NOT NULL AUTO_INCREMENT,
  `id_paciente` int NOT NULL,
  `id_convenio` int NOT NULL,
  `id_quarto` int NOT NULL,
  `valor_diaria` decimal(10,2) NOT NULL,
  PRIMARY KEY (`id_internacao`),
  KEY `id_paciente` (`id_paciente`),
  KEY `id_convenio` (`id_convenio`),
  KEY `id_quarto` (`id_quarto`),
  CONSTRAINT `internacao_ibfk_1` FOREIGN KEY (`id_paciente`) REFERENCES `paciente` (`id_paciente`),
  CONSTRAINT `internacao_ibfk_2` FOREIGN KEY (`id_convenio`) REFERENCES `convenio` (`id_convenio`),
  CONSTRAINT `internacao_ibfk_3` FOREIGN KEY (`id_quarto`) REFERENCES `quarto` (`id_quarto`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

INSERT INTO `internacao` VALUES
(1,1,1,2,800.00),
(2,2,2,3,2500.00),
(3,2,2,4,2700.00),
(4,3,3,3,2600.00),
(5,5,4,1,400.00),
(6,4,1,3,2400.00);

-- ------------------------------------------------------------
-- Tabela: prescricao
-- ------------------------------------------------------------
DROP TABLE IF EXISTS `prescricao`;
CREATE TABLE `prescricao` (
  `id_prescricao` int NOT NULL AUTO_INCREMENT,
  `id_consulta` int NOT NULL,
  `id_medicamento` int NOT NULL,
  `quantidade` int NOT NULL DEFAULT '1',
  PRIMARY KEY (`id_prescricao`),
  KEY `id_consulta` (`id_consulta`),
  KEY `id_medicamento` (`id_medicamento`),
  CONSTRAINT `prescricao_ibfk_1` FOREIGN KEY (`id_consulta`) REFERENCES `consulta` (`id_consulta`),
  CONSTRAINT `prescricao_ibfk_2` FOREIGN KEY (`id_medicamento`) REFERENCES `medicamento` (`id_medicamento`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

INSERT INTO `prescricao` VALUES
(1,1,1,2),
(2,1,3,1),
(3,2,2,1),
(4,3,1,1),
(5,5,2,3),
(6,6,4,1),
(7,7,1,1),
(8,7,2,2);

SET FOREIGN_KEY_CHECKS = 1;

-- Fim do dump
