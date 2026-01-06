select
    extract(year from o.sales_date) as YEAR,
    extract(month from o.sales_date) as MONTH,
    u.gender as GENDER,
    count(distinct(user_id)) as USER
from online_sale as o
left join user_info as u
using (user_id)
where u.gender is not null
group by
    year,
    month,
    gender
order by
    year,
    month,
    gender