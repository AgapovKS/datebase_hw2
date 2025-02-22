-- 1 задание
SELECT DISTINCT t.brand 
FROM hw.transaction t  
WHERE standard_cost > '1500';

-- 2 задание
SELECT t.transaction_id  
FROM hw.transaction t 
WHERE t.transaction_date BETWEEN  '2017-04-01' AND '2017-04-09';

-- 3 задание
SELECT DISTINCT c.job_title
FROM hw.customer c 
WHERE (c.job_industry_category = 'IT' OR c.job_industry_category = 'Financial Services')
  AND c.job_title LIKE 'Senior%';
  
-- 4 задание
SELECT DISTINCT t.brand 
FROM hw.transaction t 
JOIN hw.customer c 
  ON t.customer_id = c.customer_id
WHERE c.job_industry_category = 'Financial Services'
  
--5 задание
SELECT DISTINCT t.customer_id
FROM hw.transaction t 
WHERE t.online_order  is not null
AND t.brand in ('Giant Bicycles', 'Norco Bicycles', 'Trek Bicycles')
LIMIT 10;
    
-- 6 задание
SELECT DISTINCT c.customer_id
FROM hw.customer c 
LEFT JOIN hw.transaction t 
  ON c.customer_id = t.customer_id
WHERE t.transaction_id  is null;
  
-- 7 задание
SELECT DISTINCT c.customer_id
FROM hw.customer c 
JOIN hw.transaction t 
  ON c.customer_id = t.customer_id
WHERE c.job_industry_category = 'IT'
    AND t.standard_cost = ( 
    SELECT MAX(standard_cost) 
    FROM table1."transaction" t
);


-- 8 задание
SELECT DISTINCT c.customer_id
FROM hw.customer c 
JOIN hw.transaction t 
  ON c.customer_id = t.customer_id
WHERE (c.job_industry_category = 'IT' OR c.job_industry_category = 'Health')
    AND t.transaction_date BETWEEN  '2017-07-07' AND '2017-07-17'
    AND t.order_status = 'Approved';
