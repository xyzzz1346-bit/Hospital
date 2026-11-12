# Consultas SQL - Banco Hospitalar

Exercícios de SQL em **MySQL 8** sobre um banco de dados hospitalar. As 10 consultas usam funções de agregação (`SUM`, `AVG`, `COUNT`), `JOIN`, `GROUP BY` e filtros com `LIKE` e `IN`.

## Estrutura do repositório

| Arquivo | Descrição |
|---|---|
| `hospital_dump.sql` | Banco completo: cria o schema `hospital`, as 10 tabelas e os dados de teste |
| `hospital_<tabela>.sql` | Estrutura e dados de cada tabela, separadamente (opcional, redundante com o dump) |
| `consultas.sql` | As 10 consultas do exercício |
| `README.md` | Este arquivo |

## Modelo de dados

O banco `hospital` tem 10 tabelas:

| Tabela | Colunas principais | Relacionamentos |
|---|---|---|
| `paciente` | id_paciente, nome | - |
| `convenio` | id_convenio, nome | - |
| `especialidade` | id_especialidade, nome | - |
| `medico` | id_medico, nome, id_especialidade | -> especialidade |
| `consulta` | id_consulta, valor, status | -> paciente, medico, convenio |
| `tipo_quarto` | id_tipo_quarto, descricao | - |
| `quarto` | id_quarto | -> tipo_quarto |
| `internacao` | id_internacao, valor_diaria | -> paciente, convenio, quarto |
| `medicamento` | id_medicamento, nome | - |
| `prescricao` | id_prescricao, quantidade | -> consulta, medicamento |

## Como executar

### 1. Criar o banco

**MySQL Workbench:** Server > Data Import > Import from Self-Contained File, selecione `hospital_dump.sql` e clique em **Start Import**.

**Terminal:**

```bash
mysql -u root -p < hospital_dump.sql
```

> Atenção: o dump começa com `DROP DATABASE IF EXISTS hospital`, então recria o banco do zero e apaga o que existir com esse nome.

### 2. Rodar as consultas

1. Abra `consultas.sql` no Workbench.
2. Confirme que o schema `hospital` está ativo (em negrito no painel Schemas). O arquivo já começa com `USE hospital;`.
3. Execute tudo com **Ctrl + Shift + Enter**, ou uma consulta por vez com **Ctrl + Enter**.

### Importação por tabela (opcional)

Os arquivos `hospital_<tabela>.sql` recriam uma tabela isolada. Eles exigem que o banco `hospital` já exista e desativam a verificação de chaves estrangeiras durante a execução, para evitar erros de ordem.

## Consultas

| # | Objetivo | Filtro |
|---|---|---|
| 1 | Faturamento total de consultas por convênio | Convênios com "Saúde" no nome |
| 2 | Média do valor de consulta por especialidade | Especialidades de Cardiologia |
| 3 | Valor médio das diárias por tipo de quarto | Apartamento ou UTI |
| 4 | Total de consultas por médico | Status Realizada ou Finalizada |
| 5 | Soma de diárias por paciente | Sobrenome "Silva" |
| 6 | Contagem de prescrições por status da consulta | Dipirona ou Paracetamol |
| 7 | Média de valor por convênio e especialidade | Convênios com "Unimed" |
| 8 | Média de diária por convênio | Quartos de UTI |
| 9 | Itens prescritos por médico | Consultas "Realizada" |
| 10 | Soma e média de consultas por paciente | Nome começa com "M" |

## Resultados esperados

Com os dados de teste do dump, as consultas devem retornar:

| # | Resultado |
|---|---|
| 1 | Unimed Saúde: 480,00 / Bradesco Saúde: 570,00 |
| 2 | Cardiologia: 323,33 / Cardiologia Pediátrica: 280,00 |
| 3 | Apartamento: 800,00 / UTI: 2550,00 |
| 4 | Dr. Carlos Almeida: 970,00 / Dra. Paula Mendes: 280,00 / Dra. Fernanda Costa: 330,00 |
| 5 | Maria Silva: 800,00 / João Silva: 5200,00 (Silvana Rocha fica de fora) |
| 6 | Realizada: 5 / Finalizada: 1 |
| 7 | 5 linhas (convênio x especialidade), com médias de 180,00 a 320,00 |
| 8 | Unimed Saúde: 2400,00 / Bradesco Saúde: 2600,00 / Unimed Paulista: 2600,00 |
| 9 | Dr. Carlos Almeida: 4 / Dra. Paula Mendes: 1 / Dra. Fernanda Costa: 1 |
| 10 | Maria Silva: 480,00 (média 240,00) / Marcos Souza: 500,00 (média 250,00) / Mariana Lima: 520,00 (média 260,00) |

## Observações

- Os dados são **fictícios**, criados apenas para teste.
- O item 5 usa `CONCAT(' ', nome, ' ') LIKE '% Silva %'` para casar "Silva" como palavra inteira, sem pegar "Silvana".
- As consultas agrupam também pelo `id`, o que evita erro com `ONLY_FULL_GROUP_BY` (padrão do MySQL 8) e a mistura de homônimos.
- A tabela `internacao` guarda o valor da diária, sem coluna de quantidade de dias. Os totais dos itens 5 e 8 refletem isso.

## Tecnologias

- MySQL 8.0
- MySQL Workbench
