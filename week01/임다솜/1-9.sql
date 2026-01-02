-- https://school.programmers.co.kr/learn/courses/30/lessons/59042

SELECT
    outs.ANIMAL_ID AS ANIMAL_ID,
    outs.NAME AS NAME
FROM ANIMAL_OUTS AS outs
LEFT JOIN ANIMAL_INS AS ins
ON outs.ANIMAL_ID = ins.ANIMAL_ID
WHERE
    ins.ANIMAL_ID is NULL
ORDER BY
    outs.ANIMAL_ID