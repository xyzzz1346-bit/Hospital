-- ============================================================
-- hospital_quarto.sql
-- Banco: hospital (MySQL 8)
-- Contém: estrutura e dados da tabela quarto
-- ============================================================

USE `hospital`;

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

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

SET FOREIGN_KEY_CHECKS = 1;
