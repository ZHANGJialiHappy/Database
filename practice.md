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
