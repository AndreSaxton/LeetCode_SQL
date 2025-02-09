/* Write your T-SQL query statement below */

SELECT 
stock_name,
SUM(CASE WHEN operation = 'Sell' THEN price ELSE - price end) AS capital_gain_loss

FROM Stocks

GROUP BY 
stock_name
ORDER BY SUM(price)