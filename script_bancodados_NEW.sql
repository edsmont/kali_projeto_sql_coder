-- MySQL dump 10.13  Distrib 8.0.40, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: kali
-- ------------------------------------------------------
-- Server version	8.0.40

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `alerta_monitoracao`
--

DROP TABLE IF EXISTS `alerta_monitoracao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `alerta_monitoracao` (
  `alerta_monitoracao_id` int unsigned NOT NULL AUTO_INCREMENT,
  `titulo` varchar(255) NOT NULL,
  `descricao` varchar(255) NOT NULL,
  `prioridade` int NOT NULL,
  `origem` varchar(255) NOT NULL,
  `tipo_alerta_id` int unsigned NOT NULL,
  `ativo_id` int unsigned DEFAULT NULL,
  `ativo_servico_id` int unsigned DEFAULT NULL,
  `inicio_date` datetime NOT NULL,
  `fim_date` datetime DEFAULT NULL,
  `status` int unsigned NOT NULL,
  `ciclo_vida_timestamp` varchar(50) DEFAULT NULL,
  `contador_evento` int DEFAULT '1',
  PRIMARY KEY (`alerta_monitoracao_id`),
  KEY `alerta_monitoracao_tipo_alerta_id_index` (`tipo_alerta_id`),
  KEY `alerta_monitoracao_ativo_id_index` (`ativo_id`),
  KEY `alerta_monitoracao_ativo_servico_id_index` (`ativo_servico_id`),
  KEY `alerta_monitoracao_status_foreign` (`status`),
  CONSTRAINT `alerta_monitoracao_ativo_id_foreign` FOREIGN KEY (`ativo_id`) REFERENCES `ativo` (`ativo_id`),
  CONSTRAINT `alerta_monitoracao_ativo_servico_id_foreign` FOREIGN KEY (`ativo_servico_id`) REFERENCES `ativo_servico` (`ativo_servico_id`),
  CONSTRAINT `alerta_monitoracao_status_foreign` FOREIGN KEY (`status`) REFERENCES `status` (`status_id`),
  CONSTRAINT `alerta_monitoracao_tipo_alerta_id_foreign` FOREIGN KEY (`tipo_alerta_id`) REFERENCES `tipo_alerta` (`tipo_alerta_id`)
) ENGINE=InnoDB AUTO_INCREMENT=92 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`lab2`@`localhost`*/ /*!50003 TRIGGER `trg_registrar_mudanca_status` BEFORE UPDATE ON `alerta_monitoracao` FOR EACH ROW BEGIN
    -- Só registrar se o status for alterado
    IF OLD.status <> NEW.status THEN
        INSERT INTO historico_status_alerta (
            alerta_monitoracao_id, 
            status_anterior, 
            status_novo, 
            data_alteracao
        ) 
        VALUES (
            NEW.alerta_monitoracao_id, 
            OLD.status, 
            NEW.status, 
            NOW()
        );
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`lab2`@`localhost`*/ /*!50003 TRIGGER `trg_atualizar_ciclo_vida_alerta` BEFORE UPDATE ON `alerta_monitoracao` FOR EACH ROW BEGIN
    DECLARE fim_calculo TIMESTAMP;

    -- Se fim_date for NULL, usamos NOW(), senão usamos fim_date
    SET fim_calculo = IFNULL(NEW.fim_date, NOW());

    -- Formatar ciclo de vida corretamente em VARCHAR
    SET NEW.ciclo_vida_timestamp = CONCAT(
        TIMESTAMPDIFF(DAY, NEW.inicio_date, fim_calculo), ' dias, ',
        MOD(TIMESTAMPDIFF(HOUR, NEW.inicio_date, fim_calculo), 24), ' horas'
    );
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`lab2`@`localhost`*/ /*!50003 TRIGGER `trg_fechar_incidente_com_alerta` AFTER UPDATE ON `alerta_monitoracao` FOR EACH ROW BEGIN
    -- Se o alerta foi fechado (status 6 ou 7) e o incidente ainda estiver aberto
    IF (NEW.status IN (6,7)) THEN
        UPDATE incidente_itsm 
        SET status = 6, 
            fim_incidente_date = NOW()
        WHERE alerta_monitoracao_id = NEW.alerta_monitoracao_id 
        AND (status <> 6 OR fim_incidente_date IS NULL);
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Temporary view structure for view `alertasabertoprioridades`
--

DROP TABLE IF EXISTS `alertasabertoprioridades`;
/*!50001 DROP VIEW IF EXISTS `alertasabertoprioridades`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `alertasabertoprioridades` AS SELECT 
 1 AS `alerta_monitoracao_id`,
 1 AS `titulo`,
 1 AS `alerta_descricao`,
 1 AS `prioridade`,
 1 AS `alerta_status`,
 1 AS `alerta_inicio_date`,
 1 AS `incidente_itsm_id`,
 1 AS `incidente_status`,
 1 AS `inicio_incidente_date`,
 1 AS `fim_incidente_date`,
 1 AS `ativo_descricao`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `ativo`
--

DROP TABLE IF EXISTS `ativo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ativo` (
  `ativo_id` int unsigned NOT NULL AUTO_INCREMENT,
  `cliente_id` int unsigned NOT NULL,
  `descricao` varchar(255) NOT NULL,
  `patrimonio` int NOT NULL,
  `fornecedor` varchar(255) DEFAULT NULL,
  `sla_id` int unsigned NOT NULL,
  `cod_fornecedor` int DEFAULT NULL,
  PRIMARY KEY (`ativo_id`),
  KEY `ativo_cliente_id_index` (`cliente_id`),
  KEY `ativo_sla_id_index` (`sla_id`),
  CONSTRAINT `ativo_cliente_id_foreign` FOREIGN KEY (`cliente_id`) REFERENCES `cliente` (`cliente_id`),
  CONSTRAINT `ativo_sla_id_foreign` FOREIGN KEY (`sla_id`) REFERENCES `sla` (`sla_id`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ativo_servico`
--

DROP TABLE IF EXISTS `ativo_servico`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ativo_servico` (
  `ativo_servico_id` int unsigned NOT NULL AUTO_INCREMENT,
  `nome` varchar(255) NOT NULL,
  `ativo_id` int unsigned NOT NULL,
  `sla_id` int unsigned NOT NULL,
  PRIMARY KEY (`ativo_servico_id`),
  KEY `ativo_servico_ativo_id_index` (`ativo_id`),
  KEY `ativo_servico_sla_id_index` (`sla_id`),
  CONSTRAINT `ativo_servico_ativo_id_foreign` FOREIGN KEY (`ativo_id`) REFERENCES `ativo` (`ativo_id`),
  CONSTRAINT `ativo_servico_sla_id_foreign` FOREIGN KEY (`sla_id`) REFERENCES `sla` (`sla_id`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cliente`
--

DROP TABLE IF EXISTS `cliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cliente` (
  `cliente_id` int unsigned NOT NULL AUTO_INCREMENT,
  `cnpj` varchar(255) NOT NULL,
  `nome` varchar(255) NOT NULL,
  PRIMARY KEY (`cliente_id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cliente_endereco`
--

DROP TABLE IF EXISTS `cliente_endereco`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cliente_endereco` (
  `cliente_endereco_id` int unsigned NOT NULL AUTO_INCREMENT,
  `cliente_id` int unsigned NOT NULL,
  `endereco` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `telefone` varchar(255) NOT NULL,
  PRIMARY KEY (`cliente_endereco_id`),
  KEY `cliente_endereco_cliente_id_index` (`cliente_id`),
  CONSTRAINT `cliente_endereco_cliente_id_foreign` FOREIGN KEY (`cliente_id`) REFERENCES `cliente` (`cliente_id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Temporary view structure for view `dependencia`
--

DROP TABLE IF EXISTS `dependencia`;
/*!50001 DROP VIEW IF EXISTS `dependencia`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `dependencia` AS SELECT 
 1 AS `ativo_servico_id`,
 1 AS `nome_servico`,
 1 AS `ativo_id`,
 1 AS `descricao_ativo`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `historico_status_alerta`
--

DROP TABLE IF EXISTS `historico_status_alerta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `historico_status_alerta` (
  `historico_id` int unsigned NOT NULL AUTO_INCREMENT,
  `alerta_monitoracao_id` int unsigned NOT NULL,
  `status_anterior` int unsigned NOT NULL,
  `status_novo` int unsigned NOT NULL,
  `data_alteracao` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`historico_id`),
  KEY `alerta_monitoracao_id` (`alerta_monitoracao_id`),
  KEY `status_anterior` (`status_anterior`),
  KEY `status_novo` (`status_novo`),
  CONSTRAINT `historico_status_alerta_ibfk_1` FOREIGN KEY (`alerta_monitoracao_id`) REFERENCES `alerta_monitoracao` (`alerta_monitoracao_id`),
  CONSTRAINT `historico_status_alerta_ibfk_2` FOREIGN KEY (`status_anterior`) REFERENCES `status` (`status_id`),
  CONSTRAINT `historico_status_alerta_ibfk_3` FOREIGN KEY (`status_novo`) REFERENCES `status` (`status_id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `incidente_itsm`
--

DROP TABLE IF EXISTS `incidente_itsm`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `incidente_itsm` (
  `incidente_itsm_id` int unsigned NOT NULL AUTO_INCREMENT,
  `alerta_monitoracao_id` int unsigned NOT NULL,
  `ativo_id` int unsigned DEFAULT NULL,
  `ativo_servico_id` int unsigned DEFAULT NULL,
  `sla_id` int unsigned NOT NULL,
  `inicio_incidente_date` datetime NOT NULL,
  `fim_incidente_date` datetime DEFAULT NULL,
  `status` int unsigned DEFAULT NULL,
  `ciclo_vida_incidente` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`incidente_itsm_id`),
  KEY `incidente_itsm_alerta_monitoracao_id_index` (`alerta_monitoracao_id`),
  KEY `incidente_itsm_ativo_id_index` (`ativo_id`),
  KEY `incidente_itsm_ativo_servico_id_index` (`ativo_servico_id`),
  KEY `incidente_itsm_sla_id_index` (`sla_id`),
  KEY `incidente_itsm_status_foreign` (`status`),
  CONSTRAINT `incidente_itsm_alerta_monitoracao_id_foreign` FOREIGN KEY (`alerta_monitoracao_id`) REFERENCES `alerta_monitoracao` (`alerta_monitoracao_id`),
  CONSTRAINT `incidente_itsm_ativo_id_foreign` FOREIGN KEY (`ativo_id`) REFERENCES `ativo` (`ativo_id`),
  CONSTRAINT `incidente_itsm_ativo_servico_id_foreign` FOREIGN KEY (`ativo_servico_id`) REFERENCES `ativo_servico` (`ativo_servico_id`),
  CONSTRAINT `incidente_itsm_sla_id_foreign` FOREIGN KEY (`sla_id`) REFERENCES `sla` (`sla_id`),
  CONSTRAINT `incidente_itsm_status_foreign` FOREIGN KEY (`status`) REFERENCES `status` (`status_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1002 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`lab2`@`localhost`*/ /*!50003 TRIGGER `trg_atualizar_ciclo_vida_incidente` BEFORE UPDATE ON `incidente_itsm` FOR EACH ROW BEGIN
    DECLARE fim_calculo TIMESTAMP;

    -- Se fim_incidente_date for NULL, usamos NOW(), senão usamos fim_incidente_date
    SET fim_calculo = IFNULL(NEW.fim_incidente_date, NOW());

    -- Formatar ciclo de vida corretamente em VARCHAR
    SET NEW.ciclo_vida_incidente = CONCAT(
        TIMESTAMPDIFF(DAY, NEW.inicio_incidente_date, fim_calculo), ' dias, ',
        MOD(TIMESTAMPDIFF(HOUR, NEW.inicio_incidente_date, fim_calculo), 24), ' horas'
    );
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `sla`
--

DROP TABLE IF EXISTS `sla`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sla` (
  `sla_id` int unsigned NOT NULL AUTO_INCREMENT,
  `tempo_solucao` time NOT NULL,
  PRIMARY KEY (`sla_id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Temporary view structure for view `sla_ativos`
--

DROP TABLE IF EXISTS `sla_ativos`;
/*!50001 DROP VIEW IF EXISTS `sla_ativos`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `sla_ativos` AS SELECT 
 1 AS `id`,
 1 AS `ativo_servico_id`,
 1 AS `ativo_descricao`,
 1 AS `sla_id`,
 1 AS `tempo_solucao`,
 1 AS `alerta_monitoracao_id`,
 1 AS `alerta_titulo`,
 1 AS `alerta_descricao`,
 1 AS `alerta_status`,
 1 AS `alerta_inicio_date`,
 1 AS `alerta_fim_date`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `status`
--

DROP TABLE IF EXISTS `status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `status` (
  `status_id` int unsigned NOT NULL AUTO_INCREMENT,
  `nome` varchar(255) NOT NULL,
  PRIMARY KEY (`status_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tipo_alerta`
--

DROP TABLE IF EXISTS `tipo_alerta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tipo_alerta` (
  `tipo_alerta_id` int unsigned NOT NULL AUTO_INCREMENT,
  `descricao` varchar(255) NOT NULL,
  PRIMARY KEY (`tipo_alerta_id`)
) ENGINE=InnoDB AUTO_INCREMENT=81 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Temporary view structure for view `vw_alertas_abertos`
--

DROP TABLE IF EXISTS `vw_alertas_abertos`;
/*!50001 DROP VIEW IF EXISTS `vw_alertas_abertos`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_alertas_abertos` AS SELECT 
 1 AS `alerta_monitoracao_id`,
 1 AS `titulo`,
 1 AS `descricao`,
 1 AS `prioridade`,
 1 AS `origem`,
 1 AS `tipo_alerta`,
 1 AS `ativo`,
 1 AS `servico`,
 1 AS `status`,
 1 AS `inicio_date`,
 1 AS `fim_date`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vw_alertas_por_cliente`
--

DROP TABLE IF EXISTS `vw_alertas_por_cliente`;
/*!50001 DROP VIEW IF EXISTS `vw_alertas_por_cliente`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_alertas_por_cliente` AS SELECT 
 1 AS `cliente`,
 1 AS `total_alertas`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vw_incidentes_abertos`
--

DROP TABLE IF EXISTS `vw_incidentes_abertos`;
/*!50001 DROP VIEW IF EXISTS `vw_incidentes_abertos`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_incidentes_abertos` AS SELECT 
 1 AS `incidente_itsm_id`,
 1 AS `alerta_monitoracao_id`,
 1 AS `alerta_titulo`,
 1 AS `ativo`,
 1 AS `servico`,
 1 AS `sla_definido`,
 1 AS `status`,
 1 AS `inicio_incidente_date`,
 1 AS `fim_incidente_date`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vw_sla_vencidos`
--

DROP TABLE IF EXISTS `vw_sla_vencidos`;
/*!50001 DROP VIEW IF EXISTS `vw_sla_vencidos`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_sla_vencidos` AS SELECT 
 1 AS `incidente_itsm_id`,
 1 AS `alerta_monitoracao_id`,
 1 AS `ativo_id`,
 1 AS `inicio_incidente_date`,
 1 AS `fim_incidente_date`,
 1 AS `sla_id`,
 1 AS `tempo_solucao`,
 1 AS `tempo_resolucao_horas`,
 1 AS `status_sla`,
 1 AS `status`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vw_sla_vencidos_abertos`
--

DROP TABLE IF EXISTS `vw_sla_vencidos_abertos`;
/*!50001 DROP VIEW IF EXISTS `vw_sla_vencidos_abertos`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_sla_vencidos_abertos` AS SELECT 
 1 AS `incidente_itsm_id`,
 1 AS `alerta_monitoracao_id`,
 1 AS `ativo_id`,
 1 AS `inicio_incidente_date`,
 1 AS `sla_id`,
 1 AS `tempo_solucao`,
 1 AS `tempo_decorrido_horas`,
 1 AS `status_sla`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vw_sla_vencidos_fechados`
--

DROP TABLE IF EXISTS `vw_sla_vencidos_fechados`;
/*!50001 DROP VIEW IF EXISTS `vw_sla_vencidos_fechados`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_sla_vencidos_fechados` AS SELECT 
 1 AS `incidente_itsm_id`,
 1 AS `alerta_monitoracao_id`,
 1 AS `ativo_id`,
 1 AS `inicio_incidente_date`,
 1 AS `fim_incidente_date`,
 1 AS `sla_id`,
 1 AS `tempo_solucao`,
 1 AS `tempo_resolucao_horas`,
 1 AS `status_sla`*/;
SET character_set_client = @saved_cs_client;

--
-- Dumping events for database 'kali'
--
/*!50106 SET @save_time_zone= @@TIME_ZONE */ ;
/*!50106 DROP EVENT IF EXISTS `evento_deletar_alertas` */;
DELIMITER ;;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;;
/*!50003 SET character_set_client  = utf8mb4 */ ;;
/*!50003 SET character_set_results = utf8mb4 */ ;;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;;
/*!50003 SET @saved_time_zone      = @@time_zone */ ;;
/*!50003 SET time_zone             = 'SYSTEM' */ ;;
/*!50106 CREATE*/ /*!50117 DEFINER=`lab2`@`localhost`*/ /*!50106 EVENT `evento_deletar_alertas` ON SCHEDULE EVERY 1 DAY STARTS '2025-02-11 09:33:21' ON COMPLETION NOT PRESERVE ENABLE DO CALL sp_deletar_alertas_antigos() */ ;;
/*!50003 SET time_zone             = @saved_time_zone */ ;;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;;
/*!50003 SET character_set_client  = @saved_cs_client */ ;;
/*!50003 SET character_set_results = @saved_cs_results */ ;;
/*!50003 SET collation_connection  = @saved_col_connection */ ;;
/*!50106 DROP EVENT IF EXISTS `evento_deletar_incidentes` */;;
DELIMITER ;;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;;
/*!50003 SET character_set_client  = utf8mb4 */ ;;
/*!50003 SET character_set_results = utf8mb4 */ ;;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;;
/*!50003 SET @saved_time_zone      = @@time_zone */ ;;
/*!50003 SET time_zone             = 'SYSTEM' */ ;;
/*!50106 CREATE*/ /*!50117 DEFINER=`lab2`@`localhost`*/ /*!50106 EVENT `evento_deletar_incidentes` ON SCHEDULE EVERY 1 DAY STARTS '2025-02-11 02:45:47' ON COMPLETION NOT PRESERVE ENABLE DO CALL sp_deletar_incidentes_antigos() */ ;;
/*!50003 SET time_zone             = @saved_time_zone */ ;;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;;
/*!50003 SET character_set_client  = @saved_cs_client */ ;;
/*!50003 SET character_set_results = @saved_cs_results */ ;;
/*!50003 SET collation_connection  = @saved_col_connection */ ;;
DELIMITER ;
/*!50106 SET TIME_ZONE= @save_time_zone */ ;

--
-- Dumping routines for database 'kali'
--
/*!50003 DROP FUNCTION IF EXISTS `fn_alertas_pendentes_por_cliente` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`lab2`@`localhost` FUNCTION `fn_alertas_pendentes_por_cliente`(
    p_cliente_id INT
) RETURNS int
    DETERMINISTIC
BEGIN
    DECLARE v_total INT;

    -- Conta quantos alertas estão abertos para um cliente específico
    SELECT COUNT(*) INTO v_total
    FROM alerta_monitoracao a
    JOIN ativo at ON a.ativo_id = at.ativo_id
    WHERE at.cliente_id = p_cliente_id
    AND a.status = 1;  -- Apenas alertas abertos

    RETURN v_total;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `fn_calcular_sla_restante` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`lab2`@`localhost` FUNCTION `fn_calcular_sla_restante`(
    p_incidente_itsm_id INT
) RETURNS varchar(50) CHARSET utf8mb4
    DETERMINISTIC
BEGIN
    DECLARE v_tempo_total_sla INT DEFAULT 0;
    DECLARE v_tempo_decorrido INT DEFAULT 0;
    DECLARE v_tempo_restante INT DEFAULT 0;
    DECLARE v_fim_calculo TIMESTAMP;

    -- Pegar o tempo de SLA do incidente (convertendo de TIME para horas inteiras)
    SELECT TIME_TO_SEC(s.tempo_solucao) / 3600
    INTO v_tempo_total_sla
    FROM incidente_itsm i
    JOIN sla s ON i.sla_id = s.sla_id
    WHERE i.incidente_itsm_id = p_incidente_itsm_id;

    -- Se o incidente ou SLA não existir, retorna erro
    IF v_tempo_total_sla IS NULL THEN
        RETURN 'ERRO: Incidente não encontrado ou SLA indefinido.';
    END IF;

    -- Determinar até onde calcular: se o incidente estiver fechado, usar fim_incidente_date, senão usar NOW()
    SELECT IFNULL(fim_incidente_date, NOW())
    INTO v_fim_calculo
    FROM incidente_itsm
    WHERE incidente_itsm_id = p_incidente_itsm_id;

    -- Verificar tempo decorrido desde a abertura do incidente até o momento apropriado (NOW() ou fim_incidente_date)
    SELECT TIMESTAMPDIFF(HOUR, inicio_incidente_date, v_fim_calculo)
    INTO v_tempo_decorrido
    FROM incidente_itsm
    WHERE incidente_itsm_id = p_incidente_itsm_id;

    -- Calcular o tempo restante do SLA
    SET v_tempo_restante = v_tempo_total_sla - v_tempo_decorrido;

    -- Se o tempo restante for negativo, significa que o SLA expirou
    IF v_tempo_restante < 0 THEN
        RETURN CONCAT('SLA EXPIRADO há ', ABS(v_tempo_restante), ' horas');
    ELSE
        RETURN CONCAT(v_tempo_restante, ' horas restantes');
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `fn_contar_alertas_por_ativo` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`lab2`@`localhost` FUNCTION `fn_contar_alertas_por_ativo`(
    p_ativo_id INT
) RETURNS int
    DETERMINISTIC
BEGIN
    DECLARE v_total INT;

    -- Conta todos os alertas associados ao ativo
    SELECT COUNT(*) INTO v_total
    FROM alerta_monitoracao
    WHERE ativo_id = p_ativo_id;

    RETURN v_total;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `fn_contar_incidentes_abertos` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`lab2`@`localhost` FUNCTION `fn_contar_incidentes_abertos`() RETURNS int
    DETERMINISTIC
BEGIN
    DECLARE v_total INT;

    -- Conta todos os incidentes com status "Aberto"
    SELECT COUNT(*) INTO v_total
    FROM incidente_itsm
    WHERE status = 1;  -- Apenas status "Aberto"

    RETURN v_total;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `fn_obter_ultimo_alerta` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`lab2`@`localhost` FUNCTION `fn_obter_ultimo_alerta`() RETURNS int
    DETERMINISTIC
BEGIN
    DECLARE v_alerta_id INT;

    -- Pega o último alerta registrado
    SELECT alerta_monitoracao_id INTO v_alerta_id
    FROM alerta_monitoracao
    ORDER BY inicio_date DESC
    LIMIT 1;

    RETURN v_alerta_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `fn_tempo_medio_resolucao` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`lab2`@`localhost` FUNCTION `fn_tempo_medio_resolucao`() RETURNS varchar(50) CHARSET utf8mb4
    DETERMINISTIC
BEGIN
    DECLARE v_tempo_medio INT;

    -- Calcula a média de tempo de resolução em horas
    SELECT AVG(TIMESTAMPDIFF(HOUR, inicio_incidente_date, fim_incidente_date))
    INTO v_tempo_medio
    FROM incidente_itsm
    WHERE status IN (6,7)  -- Apenas incidentes resolvidos ou fechados
    AND fim_incidente_date IS NOT NULL;

    RETURN CONCAT(v_tempo_medio, ' horas');
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_alterar_status_incidente` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`lab2`@`localhost` PROCEDURE `sp_alterar_status_incidente`(
    IN p_incidente_itsm_id INT,
    IN p_novo_status INT
)
BEGIN
    DECLARE incidente_existente INT;

    -- Verifica se o incidente existe antes de tentar atualizar
    SELECT COUNT(*) INTO incidente_existente 
    FROM incidente_itsm 
    WHERE incidente_itsm_id = p_incidente_itsm_id;

    -- Se o incidente existir, atualiza o status
    IF incidente_existente > 0 THEN
        UPDATE incidente_itsm
        SET status = p_novo_status,
            fim_incidente_date = IF(p_novo_status IN (6, 7), NOW(), fim_incidente_date)
        WHERE incidente_itsm_id = p_incidente_itsm_id;

        -- Mensagem de sucesso
        SELECT CONCAT('Status do Incidente ID ', p_incidente_itsm_id, ' atualizado para ', p_novo_status, '.') AS mensagem_sucesso;

    ELSE
        -- Se o incidente não existir, retorna erro
        SELECT 'ERRO: Incidente não encontrado.' AS mensagem_erro;
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_concluir_alerta` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`lab2`@`localhost` PROCEDURE `sp_concluir_alerta`(
    IN p_tipo_alerta_id INT,
    IN p_ativo_id INT,
    IN p_ativo_servico_id INT,
    IN p_fim_date TIMESTAMP
)
BEGIN
    DECLARE alerta_id_existente INT DEFAULT NULL;
    DECLARE alerta_status INT DEFAULT NULL;
    
    -- Verifica se existe um alerta ativo correspondente
    SELECT alerta_monitoracao_id, status 
    INTO alerta_id_existente, alerta_status
    FROM alerta_monitoracao
    WHERE tipo_alerta_id = p_tipo_alerta_id
      AND ativo_id = p_ativo_id
      AND ativo_servico_id = p_ativo_servico_id
      AND status != 7  -- Apenas alertas que ainda não estão fechados
    ORDER BY inicio_date DESC
    LIMIT 1;
    
    -- Se o alerta não existir ou já estiver fechado, retorna erro
    IF alerta_id_existente IS NULL THEN
        SELECT 'ERRO: Nenhum alerta aberto encontrado para esses parâmetros.' AS mensagem_erro;
    ELSE
        -- Atualiza o alerta para status = 7 e registra a data de conclusão
        UPDATE alerta_monitoracao
        SET status = 7, fim_date = p_fim_date
        WHERE alerta_monitoracao_id = alerta_id_existente;
        
        -- Retorna mensagem de sucesso
        SELECT CONCAT('Alerta ID ', alerta_id_existente, ' concluído com sucesso.') AS mensagem_sucesso;
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_deletar_alertas_antigos` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`lab2`@`localhost` PROCEDURE `sp_deletar_alertas_antigos`()
BEGIN
    DELETE FROM alerta_monitoracao
    WHERE status = 7 
    AND inicio_date < DATE_SUB(NOW(), INTERVAL 60 DAY);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_deletar_incidentes_antigos` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`lab2`@`localhost` PROCEDURE `sp_deletar_incidentes_antigos`()
BEGIN
    DELETE FROM incidente_itsm
    WHERE status = 7 
    AND inicio_incidente_date < DATE_SUB(NOW(), INTERVAL 60 DAY);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_inserir_alerta` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`lab2`@`localhost` PROCEDURE `sp_inserir_alerta`(
    IN p_titulo VARCHAR(255),
    IN p_descricao VARCHAR(255),
    IN p_tipo_alerta_id INT,
    IN p_ativo_id INT,
    IN p_ativo_servico_id INT,
    IN p_prioridade INT,
    IN p_origem VARCHAR(255)
)
BEGIN
    DECLARE alerta_id_existente INT DEFAULT NULL;
    DECLARE alerta_status INT DEFAULT NULL;
    DECLARE alerta_contador INT DEFAULT 0;

    -- Verifica se já existe um alerta idêntico
    SELECT alerta_monitoracao_id, status, IFNULL(contador_evento, 0)
    INTO alerta_id_existente, alerta_status, alerta_contador
    FROM alerta_monitoracao
    WHERE titulo = p_titulo
      AND descricao = p_descricao
      AND tipo_alerta_id = p_tipo_alerta_id
      AND ativo_id = p_ativo_id
      AND ativo_servico_id = p_ativo_servico_id
    ORDER BY inicio_date DESC
    LIMIT 1;

    -- Se o alerta já existir e estiver "Aberto" ou "Em tratamento" (status != 7), incrementa contador_evento
    IF alerta_id_existente IS NOT NULL AND alerta_status NOT IN (7) THEN
        UPDATE alerta_monitoracao 
        SET contador_evento = alerta_contador + 1
        WHERE alerta_monitoracao_id = alerta_id_existente;

    -- Se o alerta já existir e estiver fechado (status = 7), cria um novo alerta
    ELSE
        INSERT INTO alerta_monitoracao (
            titulo, descricao, tipo_alerta_id, ativo_id, ativo_servico_id, status, inicio_date, contador_evento, prioridade, origem
        )
        VALUES (
            p_titulo, p_descricao, p_tipo_alerta_id, p_ativo_id, p_ativo_servico_id, 1, NOW(), 1, p_prioridade, p_origem
        );
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_inserir_incidente` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`lab2`@`localhost` PROCEDURE `sp_inserir_incidente`(
    IN p_incidente_itsm_id INT,
    IN p_alerta_monitoracao_id INT,
    IN p_ativo_id INT,
    IN p_ativo_servico_id INT,
    IN p_sla_id INT
)
BEGIN
    DECLARE incidente_existente INT;

    -- Verifica se o incidente já existe na tabela
    SELECT COUNT(*) INTO incidente_existente 
    FROM incidente_itsm 
    WHERE incidente_itsm_id = p_incidente_itsm_id;

    -- Se não existir, insere o incidente
    IF incidente_existente = 0 THEN
        INSERT INTO incidente_itsm (
            incidente_itsm_id, alerta_monitoracao_id, ativo_id, ativo_servico_id, sla_id, inicio_incidente_date, status
        ) VALUES (
            p_incidente_itsm_id, p_alerta_monitoracao_id, p_ativo_id, p_ativo_servico_id, p_sla_id, NOW(), 1
        );

        -- Mensagem de sucesso
        SELECT CONCAT('Incidente ID ', p_incidente_itsm_id, ' inserido com sucesso.') AS mensagem_sucesso;

    ELSE
        -- Se já existir, retorna erro
        SELECT 'ERRO: O ID do incidente já existe!' AS mensagem_erro;
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_inserir_incidente_com_savepoint` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`lab2`@`localhost` PROCEDURE `sp_inserir_incidente_com_savepoint`(
    IN p_incidente_itsm_id INT,
    IN p_alerta_monitoracao_id INT,
    IN p_ativo_id INT,
    IN p_ativo_servico_id INT,
    IN p_sla_id INT
)
BEGIN
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        ROLLBACK TO ponto_de_restore;
        SELECT 'ERRO: Transação revertida até o último SAVEPOINT.' AS mensagem_erro;
    END;

    START TRANSACTION;
    
    SAVEPOINT ponto_de_restore;

    -- Inserção do incidente
    INSERT INTO incidente_itsm (
        incidente_itsm_id, alerta_monitoracao_id, ativo_id, ativo_servico_id, sla_id, inicio_incidente_date, status
    ) VALUES (
        p_incidente_itsm_id, p_alerta_monitoracao_id, p_ativo_id, p_ativo_servico_id, p_sla_id, NOW(), 1
    );

    -- Se der erro depois do SAVEPOINT, podemos reverter apenas a última parte
    SAVEPOINT ponto_final;

    -- Simulação de erro (remova esse comentário para testar rollback parcial)
    -- SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Erro simulado para testar SAVEPOINT';

    COMMIT;
    SELECT 'Incidente inserido com sucesso!' AS mensagem_sucesso;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_inserir_incidente_transacao` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`lab2`@`localhost` PROCEDURE `sp_inserir_incidente_transacao`(
    IN p_incidente_itsm_id INT,
    IN p_alerta_monitoracao_id INT,
    IN p_ativo_id INT,
    IN p_ativo_servico_id INT,
    IN p_sla_id INT
)
BEGIN
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        ROLLBACK;
        SELECT 'ERRO: Transação revertida devido a um erro.' AS mensagem_erro;
    END;

    START TRANSACTION;
    
    -- Verifica se o ID já existe
    IF (SELECT COUNT(*) FROM incidente_itsm WHERE incidente_itsm_id = p_incidente_itsm_id) > 0 THEN
        ROLLBACK;
        SELECT 'ERRO: Incidente já existe!' AS mensagem_erro;
    ELSE
        INSERT INTO incidente_itsm (
            incidente_itsm_id, alerta_monitoracao_id, ativo_id, ativo_servico_id, sla_id, inicio_incidente_date, status
        ) VALUES (
            p_incidente_itsm_id, p_alerta_monitoracao_id, p_ativo_id, p_ativo_servico_id, p_sla_id, NOW(), 1
        );

        COMMIT;
        SELECT CONCAT('Incidente ID ', p_incidente_itsm_id, ' inserido com sucesso.') AS mensagem_sucesso;
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Final view structure for view `alertasabertoprioridades`
--

/*!50001 DROP VIEW IF EXISTS `alertasabertoprioridades`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`lab2`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `alertasabertoprioridades` AS select `am`.`alerta_monitoracao_id` AS `alerta_monitoracao_id`,`am`.`titulo` AS `titulo`,`am`.`descricao` AS `alerta_descricao`,`am`.`prioridade` AS `prioridade`,`am`.`status` AS `alerta_status`,`am`.`inicio_date` AS `alerta_inicio_date`,`it`.`incidente_itsm_id` AS `incidente_itsm_id`,`it`.`status` AS `incidente_status`,`it`.`inicio_incidente_date` AS `inicio_incidente_date`,`it`.`fim_incidente_date` AS `fim_incidente_date`,`a`.`descricao` AS `ativo_descricao` from ((`alerta_monitoracao` `am` left join `incidente_itsm` `it` on((`am`.`alerta_monitoracao_id` = `it`.`alerta_monitoracao_id`))) left join `ativo` `a` on((`am`.`ativo_id` = `a`.`ativo_id`))) where ((`am`.`status` = 1) and (`am`.`fim_date` is null)) order by `am`.`prioridade` desc,`am`.`inicio_date` desc */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `dependencia`
--

/*!50001 DROP VIEW IF EXISTS `dependencia`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`lab2`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `dependencia` AS select `asv`.`ativo_servico_id` AS `ativo_servico_id`,`asv`.`nome` AS `nome_servico`,`a`.`ativo_id` AS `ativo_id`,`a`.`descricao` AS `descricao_ativo` from (`ativo_servico` `asv` join `ativo` `a` on((`asv`.`ativo_id` = `a`.`ativo_id`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `sla_ativos`
--

/*!50001 DROP VIEW IF EXISTS `sla_ativos`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`lab2`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `sla_ativos` AS select `a`.`ativo_id` AS `id`,NULL AS `ativo_servico_id`,`a`.`descricao` AS `ativo_descricao`,`s`.`sla_id` AS `sla_id`,`s`.`tempo_solucao` AS `tempo_solucao`,`am`.`alerta_monitoracao_id` AS `alerta_monitoracao_id`,`am`.`titulo` AS `alerta_titulo`,`am`.`descricao` AS `alerta_descricao`,`am`.`status` AS `alerta_status`,`am`.`inicio_date` AS `alerta_inicio_date`,`am`.`fim_date` AS `alerta_fim_date` from ((`ativo` `a` join `sla` `s` on((`a`.`sla_id` = `s`.`sla_id`))) left join `alerta_monitoracao` `am` on((`a`.`ativo_id` = `am`.`ativo_id`))) where (`am`.`status` = 1) union select NULL AS `id`,`asv`.`ativo_servico_id` AS `ativo_servico_id`,`asv`.`nome` AS `servico_descricao`,`s`.`sla_id` AS `sla_id`,`s`.`tempo_solucao` AS `tempo_solucao`,`am`.`alerta_monitoracao_id` AS `alerta_monitoracao_id`,`am`.`titulo` AS `alerta_titulo`,`am`.`descricao` AS `alerta_descricao`,`am`.`status` AS `alerta_status`,`am`.`inicio_date` AS `alerta_inicio_date`,`am`.`fim_date` AS `alerta_fim_date` from ((`ativo_servico` `asv` join `sla` `s` on((`asv`.`sla_id` = `s`.`sla_id`))) left join `alerta_monitoracao` `am` on((`asv`.`ativo_servico_id` = `am`.`ativo_servico_id`))) where (`am`.`status` = 1) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_alertas_abertos`
--

/*!50001 DROP VIEW IF EXISTS `vw_alertas_abertos`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`lab2`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_alertas_abertos` AS select `a`.`alerta_monitoracao_id` AS `alerta_monitoracao_id`,`a`.`titulo` AS `titulo`,`a`.`descricao` AS `descricao`,`a`.`prioridade` AS `prioridade`,`a`.`origem` AS `origem`,`ta`.`descricao` AS `tipo_alerta`,`atv`.`descricao` AS `ativo`,`ats`.`nome` AS `servico`,`s`.`nome` AS `status`,`a`.`inicio_date` AS `inicio_date`,`a`.`fim_date` AS `fim_date` from ((((`alerta_monitoracao` `a` join `tipo_alerta` `ta` on((`a`.`tipo_alerta_id` = `ta`.`tipo_alerta_id`))) join `ativo` `atv` on((`a`.`ativo_id` = `atv`.`ativo_id`))) join `ativo_servico` `ats` on((`a`.`ativo_servico_id` = `ats`.`ativo_servico_id`))) join `status` `s` on((`a`.`status` = `s`.`status_id`))) where (`a`.`status` not in (6,7)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_alertas_por_cliente`
--

/*!50001 DROP VIEW IF EXISTS `vw_alertas_por_cliente`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`lab2`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_alertas_por_cliente` AS select `c`.`nome` AS `cliente`,count(`a`.`alerta_monitoracao_id`) AS `total_alertas` from ((`alerta_monitoracao` `a` join `ativo` `atv` on((`a`.`ativo_id` = `atv`.`ativo_id`))) join `cliente` `c` on((`atv`.`cliente_id` = `c`.`cliente_id`))) where (`a`.`inicio_date` >= (now() - interval 30 day)) group by `c`.`nome` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_incidentes_abertos`
--

/*!50001 DROP VIEW IF EXISTS `vw_incidentes_abertos`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`lab2`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_incidentes_abertos` AS select `i`.`incidente_itsm_id` AS `incidente_itsm_id`,`i`.`alerta_monitoracao_id` AS `alerta_monitoracao_id`,`a`.`titulo` AS `alerta_titulo`,`atv`.`descricao` AS `ativo`,`ats`.`nome` AS `servico`,`sla`.`tempo_solucao` AS `sla_definido`,`s`.`nome` AS `status`,`i`.`inicio_incidente_date` AS `inicio_incidente_date`,`i`.`fim_incidente_date` AS `fim_incidente_date` from (((((`incidente_itsm` `i` join `alerta_monitoracao` `a` on((`i`.`alerta_monitoracao_id` = `a`.`alerta_monitoracao_id`))) join `ativo` `atv` on((`i`.`ativo_id` = `atv`.`ativo_id`))) join `ativo_servico` `ats` on((`i`.`ativo_servico_id` = `ats`.`ativo_servico_id`))) join `sla` on((`i`.`sla_id` = `sla`.`sla_id`))) join `status` `s` on((`i`.`status` = `s`.`status_id`))) where (`i`.`status` not in (6,7)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_sla_vencidos`
--

/*!50001 DROP VIEW IF EXISTS `vw_sla_vencidos`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`lab2`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_sla_vencidos` AS select `i`.`incidente_itsm_id` AS `incidente_itsm_id`,`i`.`alerta_monitoracao_id` AS `alerta_monitoracao_id`,`i`.`ativo_id` AS `ativo_id`,`i`.`inicio_incidente_date` AS `inicio_incidente_date`,`i`.`fim_incidente_date` AS `fim_incidente_date`,`s`.`sla_id` AS `sla_id`,`s`.`tempo_solucao` AS `tempo_solucao`,timestampdiff(HOUR,`i`.`inicio_incidente_date`,ifnull(`i`.`fim_incidente_date`,now())) AS `tempo_resolucao_horas`,if((timestampdiff(HOUR,`i`.`inicio_incidente_date`,ifnull(`i`.`fim_incidente_date`,now())) > (time_to_sec(`s`.`tempo_solucao`) / 3600)),'SLA VENCIDO','SLA OK') AS `status_sla`,`i`.`status` AS `status` from (`incidente_itsm` `i` join `sla` `s` on((`i`.`sla_id` = `s`.`sla_id`))) where (timestampdiff(HOUR,`i`.`inicio_incidente_date`,ifnull(`i`.`fim_incidente_date`,now())) > (time_to_sec(`s`.`tempo_solucao`) / 3600)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_sla_vencidos_abertos`
--

/*!50001 DROP VIEW IF EXISTS `vw_sla_vencidos_abertos`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`lab2`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_sla_vencidos_abertos` AS select `i`.`incidente_itsm_id` AS `incidente_itsm_id`,`i`.`alerta_monitoracao_id` AS `alerta_monitoracao_id`,`i`.`ativo_id` AS `ativo_id`,`i`.`inicio_incidente_date` AS `inicio_incidente_date`,`s`.`sla_id` AS `sla_id`,`s`.`tempo_solucao` AS `tempo_solucao`,timestampdiff(HOUR,`i`.`inicio_incidente_date`,now()) AS `tempo_decorrido_horas`,'SLA VENCIDO' AS `status_sla` from (`incidente_itsm` `i` join `sla` `s` on((`i`.`sla_id` = `s`.`sla_id`))) where ((`i`.`status` = 1) and (timestampdiff(HOUR,`i`.`inicio_incidente_date`,now()) > (time_to_sec(`s`.`tempo_solucao`) / 3600))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_sla_vencidos_fechados`
--

/*!50001 DROP VIEW IF EXISTS `vw_sla_vencidos_fechados`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`lab2`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_sla_vencidos_fechados` AS select `i`.`incidente_itsm_id` AS `incidente_itsm_id`,`i`.`alerta_monitoracao_id` AS `alerta_monitoracao_id`,`i`.`ativo_id` AS `ativo_id`,`i`.`inicio_incidente_date` AS `inicio_incidente_date`,`i`.`fim_incidente_date` AS `fim_incidente_date`,`s`.`sla_id` AS `sla_id`,`s`.`tempo_solucao` AS `tempo_solucao`,timestampdiff(HOUR,`i`.`inicio_incidente_date`,`i`.`fim_incidente_date`) AS `tempo_resolucao_horas`,'SLA VENCIDO' AS `status_sla` from (`incidente_itsm` `i` join `sla` `s` on((`i`.`sla_id` = `s`.`sla_id`))) where ((`i`.`status` in (6,7)) and (timestampdiff(HOUR,`i`.`inicio_incidente_date`,`i`.`fim_incidente_date`) > (time_to_sec(`s`.`tempo_solucao`) / 3600))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-02-28  1:40:18
