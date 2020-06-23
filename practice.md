# LeetCode DataBase
Write a SQL query for a report that provides the following information for each person in the Person table, regardless if there is an address for each of those people: FirstName, LastName, City, State
```
SELECT p.FirstName, p.LastName, a.City, a.State
FROM Person p
LEFT JOIN Address a
ON p.PersonId=a.PersonId
```
Second Highest Salary
```
SELECT CASE 
           WHEN (SELECT COUNT(DISTINCT salary) FROM employee)<2 THEN null
           ELSE (SELECT MAX(Salary) FROM employee WHERE salary<(SELECT MAX(Salary) FROM employee)) 
       END as SecondHighestSalary ;
```
```
SELECT CASE WHEN (SELECT COUNT(DISTINCT salary) FROM employee)<2 THEN null
       ELSE (SELECT MIN(Salary) FROM (SELECT TOP 2 Salary FROM (SELECT DISTINCT Salary FROM Employee) AS S ORDER BY Salary DESC) AS a)
       END AS SecondHighestSalary
```
Nth Highest Salary
```
CREATE FUNCTION getNthHighestSalary(@N INT) RETURNS INT AS
BEGIN
    RETURN (
        /* Write your T-SQL query statement below. */ 
SELECT CASE WHEN (SELECT COUNT(DISTINCT salary) FROM employee)<@N THEN null
       ELSE (SELECT MIN(Salary) FROM (SELECT TOP (@N) Salary FROM (SELECT DISTINCT Salary FROM Employee) AS S ORDER BY Salary DESC) AS a)
       END AS  getNthHighestSalary
  );
END
```
```
CREATE FUNCTION getNthHighestSalary(@N INT) RETURNS INT AS
BEGIN
    RETURN (
        /* Write your T-SQL query statement below. */ 
SELECT CASE WHEN (SELECT COUNT(DISTINCT salary) FROM employee)<@N THEN null
       ELSE (SELECT salary
             FROM (SELECT a.Salary, ROW_NUMBER() over(order by salary DESC) AS row_num
                   FROM (SELECT DISTINCT Salary FROM Employee) AS a) result
             WHERE row_num= @N )        
       END AS getNthHighestSalary
  );
END
```
# SQLZOO
Luxembourg has an x - so does one other country. List them both. Find the countries that contain the letter x.
```
SELECT name 
FROM world
WHERE name LIKE '%x%'
```
Iceland, Switzerland end with land - but are there others? Find the countries that end with land.
```
SELECT name 
FROM world
WHERE name LIKE '%land'
```
Columbia starts with a C and ends with ia - there are two more like this. Find the countries that start with C and end with ia.
```
SELECT name 
FROM world
WHERE name LIKE 'C%ia'
```
Bahamas has three a - who else? Find the countries that have three or more a in the name.
```
SELECT name 
FROM world
WHERE name LIKE '%a%a%a%'
```
Lesotho and Moldova both have two o characters separated by two other characters. Find the countries that have two "o" characters separated by two others.
```
SELECT name 
FROM world
WHERE name LIKE '%o__o%'
```
The capital of Mexico is Mexico City. Show all the countries where the capital has the country together with the word "City". Find the country where the capital is the country plus "City".
```
SELECT name
FROM world
WHERE capital = CONCAT(name, ' City')
```
Find the capital and the name where the capital includes the name of the country.
```
SELECT capital, name
FROM world
WHERE capital like CONCAT('%', name,'%')
```
Find the capital and the name where the capital is an extension of name of the country.
You should include Mexico City as it is longer than Mexico. You should not include Luxembourg as the capital is the same as the country.
```
SELECT capital, name
FROM world
WHERE capital LIKE CONCAT(name, '%') and capital != name
```
For Monaco-Ville the name is Monaco and the extension is -Ville. Show the name and the extension where the capital is an extension of name of the country.
```
SELECT name, REPLACE(capital, name, '')
FROM world
WHERE capital LIKE CONCAT(name, '%') and capital != name
```
Show the countries that are big by area (more than 3 million) or big by population (more than 250 million) but not both. Show name, population and area.
```
SELECT name,population,area
FROM world
WHERE (area > 3000000 AND population <= 250000000) OR (area <= 3000000 AND population > 250000000)
```
Show the name and population in millions and the GDP in billions for the countries of the continent 'South America'. Use the ROUND function to show the values to two decimal places.
```
SELECT name, ROUND(population/1000000,2) population_in_millions, ROUND(gdp/1000000000,2) gdp_in_billions
FROM world
WHERE continent='South America'
```
Show the name and per-capita GDP for those countries with a GDP of at least one trillion (1000000000000; that is 12 zeros). Round this value to the nearest 1000
```
SELECT name, ROUND(gdp/population,-3)
FROM world
WHERE gdp>+1000000000000
```
Show the name and capital where the name and the capital have the same number of characters.
```
SELECT name, capital
FROM world
WHERE LEN(name)=LEN(capital)
```
Show the name and the capital where the first letters of each match. Don't include countries where the name and the capital are the same word.
```
SELECT name, capital
FROM world
WHERE LEFT(name,1)=LEFT(capital,1) AND name<>capital
```
Find the country that has all the vowels and no spaces in its name.
```
SELECT name
FROM world
WHERE name NOT LIKE '% %'
 AND name LIKE '%a%' 
 AND name LIKE '%e%' 
 AND name LIKE '%i%' 
 AND name LIKE '%o%' 
 AND name LIKE '%u%' 
```
You can't put a single quote in a quote string directly. You can use two single quotes within a quoted string.
```
SELECT *
FROM nobel
WHERE winner = 'EUGENE O''NEILL'
```
List the winners, year and subject where the winner starts with Sir. Show the the most recent first, then by name order.
```
SELECT winner, yr, subject
FROM nobel
WHERE winner LIKE 'Sir%'
ORDER BY yr DESC, winner
```
Show the 1984 winners and subject ordered by subject and winner name; but list Chemistry and Physics last.
```
SELECT winner, subject
FROM nobel
WHERE yr=1984
ORDER BY CASE WHEN subject IN ('Chemistry','Physics') THEN 1 ELSE 0 END, subject,winner
```
List each country name where the population is larger than that of 'Russia'.
```
SELECT name
FROM world
WHERE population>(SELECT population 
                  FROM world
                  WHERE name='Russia')
```
Show the countries in Europe with a per capita GDP greater than 'United Kingdom'.
```
SELECT name
FROM world
WHERE continent='Europe' and gdp/population>
  (SELECT gdp/population
    FROM world
     WHERE name='United Kingdom')
```
List the name and continent of countries in the continents containing either Argentina or Australia. Order by name of the country.
```
SELECT name, continent
FROM world
WHERE continent IN 
      (SELECT continent
         FROM world
          WHERE name IN ('Argentina', 'Australia'))
ORDER BY name
```
Show the name and the population of each country in Europe. Show the population as a percentage of the population of Germany.
```
SELECT name, CONCAT(ROUND(100*population/(SELECT population FROM world WHERE name='Germany')), '%')
FROM world
WHERE continent='Europe';
```
Find the largest country (by area) in each continent, show the continent, the name and the area:
```
SELECT continent, name, area FROM world x
WHERE area>=ALL(
        SELECT area FROM world y
        WHERE y.continent=x.continent     
)
```
List each continent and the name of the country that comes first alphabetically.
```
/* Solution 1 */
SELECT continent,name
FROM (SELECT continent,population, name,
                                 RANK() OVER(
                                             PARTITION BY continent ORDER BY name
                                             ) ranking 
             FROM world) T
WHERE ranking=1
```
```
/* Solution 2 */
SELECT continent, name
FROM world x
WHERE name<= ALL (SELECT name FROM world y
                           WHERE x.continent=y.continent
                           )
```
Find the continents where all countries have a population <= 25000000. Then find the names of the countries associated with these continents. Show name, continent and population.
```
SELECT name, continent, population
FROM world AS x
WHERE (SELECT MAX(population)
                FROM world AS y
               WHERE x.continent=y.continent)<= 25000000;
```
Some countries have populations more than three times that of any of their neighbours (in the same continent). Give the countries and continents.
```
SELECT name, continent
FROM world x
WHERE population>ALL(SELECT 3*population 
                                   FROM world y
                                    WHERE x.continent=y.continent AND x.name!=y.name
                                       )
```
For each continent show the continent and number of countries with populations of at least 10 million.
```
SELECT continent, COUNT(*)
FROM world
WHERE population>=10000000
GROUP BY continent
```
Show player, teamid, coach, gtime for all goals scored in the first 10 minutes gtime<=10
```
SELECT goal.player, goal.teamid, eteam.coach, goal.gtime 
FROM goal 
INNER JOIN eteam
ON  goal.teamid=eteam.id AND gtime<=10
```
List the dates of the matches and the name of the team in which 'Fernando Santos' was the team1 coach.
```
SELECT game.mdate, eteam.teamname
FROM game
JOIN eteam
ON game.team1=eteam.id
WHERE coach='Fernando Santos'
```
List the player for every goal scored in a game where the stadium was 'National Stadium, Warsaw'
```
SELECT goal.player
FROM game 
JOIN goal
ON game.id=goal.matchid
WHERE stadium='National Stadium, Warsaw'
```
Instead show the name of all players who scored a goal against Germany.(AND is operated before OR)
```
SELECT distinct goal.player
FROM goal
JOIN game
ON game.id=goal.matchid
WHERE (game.team1='GER'or game.team2='GER') AND goal.teamid!='GER'
```
Show teamname and the total number of goals scored.
```
SELECT eteam.teamname, COUNT(gtime)
FROM goal
JOIN eteam
ON goal.teamid=eteam.id
GROUP BY eteam.teamname

```
Show the stadium and the number of goals scored in each stadium.
```
SELECT stadium, COUNT(gtime)
FROM game 
JOIN goal
ON game.id=goal.matchid
GROUP BY game.stadium
```
For every match involving 'POL', show the matchid, date and the number of goals scored.
```
SELECT goal.matchid,game.mdate,COUNT(gtime)
FROM goal
JOIN game
ON game.id=goal.matchid
WHERE game.team1='POL' OR game.team2='POL'
GROUP BY goal.matchid, game.mdate
```
For every match where 'GER' scored, show matchid, match date and the number of goals scored by 'GER'
```
SELECT goal.matchid,game.mdate,COUNT(gtime)
FROM goal
JOIN game
ON goal.matchid=game.id
WHERE goal.teamid='GER'
GROUP BY goal.matchid,game.mdate
```
List every match with the goals scored by each team as shown. This will use "CASE WHEN" which has not been explained in any previous exercises.
```
SELECT mdate, team1,
  SUM(CASE WHEN teamid=team1 THEN 1 ELSE 0 END) AS score1, 
  team2,
  SUM(CASE WHEN teamid=team2 THEN 1 ELSE 0 END) AS score2
FROM game LEFT JOIN goal 
  ON matchid = id
GROUP BY mdate, matchid,team1, team2
```
Obtain the cast list for 'Casablanca'.
```
SELECT actor.name
FROM actor
JOIN casting
ON actor.id=casting.actorid
WHERE movieid=(SELECT id
               FROM movie
               WHERE title='Casablanca')
```
Obtain the cast list for the film 'Alien'
```
SELECT actor.name
FROM actor
JOIN casting
ON casting.actorid=actor.id
JOIN movie
ON casting.movieid=movie.id
WHERE title='Alien'
```
List the films in which 'Harrison Ford' has appeared
```
SELECT title
FROM movie
JOIN casting
ON casting.movieid=movie.id
JOIN actor
ON actor.id=casting.actorid
WHERE actor.name='Harrison Ford'
```
List the films where 'Harrison Ford' has appeared - but not in the starring role.
```
SELECT title
FROM movie
JOIN casting
ON casting.movieid=movie.id
JOIN actor
ON actor.id=casting.actorid
WHERE actor.name='Harrison Ford' AND casting.ord!=1
```
List the films together with the leading star for all 1962 films.
```
SELECT movie.title, actor.name
FROM movie
JOIN casting
ON casting.movieid=movie.id
JOIN actor
ON actor.id=casting.actorid
WHERE casting.ord=1 AND yr='1962'
```
Which were the busiest years for 'Rock Hudson', show the year and the number of movies he made each year for any year in which he made more than 2 movies.
```
SELECT yr, COUNT(*) AS num_movie
FROM movie
JOIN casting
ON casting.movieid=movie.id
JOIN actor
ON actor.id=casting.actorid
WHERE actor.name='Rock Hudson'
GROUP BY yr
HAVING COUNT(*)>2
```
List the film title and the leading actor for all of the films 'Julie Andrews' played in.
```
SELECT title, name
FROM movie
JOIN casting
ON casting.movieid=movie.id
JOIN actor
ON actor.id=casting.actorid
WHERE movie.ID IN (SELECT movie.ID 
                      FROM movie
                      JOIN casting
                      ON casting.movieid=movie.id
                      JOIN actor
                      ON actor.id=casting.actorid
                      WHERE actor.name='Julie Andrews') AND casting.ord=1
```
