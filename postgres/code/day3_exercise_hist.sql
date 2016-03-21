
select title from movies where title ilike 'stardust%';

select count(*) from movies where title !~* '^the.*';

select levenshtein('pasha', 'data');

select * from movies where levenshtein(lower(title), lower('a hard day night')) <= 3;

select show_trgm('Avatar');

select * from movies where title % 'Avatre';

explain verbose select * from movies where title % 'Avatre';
create index movies_title_trigram on movies using gist (title gist_trgm_ops);
explain verbose select * from movies where title % 'Avatre';

select title from movies where title @@ 'night & day';
explain select title from movies where title @@ 'night & day';
create index movies_title_searchable on movies using gin(to_tsvector('english', title));
explain verbose select title from movies where title @@ 'night & day';
explain verbose select title from movies where to_tsvector('english', title) @@ 'night & day';

select * from actor where name % 'Bruse Willis';
select * from actors where name % 'Bruse Willis';
select * from actors where name % 'Broose Wilis';
select * from actors where metaphone('Broose Wilis', 6);
select * from actors where metaphone(name, 6) = metaphone('Broose Wilis', 6);
select * from actors where metaphone(name, 6) % metaphone('Broose WIlis', 8);
select * from actors where metaphone(name, 6) % metaphone('Robin Williams', 8) order by levenshtein(lower('Robin Williams'), lower(name));
select * from actors where metaphone(name, 8) % metaphone('Robin Williams', 8) order by levenshtein(lower('Robin Williams'), lower(name));

SELECT name, cube_ur_coord( '(0,7,0,0,0,0,0,0,0,7,0,0,0,0,10,0,0,0)' , position) as score FROM genres g 
WHERE cube_ur_coord( '(0,7,0,0,0,0,0,0,0,7,0,0,0,0,10,0,0,0)' , position) > 0; 

SELECT name, cube_ur_coord( '(0,7,0,0,0,0,0,0,0,7,0,0,0,0,10,0,0,0)' , position) as score FROM genres g 
WHERE cube_ur_coord( '(0,7,0,0,0,0,0,0,0,7,0,0,0,0,10,0,0,0)' , position) > 0;

SELECT *, cube_distance(genre, '(0,7,0,0,0,0,0,0,0,7,0,0,0,0,10,0,0,0)' ) dist FROM movies ORDER BY dist; 

select m.movie_id, m.title from movies m, (select genre, title from movies where title='Mad Max') s where cude_enlarge(s.genre, 5, 18) @> m.genre limit 10;

select m.movie_id, m.title from movies m, (select genre, title from movies where title='Mad Max') s
where cube_enlarge(s.genre, 6, 18) @> m.genre limit 10;

select m.movie_id, m.title from movies m, (select genre, title from movies where title='Mad Max') s
where cube_enlarge(s.genre, 5, 18) @> m.genre and m.title <> s.title order by cude_distance(m.genre, s.genre) limit 10;

select m.movie_id, m.title from movies m, (select genre, title from movies where title='Mad Max') s
where cube_enlarge(s.genre, 5, 18) @> m.genre and m.title <> s.title order by cube_distance(m.genre, s.genre) limit 10;

select m.movie_id, m.title from movies m, (select genre, title from movies where title='Mad Max') s
where cube_enlarge(s.genre, 5, 18) @> m.genre and m.title <> s.title order by cube_distance(m.genre, s.genre) limit 10;

select m.movie_id, m.title cube_distance(s.genre, m.genre) from movies m, (select genre, title from movies where title='Mad Max') s
where cube_enlarge(s.genre, 5, 18) @> m.genre and m.title <> s.title order by cube_distance(m.genre, s.genre) limit 10;

select m.movie_id, m.title cube_distance(s.genre, m.genre) from movies m, (select genre, title from movies where title='Mad Max') s
where cube_enlarge(s.genre, 5, 18) @> m.genre and m.title <> s.title order by cube_distance(m.genre, s.genre) limit 10;

select m.movie_id, m.title, cube_distance(s.genre, m.genre) from movies m, (select genre, title from movies where title='Mad Max') s
where cube_enlarge(s.genre, 5, 18) @> m.genre and m.title <> s.title order by cube_distance(m.genre, s.genre) limit 10;

select m.movie_id, m.title, cube_distance(s.genre, m.genre) from movies m, (select genre, title from movies where title='Mad Max') s
where cube_enlarge(s.genre, 5, 18) @> m.genre and m.title <> s.title order by cube_distance(m.genre, s.genre) limit 30;

