SELECT 'Rentals: PID --> HID' AS FD,
CASE WHEN COUNT(*)=0 THEN 'MAY HOLD'
ELSE 'does not hold' END AS VALIDITY
FROM (
        SELECT R.PID
        FROM Rentals R
        GROUP BY R.PID
        HAVING COUNT(DISTINCT R.HID) > 1
) X;


SELECT 'Rentals: PID --> PN' AS FD,
CASE WHEN COUNT(*)=0 THEN 'MAY HOLD'
ELSE 'does not hold' END AS VALIDITY
FROM (
        SELECT R.PID
        FROM Rentals R
        GROUP BY R.PID
        HAVING COUNT(DISTINCT R.PN) > 1
) X;


SELECT 'Rentals: PID --> S' AS FD,
CASE WHEN COUNT(*)=0 THEN 'MAY HOLD'
ELSE 'does not hold' END AS VALIDITY
FROM (
        SELECT R.PID
        FROM Rentals R
        GROUP BY R.PID
        HAVING COUNT(DISTINCT R.S) > 1
) X;


SELECT 'Rentals: PID --> HS' AS FD,
CASE WHEN COUNT(*)=0 THEN 'MAY HOLD'
ELSE 'does not hold' END AS VALIDITY
FROM (
        SELECT R.PID
        FROM Rentals R
        GROUP BY R.PID
        HAVING COUNT(DISTINCT R.HS) > 1
) X;


SELECT 'Rentals: PID --> HZ' AS FD,
CASE WHEN COUNT(*)=0 THEN 'MAY HOLD'
ELSE 'does not hold' END AS VALIDITY
FROM (
        SELECT R.PID
        FROM Rentals R
        GROUP BY R.PID
        HAVING COUNT(DISTINCT R.HZ) > 1
) X;


SELECT 'Rentals: PID --> HC' AS FD,
CASE WHEN COUNT(*)=0 THEN 'MAY HOLD'
ELSE 'does not hold' END AS VALIDITY
FROM (
        SELECT R.PID
        FROM Rentals R
        GROUP BY R.PID
        HAVING COUNT(DISTINCT R.HC) > 1
) X;


SELECT 'Rentals: HID --> PID' AS FD,
CASE WHEN COUNT(*)=0 THEN 'MAY HOLD'
ELSE 'does not hold' END AS VALIDITY
FROM (
        SELECT R.HID
        FROM Rentals R
        GROUP BY R.HID
        HAVING COUNT(DISTINCT R.PID) > 1
) X;


SELECT 'Rentals: HID --> PN' AS FD,
CASE WHEN COUNT(*)=0 THEN 'MAY HOLD'
ELSE 'does not hold' END AS VALIDITY
FROM (
        SELECT R.HID
        FROM Rentals R
        GROUP BY R.HID
        HAVING COUNT(DISTINCT R.PN) > 1
) X;


SELECT 'Rentals: HID --> S' AS FD,
CASE WHEN COUNT(*)=0 THEN 'MAY HOLD'
ELSE 'does not hold' END AS VALIDITY
FROM (
        SELECT R.HID
        FROM Rentals R
        GROUP BY R.HID
        HAVING COUNT(DISTINCT R.S) > 1
) X;


SELECT 'Rentals: HID --> HS' AS FD,
CASE WHEN COUNT(*)=0 THEN 'MAY HOLD'
ELSE 'does not hold' END AS VALIDITY
FROM (
        SELECT R.HID
        FROM Rentals R
        GROUP BY R.HID
        HAVING COUNT(DISTINCT R.HS) > 1
) X;


SELECT 'Rentals: HID --> HZ' AS FD,
CASE WHEN COUNT(*)=0 THEN 'MAY HOLD'
ELSE 'does not hold' END AS VALIDITY
FROM (
        SELECT R.HID
        FROM Rentals R
        GROUP BY R.HID
        HAVING COUNT(DISTINCT R.HZ) > 1
) X;


SELECT 'Rentals: HID --> HC' AS FD,
CASE WHEN COUNT(*)=0 THEN 'MAY HOLD'
ELSE 'does not hold' END AS VALIDITY
FROM (
        SELECT R.HID
        FROM Rentals R
        GROUP BY R.HID
        HAVING COUNT(DISTINCT R.HC) > 1
) X;


SELECT 'Rentals: PN --> PID' AS FD,
CASE WHEN COUNT(*)=0 THEN 'MAY HOLD'
ELSE 'does not hold' END AS VALIDITY
FROM (
        SELECT R.PN
        FROM Rentals R
        GROUP BY R.PN
        HAVING COUNT(DISTINCT R.PID) > 1
) X;


SELECT 'Rentals: PN --> HID' AS FD,
CASE WHEN COUNT(*)=0 THEN 'MAY HOLD'
ELSE 'does not hold' END AS VALIDITY
FROM (
        SELECT R.PN
        FROM Rentals R
        GROUP BY R.PN
        HAVING COUNT(DISTINCT R.HID) > 1
) X;


SELECT 'Rentals: PN --> S' AS FD,
CASE WHEN COUNT(*)=0 THEN 'MAY HOLD'
ELSE 'does not hold' END AS VALIDITY
FROM (
        SELECT R.PN
        FROM Rentals R
        GROUP BY R.PN
        HAVING COUNT(DISTINCT R.S) > 1
) X;


SELECT 'Rentals: PN --> HS' AS FD,
CASE WHEN COUNT(*)=0 THEN 'MAY HOLD'
ELSE 'does not hold' END AS VALIDITY
FROM (
        SELECT R.PN
        FROM Rentals R
        GROUP BY R.PN
        HAVING COUNT(DISTINCT R.HS) > 1
) X;


SELECT 'Rentals: PN --> HZ' AS FD,
CASE WHEN COUNT(*)=0 THEN 'MAY HOLD'
ELSE 'does not hold' END AS VALIDITY
FROM (
        SELECT R.PN
        FROM Rentals R
        GROUP BY R.PN
        HAVING COUNT(DISTINCT R.HZ) > 1
) X;


SELECT 'Rentals: PN --> HC' AS FD,
CASE WHEN COUNT(*)=0 THEN 'MAY HOLD'
ELSE 'does not hold' END AS VALIDITY
FROM (
        SELECT R.PN
        FROM Rentals R
        GROUP BY R.PN
        HAVING COUNT(DISTINCT R.HC) > 1
) X;


SELECT 'Rentals: S --> PID' AS FD,
CASE WHEN COUNT(*)=0 THEN 'MAY HOLD'
ELSE 'does not hold' END AS VALIDITY
FROM (
        SELECT R.S
        FROM Rentals R
        GROUP BY R.S
        HAVING COUNT(DISTINCT R.PID) > 1
) X;


SELECT 'Rentals: S --> HID' AS FD,
CASE WHEN COUNT(*)=0 THEN 'MAY HOLD'
ELSE 'does not hold' END AS VALIDITY
FROM (
        SELECT R.S
        FROM Rentals R
        GROUP BY R.S
        HAVING COUNT(DISTINCT R.HID) > 1
) X;


SELECT 'Rentals: S --> PN' AS FD,
CASE WHEN COUNT(*)=0 THEN 'MAY HOLD'
ELSE 'does not hold' END AS VALIDITY
FROM (
        SELECT R.S
        FROM Rentals R
        GROUP BY R.S
        HAVING COUNT(DISTINCT R.PN) > 1
) X;


SELECT 'Rentals: S --> HS' AS FD,
CASE WHEN COUNT(*)=0 THEN 'MAY HOLD'
ELSE 'does not hold' END AS VALIDITY
FROM (
        SELECT R.S
        FROM Rentals R
        GROUP BY R.S
        HAVING COUNT(DISTINCT R.HS) > 1
) X;


SELECT 'Rentals: S --> HZ' AS FD,
CASE WHEN COUNT(*)=0 THEN 'MAY HOLD'
ELSE 'does not hold' END AS VALIDITY
FROM (
        SELECT R.S
        FROM Rentals R
        GROUP BY R.S
        HAVING COUNT(DISTINCT R.HZ) > 1
) X;


SELECT 'Rentals: S --> HC' AS FD,
CASE WHEN COUNT(*)=0 THEN 'MAY HOLD'
ELSE 'does not hold' END AS VALIDITY
FROM (
        SELECT R.S
        FROM Rentals R
        GROUP BY R.S
        HAVING COUNT(DISTINCT R.HC) > 1
) X;


SELECT 'Rentals: HS --> PID' AS FD,
CASE WHEN COUNT(*)=0 THEN 'MAY HOLD'
ELSE 'does not hold' END AS VALIDITY
FROM (
        SELECT R.HS
        FROM Rentals R
        GROUP BY R.HS
        HAVING COUNT(DISTINCT R.PID) > 1
) X;


SELECT 'Rentals: HS --> HID' AS FD,
CASE WHEN COUNT(*)=0 THEN 'MAY HOLD'
ELSE 'does not hold' END AS VALIDITY
FROM (
        SELECT R.HS
        FROM Rentals R
        GROUP BY R.HS
        HAVING COUNT(DISTINCT R.HID) > 1
) X;


SELECT 'Rentals: HS --> PN' AS FD,
CASE WHEN COUNT(*)=0 THEN 'MAY HOLD'
ELSE 'does not hold' END AS VALIDITY
FROM (
        SELECT R.HS
        FROM Rentals R
        GROUP BY R.HS
        HAVING COUNT(DISTINCT R.PN) > 1
) X;


SELECT 'Rentals: HS --> S' AS FD,
CASE WHEN COUNT(*)=0 THEN 'MAY HOLD'
ELSE 'does not hold' END AS VALIDITY
FROM (
        SELECT R.HS
        FROM Rentals R
        GROUP BY R.HS
        HAVING COUNT(DISTINCT R.S) > 1
) X;


SELECT 'Rentals: HS --> HZ' AS FD,
CASE WHEN COUNT(*)=0 THEN 'MAY HOLD'
ELSE 'does not hold' END AS VALIDITY
FROM (
        SELECT R.HS
        FROM Rentals R
        GROUP BY R.HS
        HAVING COUNT(DISTINCT R.HZ) > 1
) X;


SELECT 'Rentals: HS --> HC' AS FD,
CASE WHEN COUNT(*)=0 THEN 'MAY HOLD'
ELSE 'does not hold' END AS VALIDITY
FROM (
        SELECT R.HS
        FROM Rentals R
        GROUP BY R.HS
        HAVING COUNT(DISTINCT R.HC) > 1
) X;


SELECT 'Rentals: HZ --> PID' AS FD,
CASE WHEN COUNT(*)=0 THEN 'MAY HOLD'
ELSE 'does not hold' END AS VALIDITY
FROM (
        SELECT R.HZ
        FROM Rentals R
        GROUP BY R.HZ
        HAVING COUNT(DISTINCT R.PID) > 1
) X;


SELECT 'Rentals: HZ --> HID' AS FD,
CASE WHEN COUNT(*)=0 THEN 'MAY HOLD'
ELSE 'does not hold' END AS VALIDITY
FROM (
        SELECT R.HZ
        FROM Rentals R
        GROUP BY R.HZ
        HAVING COUNT(DISTINCT R.HID) > 1
) X;


SELECT 'Rentals: HZ --> PN' AS FD,
CASE WHEN COUNT(*)=0 THEN 'MAY HOLD'
ELSE 'does not hold' END AS VALIDITY
FROM (
        SELECT R.HZ
        FROM Rentals R
        GROUP BY R.HZ
        HAVING COUNT(DISTINCT R.PN) > 1
) X;


SELECT 'Rentals: HZ --> S' AS FD,
CASE WHEN COUNT(*)=0 THEN 'MAY HOLD'
ELSE 'does not hold' END AS VALIDITY
FROM (
        SELECT R.HZ
        FROM Rentals R
        GROUP BY R.HZ
        HAVING COUNT(DISTINCT R.S) > 1
) X;


SELECT 'Rentals: HZ --> HS' AS FD,
CASE WHEN COUNT(*)=0 THEN 'MAY HOLD'
ELSE 'does not hold' END AS VALIDITY
FROM (
        SELECT R.HZ
        FROM Rentals R
        GROUP BY R.HZ
        HAVING COUNT(DISTINCT R.HS) > 1
) X;


SELECT 'Rentals: HZ --> HC' AS FD,
CASE WHEN COUNT(*)=0 THEN 'MAY HOLD'
ELSE 'does not hold' END AS VALIDITY
FROM (
        SELECT R.HZ
        FROM Rentals R
        GROUP BY R.HZ
        HAVING COUNT(DISTINCT R.HC) > 1
) X;


SELECT 'Rentals: HC --> PID' AS FD,
CASE WHEN COUNT(*)=0 THEN 'MAY HOLD'
ELSE 'does not hold' END AS VALIDITY
FROM (
        SELECT R.HC
        FROM Rentals R
        GROUP BY R.HC
        HAVING COUNT(DISTINCT R.PID) > 1
) X;


SELECT 'Rentals: HC --> HID' AS FD,
CASE WHEN COUNT(*)=0 THEN 'MAY HOLD'
ELSE 'does not hold' END AS VALIDITY
FROM (
        SELECT R.HC
        FROM Rentals R
        GROUP BY R.HC
        HAVING COUNT(DISTINCT R.HID) > 1
) X;


SELECT 'Rentals: HC --> PN' AS FD,
CASE WHEN COUNT(*)=0 THEN 'MAY HOLD'
ELSE 'does not hold' END AS VALIDITY
FROM (
        SELECT R.HC
        FROM Rentals R
        GROUP BY R.HC
        HAVING COUNT(DISTINCT R.PN) > 1
) X;


SELECT 'Rentals: HC --> S' AS FD,
CASE WHEN COUNT(*)=0 THEN 'MAY HOLD'
ELSE 'does not hold' END AS VALIDITY
FROM (
        SELECT R.HC
        FROM Rentals R
        GROUP BY R.HC
        HAVING COUNT(DISTINCT R.S) > 1
) X;


SELECT 'Rentals: HC --> HS' AS FD,
CASE WHEN COUNT(*)=0 THEN 'MAY HOLD'
ELSE 'does not hold' END AS VALIDITY
FROM (
        SELECT R.HC
        FROM Rentals R
        GROUP BY R.HC
        HAVING COUNT(DISTINCT R.HS) > 1
) X;


SELECT 'Rentals: HC --> HZ' AS FD,
CASE WHEN COUNT(*)=0 THEN 'MAY HOLD'
ELSE 'does not hold' END AS VALIDITY
FROM (
        SELECT R.HC
        FROM Rentals R
        GROUP BY R.HC
        HAVING COUNT(DISTINCT R.HZ) > 1
) X;
