-- Verificar os dados inseridos
SELECT * FROM alerta_monitoracao ORDER BY inicio_date DESC LIMIT 10;

-- Número de alertas abertos vs. fechados
SELECT status, COUNT(*) AS total 
FROM alerta_monitoracao 
GROUP BY status;

-- Ativos com mais alertas
SELECT ativo_id, COUNT(*) AS total_alertas 
FROM alerta_monitoracao 
GROUP BY ativo_id 
ORDER BY total_alertas DESC;

-- validando  Views

SHOW FULL TABLES WHERE Table_type = 'VIEW';

SELECT * FROM vw_alertas_abertos LIMIT 10;

SELECT * FROM dependencia LIMIT 10;

SELECT * FROM sla_ativos LIMIT 10;

SELECT * FROM vw_alertas_abertos LIMIT 10;

SELECT COUNT(*) FROM alerta_monitoracao WHERE status = 1;

SELECT * FROM vw_alertas_por_cliente LIMIT 10;

SELECT * FROM vw_incidentes_abertos LIMIT 10;



