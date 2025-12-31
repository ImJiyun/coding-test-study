select
    NAME,
    IN_ as DATETIME
from (
    SELECT
        animal_id,
        i.datetime as in_,
        o.datetime as out_,
        i.name as name
    from animal_ins as I
    left join animal_outs as O
    using (animal_id)
) as base
where out_ is null
order by
    in_
limit 3