select
    report_date,
    deposit_amount,
    withdrawl_amount,
    diff
from mart
where (deposit_amount <> 0 or withdrawl_amount <> 0 or diff <> 0);