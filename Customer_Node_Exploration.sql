-- A. Customer Nodes Exploration

-- 1.How many unique nodes are there on the Data Bank system?
SELECT
	COUNT(DISTINCT node_id) AS unique_node
FROM customer_nodes;

-- 2.What is the number of nodes per region?

SELECT regions.region_id,regions.region_name,COUNT( distinct c.node_id) AS node_count
FROM customer_nodes c
RIGHT JOIN regions ON 
c.region_id = regions.region_id
GROUP BY regions.region_id ,regions.region_name
ORDER BY regions.region_id;

-- 3.How many customers are allocated to each region?

SELECT  r.region_name ,COUNT(distinct c.customer_id) 
FROM customer_nodes c 
INNER JOIN regions r ON  
c.region_id = r.region_id
GROUP BY r.region_id ,r.region_name ;

-- 4.How many days on average are customers reallocated to a different node?

WITH relocation AS 
( SELECT customer_id , node_id ,
sum(datediff( end_date , start_date)) as days_in_node
FROM customer_nodes 
WHERE  end_date !='9999-12-31' 
GROUP BY customer_id , node_id 
)
SELECT ROUND(AVG(days_in_node))  as avg_day_spent 
FROM relocation ;

