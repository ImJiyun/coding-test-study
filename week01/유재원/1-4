select
    case
        when id%2 = 1 and count(id)=id then id
        when id%2 =1 then id+1
        else id
    end as id,
    student
from seat
group by
    id,student
order by
    id