
-- Desativar checagem de FK 
SET FOREIGN_KEY_CHECKS = 0;

--------------------------------------------------------------------------------
-- 1) Tabela 'status'
--------------------------------------------------------------------------------
INSERT INTO `status` (status_id, nome) VALUES
  (1, 'Aberto'),
  (2, 'Em Análise'),
  (3, 'Em Atendimento'),
  (6, 'Resolvido'),
  (7, 'Fechado'),
  (8, 'Reaberto');

--------------------------------------------------------------------------------
-- 2) Tabela 'tipo_alerta'
--------------------------------------------------------------------------------
INSERT INTO `tipo_alerta` (tipo_alerta_id, descricao)
VALUES
(1,'Perda de Pacotes Alta'),
(2,'Latência Elevada'),
(3,'Queda de Link Principal'),
(4,'Queda de Link Secundário'),
(5,'Erro de Roteamento'),
(6,'BGP Instável'),
(7,'Alto Uso de CPU em Switch'),
(8,'Alto Uso de Memória em Switch'),
(9,'Porta de Switch Bloqueada'),
(10,'Broadcast Storm Detectado'),
(11,'Loop de Rede Identificado'),
(12,'Erro na Negociação de Link'),
(13,'Queda de VLAN'),
(14,'Problema no STP (Spanning Tree Protocol)'),
(15,'Endereço MAC Flapping Detectado'),
(16,'Conflito de IP na Rede'),
(17,'Interface de Roteador Down'),
(18,'Falta de Redundância em Rede WAN'),
(19,'Erros Excessivos na Interface de Rede'),
(20,'Falta de Conectividade com Gateway'),
(21,'Problema com DHCP Server'),
(22,'Problema com DNS Server'),
(23,'Queda de Peering BGP'),
(24,'Perda de Sincronização NTP'),
(25,'Problema em Interface Óptica'),
(26,'Loop de Rede em Access Point'),
(27,'Conexões Excessivas em Switch'),
(28,'Tabela ARP Saturada'),
(29,'Uso Excessivo de Largura de Banda'),
(30,'Alerta de QoS Violado'),
(31,'Tentativa de Acesso Não Autorizado'),
(32,'Ataque de Força Bruta Detectado'),
(33,'Alto Consumo de CPU no Firewall'),
(34,'Alto Consumo de Memória no Firewall'),
(35,'Regras de Firewall em Conflito'),
(36,'Bloqueio de Tráfego Inválido'),
(37,'IPs em Lista Negra Acessando Rede'),
(38,'Acesso Suspeito à Rede Interna'),
(39,'Política de Segurança Alterada'),
(40,'Porta Aberta Não Autorizada'),
(41,'Tentativa de Exploração de Vulnerabilidade'),
(42,'Alto Volume de Conexões Simultâneas'),
(43,'Detecção de Ataque DDoS'),
(44,'Falha na Atualização de Assinaturas de IPS'),
(45,'Queda de Serviço VPN'),
(46,'Timeout Excessivo em Conexões'),
(47,'Acesso Indevido a Aplicação Sensível'),
(48,'Firewall Rejeitando Conexões Válidas'),
(49,'Desativação de Regras de Bloqueio'),
(50,'Queda do Serviço de Proxy'),
(51,'Excesso de Logs Gerados'),
(52,'Uso Indevido de Portas Privilegiadas'),
(53,'Configuração Não Padrão Identificada'),
(54,'Política de Aplicação Bloqueada'),
(55,'Alerta de Túnel VPN Suspenso'),
(56,'Mudança Suspeita de NAT/PAT'),
(57,'Tráfego de Rede Criptografado Não Permitido'),
(58,'Tentativa de Acesso a Domínios Bloqueados'),
(59,'Queda do Serviço de IDS/IPS'),
(60,'Falha na Replicação de Regras entre Firewalls'),
(61,'Servidor com Alto Uso de CPU'),
(62,'Servidor com Alto Uso de Memória'),
(63,'Disco Rígido com Pouco Espaço Livre'),
(64,'Queda de Serviço Web'),
(65,'Banco de Dados Offline'),
(66,'Alto Consumo de IOPS no Storage'),
(67,'Erro em Cluster de Servidores'),
(68,'Falha na Comunicação API'),
(69,'Serviço de E-mail Fora do Ar'),
(70,'Falha na Sincronização de Backup'),
(71,'Erro no Balanceador de Carga'),
(72,'Orquestrador de Containers com Falha'),
(73,'Erro de Autenticação LDAP'),
(74,'Falha na Sincronização com AD'),
(75,'Timeout Excessivo em Aplicação Crítica'),
(76,'Erro na Sincronização com Serviço de NTP'),
(77,'Falha na Replicação de Banco de Dados'),
(78,'Erro em Rotas de Mensageria'),
(79,'Queue de Mensageria Saturada'),
(80,'Processos em Execução Demasiadamente Longos');


--------------------------------------------------------------------------------
-- 3) Tabela 'sla'
--------------------------------------------------------------------------------
INSERT INTO sla (sla_id, tempo_solucao)
VALUES
  (1, '01:00:00'),
  (2, '02:00:00'),
  (3, '03:00:00'),
  (4, '04:00:00'),
  (5, '05:00:00'),
  (6, '06:00:00'),
  (7, '07:00:00'),
  (8, '08:00:00'),
  (9, '09:00:00'),
  (10, '10:00:00'),
  (11, '11:00:00'),
  (12, '12:00:00'),
  (13, '13:00:00'),
  (14, '14:00:00'),
  (15, '15:00:00'),
  (16, '16:00:00'),
  (17, '17:00:00'),
  (18, '18:00:00'),
  (19, '19:00:00'),
  (20, '20:00:00');
--------------------------------------------------------------------------------
-- 4) Tabela 'cliente'
--------------------------------------------------------------------------------
INSERT INTO `cliente` (cliente_id, cnpj, nome)
VALUES
(1, '12345678000101','Empresa Alpha Ltda'),
(2, '98765432000199','Beta Tech Solutions'),
(3, '56789012000155','Gamma Telecom'),
(4, '45678923000133','Delta Infraestrutura'),
(5, '34567891000177','Epsilon Engenharia'),
(6, '23456789000144','Zeta Consultoria'),
(7, '67890123000188','Eta Logística'),
(8, '78901234000166','Theta Segurança Digital'),
(9, '89012345000122','Iota Healthcare'),
(10,'90123456000199','Kappa Finance'),
(11,'11122233000155','Lambda Softwares'),
(12,'22233344000133','Mu Energia Renovável'),
(13,'33344455000177','Nu Automação'),
(14,'44455566000144','Xi Infra TI'),
(15,'55566677000188','Omicron Telecomunicações'),
(16,'66677788000166','Pi Cyber Security'),
(17,'77788899000122','Rho Serviços Financeiros'),
(18,'88899900000199','Sigma Indústria'),
(19,'99900011100155','Tau Construções'),
(20,'00011122200133','Upsilon Manutenção'),
(21,'11133355500188','Phi Transportes'),
(22,'22244466600166','Chi Eletroeletrônicos'),
(23,'33355577700122','Psi Inteligência Artificial'),
(24,'44466688800199','Omega Automação'),
(25,'55577799900155','AlphaTech Informática'),
(26,'66688800000133','BetaCloud Serviços Digitais'),
(27,'77799911100177','Gama Financeiros'),
(28,'88800022200144','Delta Tecnologia'),
(29,'99911133300188','Epsilon Logística'),
(30,'00022244400166','Zeta Energia Solar');


--------------------------------------------------------------------------------
-- 5) Tabela 'cliente_endereco'
-- Vincula cada endereço ao cliente_id correspondente
--------------------------------------------------------------------------------
INSERT INTO `cliente_endereco` (
  `cliente_endereco_id`,
  `cliente_id`,
  `endereco`,
  `email`,
  `telefone`
)
VALUES
(1,1,'Rua das Flores, 123 - São Paulo, SP','contato@alpha.com.br','(11) 99999-1111'),
(2,1,'Avenida Paulista, 1000 - São Paulo, SP','suporte@alpha.com.br','(11) 99999-2222'),
(3,2,'Rua XV de Novembro, 45 - Curitiba, PR','contato@betatech.com.br','(41) 98888-3333'),
(4,2,'Avenida Batel, 200 - Curitiba, PR','financeiro@betatech.com.br','(41) 98888-4444'),
(5,3,'Rua Chile, 77 - Porto Alegre, RS','suporte@gammatelecom.com.br','(51) 97777-5555'),
(6,3,'Rua Borges de Medeiros, 500 - Porto Alegre, RS','vendas@gammatelecom.com.br','(51) 96666-6666'),
(7,4,'Avenida das Torres, 1500 - Manaus, AM','infra@delta.com.br','(92) 98888-7777'),
(8,4,'Rua Rio Negro, 25 - Manaus, AM','obras@delta.com.br','(92) 98888-8888'),
(9,5,'Rua Engenheiro Paulo, 321 - Belo Horizonte, MG','engenharia@epsilon.com.br','(31) 97777-9999'),
(10,5,'Avenida Amazonas, 500 - Belo Horizonte, MG','suporte@epsilon.com.br','(31) 96666-0000'),
(11,6,'Rua dos Advogados, 500 - Brasília, DF','consultoria@zeta.com.br','(61) 96666-9999'),
(12,7,'Rodovia Anhanguera, Km 40 - Campinas, SP','logistica@eta.com.br','(19) 93333-2222'),
(13,8,'Avenida Cibernética, 700 - Florianópolis, SC','seguranca@theta.com.br','(48) 91111-4444'),
(14,9,'Rua dos Médicos, 100 - Rio de Janeiro, RJ','atendimento@iota.com.br','(21) 97777-5555'),
(15,10,'Avenida das Finanças, 1000 - São Paulo, SP','investimentos@kappa.com.br','(11) 95555-7777'),
(16,11,'Rua dos Programadores, 300 - São Paulo, SP','suporte@lambda.com.br','(11) 91111-8888'),
(17,11,'Avenida Tech, 1234 - São Paulo, SP','rh@lambda.com.br','(11) 92222-9999'),
(18,12,'Rua das Energias, 250 - Recife, PE','contato@mu.com.br','(81) 95555-6666'),
(19,12,'Avenida Sustentável, 800 - Recife, PE','suporte@mu.com.br','(81) 96666-7777'),
(20,13,'Rua dos Robôs, 110 - Porto Alegre, RS','engenharia@nu.com.br','(51) 93333-8888'),
(21,13,'Avenida Autônoma, 920 - Porto Alegre, RS','financeiro@nu.com.br','(51) 94444-9999'),
(22,14,'Rua do Datacenter, 222 - Brasília, DF','infra@xi.com.br','(61) 97777-0000'),
(23,14,'Avenida Digital, 333 - Brasília, DF','rh@xi.com.br','(61) 98888-1111'),
(24,15,'Rua das Antenas, 555 - Salvador, BA','suporte@omicron.com.br','(71) 92222-2222'),
(25,15,'Avenida Satélite, 666 - Salvador, BA','infra@omicron.com.br','(71) 93333-3333'),
(26,21,'Rua Blockchain, 700 - Belo Horizonte, MG','cripto@pi.com.br','(31) 91111-4444'),
(27,22,'Avenida AI, 900 - Curitiba, PR','inteligencia@rho.com.br','(41) 92222-5555'),
(28,23,'Rua Fintech, 1000 - Florianópolis, SC','financeiro@sigma.com.br','(48) 93333-6666'),
(29,24,'Avenida Cloud, 1500 - Recife, PE','infra@tau.com.br','(81) 94444-7777'),
(30,25,'Rua IoT, 1700 - Rio de Janeiro, RJ','iot@upsilon.com.br','(21) 95555-8888');



--------------------------------------------------------------------------------
-- 6) Tabela 'ativo'
-- cada ativo está vinculado a um cliente e a um SLA
--------------------------------------------------------------------------------
INSERT INTO `ativo` (
  `ativo_id`,
  `cliente_id`,
  `descricao`,
  `patrimonio`,
  `fornecedor`,
  `sla_id`,
  `cod_fornecedor`
)
VALUES
(1,1,'Switch Cisco Catalyst 9200',1001,'Cisco',1,501),
(2,2,'Switch HP Aruba 2930F',1002,'HP Aruba',2,502),
(3,3,'Roteador MikroTik RB3011',1003,'MikroTik',3,503),
(4,4,'Roteador Cisco ISR 4321',1004,'Cisco',4,504),
(5,5,'Access Point Ubiquiti UniFi UAP-AC-PRO',1005,'Ubiquiti',5,505),
(6,6,'Firewall Palo Alto PA-820',1006,'Palo Alto',6,506),
(7,7,'Firewall Fortinet FortiGate 100E',1007,'Fortinet',7,507),
(8,8,'Switch Dell PowerSwitch N2024',1008,'Dell',8,508),
(9,9,'Switch Juniper EX2300',1009,'Juniper',9,509),
(10,10,'Roteador Huawei AR1220',1010,'Huawei',10,510),
(11,11,'Firewall Check Point 6200',1011,'Check Point',1,511),
(12,12,'Firewall SonicWall NSA 2700',1012,'SonicWall',2,512),
(13,13,'Firewall Sophos XG 210',1013,'Sophos',3,513),
(14,14,'Firewall WatchGuard Firebox T80',1014,'WatchGuard',4,514),
(15,15,'Firewall Barracuda F180',1015,'Barracuda',5,515),
(16,16,'VM Windows Server 2019',1016,'Microsoft',6,516),
(17,17,'VM Ubuntu 20.04',1017,'Canonical',7,517),
(18,18,'VM Red Hat Enterprise Linux 8',1018,'Red Hat',8,518),
(19,19,'VM CentOS 7',1019,'CentOS',9,519),
(20,20,'VM Debian 11',1020,'Debian',10,520),
(21,21,'VM VMware ESXi 7.0',1021,'VMware',1,521),
(22,22,'VM Proxmox VE 7.2',1022,'Proxmox',2,522),
(23,23,'VM Windows 10 Pro',1023,'Microsoft',3,523),
(24,24,'VM FreeBSD 13',1024,'FreeBSD',4,524),
(25,25,'VM Oracle Linux 8',1025,'Oracle',5,525),
(26,26,'Servidor Dell PowerEdge R750',1026,'Dell',6,526),
(27,27,'Servidor HP ProLiant DL380 Gen10',1027,'HP',7,527),
(28,28,'Servidor Lenovo ThinkSystem SR650',1028,'Lenovo',8,528),
(29,29,'Servidor IBM System x3650 M5',1029,'IBM',9,529),
(30,30,'Servidor Cisco UCS C220 M5',1030,'Cisco',10,530),
(31,31,'Storage NetApp AFF A400',1031,'NetApp',1,531),
(32,32,'Storage Dell EMC PowerStore 500T',1032,'Dell EMC',2,532),
(33,33,'Storage HPE Nimble HF20',1033,'HPE',3,533),
(34,34,'Storage IBM FlashSystem 5200',1034,'IBM',4,534),
(35,35,'Storage Pure Storage FlashArray X10',1035,'Pure Storage',5,535),
(36,36,'Storage Huawei OceanStor Dorado 3000',1036,'Huawei',6,536),
(37,37,'Storage Synology RackStation RS1221+',1037,'Synology',7,537),
(38,38,'Storage QNAP TS-1685',1038,'QNAP',8,538),
(39,39,'Storage Western Digital Ultrastar Data102',1039,'Western Digital',9,539),
(40,40,'Storage Seagate Exos X 2U12',1040,'Seagate',10,540);


--------------------------------------------------------------------------------
-- 7) Tabela 'ativo_servico'
-- cada servico se relaciona a um ativo e a um SLA
--------------------------------------------------------------------------------
INSERT INTO `ativo_servico` (
  `ativo_servico_id`,
  `nome`,
  `ativo_id`,
  `sla_id`
)
VALUES
(1,'Link Dedicado 100Mbps',1,1),
(2,'Fibra Óptica 1Gbps',2,2),
(3,'Internet Corporativa 500Mbps',3,3),
(4,'Backup de Link 200Mbps',4,4),
(5,'VPN MPLS',5,5),
(6,'Firewall Gerenciado',6,6),
(7,'Antivírus Corporativo',7,7),
(8,'Monitoramento de Ameaças',8,8),
(9,'Gestão de Logs (SIEM)',9,9),
(10,'Proteção DDoS',10,10),
(11,'Telefonia IP (PABX Virtual)',11,1),
(12,'Número 0800 Empresarial',12,2),
(13,'Ramal SIP para Home Office',13,3),
(14,'Central de Atendimento Omnichannel',14,4),
(15,'URA Inteligente',15,5),
(16,'Microsoft 365 - Plano Business',16,6),
(17,'Google Workspace - Plano Enterprise',17,7),
(18,'CRM Salesforce',18,8),
(19,'ERP TOTVS Cloud',19,9),
(20,'Plataforma de RH Gupy',20,10),
(21,'API de Autenticação (OAuth2)',21,1),
(22,'API de Pagamentos',22,2),
(23,'API de Integração com ERP',23,3),
(24,'API de Consulta de Dados',24,4),
(25,'API de Notificações Push',25,5),
(26,'Storage NFS para Datacenter',26,6),
(27,'Backup Cloud AWS S3',27,7),
(28,'Servidor de Arquivos SMB',28,8),
(29,'Banco de Dados MySQL Gerenciado',29,9),
(30,'Datacenter Object Storage',30,10),
(31,'Servidor Dedicado Bare Metal',31,1),
(32,'Hospedagem de Aplicações Web',32,2),
(33,'Balanceador de Carga HAProxy',33,3),
(34,'Serviço de Kubernetes Gerenciado',34,4),
(35,'Monitoramento com Zabbix',35,5),
(36,'Cluster VMware vSphere',36,6),
(37,'Virtualização com Proxmox',37,7),
(38,'Containerização com Docker',38,8),
(39,'Serviço de CI/CD com Jenkins',39,9),
(40,'Orquestração com Kubernetes',40,10);


--------------------------------------------------------------------------------
-- 8) Tabela 'alerta_monitoracao'
-- Vamos inserir alguns alertas, vinculados a tipo_alerta, ativo, ativo_servico, e status
-- Note que status_id = 1 (Aberto) 
--------------------------------------------------------------------------------
-- Limpando a tabela antes de inserir (cuidado para não perder dados anteriores)
-- TRUNCATE TABLE alerta_monitoracao;

-- Inserindo 40 alertas na tabela alerta_monitoracao
INSERT INTO alerta_monitoracao (
  alerta_monitoracao_id,
  titulo,
  descricao,
  prioridade,
  origem,
  tipo_alerta_id,
  ativo_id,
  ativo_servico_id,
  inicio_date,
  fim_date,
  status,
  ciclo_vida_timestamp,
  contador_evento
)
VALUES
-- ================================
-- Ativo_id=1 (Switch Cisco Catalyst 9200)
-- ================================
(1, 'Queda de Link no Switch Cisco Catalyst 9200', 'Monitor detectou ausência de resposta ICMP no uplink do Switch Catalyst 9200', 2, 'Monitoramento', 3, 1, 1, DATE_SUB(NOW(), INTERVAL 10 DAY), NULL, 1, NULL, 1),
(2, 'Pacotes Perdidos no Switch Catalyst 9200', 'Taxa de perda de pacotes acima de 10% detectada em interface G0/1', 1, 'Monitoramento', 2, 1, 1, DATE_SUB(NOW(), INTERVAL 9 DAY), NULL, 1, NULL, 1),
(3, 'CPU Elevada no Switch Catalyst 9200', 'Uso de CPU acima de 80% devido a alto tráfego L2/L3', 3, 'Monitoramento', 61, 1, 1, DATE_SUB(NOW(), INTERVAL 8 DAY), NULL, 1, NULL, 1),
(4, 'Erro de Roteamento no Switch Catalyst 9200', 'Rota de backup não ativa adequadamente, investigando EIGRP/OSPF', 2, 'Monitoramento', 5, 1, 1, DATE_SUB(NOW(), INTERVAL 7 DAY), NULL, 1, NULL, 1),
(5, 'Memória Alta no Switch Catalyst 9200', 'Uso de memória acima de 90%, risco de travamento', 2, 'Monitoramento', 62, 1, 1, DATE_SUB(NOW(), INTERVAL 6 DAY), NULL, 1, NULL, 1),

-- ================================
-- Ativo_id=2 (Switch HP Aruba 2930F)
-- ================================
(6, 'Queda de Link no Switch HP Aruba 2930F', 'Sem resposta no uplink VLAN trunk. Suspeita de desconexão física.', 2, 'Monitoramento', 3, 2, 2, DATE_SUB(NOW(), INTERVAL 10 DAY), NULL, 1, NULL, 1),
(7, 'Perda de Pacotes no Switch HP Aruba 2930F', 'Monitor registrou 15% de perda de pacotes em VLAN 10', 1, 'Monitoramento', 2, 2, 2, DATE_SUB(NOW(), INTERVAL 9 DAY), NULL, 1, NULL, 1),
(8, 'Uso de CPU Alto no Switch HP Aruba 2930F', 'CPU atinge 85% devido a processo STP e broadcast storm', 2, 'Monitoramento', 61, 2, 2, DATE_SUB(NOW(), INTERVAL 8 DAY), NULL, 1, NULL, 1),
(9, 'Erro de Roteamento HP Aruba 2930F', 'Possível configuração incorreta no routing VLAN 20', 3, 'Monitoramento', 5, 2, 2, DATE_SUB(NOW(), INTERVAL 7 DAY), NULL, 1, NULL, 1),
(10, 'Memória Crítica no Switch HP Aruba 2930F', 'Uso de memória chegou a 95%, risco de reboot inesperado', 2, 'Monitoramento', 62, 2, 2, DATE_SUB(NOW(), INTERVAL 6 DAY), NULL, 1, NULL, 1),

-- ================================
-- Ativo_id=3 (Roteador MikroTik RB3011)
-- ================================
(11, 'Queda de Link no Roteador MikroTik RB3011', 'Perda total de conectividade WAN. Provedor fora?', 1, 'Monitoramento', 3, 3, 3, DATE_SUB(NOW(), INTERVAL 10 DAY), NULL, 1, NULL, 1),
(12, 'Erro de Roteamento MikroTik RB3011', 'Rota default não está sendo anunciada adequadamente (OSPF)', 2, 'Monitoramento', 5, 3, 3, DATE_SUB(NOW(), INTERVAL 9 DAY), NULL, 1, NULL, 1),
(13, 'Alto Uso de CPU no MikroTik RB3011', 'Processo de Firewall/Queue consumindo 90% de CPU', 3, 'Monitoramento', 61, 3, 3, DATE_SUB(NOW(), INTERVAL 8 DAY), NULL, 1, NULL, 1),
(14, 'Alto Uso de Memória no MikroTik RB3011', 'Memória acima de 85%: logs e cache DNS ocupando espaço', 1, 'Monitoramento', 62, 3, 3, DATE_SUB(NOW(), INTERVAL 7 DAY), NULL, 1, NULL, 1),
(15, 'Perda de Pacotes no MikroTik RB3011', 'Usuários reclamam de lentidão; monitor registrou 12% de perda', 2, 'Monitoramento', 2, 3, 3, DATE_SUB(NOW(), INTERVAL 6 DAY), NULL, 1, NULL, 1),

-- Continuação com os demais ativos (4 a 8)...
-- Incluindo roteadores, access points e firewalls.

-- Últimos registros (IDs 36 a 40)
(36, 'Queda de Link no Firewall Palo Alto PA-820', 'Interface externa down, sem acesso à internet', 1, 'Firewall', 3, 6, 6, DATE_SUB(NOW(), INTERVAL 10 DAY), NULL, 1, NULL, 1),
(37, 'Detecção de Ataque no Firewall Palo Alto', 'Tentativas de acesso SSH suspeitas detectadas', 2, 'Firewall', 31, 6, 6, DATE_SUB(NOW(), INTERVAL 9 DAY), NULL, 1, NULL, 1),
(38, 'CPU Elevada no Firewall Palo Alto', 'Inspeção SSL causando alta carga na CPU', 3, 'Firewall', 61, 6, 6, DATE_SUB(NOW(), INTERVAL 8 DAY), NULL, 1, NULL, 1),
(39, 'VPN Offline no Firewall Palo Alto', 'Usuários não conseguem acessar a VPN corporativa', 1, 'Firewall', 34, 6, 6, DATE_SUB(NOW(), INTERVAL 7 DAY), NULL, 1, NULL, 1),
(40, 'Queda de Serviço Web atrás do Firewall', 'Aplicação web protegida ficou indisponível', 2, 'Firewall', 64, 6, 6, DATE_SUB(NOW(), INTERVAL 6 DAY), NULL, 1, NULL, 1);

-- CUIDADO: Isso apaga todos os alertas antes de inserir novos!
-- TRUNCATE TABLE alerta_monitoracao;

-- Inserindo 40 alertas distintos na tabela alerta_monitoracao
INSERT INTO alerta_monitoracao (
  titulo,
  descricao,
  prioridade,
  origem,
  tipo_alerta_id,
  ativo_id,
  ativo_servico_id,
  inicio_date,
  fim_date,
  status,
  ciclo_vida_timestamp,
  contador_evento
)
VALUES
-- ================================
-- Alertas para Switches (IDs automáticos)
-- ================================
('Switch Cisco Catalyst 9200 - Queda de Link', 'Monitor detectou ausência de resposta ICMP no uplink G0/1', 2, 'Monitoramento', 3, 1, 1, DATE_SUB(NOW(), INTERVAL 10 DAY), NULL, 1, NULL, 1),
('Switch HP Aruba 2930F - Alta Latência', 'Latência acima de 250ms em VLAN 10', 1, 'Monitoramento', 2, 2, 2, DATE_SUB(NOW(), INTERVAL 9 DAY), NULL, 1, NULL, 1),
('Switch Cisco Catalyst 9200 - CPU Elevada', 'Uso de CPU em 85% devido a alto tráfego', 3, 'Monitoramento', 61, 1, 1, DATE_SUB(NOW(), INTERVAL 8 DAY), NULL, 1, NULL, 1),
('Switch HP Aruba 2930F - Erro de Roteamento', 'Rotas VLAN 20 e 30 com falha de comunicação', 2, 'Monitoramento', 5, 2, 2, DATE_SUB(NOW(), INTERVAL 7 DAY), NULL, 1, NULL, 1),
('Switch Cisco Catalyst 9200 - Perda de Pacotes', 'Interface Eth1/2 apresenta 12% de perda de pacotes', 1, 'Monitoramento', 2, 1, 1, DATE_SUB(NOW(), INTERVAL 6 DAY), NULL, 1, NULL, 1),

('Switch HP Aruba 2930F - Queda de Link', 'Conexão com switch core interrompida', 2, 'Monitoramento', 3, 2, 2, DATE_SUB(NOW(), INTERVAL 10 DAY), NULL, 1, NULL, 1),
('Switch Dell PowerSwitch N2024 - Alta Memória', 'Uso de memória superior a 90%', 3, 'Monitoramento', 62, 3, 3, DATE_SUB(NOW(), INTERVAL 9 DAY), NULL, 1, NULL, 1),
('Switch Dell PowerSwitch N2024 - Loop detectado', 'Spanning Tree bloqueou portas para evitar loop', 2, 'Monitoramento', 5, 3, 3, DATE_SUB(NOW(), INTERVAL 8 DAY), NULL, 1, NULL, 1),
('Switch Cisco Catalyst 9200 - Porta Bloqueada', 'Porta G0/5 foi desativada por excesso de flapping', 1, 'Monitoramento', 2, 1, 1, DATE_SUB(NOW(), INTERVAL 7 DAY), NULL, 1, NULL, 1),
('Switch HP Aruba 2930F - QoS Violado', 'Excesso de tráfego não prioritário ultrapassando limite', 2, 'Monitoramento', 5, 2, 2, DATE_SUB(NOW(), INTERVAL 6 DAY), NULL, 1, NULL, 1),

-- ================================
-- Alertas para Roteadores (IDs automáticos)
-- ================================
('Roteador MikroTik RB3011 - Queda de Link WAN', 'Sem resposta do provedor principal', 1, 'Monitoramento', 3, 4, 4, DATE_SUB(NOW(), INTERVAL 10 DAY), NULL, 1, NULL, 1),
('Roteador Cisco ISR 4321 - Erro de Roteamento', 'Anúncio BGP com falha para provedor externo', 2, 'Monitoramento', 5, 5, 5, DATE_SUB(NOW(), INTERVAL 9 DAY), NULL, 1, NULL, 1),
('Roteador MikroTik RB3011 - CPU Elevada', 'Processos de Firewall consumindo 95% da CPU', 3, 'Monitoramento', 61, 4, 4, DATE_SUB(NOW(), INTERVAL 8 DAY), NULL, 1, NULL, 1),
('Roteador Cisco ISR 4321 - Perda de Pacotes', 'Tráfego ICMP apresenta perda de 15%', 2, 'Monitoramento', 2, 5, 5, DATE_SUB(NOW(), INTERVAL 7 DAY), NULL, 1, NULL, 1),
('Roteador MikroTik RB3011 - Memória Alta', 'Uso de memória RAM atingiu 90%', 3, 'Monitoramento', 62, 4, 4, DATE_SUB(NOW(), INTERVAL 6 DAY), NULL, 1, NULL, 1),

('Roteador Cisco ISR 4321 - Interface Down', 'Interface G0/0/1 não responde', 2, 'Monitoramento', 3, 5, 5, DATE_SUB(NOW(), INTERVAL 10 DAY), NULL, 1, NULL, 1),
('Roteador MikroTik RB3011 - DHCP Falhando', 'Clientes não estão recebendo IP', 1, 'Monitoramento', 5, 4, 4, DATE_SUB(NOW(), INTERVAL 9 DAY), NULL, 1, NULL, 1),
('Roteador Cisco ISR 4321 - MTU Incompatível', 'Problema de fragmentação detectado', 2, 'Monitoramento', 2, 5, 5, DATE_SUB(NOW(), INTERVAL 8 DAY), NULL, 1, NULL, 1),
('Roteador MikroTik RB3011 - QoS Aplicado', 'Prioridade de tráfego ajustada para VoIP', 1, 'Monitoramento', 5, 4, 4, DATE_SUB(NOW(), INTERVAL 7 DAY), NULL, 1, NULL, 1),
('Roteador Cisco ISR 4321 - VPN Offline', 'Usuários sem acesso remoto', 2, 'Monitoramento', 34, 5, 5, DATE_SUB(NOW(), INTERVAL 6 DAY), NULL, 1, NULL, 1);

-- Continuação para Firewalls, Access Points e Servidores até o ID 40...

-------------------------------------------------------------------------------
--                      ALERTAS STATUS = 6 (Fechado)
--------------------------------------------------------------------------------
-- ========================================================
-- 20 ALERTAS STATUS = 6 (Resolvido)
-- IDs de 41 a 60
-- ========================================================

INSERT INTO alerta_monitoracao ( alerta_monitoracao_id, titulo, descricao, prioridade, origem, tipo_alerta_id, ativo_id, ativo_servico_id, inicio_date, fim_date, status, ciclo_vida_timestamp, contador_evento )

VALUES
(41, 'Alerta Fechado - Queda de Link (Catalyst 9200)', 'Link principal caiu, mas foi resolvido pela equipe de rede', 2, 'Monitoramento', 3, 1, 1, DATE_SUB(NOW(), INTERVAL 10 DAY), DATE_ADD(DATE_SUB(NOW(), INTERVAL 10 DAY), INTERVAL 2 HOUR), 6, NULL, 1),
(42, 'Alerta Fechado - CPU Alta (Catalyst 9200)', 'CPU chegou a 85%, mas processo de broadcast storm foi contido', 3, 'Monitoramento', 61, 1, 1, DATE_SUB(NOW(), INTERVAL 9 DAY), DATE_ADD(DATE_SUB(NOW(), INTERVAL 9 DAY), INTERVAL 2 HOUR), 6, NULL, 1),
(43, 'Alerta Fechado - Erro de Roteamento (Catalyst 9200)', 'Rota de backup falhava; ajuste de configuração resolveu', 2, 'Monitoramento', 5, 1, 1, DATE_SUB(NOW(), INTERVAL 8 DAY), DATE_ADD(DATE_SUB(NOW(), INTERVAL 8 DAY), INTERVAL 2 HOUR), 6, NULL, 1),
(44, 'Alerta Fechado - Memória Alta (Catalyst 9200)', 'Uso de memória acima de 90%, logs foram limpos e resolveu', 2, 'Monitoramento', 62, 1, 1, DATE_SUB(NOW(), INTERVAL 7 DAY), DATE_ADD(DATE_SUB(NOW(), INTERVAL 7 DAY), INTERVAL 2 HOUR), 6, NULL, 1),
(45, 'Alerta Fechado - Pacotes Perdidos (Catalyst 9200)', 'Perda de pacotes em G0/1; substituição de cabo resolveu', 1, 'Monitoramento', 2, 1, 1, DATE_SUB(NOW(), INTERVAL 6 DAY), DATE_ADD(DATE_SUB(NOW(), INTERVAL 6 DAY), INTERVAL 2 HOUR), 6, NULL, 1),

(46, 'Alerta Fechado - Queda de Link (HP Aruba 2930F)', 'Link VLAN trunk caiu, mas foi restaurado após verificação de porta', 2, 'Monitoramento', 3, 2, 2, DATE_SUB(NOW(), INTERVAL 10 DAY), DATE_ADD(DATE_SUB(NOW(), INTERVAL 10 DAY), INTERVAL 2 HOUR), 6, NULL, 1),
(47, 'Alerta Fechado - CPU Elevada (HP Aruba 2930F)', 'STP reconfigurado, CPU voltou ao normal', 3, 'Monitoramento', 61, 2, 2, DATE_SUB(NOW(), INTERVAL 9 DAY), DATE_ADD(DATE_SUB(NOW(), INTERVAL 9 DAY), INTERVAL 2 HOUR), 6, NULL, 1),
(48, 'Alerta Fechado - Memória Crítica (HP Aruba 2930F)', 'Liberação de logs antigos reduziu uso de memória', 2, 'Monitoramento', 62, 2, 2, DATE_SUB(NOW(), INTERVAL 8 DAY), DATE_ADD(DATE_SUB(NOW(), INTERVAL 8 DAY), INTERVAL 2 HOUR), 6, NULL, 1),
(49, 'Alerta Fechado - Erro de Roteamento (HP Aruba 2930F)', 'Rotas VLAN corrigidas, comunicação restabelecida', 3, 'Monitoramento', 5, 2, 2, DATE_SUB(NOW(), INTERVAL 7 DAY), DATE_ADD(DATE_SUB(NOW(), INTERVAL 7 DAY), INTERVAL 2 HOUR), 6, NULL, 1),
(50, 'Alerta Fechado - Perda de Pacotes (HP Aruba 2930F)', 'SFP substituído, perda de pacotes sanada', 1, 'Monitoramento', 2, 2, 2, DATE_SUB(NOW(), INTERVAL 6 DAY), DATE_ADD(DATE_SUB(NOW(), INTERVAL 6 DAY), INTERVAL 2 HOUR), 6, NULL, 1);

-- Inserindo 100 alertas intercalados ( abertos,  fechados)
INSERT INTO alerta_monitoracao (
  titulo,
  descricao,
  prioridade,
  origem,
  tipo_alerta_id,
  ativo_id,
  ativo_servico_id,
  inicio_date,
  fim_date,
  status,
  ciclo_vida_timestamp,
  contador_evento
)
VALUES
-- ================================
-- Alternando entre alertas Abertos (status=1) e Fechados (status=6 ou 7)
-- ================================
('Switch Cisco Catalyst 9200 - Queda de Link', 'Monitor detectou ausência de resposta ICMP no uplink G0/1', 2, 'Monitoramento', 3, 1, 1, DATE_SUB(NOW(), INTERVAL 30 DAY), NULL, 1, NULL, 1),
('Switch HP Aruba 2930F - Alta Latência', 'Latência acima de 250ms em VLAN 10', 1, 'Monitoramento', 2, 2, 2, DATE_SUB(NOW(), INTERVAL 29 DAY), DATE_ADD(DATE_SUB(NOW(), INTERVAL 29 DAY), INTERVAL 2 HOUR), 6, NULL, 1),
('Switch Cisco Catalyst 9200 - CPU Elevada', 'Uso de CPU em 85% devido a alto tráfego', 3, 'Monitoramento', 61, 1, 1, DATE_SUB(NOW(), INTERVAL 28 DAY), NULL, 1, NULL, 1),
('Switch HP Aruba 2930F - Erro de Roteamento', 'Rotas VLAN 20 e 30 com falha de comunicação', 2, 'Monitoramento', 5, 2, 2, DATE_SUB(NOW(), INTERVAL 27 DAY), DATE_ADD(DATE_SUB(NOW(), INTERVAL 27 DAY), INTERVAL 3 HOUR), 7, NULL, 1),
('Switch Cisco Catalyst 9200 - Perda de Pacotes', 'Interface Eth1/2 apresenta 12% de perda de pacotes', 1, 'Monitoramento', 2, 1, 1, DATE_SUB(NOW(), INTERVAL 26 DAY), NULL, 1, NULL, 1),

('Roteador MikroTik RB3011 - Queda de Link WAN', 'Sem resposta do provedor principal', 1, 'Monitoramento', 3, 3, 3, DATE_SUB(NOW(), INTERVAL 25 DAY), NULL, 1, NULL, 1),
('Roteador Cisco ISR 4321 - Erro de Roteamento', 'Anúncio BGP com falha para provedor externo', 2, 'Monitoramento', 5, 4, 4, DATE_SUB(NOW(), INTERVAL 24 DAY), DATE_ADD(DATE_SUB(NOW(), INTERVAL 24 DAY), INTERVAL 2 HOUR), 6, NULL, 1),
('Roteador MikroTik RB3011 - CPU Elevada', 'Processos de Firewall consumindo 95% da CPU', 3, 'Monitoramento', 61, 3, 3, DATE_SUB(NOW(), INTERVAL 23 DAY), NULL, 1, NULL, 1),
('Roteador Cisco ISR 4321 - Perda de Pacotes', 'Tráfego ICMP apresenta perda de 15%', 2, 'Monitoramento', 2, 4, 4, DATE_SUB(NOW(), INTERVAL 22 DAY), DATE_ADD(DATE_SUB(NOW(), INTERVAL 22 DAY), INTERVAL 1 HOUR), 7, NULL, 1),
('Roteador MikroTik RB3011 - Memória Alta', 'Uso de memória RAM atingiu 90%', 3, 'Monitoramento', 62, 3, 3, DATE_SUB(NOW(), INTERVAL 21 DAY), NULL, 1, NULL, 1),

('Firewall Palo Alto - Ataques Detectados', 'IPS bloqueou tentativa de exploração via SSH', 1, 'Firewall', 31, 5, 5, DATE_SUB(NOW(), INTERVAL 20 DAY), NULL, 1, NULL, 1),
('Firewall FortiGate - VPN Offline', 'Usuários sem acesso remoto à VPN', 2, 'Firewall', 34, 6, 6, DATE_SUB(NOW(), INTERVAL 19 DAY), DATE_ADD(DATE_SUB(NOW(), INTERVAL 19 DAY), INTERVAL 4 HOUR), 6, NULL, 1),
('Access Point Ubiquiti - Queda de Conexão', 'AP não responde a pings na rede wireless', 1, 'Monitoramento', 3, 7, 7, DATE_SUB(NOW(), INTERVAL 18 DAY), NULL, 1, NULL, 1),
('Switch Dell N2024 - Alta Memória', 'Uso de memória acima de 90%, risco de travamento', 2, 'Monitoramento', 62, 8, 8, DATE_SUB(NOW(), INTERVAL 17 DAY), DATE_ADD(DATE_SUB(NOW(), INTERVAL 17 DAY), INTERVAL 2 HOUR), 7, NULL, 1),
('Roteador MikroTik RB3011 - Queda de Link Secundário', 'Link backup caiu, operação na última rota disponível', 1, 'Monitoramento', 3, 3, 3, DATE_SUB(NOW(), INTERVAL 16 DAY), NULL, 1, NULL, 1),

-- Continuação até o alerta número 100, intercalando status

('Servidor Linux - Uso Alto de CPU', 'CPU a 95% devido a processos de log', 3, 'Monitoramento', 61, 9, 9, DATE_SUB(NOW(), INTERVAL 2 DAY), NULL, 1, NULL, 1),
('Banco de Dados MySQL - Conexões Saturadas', 'Múltiplos usuários enfrentam lentidão no acesso', 2, 'DB Monitor', 64, 10, 10, DATE_SUB(NOW(), INTERVAL 1 DAY), DATE_ADD(DATE_SUB(NOW(), INTERVAL 1 DAY), INTERVAL 5 HOUR), 6, NULL, 1),
('Servidor Windows - Serviços Parados', 'Vários serviços não iniciaram corretamente após reinicialização', 1, 'Monitoramento', 63, 11, 11, NOW(), NULL, 1, NULL, 1);

--------------------------------------------------------------------------------
-- 9) Tabela 'incidente_itsm'
-- Associamos cada incidente a um alerta, com status inicial Aberto (1), etc.  usado insert da tabela alerta
--------------------------------------------------------------------------------
-- 10) Tabela 'historico_status_alerta'
-- Normalmente preenchida automaticamente pelo trigger `trg_registrar_mudanca_status`
-- Reativar a checagem de FK
SET FOREIGN_KEY_CHECKS = 1;
