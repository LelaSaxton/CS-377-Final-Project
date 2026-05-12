SELECT CONCAT_WS(':', company_id, CONCAT_WS('', year, controversey_score), UPPER(esg_risk_rating)) 
FROM risk;