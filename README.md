# SQL
## 2/5/2020 
### QUERY（SELECT）
```
SELECT …,...,   
FROM…
```
```
SELECT * FROM
```
```
SELECT DISTINCT … 
FROM …
```
```
SELECT TOP … 
FROM ....    /*(SQL server, Access)*/
```
```
SELECT … 
FROM… 
FETCH FIRST  .. ROWS ONLY /*(DB2)*/
```
```
SELECT … 
FROM… 
WHERE ROWNUM <= ...   /*(Oracle)*/
```
```
SELECT … 
FROM … 
LIMIT …      /*(MySQL, MariaDB, postgreSQL, SQLite)*/
```
```
SELECT … 
FROM … 
LIMIT 5 OFFSET 3 ; 
SELECT … 
FROM … 
LIMIT 3,5
```
    
/*  ….   */   使用注释

## 3/5/2020 
### Order
ORDER BY Clause 
```
SELECT … FROM … 
ORDER BY …
```
```
SELECT a, b, c  
FROM … 
ORDER BY b,c
```
```
SELECT a, b, c 
FROM … 
ORDER BY 2 /*2nd column*/, 3 /*3rd column*/
```
```
SELECT a, b, c  
FROM … 
ORDER BY b DESC, c
```

### Filter
```
SELECT … FROM …
WHERE … = …
```

### WHERE Clause operator

|               |               |       |
| -------------:|--------------:| -----:|
| <>            |  !=           | <     |
| >             | <=            | >=    |
| IS NULL       | BETWEEN...AND | !> !< |

```
SELECT … FROM …
WHERE … IN (...,...);
```
```
SELECT … FROM …
WHERE …=... OR …=...
```
```
SELECT … FROM …
WHERE …=... XOR …=...
 /* (A AND Not B) or (Not A AND B) */
 ```
```
SELECT … FROM …
WHERE …=... AND …=...
```
```
SELECT .... FROM …
WHERE NOT … = …
```

## 4/5/2020
### 通配符 (Wildcard)
搜索模式（search pattern）
谓语 （predicate）
```
SELECT … FROM …
WHERE … LIKE ‘_ ab’      /* Microsoft Access 用？*/
```
```
SELECT … FROM …
WHERE … LIKE ‘a%’   /* LIKE ‘%a%’   LIKE ‘a%b’ */    /* Microsoft Access  use *  not % */
```
```
SELECT … FROM
WHERE … LIKE ‘[ab]%’  /*Only use in Access and SQL Server*/
              /*[a-f]*/
```
```
SELECT … FROM
WHERE … LIKE ‘[^ab]%’ /* Access use ！to object */;
SELECT … FROM
WHERE NOT … LIKE ‘[ab]%’ 
```

### Concatenate
Concat(...,...)
```
SELECT … +... +...  FROM ...  /* SQL Server*/;
SELECT … ||... ||...  FROM ... /* Access*/;
SELECT Concat(...,...)  FROM ...  /* MariaDB, My SQL*/;
```
AS 别名 AS “Maria DB”    AS[sql Server] 

arithmetic operators :     + - * /

REPLACE(‘ABC’, ‘A’, ‘D’, )

### Text Function 文本处理函数
|                                                                 |
| ---------------------------------------------------------------:|
|RTRIM(),      LTRIM(),      TRIM()                               |
|NOW()                                                            |
|LENGTH(),     DATALENGTH(), LEN()                                |
|LOWER(),      LCASE(Access)                                      |
|SOUNDEX()                                                        |
|LEFT(),       RIGHT()                                            |
|UPPER(),      UCASE(Access)                                      |
|DATEPART(yy, SQL Server ), DATEPART(‘yyyy’, Access)              |
|SOUNDEX()                                                        |
|DATE_PART(‘year’, PostgreSQL), to_number(to_char(Oracle, 'YYYY'))|
|LIMIT 5 OFFSET 5                                                 |
|LEFT(name, 1),    RIGHT(name, 1)                                 |

### Numeric Functions
ABS()       
COS()     
SIN()       
TAN()       
EXP()       
PI()      
SQRT() 
ROUND(123, -2)  
CAST(... AS int)

### Aggregate Function
AVG(DISTINCT ...)     
COUNT()     
MAX()      
MIN()     
SUM()       

## 7/5/2020
```
SELECT … FROM ...
WHERE
GROUP BY 
HAVING
ORDER BY
```

## 8/5/2020
### SUBQUERY
```
SELECT cust_id
FROM Orders
WHERE order_num IN(SELECT order_num
                    FROM OrderItems
                    WHERE prod_id = 'RGAN01'
                    );
```
```
SELECT cust_name, cust_state, (
                               SELECT COUNT(*)
                               FROM Orders
                               WHERE Orders.cust_id = Customers.cust_id
                               ) AS orders
FROM Customers
ORDER BY cust_name;
```
```
SELECT name, CONCAT
                  (CAST
                       (ROUND(100*population/(SELECT population FROM world 
                                              WHERE name='Germany')
                          ,0 )
                   AS int)
              , '%')
FROM world
WHERE continent='Europe';
```

ANY, ALL
SELECT … FROM … WHERE …> ANY(Subquery) 
SELECT … FROM … WHERE …> ALL(Subquery) 

### Operation order:    FROM 》WHERE》GROUP BY》HAVE》SELECT》ORDER BY

### Join
WHERE Table.column = table2.column2

### Self Join
```
SELECT Table1.id1, table 2.name
FROM table AS table1, table AS table2
WHERE table1.id1=table2.id2 AND ...=....;
```

/*Correlated subquery*/
```
WHERE population>ALL(SELECT 3*population 
                      FROM world y
                      WHERE x.continent=y.continent AND x.name!=y.name
                     )
 ```

### Natural Join

### Outer Join
```
/*Inner Join*/
SELECT Table1.id1, table 2.name
FROM table1 INNER JOIN table2
ON  table1.id1=table2.id2;
```

LEFT JOIN,
RIGHT JOIN

### Create several Join
```
SELECT actor.name
FROM movie, actor, casting
WHERE movie.id=casting.movieid 
             AND actor.id=casting.actorid 
             AND movie.title= 'Alien';
             
SELECT actor.name
FROM actor
JOIN casting
ON casting.actorid = actor.id
JOIN movie
ON movie.id = casting.movieid
WHERE movie.title = 'Alien';
```

## 10/5/2020
### Union/Compound Query
```
SELECT … FROM …
WHERE ….=....
UNION
SELECT … FROM…
WHERE ….=...
```

/* display repeated result of 2 SELECT*/
```
SELECT … FROM …
WHERE ….=....
UNION ALL
SELECT … FROM…
WHERE ….=...
```
### CASE WHEN
```
SELECT mdate, team1,
  SUM(CASE WHEN teamid=team1 THEN 1 ELSE 0 END) AS score1, 
  team2,
  SUM(CASE WHEN teamid=team2 THEN 1 ELSE 0 END) AS score2
FROM game LEFT JOIN goal 
  ON matchid = id
GROUP BY mdate, team1, team2
```













