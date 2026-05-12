SELECT env.company_id, AVG(env.carbon_emissions) AS avg_carbon_emissions,
AVG(fin.net_income) AS avg_margin
FROM environmental env
JOIN financials fin ON env.company_id = fin.company_id
GROUP BY env.company_id
HAVING AVG(env.carbon_emissions) > 80;