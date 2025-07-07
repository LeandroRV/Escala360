-- 1. Profissionais com ≥ 40h na semana atual
SELECT 
  p.id, 
  p.nome, 
  ROUND(SUM(EXTRACT(EPOCH FROM (pl.hora_fim - pl.hora_inicio)) / 3600), 2) AS horas_semanais
FROM profissionais p
JOIN escalas e ON p.id = e.id_profissional
JOIN plantoes pl ON e.id_plantao = pl.id
WHERE date_trunc('week', pl.data) = date_trunc('week', CURRENT_DATE)
GROUP BY p.id, p.nome
HAVING SUM(EXTRACT(EPOCH FROM (pl.hora_fim - pl.hora_inicio)) / 3600) >= 40
ORDER BY horas_semanais DESC;

-- 2. Plantões sem alocação nas próximas 48h
SELECT pl.*
FROM plantoes pl
LEFT JOIN escalas e ON pl.id = e.id_plantao
WHERE pl.data >= NOW()
  AND pl.data <= NOW() + INTERVAL '48 hours'
  AND e.id IS NULL
ORDER BY pl.data, pl.hora_inicio;

-- 3. Substituições pendentes
SELECT 
  id, 
  id_escala_original, 
  id_profissional_solicitante, 
  id_profissional_substituto, 
  data_solicitacao
FROM substituicoes
WHERE status = 'pendente'
ORDER BY data_solicitacao DESC;
