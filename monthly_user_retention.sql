--- Create the user_actions table
CREATE TABLE user_actions (
    user_id INT,
    event_id INT,
    event_type VARCHAR(255),
    event_date TIMESTAMP
);

--- Enter the usage data
INSERT INTO user_actions (user_id, event_id, event_type, event_date) 
VALUES 
(445, 7765, 'sign-in', '2022-05-31 12:00:00'),
(445, 3634, 'like', '2022-06-05 12:00:00'),
(648, 3124, 'like', '2022-06-18 12:00:00'),
(648, 2725, 'sign-in', '2022-06-22 12:00:00'),
(648, 8568, 'comment', '2022-07-03 12:00:00'),
(445, 4363, 'sign-in', '2022-07-05 12:00:00'),
(445, 2425, 'like', '2022-07-06 12:00:00'),
(445, 2484, 'like', '2022-07-22 12:00:00'),
(648, 1423, 'sign-in', '2022-07-26 12:00:00'),
(445, 5235, 'comment', '2022-07-29 12:00:00'),
(742, 6458, 'sign-in', '2022-07-03 12:00:00'),
(742, 1374, 'comment', '2022-07-19 12:00:00');

--- Determine the monthly active users
SELECT 
    EXTRACT(MONTH FROM event_date) AS month, 
    COUNT(DISTINCT user_id) AS monthly_active_users
FROM 
    user_actions
WHERE 
    user_id IN (
        SELECT DISTINCT user_id
        FROM user_actions
        WHERE 
            EXTRACT(MONTH FROM event_date) = 6 AND 
            EXTRACT(YEAR FROM event_date) = 2022
    ) AND
    EXTRACT(MONTH FROM event_date) = 7 AND 
    EXTRACT(YEAR FROM event_date) = 2022
GROUP BY 
    month;
