CREATE DATABASE  IF NOT EXISTS `kali` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `kali`;
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
  `ciclo_vida_timestamp` time DEFAULT NULL,
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
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `alerta_monitoracao`
--

LOCK TABLES `alerta_monitoracao` WRITE;
/*!40000 ALTER TABLE `alerta_monitoracao` DISABLE KEYS */;
INSERT INTO `alerta_monitoracao` VALUES (1,'Queda de Link','Falha na conexão com o provedor',1,'Monitoramento',3,2,2,'2025-02-11 10:51:42',NULL,1,NULL,1),(2,'Queda de Link','Falha na conexão com o provedor',1,'Monitoramento',3,2,2,'2025-02-11 10:51:42',NULL,1,NULL,1),(3,'Firewall Bloqueando Serviço','Bloqueio indevido de aplicação',2,'Firewall',31,6,6,'2025-02-11 10:51:42',NULL,1,NULL,1),(4,'Alto Consumo de CPU','Servidor atingindo 95% de uso',2,'Monitoramento',61,26,26,'2025-02-11 10:51:42',NULL,1,NULL,1),(5,'Banco de Dados Offline','MySQL não responde',1,'DB Monitor',63,28,28,'2025-02-11 10:51:42',NULL,1,NULL,1),(6,'VPN Fora do Ar','Usuários sem acesso remoto',1,'Segurança',34,9,9,'2025-02-11 10:51:42',NULL,2,NULL,1),(7,'Backup Falhou','Último backup não foi realizado',3,'Backup Service',64,29,29,'2025-02-11 10:51:42',NULL,3,NULL,1),(8,'Erros em Aplicação Web','HTTP 500 retornando frequentemente',1,'Monitoramento Web',62,27,27,'2025-02-11 10:51:42',NULL,1,NULL,1),(9,'Consumo Alto de Banda','Tráfego na rede acima de 90%',2,'NetFlow',5,5,5,'2025-02-11 10:51:42',NULL,1,NULL,1),(10,'Queda de Peering BGP','Conexão com parceiro de BGP caiu',1,'Roteador',23,3,3,'2025-02-11 10:51:42',NULL,1,NULL,1),(11,'Erro no Servidor','O servidor apresentou falha de conexão',2,'Monitoramento',1,2,3,'2025-02-11 13:53:37',NULL,1,NULL,1),(12,'Erro no Servidor','Falha de conexão detectada',2,'Monitoramento',1,2,3,'2025-02-11 14:14:34',NULL,1,NULL,1),(13,'Erro2 no Servidor','Falha2 de conexão detectada',2,'Monitoramento',2,2,3,'2025-02-11 14:28:00',NULL,1,NULL,1);
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
/*!50003 CREATE*/ /*!50017 DEFINER=`lab2`@`localhost`*/ /*!50003 TRIGGER `trg_atualizar_ciclo_vida_alerta` BEFORE UPDATE ON `alerta_monitoracao` FOR EACH ROW BEGIN
    DECLARE fim_calculo TIMESTAMP;

    -- Se fim_date for NULL, usamos NOW(), senão usamos o próprio fim_date
    SET fim_calculo = IFNULL(NEW.fim_date, NOW());

    -- Calcula o ciclo de vida :  diferença entre fim_calculo e inicio_date
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
/*!50003 CREATE*/ /*!50017 DEFINER=`lab2`@`localhost`*/ /*!50003 TRIGGER `trg_registrar_mudanca_status` AFTER UPDATE ON `alerta_monitoracao` FOR EACH ROW BEGIN
    IF OLD.status <> NEW.status THEN
        INSERT INTO historico_status_alerta (alerta_monitoracao_id, status_anterior, status_novo)
        VALUES (NEW.alerta_monitoracao_id, OLD.status, NEW.status);
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
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cliente`
--

LOCK TABLES `cliente` WRITE;
/*!40000 ALTER TABLE `cliente` DISABLE KEYS */;
INSERT INTO `cliente` VALUES (1,'12345678000101','Empresa Alpha Ltda'),(2,'98765432000199','Beta Tech Solutions'),(3,'56789012000155','Gamma Telecom'),(4,'45678923000133','Delta Infraestrutura'),(5,'34567891000177','Epsilon Engenharia'),(6,'23456789000144','Zeta Consultoria'),(7,'67890123000188','Eta Logística'),(8,'78901234000166','Theta Segurança Digital'),(9,'89012345000122','Iota Healthcare'),(10,'90123456000199','Kappa Finance'),(11,'11122233000155','Lambda Softwares'),(12,'22233344000133','Mu Energia Renovável'),(13,'33344455000177','Nu Automação'),(14,'44455566000144','Xi Infra TI'),(15,'55566677000188','Omicron Telecomunicações'),(16,'66677788000166','Pi Cyber Security'),(17,'77788899000122','Rho Serviços Financeiros'),(18,'88899900000199','Sigma Indústria'),(19,'99900011100155','Tau Construções'),(20,'00011122200133','Upsilon Manutenção'),(21,'11133355500188','Phi Transportes'),(22,'22244466600166','Chi Eletroeletrônicos'),(23,'33355577700122','Psi Inteligência Artificial'),(24,'44466688800199','Omega Automação'),(25,'55577799900155','AlphaTech Informática'),(26,'66688800000133','BetaCloud Serviços Digitais'),(27,'77799911100177','Gama Financeiros'),(28,'88800022200144','Delta Tecnologia'),(29,'99911133300188','Epsilon Logística'),(30,'00022244400166','Zeta Energia Solar'),(31,'11133355500122','Eta Engenharia Estrutural'),(32,'22244466600199','Theta Telecomunicações'),(33,'33355577700155','Iota Consultoria Empresarial'),(34,'44466688800133','Kappa Sistemas'),(35,'55577799900177','Lambda Segurança'),(36,'66688800000144','Mu Arquitetura e Design'),(37,'77799911100188','Nu Tecnologia e Inovação'),(38,'88800022200166','Xi Saúde e Bem-Estar'),(39,'99911133300122','Omicron Automação Industrial'),(40,'00022244400199','Pi Gestão de Projetos');
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
) ENGINE=InnoDB AUTO_INCREMENT=91 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cliente_endereco`
--

LOCK TABLES `cliente_endereco` WRITE;
/*!40000 ALTER TABLE `cliente_endereco` DISABLE KEYS */;
INSERT INTO `cliente_endereco` VALUES (1,1,'Rua das Flores, 123 - São Paulo, SP','contato@alpha.com.br','(11) 99999-1111'),(2,1,'Avenida Paulista, 1000 - São Paulo, SP','suporte@alpha.com.br','(11) 99999-2222'),(3,2,'Rua XV de Novembro, 45 - Curitiba, PR','contato@betatech.com.br','(41) 98888-3333'),(4,2,'Avenida Batel, 200 - Curitiba, PR','financeiro@betatech.com.br','(41) 98888-4444'),(5,3,'Rua Chile, 77 - Porto Alegre, RS','suporte@gammatelecom.com.br','(51) 97777-5555'),(6,3,'Rua Borges de Medeiros, 500 - Porto Alegre, RS','vendas@gammatelecom.com.br','(51) 96666-6666'),(7,4,'Avenida das Torres, 1500 - Manaus, AM','infra@delta.com.br','(92) 98888-7777'),(8,4,'Rua Rio Negro, 25 - Manaus, AM','obras@delta.com.br','(92) 98888-8888'),(9,5,'Rua Engenheiro Paulo, 321 - Belo Horizonte, MG','engenharia@epsilon.com.br','(31) 97777-9999'),(10,5,'Avenida Amazonas, 500 - Belo Horizonte, MG','suporte@epsilon.com.br','(31) 96666-0000'),(11,6,'Rua dos Advogados, 500 - Brasília, DF','consultoria@zeta.com.br','(61) 96666-9999'),(12,7,'Rodovia Anhanguera, Km 40 - Campinas, SP','logistica@eta.com.br','(19) 93333-2222'),(13,8,'Avenida Cibernética, 700 - Florianópolis, SC','seguranca@theta.com.br','(48) 91111-4444'),(14,9,'Rua dos Médicos, 100 - Rio de Janeiro, RJ','atendimento@iota.com.br','(21) 97777-5555'),(15,10,'Avenida das Finanças, 1000 - São Paulo, SP','investimentos@kappa.com.br','(11) 95555-7777'),(16,11,'Rua dos Programadores, 300 - São Paulo, SP','suporte@lambda.com.br','(11) 91111-8888'),(17,11,'Avenida Tech, 1234 - São Paulo, SP','rh@lambda.com.br','(11) 92222-9999'),(18,12,'Rua das Energias, 250 - Recife, PE','contato@mu.com.br','(81) 95555-6666'),(19,12,'Avenida Sustentável, 800 - Recife, PE','suporte@mu.com.br','(81) 96666-7777'),(20,13,'Rua dos Robôs, 110 - Porto Alegre, RS','engenharia@nu.com.br','(51) 93333-8888'),(21,13,'Avenida Autônoma, 920 - Porto Alegre, RS','financeiro@nu.com.br','(51) 94444-9999'),(22,14,'Rua do Datacenter, 222 - Brasília, DF','infra@xi.com.br','(61) 97777-0000'),(23,14,'Avenida Digital, 333 - Brasília, DF','rh@xi.com.br','(61) 98888-1111'),(24,15,'Rua das Antenas, 555 - Salvador, BA','suporte@omicron.com.br','(71) 92222-2222'),(25,15,'Avenida Satélite, 666 - Salvador, BA','infra@omicron.com.br','(71) 93333-3333'),(26,21,'Rua Blockchain, 700 - Belo Horizonte, MG','cripto@pi.com.br','(31) 91111-4444'),(27,22,'Avenida AI, 900 - Curitiba, PR','inteligencia@rho.com.br','(41) 92222-5555'),(28,23,'Rua Fintech, 1000 - Florianópolis, SC','financeiro@sigma.com.br','(48) 93333-6666'),(29,24,'Avenida Cloud, 1500 - Recife, PE','infra@tau.com.br','(81) 94444-7777'),(30,25,'Rua IoT, 1700 - Rio de Janeiro, RJ','iot@upsilon.com.br','(21) 95555-8888'),(31,31,'Rua Aeroespacial, 1800 - São Paulo, SP','engenharia@phi.com.br','(11) 96666-9999'),(32,31,'Avenida Satélite, 1900 - São Paulo, SP','suporte@phi.com.br','(11) 97777-0000'),(33,32,'Rua Quantum, 2000 - Porto Alegre, RS','pesquisa@chi.com.br','(51) 98888-1111'),(34,32,'Avenida Física, 2100 - Porto Alegre, RS','lab@chi.com.br','(51) 99999-2222'),(35,33,'Rua GreenTech, 2200 - Brasília, DF','sustentabilidade@psi.com.br','(61) 91111-3333'),(36,33,'Avenida Ecológica, 2300 - Brasília, DF','eco@psi.com.br','(61) 92222-4444'),(37,34,'Rua Química, 2400 - Salvador, BA','pesquisa@omega.com.br','(71) 93333-5555'),(38,34,'Avenida Biotecnologia, 2500 - Salvador, BA','lab@omega.com.br','(71) 94444-6666'),(39,35,'Rua AgroTech, 2600 - Curitiba, PR','agronegocio@alphatech.com.br','(41) 95555-7777'),(40,35,'Avenida Fazenda Digital, 2700 - Curitiba, PR','suporte@alphatech.com.br','(41) 96666-8888'),(41,36,'Rua Automação, 2800 - Florianópolis, SC','automacao@betacloud.com.br','(48) 97777-9999'),(42,37,'Avenida Transformação, 2900 - Recife, PE','inovacao@gamafinance.com.br','(81) 98888-0000'),(43,38,'Rua Dados, 3000 - Rio de Janeiro, RJ','bigdata@deltatech.com.br','(21) 99999-1111'),(44,39,'Avenida Inteligente, 3100 - Brasília, DF','ai@epsilonlogistica.com.br','(61) 91111-2222'),(45,40,'Rua Startups, 3200 - São Paulo, SP','investidores@zetasol.com.br','(11) 92222-3333'),(46,1,'Rua das Flores, 123 - São Paulo, SP','contato@alpha.com.br','(11) 99999-1111'),(47,1,'Avenida Paulista, 1000 - São Paulo, SP','suporte@alpha.com.br','(11) 99999-2222'),(48,2,'Rua XV de Novembro, 45 - Curitiba, PR','contato@betatech.com.br','(41) 98888-3333'),(49,2,'Avenida Batel, 200 - Curitiba, PR','financeiro@betatech.com.br','(41) 98888-4444'),(50,3,'Rua Chile, 77 - Porto Alegre, RS','suporte@gammatelecom.com.br','(51) 97777-5555'),(51,3,'Rua Borges de Medeiros, 500 - Porto Alegre, RS','vendas@gammatelecom.com.br','(51) 96666-6666'),(52,4,'Avenida das Torres, 1500 - Manaus, AM','infra@delta.com.br','(92) 98888-7777'),(53,4,'Rua Rio Negro, 25 - Manaus, AM','obras@delta.com.br','(92) 98888-8888'),(54,5,'Rua Engenheiro Paulo, 321 - Belo Horizonte, MG','engenharia@epsilon.com.br','(31) 97777-9999'),(55,5,'Avenida Amazonas, 500 - Belo Horizonte, MG','suporte@epsilon.com.br','(31) 96666-0000'),(56,6,'Rua dos Advogados, 500 - Brasília, DF','consultoria@zeta.com.br','(61) 96666-9999'),(57,7,'Rodovia Anhanguera, Km 40 - Campinas, SP','logistica@eta.com.br','(19) 93333-2222'),(58,8,'Avenida Cibernética, 700 - Florianópolis, SC','seguranca@theta.com.br','(48) 91111-4444'),(59,9,'Rua dos Médicos, 100 - Rio de Janeiro, RJ','atendimento@iota.com.br','(21) 97777-5555'),(60,10,'Avenida das Finanças, 1000 - São Paulo, SP','investimentos@kappa.com.br','(11) 95555-7777'),(61,11,'Rua dos Programadores, 300 - São Paulo, SP','suporte@lambda.com.br','(11) 91111-8888'),(62,11,'Avenida Tech, 1234 - São Paulo, SP','rh@lambda.com.br','(11) 92222-9999'),(63,12,'Rua das Energias, 250 - Recife, PE','contato@mu.com.br','(81) 95555-6666'),(64,12,'Avenida Sustentável, 800 - Recife, PE','suporte@mu.com.br','(81) 96666-7777'),(65,13,'Rua dos Robôs, 110 - Porto Alegre, RS','engenharia@nu.com.br','(51) 93333-8888'),(66,13,'Avenida Autônoma, 920 - Porto Alegre, RS','financeiro@nu.com.br','(51) 94444-9999'),(67,14,'Rua do Datacenter, 222 - Brasília, DF','infra@xi.com.br','(61) 97777-0000'),(68,14,'Avenida Digital, 333 - Brasília, DF','rh@xi.com.br','(61) 98888-1111'),(69,15,'Rua das Antenas, 555 - Salvador, BA','suporte@omicron.com.br','(71) 92222-2222'),(70,15,'Avenida Satélite, 666 - Salvador, BA','infra@omicron.com.br','(71) 93333-3333'),(71,21,'Rua Blockchain, 700 - Belo Horizonte, MG','cripto@pi.com.br','(31) 91111-4444'),(72,22,'Avenida AI, 900 - Curitiba, PR','inteligencia@rho.com.br','(41) 92222-5555'),(73,23,'Rua Fintech, 1000 - Florianópolis, SC','financeiro@sigma.com.br','(48) 93333-6666'),(74,24,'Avenida Cloud, 1500 - Recife, PE','infra@tau.com.br','(81) 94444-7777'),(75,25,'Rua IoT, 1700 - Rio de Janeiro, RJ','iot@upsilon.com.br','(21) 95555-8888'),(76,31,'Rua Aeroespacial, 1800 - São Paulo, SP','engenharia@phi.com.br','(11) 96666-9999'),(77,31,'Avenida Satélite, 1900 - São Paulo, SP','suporte@phi.com.br','(11) 97777-0000'),(78,32,'Rua Quantum, 2000 - Porto Alegre, RS','pesquisa@chi.com.br','(51) 98888-1111'),(79,32,'Avenida Física, 2100 - Porto Alegre, RS','lab@chi.com.br','(51) 99999-2222'),(80,33,'Rua GreenTech, 2200 - Brasília, DF','sustentabilidade@psi.com.br','(61) 91111-3333'),(81,33,'Avenida Ecológica, 2300 - Brasília, DF','eco@psi.com.br','(61) 92222-4444'),(82,34,'Rua Química, 2400 - Salvador, BA','pesquisa@omega.com.br','(71) 93333-5555'),(83,34,'Avenida Biotecnologia, 2500 - Salvador, BA','lab@omega.com.br','(71) 94444-6666'),(84,35,'Rua AgroTech, 2600 - Curitiba, PR','agronegocio@alphatech.com.br','(41) 95555-7777'),(85,35,'Avenida Fazenda Digital, 2700 - Curitiba, PR','suporte@alphatech.com.br','(41) 96666-8888'),(86,36,'Rua Automação, 2800 - Florianópolis, SC','automacao@betacloud.com.br','(48) 97777-9999'),(87,37,'Avenida Transformação, 2900 - Recife, PE','inovacao@gamafinance.com.br','(81) 98888-0000'),(88,38,'Rua Dados, 3000 - Rio de Janeiro, RJ','bigdata@deltatech.com.br','(21) 99999-1111'),(89,39,'Avenida Inteligente, 3100 - Brasília, DF','ai@epsilonlogistica.com.br','(61) 91111-2222'),(90,40,'Rua Startups, 3200 - São Paulo, SP','investidores@zetasol.com.br','(11) 92222-3333');
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `historico_status_alerta`
--

LOCK TABLES `historico_status_alerta` WRITE;
/*!40000 ALTER TABLE `historico_status_alerta` DISABLE KEYS */;
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
  `ciclo_vida_incidente_timestamp` time DEFAULT NULL,
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
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `incidente_itsm`
--

LOCK TABLES `incidente_itsm` WRITE;
/*!40000 ALTER TABLE `incidente_itsm` DISABLE KEYS */;
INSERT INTO `incidente_itsm` VALUES (1,1,2,2,1,'2025-02-11 10:52:08',NULL,1,NULL),(2,1,2,2,1,'2025-02-11 10:52:08',NULL,1,NULL),(3,3,6,6,2,'2025-02-11 10:52:08',NULL,1,NULL),(4,4,26,26,3,'2025-02-11 10:52:08',NULL,1,NULL),(5,5,28,28,4,'2025-02-11 10:52:08',NULL,1,NULL),(6,6,9,9,5,'2025-02-11 10:52:08',NULL,2,NULL),(7,7,29,29,6,'2025-02-11 10:52:08',NULL,3,NULL),(8,8,27,27,7,'2025-02-11 10:52:08',NULL,1,NULL),(9,9,5,5,8,'2025-02-11 10:52:08',NULL,1,NULL),(10,10,3,3,9,'2025-02-11 10:52:08',NULL,1,NULL),(11,1,2,3,5,'2025-02-11 14:40:25',NULL,1,NULL);
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

    -- Se fim_incidente_date for NULL, usamos NOW(), senão usamos o próprio fim_incidente_date
    SET fim_calculo = IFNULL(NEW.fim_incidente_date, NOW());

    -- Calcula o ciclo de vida baseado na diferença entre fim_calculo e inicio_incidente_date
    SET NEW.ciclo_vida_incidente_timestamp = CONCAT(
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
  `tempo_solucao` timestamp NOT NULL,
  PRIMARY KEY (`sla_id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sla`
--

LOCK TABLES `sla` WRITE;
/*!40000 ALTER TABLE `sla` DISABLE KEYS */;
INSERT INTO `sla` VALUES (1,'2025-02-11 03:15:25'),(2,'2025-02-11 03:25:25'),(3,'2025-02-11 03:35:25'),(4,'2025-02-11 03:45:25'),(5,'2025-02-11 04:45:25'),(6,'2025-02-11 05:45:25'),(7,'2025-02-11 06:45:25'),(8,'2025-02-11 07:45:25'),(9,'2025-02-11 08:45:25'),(10,'2025-02-11 09:45:25'),(11,'2025-02-11 10:45:25'),(12,'2025-02-11 11:45:25'),(13,'2025-02-11 12:45:25'),(14,'2025-02-11 13:45:25'),(15,'2025-02-11 14:45:25'),(16,'2025-02-11 15:45:25'),(17,'2025-02-11 16:45:25'),(18,'2025-02-11 17:45:25'),(19,'2025-02-12 01:45:25'),(20,'2025-02-12 02:45:25');
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
 1 AS `ativo_id`,
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
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `status`
--

LOCK TABLES `status` WRITE;
/*!40000 ALTER TABLE `status` DISABLE KEYS */;
INSERT INTO `status` VALUES (1,'Aberto'),(2,'Em Análise'),(3,'Em Atendimento'),(4,'Aguardando Terceiros'),(5,'Aguardando Cliente'),(6,'Resolvido'),(7,'Fechado'),(8,'Reaberto'),(9,'Cancelado'),(10,'Escalonado'),(11,'Em Investigação'),(12,'Monitorando'),(13,'Em Testes'),(14,'Aguardando Aprovação'),(15,'Concluído'),(16,'Pendente'),(17,'Suspenso'),(18,'Aguardando Mudança'),(19,'Em Execução'),(20,'Arquivado');
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
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipo_alerta`
--

LOCK TABLES `tipo_alerta` WRITE;
/*!40000 ALTER TABLE `tipo_alerta` DISABLE KEYS */;
INSERT INTO `tipo_alerta` VALUES (1,'Perda de Pacotes Alta'),(2,'Latência Elevada'),(3,'Queda de Link Principal'),(4,'Queda de Link Secundário'),(5,'Erro de Roteamento'),(6,'BGP Instável'),(7,'Alto Uso de CPU em Switch'),(8,'Alto Uso de Memória em Switch'),(9,'Porta de Switch Bloqueada'),(10,'Broadcast Storm Detectado'),(11,'Loop de Rede Identificado'),(12,'Erro na Negociação de Link'),(13,'Queda de VLAN'),(14,'Problema no STP (Spanning Tree Protocol)'),(15,'Endereço MAC Flapping Detectado'),(16,'Conflito de IP na Rede'),(17,'Interface de Roteador Down'),(18,'Falta de Redundância em Rede WAN'),(19,'Erros Excessivos na Interface de Rede'),(20,'Falta de Conectividade com Gateway'),(21,'Problema com DHCP Server'),(22,'Problema com DNS Server'),(23,'Queda de Peering BGP'),(24,'Perda de Sincronização NTP'),(25,'Problema em Interface Óptica'),(26,'Loop de Rede em Access Point'),(27,'Conexões Excessivas em Switch'),(28,'Tabela ARP Saturada'),(29,'Uso Excessivo de Largura de Banda'),(30,'Alerta de QoS Violado'),(31,'Tentativa de Acesso Não Autorizado'),(32,'Ataque de Força Bruta Detectado'),(33,'Alto Consumo de CPU no Firewall'),(34,'Alto Consumo de Memória no Firewall'),(35,'Regras de Firewall em Conflito'),(36,'Bloqueio de Tráfego Inválido'),(37,'IPs em Lista Negra Acessando Rede'),(38,'Acesso Suspeito à Rede Interna'),(39,'Política de Segurança Alterada'),(40,'Porta Aberta Não Autorizada'),(41,'Tentativa de Exploração de Vulnerabilidade'),(42,'Alto Volume de Conexões Simultâneas'),(43,'Detecção de Ataque DDoS'),(44,'Falha na Atualização de Assinaturas de IPS'),(45,'Queda de Serviço VPN'),(46,'Timeout Excessivo em Conexões'),(47,'Acesso Indevido a Aplicação Sensível'),(48,'Firewall Rejeitando Conexões Válidas'),(49,'Desativação de Regras de Bloqueio'),(50,'Queda do Serviço de Proxy'),(51,'Excesso de Logs Gerados'),(52,'Uso Indevido de Portas Privilegiadas'),(53,'Configuração Não Padrão Identificada'),(54,'Política de Aplicação Bloqueada'),(55,'Alerta de Túnel VPN Suspenso'),(56,'Mudança Suspeita de NAT/PAT'),(57,'Tráfego de Rede Criptografado Não Permitido'),(58,'Tentativa de Acesso a Domínios Bloqueados'),(59,'Queda do Serviço de IDS/IPS'),(60,'Falha na Replicação de Regras entre Firewalls'),(61,'Servidor com Alto Uso de CPU'),(62,'Servidor com Alto Uso de Memória'),(63,'Disco Rígido com Pouco Espaço Livre'),(64,'Queda de Serviço Web'),(65,'Banco de Dados Offline'),(66,'Alto Consumo de IOPS no Storage'),(67,'Erro em Cluster de Servidores'),(68,'Falha na Comunicação API'),(69,'Serviço de E-mail Fora do Ar'),(70,'Falha na Sincronização de Backup'),(71,'Erro no Balanceador de Carga'),(72,'Orquestrador de Containers com Falha'),(73,'Erro de Autenticação LDAP'),(74,'Falha na Sincronização com AD'),(75,'Timeout Excessivo em Aplicação Crítica'),(76,'Erro na Sincronização com Serviço de NTP'),(77,'Falha na Replicação de Banco de Dados'),(78,'Erro em Rotas de Mensageria'),(79,'Queue de Mensageria Saturada'),(80,'Processos em Execução Demasiadamente Longos'),(81,'Erro na Integridade de Arquivos'),(82,'Falha em Job de Automatização'),(83,'Serviço de Cache Inacessível'),(84,'Erro em Serviço de DNS Interno'),(85,'Instabilidade em Serviço Cloud'),(86,'Falha de Comunicação com Provedor Externo'),(87,'Erro na Aplicação de Patch de Segurança'),(88,'Comprometimento de Certificado SSL'),(89,'Uso Elevado de Threads em Aplicação'),(90,'Alto Consumo de API Rate Limit'),(91,'Erro em Sincronização de Dispositivo IoT'),(92,'Alerta de Consumo de Licenciamento'),(93,'Falha em Serviço de Logs Centralizados'),(94,'Timeout em Chamadas RESTful'),(95,'Erro em Servidor FTP'),(96,'Serviço de Autenticação MFA Inativo'),(97,'Erro no Provisionamento de Recursos em Nuvem'),(98,'Problema na Atualização de Segurança de Endpoints'),(99,'Falha no Monitoramento de SLAs'),(100,'Queda de Serviço de Mensagens Instantâneas');
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
CREATE DEFINER=`lab2`@`localhost` FUNCTION `fn_calcular_sla_restante`(p_incidente_id INT) RETURNS varchar(50) CHARSET utf8mb4
    DETERMINISTIC
BEGIN
    DECLARE sla_restante INT;
    DECLARE sla_limite DATETIME;

    SELECT ADDTIME(inicio_incidente_date, sla.tempo_solucao) 
    INTO sla_limite
    FROM incidente_itsm i
    JOIN sla ON i.sla_id = sla.sla_id
    WHERE i.incidente_itsm_id = p_incidente_id;

    SET sla_restante = TIMESTAMPDIFF(HOUR, NOW(), sla_limite);

    RETURN CONCAT(sla_restante, ' horas restantes');
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `fn_verificar_incidente_duplicado` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`lab2`@`localhost` FUNCTION `fn_verificar_incidente_duplicado`(
    p_alerta_monitoracao_id INT
) RETURNS tinyint(1)
    DETERMINISTIC
BEGIN
    DECLARE existe INT;

    SELECT COUNT(*) INTO existe
    FROM incidente_itsm
    WHERE alerta_monitoracao_id = p_alerta_monitoracao_id
      AND status <> 7; -- Ignora incidentes já resolvidos/excluídos

    RETURN IF(existe > 0, TRUE, FALSE);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_abrir_incidente_para_alerta` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`lab2`@`localhost` PROCEDURE `sp_abrir_incidente_para_alerta`(
    IN p_alerta_monitoracao_id INT,
    IN p_ativo_id INT,
    IN p_ativo_servico_id INT,
    IN p_sla_id INT
)
BEGIN
    IF fn_verificar_incidente_duplicado(p_alerta_monitoracao_id) = FALSE THEN
        INSERT INTO incidente_itsm (alerta_monitoracao_id, ativo_id, ativo_servico_id, sla_id, inicio_incidente_date, status)
        VALUES (p_alerta_monitoracao_id, p_ativo_id, p_ativo_servico_id, p_sla_id, NOW(), 1);
    ELSE
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Já existe um incidente ativo para este alerta!';
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
    IN p_status INT,
    IN p_prioridade INT,
    IN p_origem VARCHAR(255)
)
BEGIN
    DECLARE alerta_id_existente INT DEFAULT NULL;
    DECLARE alerta_status INT DEFAULT NULL;
    DECLARE alerta_contador INT DEFAULT NULL;

    -- Verifica se já existe um alerta igual
    SELECT alerta_monitoracao_id, status, contador_evento
    INTO alerta_id_existente, alerta_status, alerta_contador
    FROM alerta_monitoracao
    WHERE titulo = p_titulo
      AND descricao = p_descricao
      AND tipo_alerta_id = p_tipo_alerta_id
      AND ativo_id = p_ativo_id
      AND ativo_servico_id = p_ativo_servico_id
    LIMIT 1;

    -- Se o alerta já existir e estiver aberto (status diferente de 6 e 7), incrementa o contador
    IF alerta_id_existente IS NOT NULL AND alerta_status NOT IN (6,7) THEN
        UPDATE alerta_monitoracao 
        SET contador_evento = IFNULL(alerta_contador, 0) + 1
        WHERE alerta_monitoracao_id = alerta_id_existente;
    
    -- Se o alerta já existir e estiver fechado (status = 6 ou 7), cria um novo alerta
    ELSE
        INSERT INTO alerta_monitoracao (titulo, descricao, tipo_alerta_id, ativo_id, ativo_servico_id, status, inicio_date, contador_evento, prioridade, origem)
        VALUES (p_titulo, p_descricao, p_tipo_alerta_id, p_ativo_id, p_ativo_servico_id, p_status, NOW(), 1, p_prioridade, p_origem);
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
/*!50001 VIEW `sla_ativos` AS select `a`.`ativo_id` AS `ativo_id`,`a`.`descricao` AS `ativo_descricao`,`s`.`sla_id` AS `sla_id`,`s`.`tempo_solucao` AS `tempo_solucao`,`am`.`alerta_monitoracao_id` AS `alerta_monitoracao_id`,`am`.`titulo` AS `alerta_titulo`,`am`.`descricao` AS `alerta_descricao`,`am`.`status` AS `alerta_status`,`am`.`inicio_date` AS `alerta_inicio_date`,`am`.`fim_date` AS `alerta_fim_date` from ((`ativo` `a` join `sla` `s` on((`a`.`sla_id` = `s`.`sla_id`))) left join `alerta_monitoracao` `am` on((`a`.`ativo_id` = `am`.`ativo_id`))) where ((`am`.`status` = 'Ativo') and (`am`.`ativo_id` is not null)) union select `asv`.`ativo_servico_id` AS `ativo_servico_id`,`asv`.`nome` AS `servico_descricao`,`s`.`sla_id` AS `sla_id`,`s`.`tempo_solucao` AS `tempo_solucao`,`am`.`alerta_monitoracao_id` AS `alerta_monitoracao_id`,`am`.`titulo` AS `alerta_titulo`,`am`.`descricao` AS `alerta_descricao`,`am`.`status` AS `alerta_status`,`am`.`inicio_date` AS `alerta_inicio_date`,`am`.`fim_date` AS `alerta_fim_date` from ((`ativo_servico` `asv` join `sla` `s` on((`asv`.`sla_id` = `s`.`sla_id`))) left join `alerta_monitoracao` `am` on((`asv`.`ativo_servico_id` = `am`.`ativo_servico_id`))) where ((`am`.`status` = 'Ativo') and (`am`.`ativo_servico_id` is not null)) */;
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
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-02-11 15:19:58
