
-- select * from empires;

-- select Population from countries
-- where name='Spain'

-- select * from countries_languages
-- where CountryCode='GER'

-- select * from cities
-- where CountryCode='SPA'

-- a: 3
select count(Distinct CountryCode)
from empires
where empire='Iberian';

-- b: 4
select count(distinct CountryCode)
from countries_continents
where CountryCode in 
(select CountryCode 
from countries_continents
group by CountryCode
having count(continent)>=2) and continent='Asia';

-- c: 236902.8
select sum(cl.Percentage*c.Population/100)
from countries c
join countries_continents cc on  cc.CountryCode=c.code
join countries_languages cl on cl.countrycode=cc.CountryCode
where cc.continent='Europe' and c.Population>50000000 and cl.language='Spanish'

-- d: 1
select count(distinct cl.language)
from countries_languages cl
where countrycode IN (
    select cl.CountryCode
    from countries_languages cl
    join empires e on cl.CountryCode=e.countrycode
    where e.empire='Danish Empire')
group by cl.language
having count(distinct countrycode) = (
    select count(distinct cl.CountryCode)
    from countries_languages cl
    join empires e on cl.CountryCode=e.countrycode
    where e.empire='Danish Empire')

select count(distinct cl.language)
from countries_languages cl
join empires e on cl.CountryCode=e.countrycode
where e.empire='Danish Empire'
group by cl.language
having count(distinct cl.countrycode) = (
    select count(distinct cl.CountryCode)
    from countries_languages cl
    join empires e on cl.CountryCode=e.countrycode
    where e.empire='Danish Empire')


-- 1
select count(*)
from empires
where empire='Iberian'

-- 2
select count(*)
from (
select countrycode
from countries_continents
group by countrycode
having count(continent)>1
) x

-- 3
select sum(c.population * cl.Percentage/100)
from countries c
join countries_continents cc on c.code=cc.countrycode
join countries_languages cl on cc.countrycode=cl.countrycode
where cc.continent='North America' and c.population>80000000 and cl.language='Spanish'

-- 
select count(*)
from(
select cl.language
from countries_languages cl
join empires e on cl.countrycode=e.countrycode
where e.empire='Danish Empire'
group by cl.language 
having count(distinct cl.countrycode)= (
    select count(*)
    from empires 
    where empire='Danish Empire'
    )
) x



