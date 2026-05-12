SELECT company_id, SUM(female_board) 
FROM governance
GROUP BY company_id;