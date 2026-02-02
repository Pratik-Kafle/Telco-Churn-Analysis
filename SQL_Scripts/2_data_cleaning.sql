SELECT * FROM raw_telco_churn
WHERE
	customerid IS NULL
	OR 
	gender IS NULL
	OR
	seniorcitizen IS NULL
	OR
	partner IS NULL
	OR
	tenure IS NULL
	OR
	phoneservice IS NULL
	OR
	multiplelines IS NULL
	OR
	internetservice IS NULL
	OR
	onlinesecurity IS NULL
	OR
	onlinebackup IS NULL
	OR
	deviceprotection IS NULL
	OR
	techsupport IS NULL
	OR
	streamingtv IS NULL
	OR
	streamingmovies IS NULL
	OR
	contract IS NULL
	OR
	paperlessbilling IS NULL
	OR
	paymentmethod IS NULL
	OR
	monthlycharges IS NULL
	OR
	churn IS NULL
;



/* STEP 1: Handle Missing Values 
The raw data contains ' ' (space)
We set these to NULL (or 0) so we can convert the column type.
*/

UPDATE raw_telco_churn
SET TotalCharges = NULL
WHERE TotalCharges = ' ';

/* STEP 2: Fix Data Types
Now that the bad text is gone, we convert the column to a decimal 
so we can sum/average it later.
*/

ALTER TABLE raw_telco_churn
ALTER COLUMN TotalCharges TYPE DECIMAL(10,2) 
USING TotalCharges::DECIMAL;


-- Verification: Check that if it worked
SELECT column_name, data_type 
FROM information_schema.columns 
WHERE table_name = 'raw_telco_churn' AND column_name = 'totalcharges';


