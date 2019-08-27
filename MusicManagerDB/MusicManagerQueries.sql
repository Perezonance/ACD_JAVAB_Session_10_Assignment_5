/* Query 1 */
select distinct a.artist_id, a.artist_name
from music_manager.artists a, music_manager.albums b, music_manager.albums c
where a.artist_id = b.album_artist_id 
and a.artist_id = c.album_artist_id 
and b.album_id <> c.album_id 
and b.album_type = 'live' 
and c.album_type = 'compilation' 
and b.album_year = c.album_year;

/* Query 2 */
select distinct artist_name
from music_manager.artists a, music_manager.albums b
where a.artist_id = b.album_artist_id
and not exists(
	select c.artist_name
    from music_manager.artists c, music_manager.albums d
    where d.album_type = "Compilation"
    and d.album_type = "Live"
    and a.artist_id = c.artist_id
    and c.artist_id = d.album_artist_id
);

/* Query 3 */
select distinct a.album_id, a.album_title
from albums a, artists art
where a.album_artist_id = art.artist_id
and art.artist_type = 'band'
and not exists
	(select b.album_title
    from albums b, artists art
    where a.album_artist_id = b.album_artist_id
    and a.album_year > b.album_year
    and (a.album_rating < b.album_rating or a.album_rating = b.album_rating));

/* Query 4 */
select distinct a.album_id, a.album_title
from albums a, artists art
where art.nationality = 'English'
and a.album_type = 'live'
and a.album_rating > (select avg(album_rating)
		from albums b where b.album_year = a.album_year);

/* Query 5 */
select distinct song.track_name, album.album_title, artist.artist_name, song.track_length, album.album_year, album.album_rating
from tracks song, albums album, artists artist
where song.track_length < 154
and song.track_album_id = album.album_id
and album.album_artist_id = artist.artist_id
and (2019 - album.album_year) < 20
and album_rating > 3;

/* Query 6 */
select sum(total_length) / count(*) as 'avg_album_length'
from albums album, (
	select track_album_id, sum(track_length) as 'total_length', count(distinct track_id) as 'counts'
		from tracks
		group by track_album_id
		having count(distinct track_id) > 9 ) more9
where album.album_id = more9.track_album_id
and album.album_year > 1989
and album.album_year < 2000;

/* Query 7 */
SELECT artists.artist_id, artists.artist_name
FROM artists
WHERE artists.artist_id NOT IN (
	SELECT album1.album_artist_id
	FROM albums album1, albums album2
	WHERE album1.album_artist_id = album2.album_artist_id
	AND album1.album_id <> album2.album_id
	AND album1.album_year > album2.album_year
	AND album1.album_type = 'studio'
	AND album2.album_type = 'studio'
	AND album1.album_year - album2.album_year > 4
	AND NOT EXISTS (SELECT *
		FROM albums album3
		WHERE album3.album_id <> album1.album_id
		AND album3.album_id <> album2.album_id
		AND album3.album_artist_id = album1.album_artist_id
		AND (album3.album_year <= album1.album_year
		AND album3.album_year >= album2.album_year)));

/* Query 8 */
select a.artist_id, a.artist_name, a.count as live_compilation_count, b.count as studio_count
from
	(select artist.artist_id, artist.artist_name, album.album_type, count(*) as count
	from artists artist, albums album
	where artist.artist_id = album.album_artist_id
	and (album.album_type = 'compilation'
		or album.album_type = 'live')
	group by artist.artist_name) a,
    
	(select artist.artist_id, artist.artist_name, album.album_type, count(*) as count
	from artists artist, albums album
	where artist.artist_id = album.album_artist_id
	and album.album_type = 'studio'
	group by artist.artist_name) b
    
where a.artist_name = b.artist_name
and a.count > b.count;

/* Query 9 */
select album.album_id, album.album_title, avg(track.track_length)
from albums album, tracks track
where album.album_id = track.track_album_id
group by album.album_title
having count(track.track_album_id) = max(track.track_number);

/* Query 10 */
select a.artist_id, a.artist_name
from artists a, albums b
where a.artist_id in (
	select artist_id
	from artists, albums
	where artists.artist_id = albums.album_artist_id
	and albums.album_type = 'studio'
	group by artists.artist_id
	having count(*) >2)
and a.artist_id in (
	select artist_id
	from artists, albums
	where artists.artist_id = albums.album_artist_id
	and albums.album_type = 'live'
	group by artists.artist_id
	having count(*) > 1)
and a.artist_id in (
	select artist_id
	from artists, albums
	where artists.artist_id = albums.album_artist_id
	and albums.album_type = 'compilation'
	group by artists.artist_id
	having count(*) > 0)
and a.artist_id not in (
	select artist_id
	from artists, albums
	where artists.artist_id = albums.album_artist_id
	and albums.album_rating < 3
	group by artist_id)
group by a.artist_id;

/* Query 11 */
select a.artist_id, a.artist_name
from artists a, albums b
where a.artist_id = b.album_artist_id
and a.artist_type = 'band'
and a.nationality = 'American'
and b.album_year = (select min(c.album_year)
	from albums c
    where b.album_artist_id = c.album_artist_id)
and b.album_rating = 5;

/* Query 12 */
select b.artist_name, 
	cast(
	(sum(case when a.album_rating < 3 then 1 else 0 end)
	 / count(*)  * 100) as decimal(8,2)) as p
from albums a, artists b
where a.album_artist_id = b.artist_id
group by a.album_artist_id
order by p asc;

/* Query 13 */
SELECT a.artist_name
FROM (
	SELECT artists.artist_name, artists.nationality, count(*) AS studio_count
	FROM artists, albums
	WHERE artists.artist_id = albums.album_artist_id
	AND albums.album_type = 'studio'
	GROUP BY artist_id
	ORDER BY nationality ASC, studio_count DESC) a
WHERE a.studio_count = (
	SELECT Max(studio_count)
	FROM (
		SELECT artists.artist_name, artists.nationality, count(*) AS studio_count
		FROM artists, albums
		WHERE artists.artist_id = albums.album_artist_id
		AND albums.album_type = 'studio'
		GROUP BY artist_id
		ORDER BY nationality ASC, studio_count DESC) b
	WHERE a.nationality = b.nationality);
    
/* Query 14 */
select a.album_title, b.album_title
from albums a, albums b, artists a1, artists b1
where a.album_artist_id = a1.artist_id
and b.album_artist_id = b1.artist_id
and a.album_id <> b.album_id
and a1.nationality <> b1.nationality
and a.album_rating > b.album_rating;

/* Query 15 */
SELECT albums.album_title, 
SUM(CASE WHEN albums.album_id = tracks.track_album_id 
	THEN 1 ELSE 0 END) AS track_count,
	CASE WHEN (SUM(CASE WHEN albums.album_id = tracks.track_album_id 
	THEN 1 ELSE 0 END)) = 0 THEN null ELSE 
	albums.album_rating / (SUM(CASE WHEN albums.album_id = tracks.track_album_id 
	THEN 1 ELSE 0 END)) END AS ratio
FROM albums, tracks
GROUP BY albums.album_id
ORDER BY ratio DESC;
