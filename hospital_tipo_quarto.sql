-- ============================================================
-- hospital_tipo_quarto.sql
-- Banco: hospital (MySQL 8)
-- Contém: estrutura e dados da tabela tipo_quarto
-- ============================================================

USE `hospital`;

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

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

SET FOREIGN_KEY_CHECKS = 1;
