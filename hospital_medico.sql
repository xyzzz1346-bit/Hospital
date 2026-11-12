-- ============================================================
-- hospital_medico.sql
-- Banco: hospital (MySQL 8)
-- Contém: estrutura e dados da tabela medico
-- ============================================================

USE `hospital`;

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

DROP TABLE IF EXISTS `medico`;
CREATE TABLE `medico` (
  `id_medico` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(100) NOT NULL,
  `id_especialidade` int NOT NULL,
  PRIMARY KEY (`id_medico`),
  KEY `id_especialidade` (`id_especialidade`),
  CONSTRAINT `medico_ibfk_1` FOREIGN KEY (`id_especialidade`) REFERENCES `especialidade` (`id_especialidade`)
) ENGINE=InnoDB AUTO_INCREMENT=5
