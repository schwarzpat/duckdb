--- Create the transactions table
CREATE TABLE transactions (
    transaction_id INT PRIMARY KEY,
    merchant_id INT,
    credit_card_id INT,
    transaction_timestamp TIMESTAMP,
    amount DECIMAL(10, 2)
);

--- Enter the data to the table
INSERT INTO transactions (transaction_id, merchant_id, credit_card_id, transaction_timestamp, amount) 
VALUES 
(1, 101, 1, '2022-09-25 12:00:00', 100.00),
(2, 101, 1, '2022-09-25 12:08:00', 100.00),
(3, 101, 1, '2022-09-25 12:28:00', 100.00),
(5, 101, 1, '2022-09-25 13:37:00', 100.00),
(4, 101, 2, '2022-09-25 12:20:00', 300.00),
(6, 102, 2, '2022-09-25 14:00:00', 400.00),
(7, 102, 3, '2022-09-26 10:00:00', 300.00),
(8, 102, 3, '2022-09-26 10:10:00', 300.00),
(9, 102, 3, '2022-09-26 10:14:00', 300.00),
(10, 103, 4, '2022-09-27 12:00:00', 50.00),
(11, 103, 4, '2022-09-27 12:09:00', 50.00),
(12, 103, 4, '2022-09-27 22:00:00', 50.00),
(14, 105, 6, '2022-09-27 12:10:00', 100.00),
(13, 105, 6, '2022-09-27 12:00:00', 200.00);

--- Determine the count of repeated payments
SELECT count(*) as payment_count
FROM transactions t1
JOIN transactions t2
  ON t1.merchant_id = t2.merchant_id
  AND t1.credit_card_id = t2.credit_card_id
  AND t1.amount = t2.amount
  AND t2.transaction_timestamp > t1.transaction_timestamp
  AND t2.transaction_timestamp <= t1.transaction_timestamp + INTERVAL '10 minutes';
