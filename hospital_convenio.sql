-- ============================================================
-- hospital_convenio.sql
-- Banco: hospital (MySQL 8)
-- Contém: estrutura e dados da tabela convenio
-- ============================================================

USE `hospital`;

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

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

SET FOREIGN_KEY_CHECKS = 1;
