# Consultas SQL - Banco Hospitalar

Exercícios de SQL (MySQL 8) com agregações (SUM, AVG, COUNT), JOINs, GROUP BY e filtros LIKE/IN.

## Estrutura
- `banco/hospital_dump.sql`: cria o banco `hospital`, as tabelas e os dados de teste.
- `consultas/consultas.sql`: as 10 consultas solicitadas.

## Como usar
1. Importe o dump: no MySQL Workbench, Server > Data Import > Import from Self-Contained File.
   Ou pelo terminal: `mysql -u root -p < banco/hospital_dump.sql`
2. Abra `consultas/consultas.sql`, confirme que o banco `hospital` está ativo e execute.

## Modelo
paciente, convenio, especialidade, medico, consulta, tipo_quarto, quarto, internacao, medicamento, prescricao.
