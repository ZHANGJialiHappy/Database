SQLquery = """
SELECT 'Person: %s --> %s' AS FD,
CASE WHEN COUNT(*)=0 THEN 'MAY HOLD'
ELSE 'does not hold' END AS VALIDITY
FROM (
        SELECT P.%s
        FROM Person P
        GROUP BY P.%s
        HAVING COUNT(DISTINCT P.%s) > 1
) X;
"""

def PrintSQL(Att1, Att2):
    print (SQLquery % (Att1, Att2, Att1, Att1, Att2));

R = ['ID', 'Name', 'ZIP', 'City']
for i in range(len(R)):
    for j in range(len(R)):
        if (i != j):
            PrintSQL(R[i], R[j])

