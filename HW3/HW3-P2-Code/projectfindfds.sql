SELECT 'projects: ID --> PID' AS FD,
CASE WHEN COUNT(*)=0 THEN 'MAY HOLD'
ELSE 'does not hold' END AS VALIDITY
FROM (
        SELECT R.ID
        FROM Projects R
        GROUP BY R.ID
        HAVING COUNT(DISTINCT R.PID) > 1
) X;


SELECT 'projects: ID --> SID' AS FD,
CASE WHEN COUNT(*)=0 THEN 'MAY HOLD'
ELSE 'does not hold' END AS VALIDITY
FROM (
        SELECT R.ID
        FROM Projects R
        GROUP BY R.ID
        HAVING COUNT(DISTINCT R.SID) > 1
) X;


SELECT 'projects: ID --> SN' AS FD,
CASE WHEN COUNT(*)=0 THEN 'MAY HOLD'
ELSE 'does not hold' END AS VALIDITY
FROM (
        SELECT R.ID
        FROM Projects R
        GROUP BY R.ID
        HAVING COUNT(DISTINCT R.SN) > 1
) X;


SELECT 'projects: ID --> PN' AS FD,
CASE WHEN COUNT(*)=0 THEN 'MAY HOLD'
ELSE 'does not hold' END AS VALIDITY
FROM (
        SELECT R.ID
        FROM Projects R
        GROUP BY R.ID
        HAVING COUNT(DISTINCT R.PN) > 1
) X;


SELECT 'projects: ID --> MID' AS FD,
CASE WHEN COUNT(*)=0 THEN 'MAY HOLD'
ELSE 'does not hold' END AS VALIDITY
FROM (
        SELECT R.ID
        FROM Projects R
        GROUP BY R.ID
        HAVING COUNT(DISTINCT R.MID) > 1
) X;


SELECT 'projects: ID --> MN' AS FD,
CASE WHEN COUNT(*)=0 THEN 'MAY HOLD'
ELSE 'does not hold' END AS VALIDITY
FROM (
        SELECT R.ID
        FROM Projects R
        GROUP BY R.ID
        HAVING COUNT(DISTINCT R.MN) > 1
) X;


SELECT 'projects: PID --> ID' AS FD,
CASE WHEN COUNT(*)=0 THEN 'MAY HOLD'
ELSE 'does not hold' END AS VALIDITY
FROM (
        SELECT R.PID
        FROM Projects R
        GROUP BY R.PID
        HAVING COUNT(DISTINCT R.ID) > 1
) X;


SELECT 'projects: PID --> SID' AS FD,
CASE WHEN COUNT(*)=0 THEN 'MAY HOLD'
ELSE 'does not hold' END AS VALIDITY
FROM (
        SELECT R.PID
        FROM Projects R
        GROUP BY R.PID
        HAVING COUNT(DISTINCT R.SID) > 1
) X;


SELECT 'projects: PID --> SN' AS FD,
CASE WHEN COUNT(*)=0 THEN 'MAY HOLD'
ELSE 'does not hold' END AS VALIDITY
FROM (
        SELECT R.PID
        FROM Projects R
        GROUP BY R.PID
        HAVING COUNT(DISTINCT R.SN) > 1
) X;


SELECT 'projects: PID --> PN' AS FD,
CASE WHEN COUNT(*)=0 THEN 'MAY HOLD'
ELSE 'does not hold' END AS VALIDITY
FROM (
        SELECT R.PID
        FROM Projects R
        GROUP BY R.PID
        HAVING COUNT(DISTINCT R.PN) > 1
) X;


SELECT 'projects: PID --> MID' AS FD,
CASE WHEN COUNT(*)=0 THEN 'MAY HOLD'
ELSE 'does not hold' END AS VALIDITY
FROM (
        SELECT R.PID
        FROM Projects R
        GROUP BY R.PID
        HAVING COUNT(DISTINCT R.MID) > 1
) X;


SELECT 'projects: PID --> MN' AS FD,
CASE WHEN COUNT(*)=0 THEN 'MAY HOLD'
ELSE 'does not hold' END AS VALIDITY
FROM (
        SELECT R.PID
        FROM Projects R
        GROUP BY R.PID
        HAVING COUNT(DISTINCT R.MN) > 1
) X;


SELECT 'projects: SID --> ID' AS FD,
CASE WHEN COUNT(*)=0 THEN 'MAY HOLD'
ELSE 'does not hold' END AS VALIDITY
FROM (
        SELECT R.SID
        FROM Projects R
        GROUP BY R.SID
        HAVING COUNT(DISTINCT R.ID) > 1
) X;


SELECT 'projects: SID --> PID' AS FD,
CASE WHEN COUNT(*)=0 THEN 'MAY HOLD'
ELSE 'does not hold' END AS VALIDITY
FROM (
        SELECT R.SID
        FROM Projects R
        GROUP BY R.SID
        HAVING COUNT(DISTINCT R.PID) > 1
) X;


SELECT 'projects: SID --> SN' AS FD,
CASE WHEN COUNT(*)=0 THEN 'MAY HOLD'
ELSE 'does not hold' END AS VALIDITY
FROM (
        SELECT R.SID
        FROM Projects R
        GROUP BY R.SID
        HAVING COUNT(DISTINCT R.SN) > 1
) X;


SELECT 'projects: SID --> PN' AS FD,
CASE WHEN COUNT(*)=0 THEN 'MAY HOLD'
ELSE 'does not hold' END AS VALIDITY
FROM (
        SELECT R.SID
        FROM Projects R
        GROUP BY R.SID
        HAVING COUNT(DISTINCT R.PN) > 1
) X;


SELECT 'projects: SID --> MID' AS FD,
CASE WHEN COUNT(*)=0 THEN 'MAY HOLD'
ELSE 'does not hold' END AS VALIDITY
FROM (
        SELECT R.SID
        FROM Projects R
        GROUP BY R.SID
        HAVING COUNT(DISTINCT R.MID) > 1
) X;


SELECT 'projects: SID --> MN' AS FD,
CASE WHEN COUNT(*)=0 THEN 'MAY HOLD'
ELSE 'does not hold' END AS VALIDITY
FROM (
        SELECT R.SID
        FROM Projects R
        GROUP BY R.SID
        HAVING COUNT(DISTINCT R.MN) > 1
) X;


SELECT 'projects: SN --> ID' AS FD,
CASE WHEN COUNT(*)=0 THEN 'MAY HOLD'
ELSE 'does not hold' END AS VALIDITY
FROM (
        SELECT R.SN
        FROM Projects R
        GROUP BY R.SN
        HAVING COUNT(DISTINCT R.ID) > 1
) X;


SELECT 'projects: SN --> PID' AS FD,
CASE WHEN COUNT(*)=0 THEN 'MAY HOLD'
ELSE 'does not hold' END AS VALIDITY
FROM (
        SELECT R.SN
        FROM Projects R
        GROUP BY R.SN
        HAVING COUNT(DISTINCT R.PID) > 1
) X;


SELECT 'projects: SN --> SID' AS FD,
CASE WHEN COUNT(*)=0 THEN 'MAY HOLD'
ELSE 'does not hold' END AS VALIDITY
FROM (
        SELECT R.SN
        FROM Projects R
        GROUP BY R.SN
        HAVING COUNT(DISTINCT R.SID) > 1
) X;


SELECT 'projects: SN --> PN' AS FD,
CASE WHEN COUNT(*)=0 THEN 'MAY HOLD'
ELSE 'does not hold' END AS VALIDITY
FROM (
        SELECT R.SN
        FROM Projects R
        GROUP BY R.SN
        HAVING COUNT(DISTINCT R.PN) > 1
) X;


SELECT 'projects: SN --> MID' AS FD,
CASE WHEN COUNT(*)=0 THEN 'MAY HOLD'
ELSE 'does not hold' END AS VALIDITY
FROM (
        SELECT R.SN
        FROM Projects R
        GROUP BY R.SN
        HAVING COUNT(DISTINCT R.MID) > 1
) X;


SELECT 'projects: SN --> MN' AS FD,
CASE WHEN COUNT(*)=0 THEN 'MAY HOLD'
ELSE 'does not hold' END AS VALIDITY
FROM (
        SELECT R.SN
        FROM Projects R
        GROUP BY R.SN
        HAVING COUNT(DISTINCT R.MN) > 1
) X;


SELECT 'projects: PN --> ID' AS FD,
CASE WHEN COUNT(*)=0 THEN 'MAY HOLD'
ELSE 'does not hold' END AS VALIDITY
FROM (
        SELECT R.PN
        FROM Projects R
        GROUP BY R.PN
        HAVING COUNT(DISTINCT R.ID) > 1
) X;


SELECT 'projects: PN --> PID' AS FD,
CASE WHEN COUNT(*)=0 THEN 'MAY HOLD'
ELSE 'does not hold' END AS VALIDITY
FROM (
        SELECT R.PN
        FROM Projects R
        GROUP BY R.PN
        HAVING COUNT(DISTINCT R.PID) > 1
) X;


SELECT 'projects: PN --> SID' AS FD,
CASE WHEN COUNT(*)=0 THEN 'MAY HOLD'
ELSE 'does not hold' END AS VALIDITY
FROM (
        SELECT R.PN
        FROM Projects R
        GROUP BY R.PN
        HAVING COUNT(DISTINCT R.SID) > 1
) X;


SELECT 'projects: PN --> SN' AS FD,
CASE WHEN COUNT(*)=0 THEN 'MAY HOLD'
ELSE 'does not hold' END AS VALIDITY
FROM (
        SELECT R.PN
        FROM Projects R
        GROUP BY R.PN
        HAVING COUNT(DISTINCT R.SN) > 1
) X;


SELECT 'projects: PN --> MID' AS FD,
CASE WHEN COUNT(*)=0 THEN 'MAY HOLD'
ELSE 'does not hold' END AS VALIDITY
FROM (
        SELECT R.PN
        FROM Projects R
        GROUP BY R.PN
        HAVING COUNT(DISTINCT R.MID) > 1
) X;


SELECT 'projects: PN --> MN' AS FD,
CASE WHEN COUNT(*)=0 THEN 'MAY HOLD'
ELSE 'does not hold' END AS VALIDITY
FROM (
        SELECT R.PN
        FROM Projects R
        GROUP BY R.PN
        HAVING COUNT(DISTINCT R.MN) > 1
) X;


SELECT 'projects: MID --> ID' AS FD,
CASE WHEN COUNT(*)=0 THEN 'MAY HOLD'
ELSE 'does not hold' END AS VALIDITY
FROM (
        SELECT R.MID
        FROM Projects R
        GROUP BY R.MID
        HAVING COUNT(DISTINCT R.ID) > 1
) X;


SELECT 'projects: MID --> PID' AS FD,
CASE WHEN COUNT(*)=0 THEN 'MAY HOLD'
ELSE 'does not hold' END AS VALIDITY
FROM (
        SELECT R.MID
        FROM Projects R
        GROUP BY R.MID
        HAVING COUNT(DISTINCT R.PID) > 1
) X;


SELECT 'projects: MID --> SID' AS FD,
CASE WHEN COUNT(*)=0 THEN 'MAY HOLD'
ELSE 'does not hold' END AS VALIDITY
FROM (
        SELECT R.MID
        FROM Projects R
        GROUP BY R.MID
        HAVING COUNT(DISTINCT R.SID) > 1
) X;


SELECT 'projects: MID --> SN' AS FD,
CASE WHEN COUNT(*)=0 THEN 'MAY HOLD'
ELSE 'does not hold' END AS VALIDITY
FROM (
        SELECT R.MID
        FROM Projects R
        GROUP BY R.MID
        HAVING COUNT(DISTINCT R.SN) > 1
) X;


SELECT 'projects: MID --> PN' AS FD,
CASE WHEN COUNT(*)=0 THEN 'MAY HOLD'
ELSE 'does not hold' END AS VALIDITY
FROM (
        SELECT R.MID
        FROM Projects R
        GROUP BY R.MID
        HAVING COUNT(DISTINCT R.PN) > 1
) X;


SELECT 'projects: MID --> MN' AS FD,
CASE WHEN COUNT(*)=0 THEN 'MAY HOLD'
ELSE 'does not hold' END AS VALIDITY
FROM (
        SELECT R.MID
        FROM Projects R
        GROUP BY R.MID
        HAVING COUNT(DISTINCT R.MN) > 1
) X;


SELECT 'projects: MN --> ID' AS FD,
CASE WHEN COUNT(*)=0 THEN 'MAY HOLD'
ELSE 'does not hold' END AS VALIDITY
FROM (
        SELECT R.MN
        FROM Projects R
        GROUP BY R.MN
        HAVING COUNT(DISTINCT R.ID) > 1
) X;


SELECT 'projects: MN --> PID' AS FD,
CASE WHEN COUNT(*)=0 THEN 'MAY HOLD'
ELSE 'does not hold' END AS VALIDITY
FROM (
        SELECT R.MN
        FROM Projects R
        GROUP BY R.MN
        HAVING COUNT(DISTINCT R.PID) > 1
) X;


SELECT 'projects: MN --> SID' AS FD,
CASE WHEN COUNT(*)=0 THEN 'MAY HOLD'
ELSE 'does not hold' END AS VALIDITY
FROM (
        SELECT R.MN
        FROM Projects R
        GROUP BY R.MN
        HAVING COUNT(DISTINCT R.SID) > 1
) X;


SELECT 'projects: MN --> SN' AS FD,
CASE WHEN COUNT(*)=0 THEN 'MAY HOLD'
ELSE 'does not hold' END AS VALIDITY
FROM (
        SELECT R.MN
        FROM Projects R
        GROUP BY R.MN
        HAVING COUNT(DISTINCT R.SN) > 1
) X;


SELECT 'projects: MN --> PN' AS FD,
CASE WHEN COUNT(*)=0 THEN 'MAY HOLD'
ELSE 'does not hold' END AS VALIDITY
FROM (
        SELECT R.MN
        FROM Projects R
        GROUP BY R.MN
        HAVING COUNT(DISTINCT R.PN) > 1
) X;


SELECT 'projects: MN --> MID' AS FD,
CASE WHEN COUNT(*)=0 THEN 'MAY HOLD'
ELSE 'does not hold' END AS VALIDITY
FROM (
        SELECT R.MN
        FROM Projects R
        GROUP BY R.MN
        HAVING COUNT(DISTINCT R.MID) > 1
) X;
