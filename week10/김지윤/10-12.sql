SELECT
    hg.EMP_NO,
    hr.EMP_NAME,
    
    CASE 
        WHEN AVG(hg.SCORE) >= 96 THEN 'S'
        WHEN AVG(hg.SCORE) >= 90 THEN 'A'
        WHEN AVG(hg.SCORE) >= 80 THEN 'B'
        ELSE 'C'
    END AS GRADE,
    
    CASE 
        WHEN AVG(hg.SCORE) >= 96 THEN SAL * 0.2
        WHEN AVG(hg.SCORE) >= 90 THEN SAL * 0.15
        WHEN AVG(hg.SCORE) >= 80 THEN SAL * 0.1
        ELSE 0
    END AS BONUS
FROM
    HR_GRADE AS hg
LEFT JOIN
    HR_EMPLOYEES AS hr
ON
    hg.EMP_NO = hr.EMP_NO
GROUP BY
    hg.EMP_NO,
    hr.EMP_NAME
ORDER BY
    hg.EMP_NO