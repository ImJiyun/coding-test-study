# https://school.programmers.co.kr/learn/courses/30/lessons/59045

SELECT
    o.animal_id,
    o.animal_type,
    o.name
FROM animal_outs as o
left join animal_ins as i
USING (animal_id)
WHERE o.sex_upon_outcome IN ('Spayed Female', 'Neutered Male') AND i.sex_upon_intake IN ('Intact Male', 'Intact Female')