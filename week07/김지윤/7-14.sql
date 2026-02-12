# LEFT JOIN으로 풀었더니 틀렸음
# 해당 레스토랑의 리뷰가 없는 경우 SCORE 집계가 NULL이 되기 때문에 문제 의도와 맞지 않는 것일지?

SELECT
    ri.REST_ID,
    ri.REST_NAME,
    ri.FOOD_TYPE,
    ri.FAVORITES,
    ri.ADDRESS,
    ROUND(AVG(rr.REVIEW_SCORE), 2) AS SCORE
FROM
    REST_INFO AS ri
JOIN
    REST_REVIEW AS rr
ON
    ri.REST_ID = rr.REST_ID
WHERE
    ADDRESS LIKE "서울%"
GROUP BY
    ri.REST_ID
ORDER BY
    SCORE DESC,
    FAVORITES DESC