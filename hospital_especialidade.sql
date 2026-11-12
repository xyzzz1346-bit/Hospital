-- ============================================================
-- hospital_especialidade.sql
-- Banco: hospital (MySQL 8)
-- Contém: estrutura e dados da tabela especialidade
-- ============================================================

USE `hospital`;

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

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

SET FOREIGN_KEY_CHECKS = 1;
