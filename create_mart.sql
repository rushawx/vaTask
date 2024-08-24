create table if not exists mart as 
with 
d as (
    select
        created_at::date as report_date,
        sum(amount) as amount_sum
    from deposits
    group by created_at::date
    order by created_at::date asc
),
w as (
    select
        created_at::date as report_date,
        sum(amount) as amount_sum
    from withdrawls
    group by created_at::date
    order by created_at::date asc
)
select 
    t.report_date::date as report_date,
    coalesce(sum(d.amount_sum), 0) as deposit_amount,
    coalesce(sum(w.amount_sum), 0) as withdrawl_amount,
    coalesce(sum(d.amount_sum), 0) - coalesce(sum(w.amount_sum), 0) as diff
from generate_series('2024-01-01'::date, '2024-12-31'::date, interval '1 day') as t (report_date)
    left join d as d on t.report_date = d.report_date
    left join w as w on t.report_date = w.report_date
group by t.report_date::date
order by t.report_date::date asc;