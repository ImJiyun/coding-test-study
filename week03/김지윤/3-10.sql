# fav_rank_table: FOOD_TYPE별 FAVORITES가 많은 순으로 순위 매기기
# WHERE 조건에서 fav_rank = 1인 경우만 필터링
# FOOD_TYPE DESC로 내림차순 정렬
WITH fav_rank_table AS (
    SELECT
        *,
        RANK() OVER (PARTITION BY FOOD_TYPE ORDER BY FAVORITES DESC) AS fav_rank
    FROM
        REST_INFO 
)

SELECT
    FOOD_TYPE,
    REST_ID,
    REST_NAME,
    FAVORITES
FROM
    fav_rank_table
WHERE
    fav_rank = 1
ORDER BY
    FOOD_TYPE DESC