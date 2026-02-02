-- Creating View so we can use it to visualize in Power BI
CREATE VIEW v_churn_analysis AS
SELECT 
    customerID,
    gender,
	Partner,
	Dependents,
	SeniorCitizen,
    tenure,
    Contract,
    PaymentMethod,
    MonthlyCharges,
    TotalCharges,
    Churn,
    InternetService,
	TechSupport,
	OnlineSecurity,
    
    -- SEGMENT 1: Tenure Buckets (New vs Loyal)
    CASE 
        WHEN tenure <= 12 THEN '0-1 Year (New)'
        WHEN tenure <= 24 THEN '1-2 Years'
        WHEN tenure <= 48 THEN '2-4 Years'
        ELSE '4+ Years (Loyal)'
    END AS Tenure_Group,
    
    -- SEGMENT 2: High Value Customers
    CASE 
        WHEN MonthlyCharges >= 70 THEN 'High Value'
        ELSE 'Standard'
    END AS Customer_Value,

    -- SEGMENT 3: Risk Factor (Combining Short Term + High Cost)
    CASE 
        WHEN Contract = 'Month-to-month' AND MonthlyCharges > 70 THEN 'High Risk'
        ELSE 'Normal Risk'
    END AS Risk_Category
FROM raw_telco_churn;

SELECT * FROM v_churn_analysis;
                           
SELECT risk_category,COUNT(*) FROM v_churn_analysis
GROUP BY risk_category;