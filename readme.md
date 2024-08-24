<b>Инструкция</b>:

<li> infra_up: поднять постгрес</li>
<li> infra_down: притушить постгрес</li>
<li> task_1_etl: запустить скрипт 1ой задачи</li>
<li> task_2_mart: запустить скирпт 2ой задачи</li>

Решение:

<li> Задача №1</li>
Решение см. скрипт etl.sh или запусти команду `make task_1_etl`
<li> Задача №2</li>
Решение см. скрипты mart.sh, init/init.sql или запусти команду `make task_2_mart`
<li> Задача №3</li>
Решение см. скрипт errors.sh или запусти команду `make task_3_errors`

* Обновление можно реализовать следующими способами:
<li> Написать хранимую процедуру, если достаточно смелости и отваги</li>
<li> Создать STG таблицу mart_stg, где будут храниться временные данные. Собирать ее за несколько дней. Удалять данные из mart за соответствующие несколько дней. Перезаливать данные из STG</li>
<li> Создать STG таблицу mart_stg, где будут храниться временные данные. Собирать ее за несколько дней. Затем запускать инструкцию [MERGE](https://www.postgresql.org/docs/current/sql-merge.html)</li>
<li> Развернуть DBT. Создать таблицу c моделью materialized "incremental"</li>
<li> Запускать какой-либо из вариантов выше с помощью Airflow</li>
