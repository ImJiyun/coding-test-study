WITH more_than_1_places AS (
    SELECT
        HOST_ID
    FROM
        PLACES
    GROUP BY
        HOST_ID
    HAVING
        COUNT(*) > 1
) 

SELECT
    *
FROM
    PLACES
WHERE
    HOST_ID IN (
        SELECT
            HOST_ID
        FROM
            more_than_1_places
    )