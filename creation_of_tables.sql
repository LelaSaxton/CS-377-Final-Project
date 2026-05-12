CREATE TABLE stock_performance(
company_ID VARCHAR(10),
year INT CHECK(year >= 2015 AND year <= 2025),
stock_price_start NUMERIC,
stock_price_end NUMERIC,
annual_return NUMERIC,
market_cap NUMERIC
);

CREATE TABLE environmental (
company_id VARCHAR(10),
year INT CHECK(year >= 2015 AND year <= 2025),
carbon_emissions NUMERIC,
energy_use NUMERIC,
waste_recycled NUMERIC
);

CREATE TABLE esg_scores(
company_id VARCHAR(10),
year INT CHECK(year >= 2015 AND year <= 2025),
environmetal_score NUMERIC,
social_score NUMERIC,
governance_score NUMERIC,
esg_score NUMERIC
);

CREATE TABLE financials(
company_id VARCHAR(10),
year INT CHECK(year >= 2015 AND year <= 2025),
revenue NUMERIC,
net_income NUMERIC,
ROA NUMERIC,
ROE NUMERIC
);

CREATE TABLE governance(
company_id VARCHAR(10),
year INT CHECK(year >= 2015 AND year <= 2025),
board_independence NUMERIC,
female_board NUMERIC,
exec_comp_to_revenue NUMERIC
);

CREATE TABLE risk(
company_id VARCHAR(10),
year INT CHECK(year >= 2015 AND year <= 2025),
controversey_score NUMERIC,
regulatory_fines NUMERIC,
esg_risk_rating VARCHAR(50)
);