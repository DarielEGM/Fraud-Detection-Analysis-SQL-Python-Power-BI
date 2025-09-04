/*Update payment_method column from values 'None' to 'NULL'*/
UPDATE transactions SET payment_method = NULL     
WHERE payment_method = 'None';

/*Cleaning of NULLS Values*/
DELETE FROM transactions 
WHERE customer_age IS NULL;


