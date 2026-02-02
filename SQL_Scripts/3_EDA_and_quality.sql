-- Checking for Data Consistency
-- Are there negative tenures or monthly charges?
SELECT count(*) as error_count 
FROM raw_telco_churn 
WHERE tenure < 0 OR MonthlyCharges < 0;

--  Customer Distribution by Contract Type
-- This tells us if the business is mostly Month-to-Month or Long-Term.
SELECT 
    Contract, 
    COUNT(*) as Count, 
    ROUND(COUNT(*) * 100.0 / (SELECT COUNT(*) FROM raw_telco_churn), 1) as Percentage
FROM raw_telco_churn
GROUP BY Contract
ORDER BY Count DESC;


-- Understanding the "Churn" Split
SELECT 
    Churn, 
    COUNT(*) as Count, 
    ROUND(COUNT(*) * 100.0 / (SELECT COUNT(*) FROM raw_telco_churn), 1) as Pct
FROM raw_telco_churn
GROUP BY Churn;