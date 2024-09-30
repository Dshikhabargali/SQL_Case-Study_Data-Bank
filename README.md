# <p align="center" style="margin-top: 0px;">  Case Study  - Data Bank

<p align="center" style="margin-bottom: 0px !important;">
<img src="https://github.com/Chisomnwa/SQL-Challenge-Case-Study-4---Data-Bank/blob/main/Images/Data%20Bank%20Logo.png" width="540" height="540">

---
* [Click here to view the full challenge](https://8weeksqlchallenge.com/case-study-4/)*

---

## Problem Statement
There is a new innovation in the financial industry called Neo-Banks: new aged digital only banks without physical branches.

Danny thought that there should be some sort of intersection between these new age banks, cryptocurrency and the data world…so he decides to launch a new initiative - Data Bank!

Data Bank runs just like any other digital bank - but it isn’t only for banking activities, they also have the world’s most secure distributed data storage platform!

Customers are allocated cloud data storage limits which are directly linked to how much money they have in their accounts. There are a few interesting caveats that go with this business model, and this is where the Data Bank team need your help!

The management team at Data Bank want to increase their total customer base - but also need some help tracking just how much data storage their customers will need.

This case study is all about calculating metrics, growth and helping the business analyse their data in a smart way to better forecast and plan for their future developments!
   
   
---
## Entity Relationship Diagram
<p align="center" style="margin-bottom: 0px !important;">
<img src="https://github.com/Chisomnwa/SQL-Challenge-Case-Study-4---Data-Bank/blob/main/Images/ERD%20-%20%20Data%20Bank.png">
   
## Case Study Questions
The following case study questions include some general data exploration analysis for the nodes and transactions before diving right into the core business questions and finishes with a challenging final request!

### Customer Nodes Exploration
How many unique nodes are there on the Data Bank system?</br>
What is the number of nodes per region?</br>
How many customers are allocated to each region?</br>
How many days on average are customers reallocated to a different node?</br>
What is the median, 80th and 95th percentile for this same reallocation days metric for each region?</br>

### Customer Transactions
What is the unique count and total amount for each transaction type?</br>
What is the average total historical deposit counts and amounts for all customers?</br>
For each month - how many Data Bank customers make more than 1 deposit and either 1 purchase or 1 withdrawal in a single month?</br>
What is the closing balance for each customer at the end of the month?</br>
What is the percentage of customers who increase their closing balance by more than 5%? </br>
## Available Data
  
<details><summary>
    All datasets exist in database schema.
  </summary> 
  
 #### ``Table 1: Regions``
region_id | region_name
-- | --
1 | Africa
2 | America
3 | Asia
4 | Europe
5 | Oceania

#### ``Table 2: subscriptions``
*This is  customers sample table*
customer_id | region_id | node_id | start_date | end_date
-- | -- | -- | -- | --
1 | 3 | 4 | 2020-01-02 | 2020-01-03
2 | 3 | 5 | 2020-01-03 | 2020-01-17
3 | 5 | 4 | 2020-01-27 | 2020-02-18
4 | 5 | 4 | 2020-01-07 | 2020-01-19
5 | 3 | 3 | 2020-01-15 | 2020-01-23
6 | 1 | 1 | 2020-01-11 | 2020-02-06
7 | 2 | 5 | 2020-01-20 | 2020-02-04
8 | 1 | 2 | 2020-01-15 | 2020-01-28
9 | 4 | 5 | 2020-01-21 | 2020-01-25
10 | 3 | 4 | 2020-01-13 | 2020-01-14

#### ``Table 3: Customer Transactions``
*This is customers sample table*
customer_id | txn_date | txn_type | txn_amount
-- | -- | -- | --
429 | 2020-01-21 | deposit | 82
155 | 2020-01-10 | deposit | 712
398 | 2020-01-01 | deposit | 196
255 | 2020-01-14 | deposit | 563
185 | 2020-01-29 | deposit | 626
309 | 2020-01-13 | deposit | 995
312 | 2020-01-20 | deposit | 485
376 | 2020-01-03 | deposit | 706
188 | 2020-01-13 | deposit | 601
138 | 2020-01-11 | deposit | 520

  </details>


 
