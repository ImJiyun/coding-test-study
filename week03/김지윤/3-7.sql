# GROUP BY + AVG 이용한 부서별 평균 연봉 구하기
# JOIN으로 두 테이블 연결 (DEPT_ID)
# DEPT_ID, DEPT_NAME_EN로 GROUP BY
# AVG으로 평균 연봉 구한 후 ROUND로 소수 첫째점 자리에서 반올림 처리
SELECT
    hd.DEPT_ID,
    hd.DEPT_NAME_EN,
    ROUND(AVG(he.SAL), 0) AS AVG_SAL
FROM
    HR_DEPARTMENT AS hd
JOIN
    HR_EMPLOYEES AS he
ON
    hd.DEPT_ID = he.DEPT_ID
GROUP BY
    hd.DEPT_ID,
    hd.DEPT_NAME_EN
ORDER BY
    AVG_SAL DESC