-- a : 345
select count(songid)
from songs
where duration >= INTERVAL '10 minutes' and duration<=INTERVAL '30 minutes';

-- b : 28
select round(sum(extract(epoch from duration))/3600) as total_hours
from songs
where isexplicit=1;

-- c : 833
select max(num_release)
from 
    (select count(songid) as num_release
    from songs
    group by extract(year from ReleaseDate)) as num_release_list;


-- d : 277

-- wrong anser 266. The songs should belong to Elton John, not the album
select max(average_duration)
from
    (select round(avg(extract(epoch from s.duration))) average_duration, aa.AlbumId
    from albumartists aa
    join artists a on aa.artistid=a.artistid
    join albumsongs aso on aa.albumid=aso.albumid
    join songs s on aso.songid=s.songid
    where a.artist='Elton John'
    group by aa.albumid) as average_list;

SELECT MAX(avg_duration) AS max_average_duration
FROM (
    SELECT round(avg(extract(epoch from s.duration))) AS avg_duration, al.AlbumId
    FROM AlbumSongs al 
    JOIN Songs s ON al.SongId = s.SongId
    JOIN Artists ar ON s.ArtistId = ar.ArtistId
    WHERE ar.Artist = 'Elton John'
    GROUP BY al.AlbumId
) AS subquery;

-- e : 4565 (distinct!!)
select count(distinct sg.songid)
from genres g
join songgenres sg on g.genreid=sg.genreid
where genre like 'Alter%'

-- f : 11996
-- 1st solution:
select count(distinct songid)
from (
    -- select all songs, which release date is less than 2007
    select songs.songid
    from songs
    where extract(year from ReleaseDate)<2007

    union all
    -- select all songs, whoes album's release date is more than 2010
    select distinct aso.songid
    from albumsongs aso
    join albums a on a.albumid=aso.albumid
    where extract(year from a.albumreleasedate) >2010
) as combined_results;

-- 2nd solution: left join(keep the songs which are not contained in any of album )
select count(distinct s.songid)
from songs s
left join albumsongs aso on s.songid=aso.songid
left join albums a on aso.albumid=a.albumid
where extract(year from a.albumreleasedate)>2010 or extract(year from s.ReleaseDate)<2007

-- g : 14
-- soulution 1
SELECT a.albumid
FROM albumsongs a
JOIN songs s ON a.songid = s.songid
GROUP BY a.albumid
HAVING COUNT(a.songid) > 1
AND SUM(CASE WHEN s.isexplicit = 0 THEN 1 ELSE 0 END) = 0;

-- soulution 2
SELECT a.albumid
FROM albumsongs a
JOIN songs s ON a.songid = s.songid
WHERE s.isexplicit = 1
AND a.albumid NOT IN (
    SELECT a.albumid
    FROM albumsongs a
    JOIN songs s ON a.songid = s.songid
    WHERE s.isexplicit = 0
)
group by a.albumid
having count(*) > 1

-- h :
select album
from albums
where albumid=(
    select albumid
    from albumgenres
    group by albumid
    having count(genreid)=(
    select max(num)
    from 
        (select count(*) as num
        from albumgenres
        group by albumid) as al_genre
    )
)





