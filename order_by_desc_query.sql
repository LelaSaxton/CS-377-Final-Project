SELECT env.company_id, env.carbon_emissions, env.waste_recycled, fin.net_income
FROM environmental env
JOIN financials fin ON env.company_id = fin.company_id
ORDER BY env.carbon_emissions DESC;