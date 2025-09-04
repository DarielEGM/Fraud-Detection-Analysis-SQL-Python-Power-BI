COPY transactions
FROM 'D:\DATA ANALITICS\Projects_Data_analyst\PAYMENT_CARD_FRAUD_DETECTION_2025(SQL,PYTHON,POWER_BI)\data\dataset\luxury_cosmetics_fraud_analysis_2025.csv'
WITH (FORMAT csv, HEADER true, DELIMITER ',', ENCODING 'UTF8');
