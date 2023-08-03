-- Show transaction history

SELECT *
FROM transaction

-- Find the transactions under $2.00

SELECT amount, id_merchant
FROM transaction WHERE amount < 2.00
ORDER BY amount;

-- Group ID_Merchant to show repeat pattern and frequency of repeat

SELECT id_merchant, COUNT(*) AS Number_Repeated_Less_Than_2_Dollars_Transactions
FROM transaction
WHERE amount < 2.00
GROUP BY id_merchant;

-- Show Top 10 Biggest Repeat Suspects

SELECT id_merchant,
COUNT(*) 
AS Number_Repeated_Less_Than_2_Dollars_Transactions
FROM transaction
WHERE amount < 2.00
GROUP BY id_merchant
ORDER BY Number_Repeated_Less_Than_2_Dollars_Transactions DESC
LIMIT 10;

-- Time period in which potentially fraudulent transactions are made.

SELECT amount, id_merchant, date
FROM transaction 
WHERE amount < 2.00

SELECT id_merchant,
COUNT(*) 
AS Number_Repeated_Less_Than_2_Dollars_Transactions
FROM transaction
WHERE amount < 2.00
GROUP BY id_merchant
ORDER BY Number_Repeated_Less_Than_2_Dollars_Transactions DESC
LIMIT 10;

-- What are the top 100 highest transactions made between 7:00 am and 9:00 am?

SELECT *
FROM transaction
WHERE EXTRACT(HOUR FROM date) BETWEEN 7 AND 9
ORDER BY amount DESC
LIMIT 100;

-- Do you see any anomalous transactions that could be fraudulent?
-- Yes, I see Transaction ID 3163 for $1894 and 2451 for $1617 are some of many (12 transactions more than $100).

-- Is there a higher number of fraudulent transactions made during this time frame versus the rest of the day?

SELECT *
FROM transaction
ORDER BY amount DESC
LIMIT 100;

-- I believe there is no specific correlation with  early afternoon, late evening and other sporadic times showing anamolies and suspicious fraud transactions.

-- If you answered yes to the previous question, explain why you think there might be fraudulent transactions during this time frame.




