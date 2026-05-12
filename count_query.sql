SELECT company_id, COUNT(esg_score) 
FROM esg_scores
GROUP BY company_id;