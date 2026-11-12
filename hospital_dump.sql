USE hospital;

-- 1. Faturamento total de consultas por convênio ("Saúde" no nome)
SELECT cv.id_convenio,
       cv.nome AS convenio,
       SUM(c.valor) AS faturamento_total
FROM consulta c
JOIN convenio cv ON cv.id_convenio = c.id_convenio
WHERE cv.nome LIKE '%Saúde%'
GROUP BY cv.id_convenio, cv.nome;

-- 2. Média do valor de consulta por especialidade (Cardiologia)
SELECT e.id_especialidade,
       e.nome AS especialidade,
       ROUND(AVG(c.valor), 2) AS media_valor
FROM consulta c
JOIN medico m ON m.id_medico = c.id_medico
JOIN especialidade e ON e.id_especialidade = m.id_especialidade
WHERE e.nome LIKE '%Cardiologia%'
GROUP BY e.id_especialidade, e.nome;

-- 3. Valor médio das diárias por tipo de quarto (Apartamento ou UTI)
SELECT tq.id_tipo_quarto,
       tq.descricao AS tipo_quarto,
       ROUND(AVG(i.valor_diaria), 2) AS media_diaria
FROM internacao i
JOIN quarto q ON q.id_quarto = i.id_quarto
JOIN tipo_quarto tq ON tq.id_tipo_quarto = q.id_tipo_quarto
WHERE tq.descricao IN ('Apartamento', 'UTI')
GROUP BY tq.id_tipo_quarto, tq.descricao;

-- 4. Total de consultas por médico (Realizada ou Finalizada)
SELECT m.id_medico,
       m.nome AS medico,
       SUM(c.valor) AS total_consultas
FROM consulta c
JOIN medico m ON m.id_medico = c.id_medico
WHERE c.status IN ('Realizada', 'Finalizada')
GROUP BY m.id_medico, m.nome;

-- 5. Soma de diárias por paciente com sobrenome "Silva"
SELECT p.id_paciente,
       p.nome AS paciente,
       SUM(i.valor_diaria) AS total_diarias
FROM internacao i
JOIN paciente p ON p.id_paciente = i.id_paciente
WHERE CONCAT(' ', p.nome, ' ') LIKE '% Silva %'
GROUP BY p.id_paciente, p.nome;

-- 6. Prescrições por status da consulta (Dipirona ou Paracetamol)
SELECT c.status AS status_consulta,
       COUNT(pr.id_prescricao) AS qtd_prescricoes
FROM prescricao pr
JOIN consulta c ON c.id_consulta = pr.id_consulta
JOIN medicamento md ON md.id_medicamento = pr.id_medicamento
WHERE md.nome LIKE '%Dipirona%'
   OR md.nome LIKE '%Paracetamol%'
GROUP BY c.status;

-- 7. Média de valor por convênio ("Unimed") e especialidade
SELECT cv.id_convenio,
       cv.nome AS convenio,
       e.id_especialidade,
       e.nome AS especialidade,
       ROUND(AVG(c.valor), 2) AS media_valor
FROM consulta c
JOIN convenio cv ON cv.id_convenio = c.id_convenio
JOIN medico m ON m.id_medico = c.id_medico
JOIN especialidade e ON e.id_especialidade = m.id_especialidade
WHERE cv.nome LIKE '%Unimed%'
GROUP BY cv.id_convenio, cv.nome, e.id_especialidade, e.nome;

-- 8. Média de diária de internação por convênio em quartos de UTI
SELECT cv.id_convenio,
       cv.nome AS convenio,
       ROUND(AVG(i.valor_diaria), 2) AS media_diaria
FROM internacao i
JOIN convenio cv ON cv.id_convenio = i.id_convenio
JOIN quarto q ON q.id_quarto = i.id_quarto
JOIN tipo_quarto tq ON tq.id_tipo_quarto = q.id_tipo_quarto
WHERE tq.descricao = 'UTI'
GROUP BY cv.id_convenio, cv.nome;

-- 9. Itens prescritos por médico em consultas "Realizada"
SELECT m.id_medico,
       m.nome AS medico,
       COUNT(pr.id_prescricao) AS total_itens
FROM prescricao pr
JOIN consulta c ON c.id_consulta = pr.id_consulta
JOIN medico m ON m.id_medico = c.id_medico
WHERE c.status = 'Realizada'
GROUP BY m.id_medico, m.nome;

-- 10. Soma e média de consultas por paciente (nome começa com "M")
SELECT p.id_paciente,
       p.nome AS paciente,
       SUM(c.valor) AS total_gasto,
       ROUND(AVG(c.valor), 2) AS media_gasto
FROM consulta c
JOIN paciente p ON p.id_paciente = c.id_paciente
WHERE p.nome LIKE 'M%'
GROUP BY p.id_paciente, p.nome;
