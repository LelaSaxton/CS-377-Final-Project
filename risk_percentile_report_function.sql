CREATE OR REPLACE FUNCTION create_risk_percentile_report()
RETURNS TABLE(
	company_id VARCHAR,
	risk_rating VARCHAR,
	controversey_score NUMERIC,
	annual_return NUMERIC,
	controversey_percentile NUMERIC )
AS $$
BEGIN
RETURN QUERY 
-- CTE function that consolidates the data stored in all 7 tables
WITH combined_data AS (SELECT 
	r.company_id, 
	r.esg_risk_rating, 
	r.controversey_score, 
	sp.annual_return
FROM risk r
	LEFT JOIN financials f ON r.company_id = f.company_id
	LEFT JOIN environmental env ON r.company_id = env.company_id
	LEFT JOIN esg_scores e ON r.company_id = e.company_id
	LEFT JOIN social s ON r.company_id = s.company_id
	LEFT JOIN governance g ON r.company_id = g.company_id
	LEFT JOIN stock_performance sp ON r.company_id = sp.company_id)
-- Main query that uses window function to calculate 
--and get percentiles within specific risk ratings
	SELECT 
	cd.company_id, 
	cd.esg_risk_rating, 
	cd.controversey_score, 
	cd.annual_return,
ROUND(
	(PERCENT_RANK() OVER (
		PARTITION BY cd.esg_risk_rating
		ORDER BY cd.controversey_score ASC
	)) :: NUMERIC * 100, 2
) AS controversey_percentile
FROM combined_data cd;
END;
$$ LANGUAGE plpgsql;