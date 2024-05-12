select *
from sports
order by name;

select *
from results
order by peopleid, sportid
-- The name of all sports with at least one result.

insert into sports(id, name, record)
values(7, 'Table Tennis', 15.5);

insert into results(peopleid, competitionid, sportid, result)
values(1, 1, 7, 15.5);

select name
from sports s
join results r on s.id=r.sportid
group by name
having count(name)>=1;

-- The number of athletes who have competed in at least one sport
select count(DISTINCT peopleid)
from results

-- The ID and name of athletes who have at least twenty results
select p.id, p.name
from people p
join results r on p.id=r.peopleid
group by id
having count(id)>=20

-- The ID, name and gender description of all athletes that currently hold a record.
delete from results
where sportid=7

select distinct p.id, p.name, g.description
from people p
join gender g on p.gender=g.gender
join results r on p.id=r.peopleid
join sports s on r.sportid=s.id
where r.result=s.record
order by p.id

-- For each sport, where some athlete holds the record, the name of the
-- sport and the number of athletes that hold a record in that sport; the last
-- column should be named “numathletes”
select s.name, count(distinct r.peopleid) AS numathletes
from sports s
join results r on r.sportid=s.id
where r.result=s.record
group by s.name

select r.peopleid, s.name, s.record
from sports s
join results r on r.sportid=s.id
where r.result=s.record
order by name

-- The ID and name of each athlete that has at least twenty results in the
-- triple jump, their best result, along with the difference between the
-- record and their best result. The second-to-last column should be named
-- “best” while the last column should be named “difference”. The last
-- column should always contain non-negative values and should preferably
-- be formatted to show at least one digit before the decimal point and
-- exactly two digits after the decimal point.
select p.id, p.name AS people, max(r.result) AS best, to_char(max(s.record)-max(r.result), '0D99') AS difference
from people p
join results r on p.id=r.peopleid
join sports s on r.sportid=s.id
where s.name='Triple Jump'
group by p.id
having count(result)>=20

select p.id, p.name AS people, s.name AS sport, r.competitionid,r.result, s.record
from people p
join results r on p.id=r.peopleid
join sports s on r.sportid=s.id
where s.name='Triple Jump'
order by id

-- The ID, name and gender description of all athletes who participated in the
-- competition held in Hvide Sande in 2009.
select distinct p.id, p.name, g.description
from people p
join gender g on p.gender=g.gender
join results r on p.id=r.peopleid
join competitions c on r.competitionid=c.id
where c.place='Hvide Sande' and extract(year from c.held)=2009
order by p.id

select *
from people p
join gender g on p.gender=g.gender
join results r on p.id=r.peopleid
join competitions c on r.competitionid=c.id
order by p.id

-- The name and gender description of all people with a last name that starts
-- with a “J” and ends with a “sen” (e.g., Jensen, Jansen, Johansen).
select p.name, g.description
from people p
join gender g on p.gender=g.gender
where p.name like '% J%sen'

-- For each result, the name of the athlete, the name of the sport, and the
-- percentage of the record achieved by the result (a result that is a record
-- should therefore appear as 100; this column should be named
-- “percentage”). Preferably, format the last column to show only whole
-- numbers, as well as the % sign, you can use CASE to detect when the
-- result is NULL and when not.
-- ???????????, why must round instead to_char
select p.name, s.name, 
case
when r.result is null then 'null'
else concat(cast(round(100*r.result/s.record) as char(2)), '%') 
end as percentage
from people p 
join results r on p.id=r.peopleid
join sports s on r.sportid=s.id
order by p.id, s.name

select P.name, S.name, 
	case when R.result is not null 
	then to_char(100*R.result/S.record, '990D99%') 
	else null 
	end as percentage
from People P 
	join Results R on P.ID = R.peopleID 
	join Sports S on S.ID = R.sportID
order by p.id, s.name


-- The number of athletes with some incomplete result registrations. 
select count(distinct p.id)
from people p
join results r on p.id=r.peopleid
where result is null

-- For each sport, show the ID and name of the sport and the best
-- performance over all athletes and competitions. This last column should
-- be called ‘maxres’ and should be formatted to show at least one digit
-- before the decimal point and exactly two digits after the decimal point.
-- The query result should be ordered by the sport ID.
select s.id, s.name, cast(max(r.result) as decimal(10,2)) as maxres
from results r
join sports s on r.sportid=s.id
group by s.id
order by s.id

-- Show the ID and name of athletes who hold a record in at least two sports,
-- along with the total number of their record-setting or record-equaling
-- results. 
select p.id, p.name, count(s.id) as numberofrecords
from people p 
join results r on p.id=r.peopleid
join sports s on r.sportid=s.id
where r.result=s.record 
group by p.id
having count(distinct s.id)>=2

select *
from people p 
join results r on p.id=r.peopleid
join sports s on r.sportid=s.id
where r.result=s.record 
order by p.id

-- Show the ID, name, and height of athletes who have achieved the best
-- result in each sport, along with the result, the name of the sport, and a
-- column called ‘record?’ which contains 1 if the result is a record or 0 if the
-- result is not a record. Note that for each sport there may be many
-- athletes who share the best result, in this case all the rows should be in
-- the result. If you can print ‘yes’ and ‘no’ instead of 1 and 0, all the better. 
select distinct p.id, p.name, p.height, r.result, s.name,
case
when r.result=s.record then 'yes'
else 'no'
end as record
from results r 
join people p on r.peopleid=p.id
join sports s on r.sportid=s.id
join (
    select sportid, max(result)
    from results
    group by sportid  
) as best_results
on r.sportid=best_results.sportid and best_results.max=r.result
order by p.id, s.name

select distinct P.ID, P.name, P.height, R.result, S.name, 
case (R.result = S.record) 
when true then 'Yes' 
else 'No' end as "record?"
from People P, Results R, Sports S
where P.ID = R.peopleID
  and S.ID = R.sportID
  and R.result = (
    select max(R1.result)
    from Results R1
    where R1.sportID = R.sportID
);

-- The ID and name of all athletes who have not participated in any
-- competitions. 
select p.id, p.name
from people p
left join results r on p.id=r.peopleid
where r.competitionid is null

select P.ID, P.name
from People P
where not exists (
    select *
    from Results R
    where R.peopleID = P.ID
);


-- The ID and name of athletes who have competed in June of 2002 or hold a
-- record in High Jump.




