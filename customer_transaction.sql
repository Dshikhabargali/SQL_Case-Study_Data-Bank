-- B. Customer Transactions 

-- 1 What is the unique count and total amount for each transaction type?
SELECT
txn_type, COUNT(  DISTINCT customer_id) AS unique_count, 
SUM(txn_amount) AS total_amount
FROM customer_transactions
GROUP BY txn_type;

-- 2 What is the average total historical deposit counts and amounts for all customers?
WITH Total_deposit  as (SELECT 
    customer_id, 
    COUNT(customer_id) AS txn_count, 
    AVG(txn_amount) AS avg_amount
  FROM customer_transactions
  WHERE txn_type = 'deposit'
  GROUP BY customer_id
  )
SELECT ROUND(AVG(txn_count)) , ROUND(AVG(avg_amount)) 
from Total_deposit ;

-- 3 For each month - how many Data Bank customers make more than 1 deposit and either 1 purchase or 1 withdrawal in a single month?


WITH month_total AS (
	SELECT
		MONTH(txn_date) AS txn_month,
		customer_id,
		SUM(CASE WHEN txn_type = 'deposit' THEN 1 ELSE 0 END) AS deposit_count,
		SUM(CASE WHEN txn_type = 'purchase' THEN 1 ELSE 0 END) AS purchase_count,
		SUM(CASE WHEN txn_type = 'withdrawal' THEN 1 ELSE 0 END) AS withdrawal_count
	FROM customer_transactions
	GROUP BY
		MONTH(txn_date),
		customer_id
)
SELECT 
	txn_month,
	COUNT(customer_id) AS customer_count
FROM month_total
WHERE deposit_count > 1 AND  (purchase_count = 1 OR withdrawal_count = 1)
GROUP BY txn_month
ORDER BY txn_month;

-- 4 What is the closing balance for each customer at the end of the month?
 
WITH txn_monthly_balance_cte AS
  (SELECT customer_id,
          txn_amount,
          month(txn_date) AS txn_month,
          SUM(CASE
                  WHEN txn_type="deposit" THEN txn_amount
                  ELSE -txn_amount
              END) AS net_transaction_amt
   FROM customer_transactions
   GROUP BY customer_id,
            month(txn_date) , txn_amount
   ORDER BY customer_id)
SELECT customer_id,
       txn_month,
       net_transaction_amt,
       sum(net_transaction_amt) over(PARTITION BY customer_id
                                     ORDER BY txn_month ROWS BETWEEN UNBOUNDED preceding AND CURRENT ROW) AS closing_balance
FROM txn_monthly_balance_cte;

-- 5 What is the percentage of customers who increase their closing balance by more than 5%?

