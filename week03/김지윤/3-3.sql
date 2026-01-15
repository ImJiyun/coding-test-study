WITH fish_len_rank AS (
    SELECT
        *,
        RANK() OVER (PARTITION BY FISH_TYPE ORDER BY LENGTH DESC) AS len_rank
    FROM
        FISH_INFO  
)

SELECT
    flr.ID,
    fni.FISH_NAME,
    flr.LENGTH
FROM
    fish_len_rank AS flr
LEFT JOIN
    FISH_NAME_INFO AS fni
ON
    flr.FISH_TYPE = fni.FISH_TYPE
WHERE
    flr.len_rank = 1
ORDER BY
    flr.ID