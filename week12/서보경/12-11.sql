WITH first_gen AS (
    SELECT ID
    FROM ECOLI_DATA
    WHERE PARENT_ID IS NULL
),

second_gen AS (
    SELECT e.ID
    FROM ECOLI_DATA AS e
    JOIN first_gen AS f
    ON e.PARENT_ID = f.ID
),

third_gen AS (
    SELECT e.ID
    FROM ECOLI_DATA AS e
    JOIN second_gen AS s
    ON e.PARENT_ID = s.ID
)

SELECT
    ID
FROM third_gen
ORDER BY
    ID ASC;