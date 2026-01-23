##틀림
SELECT 
    CASE 
        WHEN income < 20000 THEN 'Low Salary'
        WHEN income <= 50000 THEN 'Average Salary'
        ELSE 'High Salary'
    END AS category,
    COUNT(account_id) AS accounts_count
FROM Accounts
GROUP BY category;