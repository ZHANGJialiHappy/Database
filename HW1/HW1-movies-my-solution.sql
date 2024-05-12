SELECT COUNT(*)
FROM Person
WHERE deathdate IS NULL;

select count(*)
from movie
where language ='French';

SELECT COUNT(DISTINCT movieid) AS num_movies
FROM (
    SELECT m.id AS movieid, AVG(p.height) AS avg_height
    FROM movie m
    JOIN involved i ON m.id = i.movieid
    JOIN person p ON i.personid = p.id
    WHERE m.language = 'Portuguese' AND p.height IS NOT NULL
    GROUP BY m.id
    HAVING AVG(p.height) > 175
) AS subquery;

-- The movie genre relation does not have a primary key, which can lead to a movie
-- having more than one entry with the same genre. As a result, there are 14 movies
-- in movie genre that have the genre ‘Action’ assigned to them more than once. How
-- many movies in movie genre have the genre ‘Thriller’ assigned to them more than
-- once?

select * from movie_genre

SELECT COUNT(movieid) As num_movies
FROM (
    SELECT movieId
    FROM movie_genre
    WHERE genre = 'Thriller'
    GROUP BY movieId
    HAVING COUNT(*) > 1
) AS subquery;

-- According to the information in the database, 52 different people acted in movies
-- directed by ‘Ingmar Bergman’. How many different people acted in movies directed
-- by ‘Akira Kurosawa’?
SELECT COUNT(DISTINCT personid) AS num_actors
FROM involved
WHERE movieid IN (
    SELECT movieid
    FROM involved
    WHERE personid IN (
        SELECT id
        FROM person
        WHERE name = 'Akira Kurosawa'
    ) AND role='director'
) and involved.role='actor';

SELECT COUNT(DISTINCT person.name) AS number_of_ppl_in_akira_kurosawa_movies
FROM person
JOIN involved ON person.id = involved.personid
JOIN movie ON movie.id = involved.movieid
WHERE movie.title IN (
    SELECT movie.title
    FROM person
    JOIN involved ON person.id = involved.personid
    JOIN movie ON movie.id = involved.movieid
    WHERE person.name = 'Akira Kurosawa'  AND involved.role = 'director'
) AND involved.role = 'actor';

-- Of all the movies produced in 2001, there are 10 that have only one actor involved in
-- them. How many movies produced in 2005 have only two actors involved in them?
select count(*)
from 
  (select movieid, count(distinct personid) as count
  from involved
  where movieid in  
    (select id
    from movie
    where year=2005) and involved.role = 'actor'
  group by movieid) as numActor_in_2001_movies
  where count=2

SELECT COUNT(*) AS num_movies
FROM (
    SELECT m.id
    FROM movie m
    JOIN involved i ON m.id = i.movieid
    WHERE m.year = 2005 and i.role = 'actor'
    GROUP BY m.id
    HAVING COUNT(distinct i.personid) = 2
) AS single_actor_movies;

-- In the database, there are 92 cases where a specific actor and director have 
-- collaborated in more than 10 movies. How many are the cases where a specific actor and
-- director collaborated in more than 15 movies?

SELECT COUNT(*) AS num_cases
FROM (
    SELECT i1.personid AS actor_id, i2.personid AS director_id
    FROM involved AS i1
    JOIN involved AS i2 ON i1.movieid = i2.movieid
    WHERE i1.role = 'actor' AND i2.role = 'director' AND i1.personid !=i2.personid
    GROUP BY i1.personid, i2.personid
    HAVING COUNT(*) > 15
) AS cases;

-- Of all the movies produced in 2007, there are 325 that have entries registered in
-- involved for all roles defined in the roles relation. How many movies produced in
-- 2004 have entries registered in involved for all roles defined in the roles relation?
-- Note: This is a relational division query that must work for any instance; Do not use
-- any ‘magic numbers’.
select count(*)
from
   (SELECT i.movieid
    FROM involved i
    JOIN movie m ON i.movieid = m.id
    WHERE m.year = 2004
    group by i.movieid
    having count(distinct i.role)= (select count(*) from role))
    as movies_with_all_roles;

-- The number of people who have played a role in movies of all genres in the category
-- ‘Newsworthy’ is 156. How many people have played a role in movies of all genres in
-- the category ‘Popular’?
select count(*)
from 
    (select distinct i.personid
    from involved i
    join movie_genre mg on mg.movieid=i.movieid
    join 
    (select genre from genre where category='Popular') 
    as specific_genres
    on mg.genre=specific_genres.genre
    group by i.personid
    having count(distinct mg.genre)= (select count(genre) from genre where category='Popular'))
    as personid_in_all_genre



