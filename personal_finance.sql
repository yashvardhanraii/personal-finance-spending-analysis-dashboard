CREATE DATABASE personal_finance;
SHOW DATABASES;

USE personal_finance;
SHOW TABLES;

CREATE TABLE transactions (
    id INT AUTO_INCREMENT PRIMARY KEY,
    date DATE,
    description VARCHAR(255),
    category VARCHAR(100),
    amount DECIMAL(10,2)
);

DESCRIBE transactions;
SELECT * FROM transactions LIMIT 10;

-- YEAR VIEW FOR SLICER
CREATE OR REPLACE VIEW year_dim AS
SELECT DISTINCT
    YEAR(date) AS year
FROM transactions
ORDER BY year;

SHOW FULL TABLES;

-- TOTAL SPEND BY CATEGORY
CREATE OR REPLACE VIEW category_spending AS
SELECT
    YEAR(date) AS year,
    category,
    ROUND(SUM(-amount), 2) AS total_spent
FROM transactions
GROUP BY YEAR(date), category
ORDER BY year, total_spent DESC;

SHOW FULL TABLES;

-- TOTAL SPEND BY MONTH
CREATE OR REPLACE VIEW monthly_spending AS
SELECT
    YEAR(date) AS year,
    MONTH(date) AS month,
    ROUND(SUM(-amount), 2) AS total_spent
FROM transactions
GROUP BY YEAR(date), MONTH(date)
ORDER BY year, month;

SHOW FULL TABLES;

-- TOTAL SPENDING BY MERCHANTS
CREATE OR REPLACE VIEW merchant_spending AS
SELECT
    YEAR(date) AS year,
    description,
    ROUND(SUM(-amount), 2) AS total_spent
FROM transactions
GROUP BY YEAR(date), description
ORDER BY year, total_spent DESC;

SHOW FULL TABLES;

-- CATEGORY SHARE OF MONTHLY SPEND
CREATE OR REPLACE VIEW category_merchant_spending AS
SELECT
    year,
    month,
    category,
    total_spent,
    ROUND(
        total_spent / SUM(total_spent) OVER (PARTITION BY year, month) * 100,
        2
    ) AS pct_of_month_spend
FROM (
    SELECT
        YEAR(date) AS year,
        MONTH(date) AS month,
        category,
        SUM(-amount) AS total_spent
    FROM transactions
    GROUP BY YEAR(date), MONTH(date), category
) t
ORDER BY year, month, pct_of_month_spend DESC;