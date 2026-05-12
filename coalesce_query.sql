SELECT
COALESCE(company_id),
AVG(carbon_emissions) AS avg_carbon_emissions
FROM env_imp_on_prof
GROUP BY(company_id)
ORDER BY AVG(carbon_emissions);