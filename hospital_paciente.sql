-- ============================================================
-- hospital_paciente.sql
-- Banco: hospital (MySQL 8)
-- Contém: estrutura e dados da tabela paciente
-- ============================================================

USE `hospital`;

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

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

SET FOREIGN_KEY_CHECKS = 1;
