create table if not exists errors as 
with
calendar as (
select
	dt::date as date
from generate_series('2022-01-01'::date, '2022-12-31', interval '1 day') as t (dt)
),
data as (
select
	id,
	date,
	station,
	msg,
	row_number() over(partition by date, station order by id desc) as rn
from input
)
select
	id,
	c.date,
	station,
	msg,
	case
		when
			msg = 'fail' and
			lag(msg, 1, 'ok') over(partition by station order by c.date asc, id asc) = 'fail' and
			lag(msg, 2, 'ok') over(partition by station order by c.date asc, id asc) = 'fail'
		then 'critical'
		when
			msg = 'fail' and
			lag(msg, 1, 'ok') over(partition by station order by c.date asc, id asc) = 'fail'
		then 'serious'
		else 'new'
	end as status
from calendar as c	
left join data as i on c.date = i.date and i.rn = 1
where id is not null
order by station asc, date asc, id asc;
