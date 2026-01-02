-- 컬럼 : 게시글ID, 작성자ID, 게시글 제목, 가격, 거래상태
-- 테이블 : USED_GOODS_BOARD
-- 조건1 : 2022년 10월 5일에 등록
-- 조건2 : STATUS='SALE'이면 '판매중', RESERVED '예약중', DONE '거래완료'
-- 정렬 : 게시글ID 내림차순
SELECT
    BOARD_ID,
    WRITER_ID,
    TITLE,
    PRICE,
    CASE 
        WHEN STATUS='SALE' THEN '판매중'
        WHEN STATUS='RESERVED' THEN '예약중'
        ELSE '거래완료'
    END AS STATUS
FROM USED_GOODS_BOARD
WHERE CREATED_DATE = '2022-10-05'
GROUP BY
    BOARD_ID,
    WRITER_ID,
    TITLE,
    PRICE
ORDER BY BOARD_ID DESC