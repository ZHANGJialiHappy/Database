Country(CID, name, population)
Developer(DID, name, since, CID)
Game(GID, name, genre, DID)
Person (PID, name, birthyear)
Buys (GID, PID, year)
Plays (GID, PID)

select count(*)
from buys b 
join game g on b.gid=g.gid
where g.genre= 'Role-playing' and b.year='2001'

select count(distinct p.pid)
from country c
join developer d on d.cid=c.cid 
join game g on g.did= d.did
join buys b on g.gid=b.gid
join person p on p.pid=b.pid
where b.year < d.since
and b.year> p.birthyear
and c.name='Denmark';

select count(*)
from Game g
where g.name like '%Zelda%'

Country(CID, name, population)
Developer(DID, name, since, CID)
Game(GID, name, genre, DID)
Person (PID, name, birthyear)
Buys (GID, PID, year)
Plays (GID, PID)

-- 9:238
select count(*)
from(
    select  b.pid
    from buys b 
    join plays pl on b.pid=pl.pid and b.gid=pl.gid
    where b.year =2020
    union 
    select p.pid
    from person p
    where p.birthyear>1990)
 x;

select count(p.pid)
from person p
where p.birthyear >1990
or p.pid in(
    select b.pid
    from buys b
    join plays pl on b.pid=pl.pid and b.gid=pl.gid
    where b.year=2020
)


Country(CID, name, population)
Developer(DID, name, since, CID)
Game(GID, name, genre, DID)
Person (PID, name, birthyear)
Buys (GID, PID, year)
Plays (GID, PID)
-- 11

select distinct pid
from buys
group by gid, pid
having count(year)!=1


select count(distinct b.pid)
from buys b 
left join plays p on b.gid=p.gid and b.pid=p.pid
where p.gid is not null and p.pid is not null

-- 13
select count(*)
from (
    select distinct p.pid
    from plays p
    group by p.pid
    having count(distinct p.gid) > (
    select count( distinct b.gid)
    from buys b
    group by b.pid
    having b.pid= p.pid
    )
) x;
-- 

select 
from plays p 
full outer join buys b on b.gid=p.gid and b.pid=p.pid
where b.pid is null and b.

Country(CID, name, population)
Developer(DID, name, since, CID)
Game(GID, name, genre, DID)
Person (PID, name, birthyear)
Buys (GID, PID, year)
Plays (GID, PID)
-- 15

select count(distinct p.pid)
from person p 
join buys b on p.pid=b.pid
join game g on b.gid=g.gid
join developer d on g.did=d.did
join country c on d.cid=c.cid
where c.population >30000000

-- 17
select g.gid
from developer d
join game g on d.did=g.did
where since =1969

select count(distinct b.pid)
from buys b
where b.gid in (
    select g.gid
    from developer d
    join game g on d.did=g.did
    where since =1960
)


