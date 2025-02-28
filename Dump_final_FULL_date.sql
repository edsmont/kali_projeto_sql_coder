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

--
-- Dumping data for table `alerta_monitoracao`
--

LOCK TABLES `alerta_monitoracao` WRITE;
/*!40000 ALTER TABLE `alerta_monitoracao` DISABLE KEYS */;
INSERT INTO `alerta_monitoracao` VALUES (1,'Queda de Link no Switch Cisco Catalyst 9200','Monitor detectou ausência de resposta ICMP no uplink do Switch Catalyst 9200',2,'Monitoramento',3,1,1,'2025-02-12 18:19:50','2025-02-26 00:14:46',7,'13 dias, 5 horas',1),(2,'Pacotes Perdidos no Switch Catalyst 9200','Taxa de perda de pacotes acima de 10% detectada em interface G0/1',1,'Monitoramento',2,1,1,'2025-02-13 18:19:50',NULL,1,NULL,1),(3,'CPU Elevada no Switch Catalyst 9200','Uso de CPU acima de 80% devido a alto tráfego L2/L3',3,'Monitoramento',61,1,1,'2025-02-14 18:19:50','2025-02-22 22:41:16',7,'8 dias, 4 horas',1),(4,'Erro de Roteamento no Switch Catalyst 9200','Rota de backup não ativa adequadamente, investigando EIGRP/OSPF',2,'Monitoramento',5,1,1,'2025-02-15 18:19:50',NULL,1,NULL,1),(5,'Memória Alta no Switch Catalyst 9200','Uso de memória acima de 90%, risco de travamento',2,'Monitoramento',62,1,1,'2025-02-16 18:19:50',NULL,1,NULL,1),(6,'Queda de Link no Switch HP Aruba 2930F','Sem resposta no uplink VLAN trunk. Suspeita de desconexão física.',2,'Monitoramento',3,2,2,'2025-02-12 18:19:50',NULL,1,NULL,1),(7,'Perda de Pacotes no Switch HP Aruba 2930F','Monitor registrou 15% de perda de pacotes em VLAN 10',1,'Monitoramento',2,2,2,'2025-02-13 18:19:50',NULL,1,NULL,1),(8,'Uso de CPU Alto no Switch HP Aruba 2930F','CPU atinge 85% devido a processo STP e broadcast storm',2,'Monitoramento',61,2,2,'2025-02-14 18:19:50',NULL,1,NULL,1),(9,'Erro de Roteamento HP Aruba 2930F','Possível configuração incorreta no routing VLAN 20',3,'Monitoramento',5,2,2,'2025-02-15 18:19:50',NULL,1,NULL,1),(10,'Memória Crítica no Switch HP Aruba 2930F','Uso de memória chegou a 95%, risco de reboot inesperado',2,'Monitoramento',62,2,2,'2025-02-16 18:19:50','2025-02-22 22:53:14',7,'6 dias, 4 horas',1),(11,'Queda de Link no Roteador MikroTik RB3011','Perda total de conectividade WAN. Provedor fora?',1,'Monitoramento',3,3,3,'2025-02-12 18:19:50',NULL,1,NULL,1),(12,'Erro de Roteamento MikroTik RB3011','Rota default não está sendo anunciada adequadamente (OSPF)',2,'Monitoramento',5,3,3,'2025-02-13 18:19:50','2025-02-22 22:41:08',7,'9 dias, 4 horas',1),(13,'Alto Uso de CPU no MikroTik RB3011','Processo de Firewall/Queue consumindo 90% de CPU',3,'Monitoramento',61,3,3,'2025-02-14 18:19:50',NULL,1,NULL,1),(14,'Alto Uso de Memória no MikroTik RB3011','Memória acima de 85%: logs e cache DNS ocupando espaço',1,'Monitoramento',62,3,3,'2025-02-15 18:19:50',NULL,1,NULL,1),(15,'Perda de Pacotes no MikroTik RB3011','Usuários reclamam de lentidão; monitor registrou 12% de perda',2,'Monitoramento',2,3,3,'2025-02-16 18:19:50',NULL,1,NULL,1),(36,'Queda de Link no Firewall Palo Alto PA-820','Interface externa down, sem acesso à internet',1,'Firewall',3,6,6,'2025-02-12 18:19:50',NULL,1,NULL,1),(37,'Detecção de Ataque no Firewall Palo Alto','Tentativas de acesso SSH suspeitas detectadas',2,'Firewall',31,6,6,'2025-02-13 18:19:50',NULL,1,NULL,1),(38,'CPU Elevada no Firewall Palo Alto','Inspeção SSL causando alta carga na CPU',3,'Firewall',61,6,6,'2025-02-14 18:19:50',NULL,1,NULL,1),(39,'VPN Offline no Firewall Palo Alto','Usuários não conseguem acessar a VPN corporativa',1,'Firewall',34,6,6,'2025-02-15 18:19:50',NULL,1,NULL,1),(40,'Queda de Serviço Web atrás do Firewall','Aplicação web protegida ficou indisponível',2,'Firewall',64,6,6,'2025-02-16 18:19:50',NULL,1,NULL,1),(41,'Alerta Fechado - Queda de Link (Catalyst 9200)','Link principal caiu, mas foi resolvido pela equipe de rede',2,'Monitoramento',3,1,1,'2025-02-12 18:15:28','2025-02-12 20:15:28',7,'0 dias, 2 horas',1),(42,'Alerta Fechado - CPU Alta (Catalyst 9200)','CPU chegou a 85%, mas processo de broadcast storm foi contido',3,'Monitoramento',61,1,1,'2025-02-13 18:15:28','2025-02-13 20:15:28',7,'0 dias, 2 horas',1),(43,'Alerta Fechado - Erro de Roteamento (Catalyst 9200)','Rota de backup falhava; ajuste de configuração resolveu',2,'Monitoramento',5,1,1,'2025-02-14 18:15:28','2025-02-14 20:15:28',7,'0 dias, 2 horas',1),(44,'Alerta Fechado - Memória Alta (Catalyst 9200)','Uso de memória acima de 90%, logs foram limpos e resolveu',2,'Monitoramento',62,1,1,'2025-02-15 18:15:28','2025-02-15 20:15:28',7,'0 dias, 2 horas',1),(45,'Alerta Fechado - Pacotes Perdidos (Catalyst 9200)','Perda de pacotes em G0/1; substituição de cabo resolveu',1,'Monitoramento',2,1,1,'2025-02-16 18:15:28','2025-02-16 20:15:28',7,'0 dias, 2 horas',1),(46,'Alerta Fechado - Queda de Link (HP Aruba 2930F)','Link VLAN trunk caiu, mas foi restaurado após verificação de porta',2,'Monitoramento',3,2,2,'2025-02-12 18:15:28','2025-02-12 20:15:28',7,'0 dias, 2 horas',1),(47,'Alerta Fechado - CPU Elevada (HP Aruba 2930F)','STP reconfigurado, CPU voltou ao normal',3,'Monitoramento',61,2,2,'2025-02-13 18:15:28','2025-02-13 20:15:28',7,'0 dias, 2 horas',1),(48,'Alerta Fechado - Memória Crítica (HP Aruba 2930F)','Liberação de logs antigos reduziu uso de memória',2,'Monitoramento',62,2,2,'2025-02-14 18:15:28','2025-02-14 20:15:28',7,'0 dias, 2 horas',1),(49,'Alerta Fechado - Erro de Roteamento (HP Aruba 2930F)','Rotas VLAN corrigidas, comunicação restabelecida',3,'Monitoramento',5,2,2,'2025-02-15 18:15:28','2025-02-15 20:15:28',7,'0 dias, 2 horas',1),(50,'Alerta Fechado - Perda de Pacotes (HP Aruba 2930F)','SFP substituído, perda de pacotes sanada',1,'Monitoramento',2,2,2,'2025-02-16 18:15:28','2025-02-16 20:15:28',7,'0 dias, 2 horas',1),(51,'Switch Cisco Catalyst 9200 - Queda de Link','Monitor detectou ausência de resposta ICMP no uplink G0/1',2,'Monitoramento',3,1,1,'2025-02-12 18:25:27','2025-02-23 00:16:39',7,'10 dias, 5 horas',1),(52,'Switch HP Aruba 2930F - Alta Latência','Latência acima de 250ms em VLAN 10',1,'Monitoramento',2,2,2,'2025-02-13 18:25:27',NULL,1,NULL,1),(53,'Switch Cisco Catalyst 9200 - CPU Elevada','Uso de CPU em 85% devido a alto tráfego',3,'Monitoramento',61,1,1,'2025-02-14 18:25:27',NULL,1,NULL,1),(54,'Switch HP Aruba 2930F - Erro de Roteamento','Rotas VLAN 20 e 30 com falha de comunicação',2,'Monitoramento',5,2,2,'2025-02-15 18:25:27',NULL,1,NULL,1),(55,'Switch Cisco Catalyst 9200 - Perda de Pacotes','Interface Eth1/2 apresenta 12% de perda de pacotes',1,'Monitoramento',2,1,1,'2025-02-16 18:25:27',NULL,1,NULL,1),(56,'Switch HP Aruba 2930F - Queda de Link','Conexão com switch core interrompida',2,'Monitoramento',3,2,2,'2025-02-12 18:25:27',NULL,1,NULL,1),(57,'Switch Dell PowerSwitch N2024 - Alta Memória','Uso de memória superior a 90%',3,'Monitoramento',62,3,3,'2025-02-13 18:25:27',NULL,1,NULL,1),(58,'Switch Dell PowerSwitch N2024 - Loop detectado','Spanning Tree bloqueou portas para evitar loop',2,'Monitoramento',5,3,3,'2025-02-14 18:25:27',NULL,1,NULL,1),(59,'Switch Cisco Catalyst 9200 - Porta Bloqueada','Porta G0/5 foi desativada por excesso de flapping',1,'Monitoramento',2,1,1,'2025-02-15 18:25:27',NULL,1,NULL,1),(60,'Switch HP Aruba 2930F - QoS Violado','Excesso de tráfego não prioritário ultrapassando limite',2,'Monitoramento',5,2,2,'2025-02-16 18:25:27',NULL,1,NULL,1),(61,'Roteador MikroTik RB3011 - Queda de Link WAN','Sem resposta do provedor principal',1,'Monitoramento',3,4,4,'2025-02-12 18:25:27',NULL,1,NULL,1),(62,'Roteador Cisco ISR 4321 - Erro de Roteamento','Anúncio BGP com falha para provedor externo',2,'Monitoramento',5,5,5,'2025-02-13 18:25:27',NULL,1,NULL,1),(63,'Roteador MikroTik RB3011 - CPU Elevada','Processos de Firewall consumindo 95% da CPU',3,'Monitoramento',61,4,4,'2025-02-14 18:25:27',NULL,1,NULL,1),(64,'Roteador Cisco ISR 4321 - Perda de Pacotes','Tráfego ICMP apresenta perda de 15%',2,'Monitoramento',2,5,5,'2025-02-15 18:25:27',NULL,1,NULL,1),(65,'Roteador MikroTik RB3011 - Memória Alta','Uso de memória RAM atingiu 90%',3,'Monitoramento',62,4,4,'2025-02-16 18:25:27',NULL,1,NULL,1),(66,'Roteador Cisco ISR 4321 - Interface Down','Interface G0/0/1 não responde',2,'Monitoramento',3,5,5,'2025-02-12 18:25:27',NULL,1,NULL,1),(67,'Roteador MikroTik RB3011 - DHCP Falhando','Clientes não estão recebendo IP',1,'Monitoramento',5,4,4,'2025-02-13 18:25:27',NULL,1,NULL,1),(68,'Roteador Cisco ISR 4321 - MTU Incompatível','Problema de fragmentação detectado',2,'Monitoramento',2,5,5,'2025-02-14 18:25:27',NULL,1,NULL,1),(69,'Roteador MikroTik RB3011 - QoS Aplicado','Prioridade de tráfego ajustada para VoIP',1,'Monitoramento',5,4,4,'2025-02-15 18:25:27',NULL,1,NULL,1),(70,'Roteador Cisco ISR 4321 - VPN Offline','Usuários sem acesso remoto',2,'Monitoramento',34,5,5,'2025-02-16 18:25:27',NULL,1,NULL,1),(71,'Switch Cisco Catalyst 9200 - Queda de Link','Monitor detectou ausência de resposta ICMP no uplink G0/1',2,'Monitoramento',3,1,1,'2025-01-23 18:53:19',NULL,1,NULL,1),(72,'Switch HP Aruba 2930F - Alta Latência','Latência acima de 250ms em VLAN 10',1,'Monitoramento',2,2,2,'2025-01-24 18:53:19','2025-01-24 20:53:19',6,NULL,1),(73,'Switch Cisco Catalyst 9200 - CPU Elevada','Uso de CPU em 85% devido a alto tráfego',3,'Monitoramento',61,1,1,'2025-01-25 18:53:19',NULL,1,NULL,1),(74,'Switch HP Aruba 2930F - Erro de Roteamento','Rotas VLAN 20 e 30 com falha de comunicação',2,'Monitoramento',5,2,2,'2025-01-26 18:53:19','2025-01-26 21:53:19',7,NULL,1),(75,'Switch Cisco Catalyst 9200 - Perda de Pacotes','Interface Eth1/2 apresenta 12% de perda de pacotes',1,'Monitoramento',2,1,1,'2025-01-27 18:53:19',NULL,1,NULL,1),(76,'Roteador MikroTik RB3011 - Queda de Link WAN','Sem resposta do provedor principal',1,'Monitoramento',3,3,3,'2025-01-28 18:53:19',NULL,1,NULL,1),(77,'Roteador Cisco ISR 4321 - Erro de Roteamento','Anúncio BGP com falha para provedor externo',2,'Monitoramento',5,4,4,'2025-01-29 18:53:19','2025-01-29 20:53:19',6,NULL,1),(78,'Roteador MikroTik RB3011 - CPU Elevada','Processos de Firewall consumindo 95% da CPU',3,'Monitoramento',61,3,3,'2025-01-30 18:53:19',NULL,1,NULL,1),(79,'Roteador Cisco ISR 4321 - Perda de Pacotes','Tráfego ICMP apresenta perda de 15%',2,'Monitoramento',2,4,4,'2025-01-31 18:53:19','2025-01-31 19:53:19',7,NULL,1),(80,'Roteador MikroTik RB3011 - Memória Alta','Uso de memória RAM atingiu 90%',3,'Monitoramento',62,3,3,'2025-02-01 18:53:19',NULL,1,NULL,1),(81,'Firewall Palo Alto - Ataques Detectados','IPS bloqueou tentativa de exploração via SSH',1,'Firewall',31,5,5,'2025-02-02 18:53:19',NULL,1,NULL,1),(82,'Firewall FortiGate - VPN Offline','Usuários sem acesso remoto à VPN',2,'Firewall',34,6,6,'2025-02-03 18:53:19','2025-02-03 22:53:19',6,NULL,1),(83,'Access Point Ubiquiti - Queda de Conexão','AP não responde a pings na rede wireless',1,'Monitoramento',3,7,7,'2025-02-04 18:53:19',NULL,1,NULL,1),(84,'Switch Dell N2024 - Alta Memória','Uso de memória acima de 90%, risco de travamento',2,'Monitoramento',62,8,8,'2025-02-05 18:53:19','2025-02-05 20:53:19',7,NULL,1),(85,'Roteador MikroTik RB3011 - Queda de Link Secundário','Link backup caiu, operação na última rota disponível',1,'Monitoramento',3,3,3,'2025-02-06 18:53:19',NULL,1,NULL,1),(86,'Servidor Linux - Uso Alto de CPU','CPU a 95% devido a processos de log',3,'Monitoramento',61,9,9,'2025-02-20 18:53:19',NULL,1,NULL,1),(87,'Banco de Dados MySQL - Conexões Saturadas','Múltiplos usuários enfrentam lentidão no acesso',2,'DB Monitor',64,10,10,'2025-02-21 18:53:19','2025-02-21 23:53:19',6,NULL,1),(88,'Servidor Windows - Serviços Parados','Vários serviços não iniciaram corretamente após reinicialização',1,'Monitoramento',63,11,11,'2025-02-22 18:53:19',NULL,1,NULL,1),(89,'Teste Alerta','Descrição do alerta',1,'Monitoramento',2,1,3,'2025-02-22 23:45:10',NULL,1,'0 dias, 0 horas',8),(90,'Título do Alerta','Descrição do Alerta',1,'Monitoramento',2,5,3,'2025-02-25 00:54:39',NULL,1,'0 dias, 0 horas',11),(91,'Teste de Alerta','Descrição do alerta gerado para teste',2,'Monitoramento',1,1,1,'2025-02-25 23:50:55',NULL,1,'0 dias, 0 horas',4);
/*!40000 ALTER TABLE `alerta_monitoracao` ENABLE KEYS */;
UNLOCK TABLES;
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
-- Dumping data for table `ativo`
--

LOCK TABLES `ativo` WRITE;
/*!40000 ALTER TABLE `ativo` DISABLE KEYS */;
INSERT INTO `ativo` VALUES (1,1,'Switch Cisco Catalyst 9200',1001,'Cisco',1,501),(2,2,'Switch HP Aruba 2930F',1002,'HP Aruba',2,502),(3,3,'Roteador MikroTik RB3011',1003,'MikroTik',3,503),(4,4,'Roteador Cisco ISR 4321',1004,'Cisco',4,504),(5,5,'Access Point Ubiquiti UniFi UAP-AC-PRO',1005,'Ubiquiti',5,505),(6,6,'Firewall Palo Alto PA-820',1006,'Palo Alto',6,506),(7,7,'Firewall Fortinet FortiGate 100E',1007,'Fortinet',7,507),(8,8,'Switch Dell PowerSwitch N2024',1008,'Dell',8,508),(9,9,'Switch Juniper EX2300',1009,'Juniper',9,509),(10,10,'Roteador Huawei AR1220',1010,'Huawei',10,510),(11,11,'Firewall Check Point 6200',1011,'Check Point',1,511),(12,12,'Firewall SonicWall NSA 2700',1012,'SonicWall',2,512),(13,13,'Firewall Sophos XG 210',1013,'Sophos',3,513),(14,14,'Firewall WatchGuard Firebox T80',1014,'WatchGuard',4,514),(15,15,'Firewall Barracuda F180',1015,'Barracuda',5,515),(16,16,'VM Windows Server 2019',1016,'Microsoft',6,516),(17,17,'VM Ubuntu 20.04',1017,'Canonical',7,517),(18,18,'VM Red Hat Enterprise Linux 8',1018,'Red Hat',8,518),(19,19,'VM CentOS 7',1019,'CentOS',9,519),(20,20,'VM Debian 11',1020,'Debian',10,520),(21,21,'VM VMware ESXi 7.0',1021,'VMware',1,521),(22,22,'VM Proxmox VE 7.2',1022,'Proxmox',2,522),(23,23,'VM Windows 10 Pro',1023,'Microsoft',3,523),(24,24,'VM FreeBSD 13',1024,'FreeBSD',4,524),(25,25,'VM Oracle Linux 8',1025,'Oracle',5,525),(26,26,'Servidor Dell PowerEdge R750',1026,'Dell',6,526),(27,27,'Servidor HP ProLiant DL380 Gen10',1027,'HP',7,527),(28,28,'Servidor Lenovo ThinkSystem SR650',1028,'Lenovo',8,528),(29,29,'Servidor IBM System x3650 M5',1029,'IBM',9,529),(30,30,'Servidor Cisco UCS C220 M5',1030,'Cisco',10,530),(31,31,'Storage NetApp AFF A400',1031,'NetApp',1,531),(32,32,'Storage Dell EMC PowerStore 500T',1032,'Dell EMC',2,532),(33,33,'Storage HPE Nimble HF20',1033,'HPE',3,533),(34,34,'Storage IBM FlashSystem 5200',1034,'IBM',4,534),(35,35,'Storage Pure Storage FlashArray X10',1035,'Pure Storage',5,535),(36,36,'Storage Huawei OceanStor Dorado 3000',1036,'Huawei',6,536),(37,37,'Storage Synology RackStation RS1221+',1037,'Synology',7,537),(38,38,'Storage QNAP TS-1685',1038,'QNAP',8,538),(39,39,'Storage Western Digital Ultrastar Data102',1039,'Western Digital',9,539),(40,40,'Storage Seagate Exos X 2U12',1040,'Seagate',10,540);
/*!40000 ALTER TABLE `ativo` ENABLE KEYS */;
UNLOCK TABLES;

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
-- Dumping data for table `ativo_servico`
--

LOCK TABLES `ativo_servico` WRITE;
/*!40000 ALTER TABLE `ativo_servico` DISABLE KEYS */;
INSERT INTO `ativo_servico` VALUES (1,'Link Dedicado 100Mbps',1,1),(2,'Fibra Óptica 1Gbps',2,2),(3,'Internet Corporativa 500Mbps',3,3),(4,'Backup de Link 200Mbps',4,4),(5,'VPN MPLS',5,5),(6,'Firewall Gerenciado',6,6),(7,'Antivírus Corporativo',7,7),(8,'Monitoramento de Ameaças',8,8),(9,'Gestão de Logs (SIEM)',9,9),(10,'Proteção DDoS',10,10),(11,'Telefonia IP (PABX Virtual)',11,1),(12,'Número 0800 Empresarial',12,2),(13,'Ramal SIP para Home Office',13,3),(14,'Central de Atendimento Omnichannel',14,4),(15,'URA Inteligente',15,5),(16,'Microsoft 365 - Plano Business',16,6),(17,'Google Workspace - Plano Enterprise',17,7),(18,'CRM Salesforce',18,8),(19,'ERP TOTVS Cloud',19,9),(20,'Plataforma de RH Gupy',20,10),(21,'API de Autenticação (OAuth2)',21,1),(22,'API de Pagamentos',22,2),(23,'API de Integração com ERP',23,3),(24,'API de Consulta de Dados',24,4),(25,'API de Notificações Push',25,5),(26,'Storage NFS para Datacenter',26,6),(27,'Backup Cloud AWS S3',27,7),(28,'Servidor de Arquivos SMB',28,8),(29,'Banco de Dados MySQL Gerenciado',29,9),(30,'Datacenter Object Storage',30,10),(31,'Servidor Dedicado Bare Metal',31,1),(32,'Hospedagem de Aplicações Web',32,2),(33,'Balanceador de Carga HAProxy',33,3),(34,'Serviço de Kubernetes Gerenciado',34,4),(35,'Monitoramento com Zabbix',35,5),(36,'Cluster VMware vSphere',36,6),(37,'Virtualização com Proxmox',37,7),(38,'Containerização com Docker',38,8),(39,'Serviço de CI/CD com Jenkins',39,9),(40,'Orquestração com Kubernetes',40,10);
/*!40000 ALTER TABLE `ativo_servico` ENABLE KEYS */;
UNLOCK TABLES;

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
-- Dumping data for table `cliente`
--

LOCK TABLES `cliente` WRITE;
/*!40000 ALTER TABLE `cliente` DISABLE KEYS */;
INSERT INTO `cliente` VALUES (1,'12345678000101','Empresa Alpha Ltda'),(2,'98765432000199','Beta Tech Solutions'),(3,'56789012000155','Gamma Telecom'),(4,'45678923000133','Delta Infraestrutura'),(5,'34567891000177','Epsilon Engenharia'),(6,'23456789000144','Zeta Consultoria'),(7,'67890123000188','Eta Logística'),(8,'78901234000166','Theta Segurança Digital'),(9,'89012345000122','Iota Healthcare'),(10,'90123456000199','Kappa Finance'),(11,'11122233000155','Lambda Softwares'),(12,'22233344000133','Mu Energia Renovável'),(13,'33344455000177','Nu Automação'),(14,'44455566000144','Xi Infra TI'),(15,'55566677000188','Omicron Telecomunicações'),(16,'66677788000166','Pi Cyber Security'),(17,'77788899000122','Rho Serviços Financeiros'),(18,'88899900000199','Sigma Indústria'),(19,'99900011100155','Tau Construções'),(20,'00011122200133','Upsilon Manutenção'),(21,'11133355500188','Phi Transportes'),(22,'22244466600166','Chi Eletroeletrônicos'),(23,'33355577700122','Psi Inteligência Artificial'),(24,'44466688800199','Omega Automação'),(25,'55577799900155','AlphaTech Informática'),(26,'66688800000133','BetaCloud Serviços Digitais'),(27,'77799911100177','Gama Financeiros'),(28,'88800022200144','Delta Tecnologia'),(29,'99911133300188','Epsilon Logística'),(30,'00022244400166','Zeta Energia Solar');
/*!40000 ALTER TABLE `cliente` ENABLE KEYS */;
UNLOCK TABLES;

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
-- Dumping data for table `cliente_endereco`
--

LOCK TABLES `cliente_endereco` WRITE;
/*!40000 ALTER TABLE `cliente_endereco` DISABLE KEYS */;
INSERT INTO `cliente_endereco` VALUES (1,1,'Rua das Flores, 123 - São Paulo, SP','contato@alpha.com.br','(11) 99999-1111'),(2,1,'Avenida Paulista, 1000 - São Paulo, SP','suporte@alpha.com.br','(11) 99999-2222'),(3,2,'Rua XV de Novembro, 45 - Curitiba, PR','contato@betatech.com.br','(41) 98888-3333'),(4,2,'Avenida Batel, 200 - Curitiba, PR','financeiro@betatech.com.br','(41) 98888-4444'),(5,3,'Rua Chile, 77 - Porto Alegre, RS','suporte@gammatelecom.com.br','(51) 97777-5555'),(6,3,'Rua Borges de Medeiros, 500 - Porto Alegre, RS','vendas@gammatelecom.com.br','(51) 96666-6666'),(7,4,'Avenida das Torres, 1500 - Manaus, AM','infra@delta.com.br','(92) 98888-7777'),(8,4,'Rua Rio Negro, 25 - Manaus, AM','obras@delta.com.br','(92) 98888-8888'),(9,5,'Rua Engenheiro Paulo, 321 - Belo Horizonte, MG','engenharia@epsilon.com.br','(31) 97777-9999'),(10,5,'Avenida Amazonas, 500 - Belo Horizonte, MG','suporte@epsilon.com.br','(31) 96666-0000'),(11,6,'Rua dos Advogados, 500 - Brasília, DF','consultoria@zeta.com.br','(61) 96666-9999'),(12,7,'Rodovia Anhanguera, Km 40 - Campinas, SP','logistica@eta.com.br','(19) 93333-2222'),(13,8,'Avenida Cibernética, 700 - Florianópolis, SC','seguranca@theta.com.br','(48) 91111-4444'),(14,9,'Rua dos Médicos, 100 - Rio de Janeiro, RJ','atendimento@iota.com.br','(21) 97777-5555'),(15,10,'Avenida das Finanças, 1000 - São Paulo, SP','investimentos@kappa.com.br','(11) 95555-7777'),(16,11,'Rua dos Programadores, 300 - São Paulo, SP','suporte@lambda.com.br','(11) 91111-8888'),(17,11,'Avenida Tech, 1234 - São Paulo, SP','rh@lambda.com.br','(11) 92222-9999'),(18,12,'Rua das Energias, 250 - Recife, PE','contato@mu.com.br','(81) 95555-6666'),(19,12,'Avenida Sustentável, 800 - Recife, PE','suporte@mu.com.br','(81) 96666-7777'),(20,13,'Rua dos Robôs, 110 - Porto Alegre, RS','engenharia@nu.com.br','(51) 93333-8888'),(21,13,'Avenida Autônoma, 920 - Porto Alegre, RS','financeiro@nu.com.br','(51) 94444-9999'),(22,14,'Rua do Datacenter, 222 - Brasília, DF','infra@xi.com.br','(61) 97777-0000'),(23,14,'Avenida Digital, 333 - Brasília, DF','rh@xi.com.br','(61) 98888-1111'),(24,15,'Rua das Antenas, 555 - Salvador, BA','suporte@omicron.com.br','(71) 92222-2222'),(25,15,'Avenida Satélite, 666 - Salvador, BA','infra@omicron.com.br','(71) 93333-3333'),(26,21,'Rua Blockchain, 700 - Belo Horizonte, MG','cripto@pi.com.br','(31) 91111-4444'),(27,22,'Avenida AI, 900 - Curitiba, PR','inteligencia@rho.com.br','(41) 92222-5555'),(28,23,'Rua Fintech, 1000 - Florianópolis, SC','financeiro@sigma.com.br','(48) 93333-6666'),(29,24,'Avenida Cloud, 1500 - Recife, PE','infra@tau.com.br','(81) 94444-7777'),(30,25,'Rua IoT, 1700 - Rio de Janeiro, RJ','iot@upsilon.com.br','(21) 95555-8888');
/*!40000 ALTER TABLE `cliente_endereco` ENABLE KEYS */;
UNLOCK TABLES;

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
-- Dumping data for table `historico_status_alerta`
--

LOCK TABLES `historico_status_alerta` WRITE;
/*!40000 ALTER TABLE `historico_status_alerta` DISABLE KEYS */;
INSERT INTO `historico_status_alerta` VALUES (1,10,1,6,'2025-02-22 23:11:17'),(2,10,6,7,'2025-02-23 01:40:59'),(3,12,1,7,'2025-02-23 01:41:08'),(4,3,1,7,'2025-02-23 01:41:16'),(5,41,6,7,'2025-02-23 02:23:38'),(6,42,6,7,'2025-02-23 02:24:33'),(7,43,6,7,'2025-02-23 02:24:33'),(8,44,6,7,'2025-02-23 02:24:33'),(9,45,6,7,'2025-02-23 02:24:33'),(10,46,6,7,'2025-02-23 02:24:33'),(11,47,6,7,'2025-02-23 02:24:33'),(12,49,6,7,'2025-02-23 02:24:33'),(13,48,6,7,'2025-02-23 02:24:33'),(14,50,6,7,'2025-02-23 02:24:33'),(15,51,1,7,'2025-02-23 03:16:39'),(16,1,1,7,'2025-02-26 03:14:46');
/*!40000 ALTER TABLE `historico_status_alerta` ENABLE KEYS */;
UNLOCK TABLES;

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

--
-- Dumping data for table `incidente_itsm`
--

LOCK TABLES `incidente_itsm` WRITE;
/*!40000 ALTER TABLE `incidente_itsm` DISABLE KEYS */;
INSERT INTO `incidente_itsm` VALUES (1,1,1,1,1,'2025-02-12 18:19:50','2025-02-26 00:14:46',6,'13 dias, 5 horas'),(2,2,1,1,1,'2025-02-13 18:19:50','2025-02-26 00:20:29',6,'12 dias, 6 horas'),(3,3,1,1,1,'2025-02-14 18:19:50',NULL,1,NULL),(4,4,1,1,1,'2025-02-15 18:19:50',NULL,1,NULL),(5,5,1,1,1,'2025-02-16 18:19:50',NULL,1,NULL),(6,6,2,2,1,'2025-02-12 18:19:50',NULL,1,NULL),(7,7,2,2,1,'2025-02-13 18:19:50',NULL,1,NULL),(8,8,2,2,1,'2025-02-14 18:19:50',NULL,1,NULL),(9,9,2,2,1,'2025-02-15 18:19:50',NULL,1,NULL),(10,10,2,2,1,'2025-02-16 18:19:50','2025-02-22 22:53:14',6,'6 dias, 4 horas'),(11,11,3,3,1,'2025-02-12 18:19:50',NULL,1,NULL),(12,12,3,3,1,'2025-02-13 18:19:50',NULL,1,NULL),(13,13,3,3,1,'2025-02-14 18:19:50',NULL,1,NULL),(14,14,3,3,1,'2025-02-15 18:19:50',NULL,1,NULL),(15,15,3,3,1,'2025-02-16 18:19:50',NULL,1,NULL),(36,36,6,6,1,'2025-02-12 18:19:50',NULL,1,NULL),(37,37,6,6,1,'2025-02-13 18:19:50',NULL,1,NULL),(38,38,6,6,1,'2025-02-14 18:19:50',NULL,1,NULL),(39,39,6,6,1,'2025-02-15 18:19:50',NULL,1,NULL),(40,40,6,6,1,'2025-02-16 18:19:50',NULL,1,NULL),(41,41,1,1,1,'2025-02-12 18:15:28','2025-02-12 20:15:28',6,NULL),(42,42,1,1,1,'2025-02-13 18:15:28','2025-02-13 20:15:28',6,NULL),(43,43,1,1,1,'2025-02-14 18:15:28','2025-02-14 20:15:28',6,NULL),(44,44,1,1,1,'2025-02-15 18:15:28','2025-02-15 20:15:28',6,NULL),(45,45,1,1,1,'2025-02-16 18:15:28','2025-02-16 20:15:28',6,NULL),(46,46,2,2,1,'2025-02-12 18:15:28','2025-02-12 20:15:28',6,NULL),(47,47,2,2,1,'2025-02-13 18:15:28','2025-02-13 20:15:28',6,NULL),(48,48,2,2,1,'2025-02-14 18:15:28','2025-02-14 20:15:28',6,NULL),(49,49,2,2,1,'2025-02-15 18:15:28','2025-02-15 20:15:28',6,NULL),(50,50,2,2,1,'2025-02-16 18:15:28','2025-02-16 20:15:28',6,NULL),(51,51,1,1,1,'2025-02-12 18:25:27','2025-02-23 00:16:39',6,'10 dias, 5 horas'),(52,52,2,2,1,'2025-02-13 18:25:27',NULL,1,NULL),(53,53,1,1,1,'2025-02-14 18:25:27',NULL,1,NULL),(54,54,2,2,1,'2025-02-15 18:25:27',NULL,1,NULL),(55,55,1,1,1,'2025-02-16 18:25:27',NULL,1,NULL),(56,56,2,2,1,'2025-02-12 18:25:27',NULL,1,NULL),(57,57,3,3,1,'2025-02-13 18:25:27',NULL,1,NULL),(58,58,3,3,1,'2025-02-14 18:25:27',NULL,1,NULL),(59,59,1,1,1,'2025-02-15 18:25:27',NULL,1,NULL),(60,60,2,2,1,'2025-02-16 18:25:27',NULL,1,NULL),(61,61,4,4,1,'2025-02-12 18:25:27',NULL,1,NULL),(62,62,5,5,1,'2025-02-13 18:25:27',NULL,1,NULL),(63,63,4,4,1,'2025-02-14 18:25:27',NULL,1,NULL),(64,64,5,5,1,'2025-02-15 18:25:27',NULL,1,NULL),(65,65,4,4,1,'2025-02-16 18:25:27',NULL,1,NULL),(66,66,5,5,1,'2025-02-12 18:25:27',NULL,1,NULL),(67,67,4,4,1,'2025-02-13 18:25:27',NULL,1,NULL),(68,68,5,5,1,'2025-02-14 18:25:27',NULL,1,NULL),(69,69,4,4,1,'2025-02-15 18:25:27',NULL,1,NULL),(70,70,5,5,1,'2025-02-16 18:25:27',NULL,1,NULL),(71,71,1,1,1,'2025-01-23 18:53:19',NULL,1,NULL),(72,72,2,2,1,'2025-01-24 18:53:19','2025-01-24 20:53:19',6,NULL),(73,73,1,1,1,'2025-01-25 18:53:19',NULL,1,NULL),(74,74,2,2,1,'2025-01-26 18:53:19','2025-01-26 21:53:19',7,NULL),(75,75,1,1,1,'2025-01-27 18:53:19',NULL,1,NULL),(76,76,3,3,1,'2025-01-28 18:53:19',NULL,1,NULL),(77,77,4,4,1,'2025-01-29 18:53:19','2025-01-29 20:53:19',6,NULL),(78,78,3,3,1,'2025-01-30 18:53:19',NULL,1,NULL),(79,79,4,4,1,'2025-01-31 18:53:19','2025-01-31 19:53:19',7,NULL),(80,80,3,3,1,'2025-02-01 18:53:19',NULL,1,NULL),(81,81,5,5,1,'2025-02-02 18:53:19',NULL,1,NULL),(82,82,6,6,1,'2025-02-03 18:53:19','2025-02-03 22:53:19',6,NULL),(83,83,7,7,1,'2025-02-04 18:53:19',NULL,1,NULL),(84,84,8,8,1,'2025-02-05 18:53:19','2025-02-05 20:53:19',7,NULL),(85,85,3,3,1,'2025-02-06 18:53:19',NULL,1,NULL),(86,86,9,9,1,'2025-02-20 18:53:19',NULL,1,NULL),(87,87,10,10,1,'2025-02-21 18:53:19','2025-02-21 23:53:19',6,NULL),(88,88,11,11,1,'2025-02-22 18:53:19',NULL,1,NULL),(1001,5,3,2,1,'2025-02-25 00:52:48',NULL,1,NULL);
/*!40000 ALTER TABLE `incidente_itsm` ENABLE KEYS */;
UNLOCK TABLES;
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
-- Dumping data for table `sla`
--

LOCK TABLES `sla` WRITE;
/*!40000 ALTER TABLE `sla` DISABLE KEYS */;
INSERT INTO `sla` VALUES (1,'01:00:00'),(2,'02:00:00'),(3,'03:00:00'),(4,'04:00:00'),(5,'05:00:00'),(6,'06:00:00'),(7,'07:00:00'),(8,'08:00:00'),(9,'09:00:00'),(10,'10:00:00'),(11,'11:00:00'),(12,'12:00:00'),(13,'13:00:00'),(14,'14:00:00'),(15,'15:00:00'),(16,'16:00:00'),(17,'17:00:00'),(18,'18:00:00'),(19,'19:00:00'),(20,'20:00:00');
/*!40000 ALTER TABLE `sla` ENABLE KEYS */;
UNLOCK TABLES;

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
-- Dumping data for table `status`
--

LOCK TABLES `status` WRITE;
/*!40000 ALTER TABLE `status` DISABLE KEYS */;
INSERT INTO `status` VALUES (1,'Aberto'),(2,'Em Análise'),(3,'Em Atendimento'),(6,'observação'),(7,'Fechado'),(8,'Reaberto');
/*!40000 ALTER TABLE `status` ENABLE KEYS */;
UNLOCK TABLES;

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
-- Dumping data for table `tipo_alerta`
--

LOCK TABLES `tipo_alerta` WRITE;
/*!40000 ALTER TABLE `tipo_alerta` DISABLE KEYS */;
INSERT INTO `tipo_alerta` VALUES (1,'Perda de Pacotes Alta'),(2,'Latência Elevada'),(3,'Queda de Link Principal'),(4,'Queda de Link Secundário'),(5,'Erro de Roteamento'),(6,'BGP Instável'),(7,'Alto Uso de CPU em Switch'),(8,'Alto Uso de Memória em Switch'),(9,'Porta de Switch Bloqueada'),(10,'Broadcast Storm Detectado'),(11,'Loop de Rede Identificado'),(12,'Erro na Negociação de Link'),(13,'Queda de VLAN'),(14,'Problema no STP (Spanning Tree Protocol)'),(15,'Endereço MAC Flapping Detectado'),(16,'Conflito de IP na Rede'),(17,'Interface de Roteador Down'),(18,'Falta de Redundância em Rede WAN'),(19,'Erros Excessivos na Interface de Rede'),(20,'Falta de Conectividade com Gateway'),(21,'Problema com DHCP Server'),(22,'Problema com DNS Server'),(23,'Queda de Peering BGP'),(24,'Perda de Sincronização NTP'),(25,'Problema em Interface Óptica'),(26,'Loop de Rede em Access Point'),(27,'Conexões Excessivas em Switch'),(28,'Tabela ARP Saturada'),(29,'Uso Excessivo de Largura de Banda'),(30,'Alerta de QoS Violado'),(31,'Tentativa de Acesso Não Autorizado'),(32,'Ataque de Força Bruta Detectado'),(33,'Alto Consumo de CPU no Firewall'),(34,'Alto Consumo de Memória no Firewall'),(35,'Regras de Firewall em Conflito'),(36,'Bloqueio de Tráfego Inválido'),(37,'IPs em Lista Negra Acessando Rede'),(38,'Acesso Suspeito à Rede Interna'),(39,'Política de Segurança Alterada'),(40,'Porta Aberta Não Autorizada'),(41,'Tentativa de Exploração de Vulnerabilidade'),(42,'Alto Volume de Conexões Simultâneas'),(43,'Detecção de Ataque DDoS'),(44,'Falha na Atualização de Assinaturas de IPS'),(45,'Queda de Serviço VPN'),(46,'Timeout Excessivo em Conexões'),(47,'Acesso Indevido a Aplicação Sensível'),(48,'Firewall Rejeitando Conexões Válidas'),(49,'Desativação de Regras de Bloqueio'),(50,'Queda do Serviço de Proxy'),(51,'Excesso de Logs Gerados'),(52,'Uso Indevido de Portas Privilegiadas'),(53,'Configuração Não Padrão Identificada'),(54,'Política de Aplicação Bloqueada'),(55,'Alerta de Túnel VPN Suspenso'),(56,'Mudança Suspeita de NAT/PAT'),(57,'Tráfego de Rede Criptografado Não Permitido'),(58,'Tentativa de Acesso a Domínios Bloqueados'),(59,'Queda do Serviço de IDS/IPS'),(60,'Falha na Replicação de Regras entre Firewalls'),(61,'Servidor com Alto Uso de CPU'),(62,'Servidor com Alto Uso de Memória'),(63,'Disco Rígido com Pouco Espaço Livre'),(64,'Queda de Serviço Web'),(65,'Banco de Dados Offline'),(66,'Alto Consumo de IOPS no Storage'),(67,'Erro em Cluster de Servidores'),(68,'Falha na Comunicação API'),(69,'Serviço de E-mail Fora do Ar'),(70,'Falha na Sincronização de Backup'),(71,'Erro no Balanceador de Carga'),(72,'Orquestrador de Containers com Falha'),(73,'Erro de Autenticação LDAP'),(74,'Falha na Sincronização com AD'),(75,'Timeout Excessivo em Aplicação Crítica'),(76,'Erro na Sincronização com Serviço de NTP'),(77,'Falha na Replicação de Banco de Dados'),(78,'Erro em Rotas de Mensageria'),(79,'Queue de Mensageria Saturada'),(80,'Processos em Execução Demasiadamente Longos');
/*!40000 ALTER TABLE `tipo_alerta` ENABLE KEYS */;
UNLOCK TABLES;

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

-- Dump completed on 2025-02-28  1:40:45
