-- 코드를 작성해주세요
# 평균 길이가 33cm 이상인 물고기 대상
# 10cm이하의 물고기들은 10cm로 취급하여 평균 길이를 구하기
# 첫 시도 : LENGTH IS NULL 없었음
# WITH longer_than_33 AS (
#     SELECT
#         FISH_TYPE
#     FROM
#         FISH_INFO
#     GROUP BY
#         FISH_TYPE
#     HAVING  
#         AVG(LENGTH) >= 33
# )

# SELECT
#     COUNT(FISH_TYPE) AS FISH_COUNT,
#     MAX(LENGTH) AS MAX_LENGTH,
#     FISH_TYPE
# FROM
#     FISH_INFO
# WHERE
#     FISH_TYPE IN (
#         SELECT
#             *
#         FROM
#             longer_than_33
#     )
# GROUP BY
#     FISH_TYPE

# ORDER BY 안 붙였더니 오답 나왔음
WITH not_null_table AS(
    SELECT
        FISH_TYPE,
        IF(LENGTH IS NULL, 10, LENGTH) AS LENGTH
    FROM
        FISH_INFO
)

SELECT
    COUNT(FISH_TYPE) AS FISH_COUNT,
    MAX(LENGTH) AS MAX_LENGTH,
    FISH_TYPE
FROM
    not_null_table
GROUP BY
    FISH_TYPE
HAVING
    AVG(LENGTH) >= 33
ORDER BY
    FISH_TYPE