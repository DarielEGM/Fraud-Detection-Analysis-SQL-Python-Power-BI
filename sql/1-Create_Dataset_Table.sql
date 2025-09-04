CREATE TABLE public.transactions
(
    transaction_id VARCHAR(255) PRIMARY KEY,
    customer_id VARCHAR(255),
    transaction_date DATE,
    transaction_time TIME,
    customer_age INT,
    customer_loyalty_tier VARCHAR(50),
    location VARCHAR(255),
    store_id VARCHAR(255),
    product_sku VARCHAR(255),
    product_category VARCHAR(255),
    purchase_amount FLOAT,
    payment_method VARCHAR(50),
    device_type VARCHAR(50),
    ip_address VARCHAR(50),
    fraud_flag BOOLEAN,
    footfall_count INT
);