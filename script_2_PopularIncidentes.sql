INSERT INTO incidente_itsm (
  incidente_itsm_id,
  alerta_monitoracao_id,
  ativo_id,
  ativo_servico_id,
  sla_id,
  inicio_incidente_date,
  fim_incidente_date,
  status
)
SELECT 
  alerta_monitoracao_id,  -- ID do incidente será o mesmo do alerta
  alerta_monitoracao_id,
  ativo_id,
  ativo_servico_id,
  1,                     -- SLA fixo (mude se necessário)
  inicio_date,
  fim_date,
  status
FROM alerta_monitoracao;
