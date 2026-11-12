-- ============================================================
-- hospital_prescricao.sql
-- Banco: hospital (MySQL 8)
-- Contém: estrutura e dados da tabela prescricao
-- ============================================================

USE `hospital`;

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

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
  CONSTRAINT `prescricao_ibfk_2`
