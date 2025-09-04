/*
Check whether the dataset copy was successful by verifying values ​
​such as the number of records, fraudulent and non-fraudulent transactions, 
payment method types, etc.
*/

/*Number of rows*/
SELECT COUNT(*) 
FROM transactions;

/*Counting fraudulent and non-fraudulent transactions*/
SELECT fraud_flag, COUNT(*) 
FROM transactions 
GROUP BY fraud_flag;

/*Number of Null values in "customer_age" column*/
SELECT COUNT(*)  AS customer_age_nulls
FROM transactions 
WHERE customer_age IS NULL;

/*Number of Null values in "payment_method" column*/
SELECT DISTINCT payment_method      
FROM transactions;

SELECT payment_method,COUNT(*) AS count_payment_method
FROM transactions 
GROUP BY payment_method
ORDER BY count_payment_method;

/*Number of Null values in "customer_loyalty_tier" column*/
SELECT DISTINCT customer_loyalty_tier       
FROM transactions;

SELECT customer_loyalty_tier, COUNT(*) AS count_customer_loyalty_tier
FROM transactions 
GROUP BY customer_loyalty_tier
ORDER BY count_customer_loyalty_tier;

/*Values of purchase_amount column between $50 and $300*/
SELECT COUNT(*) 
FROM transactions 
WHERE purchase_amount BETWEEN 50 AND 300;

/*Values of footfall_count column between 50 and 500*/
SELECT COUNT(*) 
FROM transactions 
WHERE purchase_amount BETWEEN 50 AND 500;

/*Number of Unique values in product_category column*/
SELECT COUNT(DISTINCT product_category) 
FROM transactions;

/*Number of Unique values in device_type column*/
SELECT COUNT(DISTINCT device_type) 
FROM transactions;