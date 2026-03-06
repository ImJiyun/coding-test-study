-- https://school.programmers.co.kr/learn/courses/30/lessons/276035

SELECT
    id,
    email,
    first_name,
    last_name
FROM developers AS d
WHERE EXISTS (
    SELECT 1
    FROM skillcodes AS s
    WHERE
    category = "Front End"
    AND d.skill_code & s.code
)
ORDER BY
    id