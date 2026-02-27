CREATE DATABASE banking_project;
USE banking_project;
CREATE TABLE bank_raw (
    age INT,
    job VARCHAR(50),
    marital VARCHAR(20),
    education VARCHAR(30),
    default_status VARCHAR(10),
    balance INT,
    housing VARCHAR(10),
    personal_loan VARCHAR(10),
    contact VARCHAR(20),
    day INT,
    month VARCHAR(10),
    duration INT,
    campaign INT,
    pdays INT,
    previous INT,
    poutcome VARCHAR(20),
    deposit VARCHAR(10)
);
DROP TABLE bank_raw;
CREATE TABLE bank_raw (
    age VARCHAR(10),
    job VARCHAR(50),
    marital VARCHAR(20),
    education VARCHAR(30),
    default_status VARCHAR(10),
    balance VARCHAR(20),
    housing VARCHAR(10),
    personal_loan VARCHAR(10),
    contact VARCHAR(20),
    day VARCHAR(10),
    month VARCHAR(10),
    duration VARCHAR(20),
    campaign VARCHAR(10),
    pdays VARCHAR(10),
    previous VARCHAR(10),
    poutcome VARCHAR(20),
    deposit VARCHAR(10)
);
SELECT COUNT(*) FROM bank_clean;
USE banking_project;
SELECT COUNT(*) FROM bank_clean;
SELECT 
    deposit,
    COUNT(*) AS total_customers,
    ROUND(COUNT(*) * 100.0 / (SELECT COUNT(*) FROM bank_clean), 2) AS percentage
FROM bank_clean
GROUP BY deposit;
DESCRIBE bank_clean;
SELECT 
    y,
    COUNT(*) AS total_customers,
    ROUND(COUNT(*) * 100.0 / (SELECT COUNT(*) FROM bank_clean), 2) AS percentage
FROM bank_clean
GROUP BY y;
SELECT 
    y,
    ROUND(AVG(balance),2) AS avg_balance
FROM bank_clean
GROUP BY y;
SELECT 
    CASE 
        WHEN balance < 0 THEN 'Negative'
        WHEN balance BETWEEN 0 AND 1000 THEN 'Low'
        WHEN balance BETWEEN 1001 AND 5000 THEN 'Medium'
        ELSE 'High'
    END AS balance_category,
    
    COUNT(*) AS total_customers,
    
    SUM(CASE WHEN y = 'yes' THEN 1 ELSE 0 END) AS deposit_yes,
    
    ROUND(
        SUM(CASE WHEN y = 'yes' THEN 1 ELSE 0 END) * 100.0 
        / COUNT(*), 
        2
    ) AS conversion_rate
    
FROM bank_clean
GROUP BY balance_category
ORDER BY conversion_rate DESC;
SELECT 
    campaign,
    COUNT(*) AS total_customers,
    SUM(CASE WHEN y = 'yes' THEN 1 ELSE 0 END) AS deposit_yes,
    ROUND(
        SUM(CASE WHEN y = 'yes' THEN 1 ELSE 0 END) * 100.0 / COUNT(*),
        2
    ) AS conversion_rate
FROM bank_clean
GROUP BY campaign
ORDER BY campaign
LIMIT 10;
SELECT 
    education,
    COUNT(*) AS total_customers,
    SUM(CASE WHEN y = 'yes' THEN 1 ELSE 0 END) AS deposit_yes,
    ROUND(
        SUM(CASE WHEN y = 'yes' THEN 1 ELSE 0 END) * 100.0 / COUNT(*),
        2
    ) AS conversion_rate
FROM bank_clean
GROUP BY education
ORDER BY conversion_rate DESC;
SELECT 
    education,
    
    CASE 
        WHEN balance < 0 THEN 'Negative'
        WHEN balance BETWEEN 0 AND 1000 THEN 'Low'
        WHEN balance BETWEEN 1001 AND 5000 THEN 'Medium'
        ELSE 'High'
    END AS balance_category,
    
    COUNT(*) AS total_customers,
    
    SUM(CASE WHEN y = 'yes' THEN 1 ELSE 0 END) AS deposit_yes,
    
    ROUND(
        SUM(CASE WHEN y = 'yes' THEN 1 ELSE 0 END) * 100.0 / COUNT(*),
        2
    ) AS conversion_rate
    
FROM bank_clean
GROUP BY education, balance_category
ORDER BY conversion_rate DESC
LIMIT 15;
SELECT 
    campaign,
    COUNT(*) AS total_customers,
    SUM(CASE WHEN y = 'yes' THEN 1 ELSE 0 END) AS deposit_yes,
    ROUND(
        SUM(CASE WHEN y = 'yes' THEN 1 ELSE 0 END) * 100.0 / COUNT(*),
        2
    ) AS conversion_rate
FROM bank_clean
GROUP BY campaign
ORDER BY campaign
LIMIT 15;

