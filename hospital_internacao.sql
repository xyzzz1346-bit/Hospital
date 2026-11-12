-- ============================================================
-- hospital_internacao.sql
-- Banco: hospital (MySQL 8)
-- Contém: estrutura e dados da tabela internacao
-- ============================================================

USE `hospital`;

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

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

SET FOREIGN_KEY_CHECKS = 1;
