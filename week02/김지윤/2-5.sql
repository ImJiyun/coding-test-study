-- 코드를 입력하세요
# 년, 월, 성별 별 상품 구매 회원 수 구하기
# 성별 정보가 없는 경우 결과에서 제외: GENDER IS NOT NULL
# COUNT(*)로 구했더니 오류
# JOIN후 생기는 중복 USER_ID를 DISTINCT로 제거
SELECT
    YEAR(os.SALES_DATE) AS YEAR,
    MONTH(os.SALES_DATE) AS MONTH,
    ui.GENDER AS GENDER,
    COUNT(DISTINCT os.USER_ID) AS USERS
FROM
    ONLINE_SALE AS os
LEFT JOIN
    USER_INFO AS ui
ON 
    ui.USER_ID = os.USER_ID
WHERE
    ui.GENDER IS NOT NULL
GROUP BY
    YEAR,
    MONTH,
    GENDER
ORDER BY
    YEAR,
    MONTH,
    GENDER