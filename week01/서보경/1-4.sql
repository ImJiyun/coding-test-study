SELECT
    student,
    CASE
## CASE types boolean and integer cannot be matched
        WHEN id%2 = 0 THEN id-1
        WHEN id = 1 THEN id+1
        WHEN id%2 = 1 THEN id+1
        ELSE id = 5
        END AS id
FROM Seat
ORDER BY id ASC