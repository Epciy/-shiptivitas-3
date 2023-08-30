-- TYPE YOUR SQL QUERY BELOW

-- PART 1: Create a SQL query that maps out the daily average users before and after the feature change

WITH UserLoginDates AS (
    SELECT
        user_id,
        DATE(login_timestamp) AS login_date,
        COUNT(DISTINCT DATE(login_timestamp)) OVER (PARTITION BY user_id) AS total_active_days
    FROM login_history
)
SELECT
    login_date,
    AVG(total_active_days) AS daily_avg_active_users
FROM UserLoginDates
GROUP BY login_date
ORDER BY login_date;



-- PART 2: Create a SQL query that indicates the number of status changes by card

SELECT
    c.id AS card_id,
    c.name AS card_name,
    COUNT(*) AS status_change_count
FROM card_change_history ch
JOIN card c ON ch.cardID = c.id
GROUP BY c.id, c.name
ORDER BY c.id;




