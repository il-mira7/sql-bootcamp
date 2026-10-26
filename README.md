# SQL Bootcamp — School 21

12 учебных проектов SQL Bootcamp [школы 21](https://21-school.ru): от базовых запросов до транзакций, индексов и основ Data Warehouse. Всего 100 задач, СУБД — PostgreSQL.

> Формулировки заданий — собственность школы, поэтому в репозитории только решения и мои краткие описания того, что делает каждое упражнение.

## Технологии и темы

- **PostgreSQL 16**, клиент `psql`
- базовые запросы: `SELECT`, фильтрация, сортировка, `CASE`, скалярные подзапросы, CTE
- множественные операции: `UNION` / `INTERSECT` / `EXCEPT` (включая `ALL`)
- соединения: `INNER`, `LEFT` / `RIGHT` / `FULL OUTER`, `CROSS`, `NATURAL`, self-join, anti-join
- DML: `INSERT` / `UPDATE` / `DELETE`, вставка через подзапросы и `INSERT … SELECT`
- представления: `VIEW`, `MATERIALIZED VIEW`, `REFRESH`
- индексы: B-tree, составные, функциональные, частичные, уникальные; проверка планов через `EXPLAIN ANALYZE`
- ограничения целостности: `PRIMARY KEY`, `FOREIGN KEY`, `CHECK`, `DEFAULT`; последовательности
- триггеры и функции на SQL и PL/pgSQL (аудит таблицы через `TG_OP`)
- транзакции и уровни изоляции: lost update, non-repeatable reads, phantom reads, deadlock
- агрегация и OLAP: `GROUP BY` / `HAVING`, оконные функции
- основы Data Warehouse: построение витрины балансов с пересчётом в USD по курсам на дату

## Проекты

| # | Проект | Темы | Задач |
|---|--------|------|:-----:|
| 01 | [Relational Model Basics](01_Relational_Model_Basics) | базовые `SELECT`, фильтры, подзапросы, CTE, `CASE` | 10 |
| 02 | [Set Operations and Subqueries](02_Set_Operations_and_Subqueries) | `UNION`/`INTERSECT`/`EXCEPT`, `CROSS`/`NATURAL JOIN`, `NOT IN` vs `NOT EXISTS` | 11 |
| 03 | [SQL Joins](03_SQL_Joins) | `LEFT`/`RIGHT`/`FULL OUTER JOIN`, `generate_series`, self-join | 11 |
| 04 | [DML and Joins](04_DML_and_Joins) | многотабличные выборки; `INSERT`/`UPDATE`/`DELETE` | 14 |
| 05 | [Views and Snapshots](05_Views_and_Snapshots) | `VIEW`, `MATERIALIZED VIEW`, `REFRESH` | 9 |
| 06 | [Traveling Salesman Problem](06_Traveling_Salesman_Problem) | рекурсивный CTE и массивы: задача коммивояжёра на SQL · _командный_ | 2 |
| 07 | [Database Indexes](07_Database_Indexes) | типы индексов, `EXPLAIN ANALYZE` | 7 |
| 08 | [Integrating Features](08_Integrating_Features) | новая таблица: `PK`/`FK`, `CHECK`, `DEFAULT`, `SEQUENCE`, комментарии | 7 |
| 09 | [OLAP Aggregations](09_OLAP_Aggregations) | `GROUP BY`/`HAVING`, агрегатные и оконные функции | 10 |
| 10 | [Isolation Levels](10_Isolation_Levels) | уровни изоляции и аномалии транзакций на двух сессиях | 8 |
| 11 | [Functions and Procedures](11_Functions_and_Procedures) | триггеры аудита, функции SQL и PL/pgSQL, `VARIADIC` | 9 |
| 12 | [Data Warehouse Fundamentals](12_Data_Warehouse_Fundamentals) | витрина балансов в USD, сопоставление курсов по времени · _командный_ | 2 |

## Запуск

Понадобится PostgreSQL. В каждом проекте схема и тестовые данные лежат в `materials/model.sql`:

```bash
createdb pizza
psql -d pizza -f 01_Relational_Model_Basics/materials/model.sql
psql -d pizza -f 01_Relational_Model_Basics/src/ex00/day00_ex00.sql
```

Некоторые упражнения меняют данные (`INSERT`/`UPDATE`/`DELETE`, триггеры) и рассчитаны на последовательное выполнение внутри своего проекта; исключение — 10_Isolation_Levels, где сценарии исполняются в двух параллельных сессиях psql.

## Структура

```
NN_Project_Name/
├── README.md      — описание проекта и упражнений
├── materials/     — схема и тестовые данные (модель БД)
└── src/exNN/      — решения
```
