
CREATE OR REPLACE FUNCTION find_similar_movies(the_title text)
RETURNS TABLE(stitle text) AS $$
DECLARE
 v_title text;
 v_genre cube;
BEGIN
 v_title := the_title;
 select m.genre INTO v_genre from movies m where m.title=the_title LIMIT 1;
 return QUERY select m.title from movies m where cube_enlarge(v_genre, 5, 18) @> m.genre and m.title <> v_title 
 order by cube_distance(m.genre, v_genre) limit 5;
END;
$$ LANGUAGE plpgsql;

create index if not exists actors_name on actors using hash(name);

CREATE OR REPLACE FUNCTION find_movies_by_actor(the_actor text)
RETURNS TABLE(stitle text) AS $$
DECLARE
 v_actor text;
BEGIN
 v_actor := the_actor;
 return QUERY select m.title from movies_actors ma join actors a ON (ma.actor_id=a.actor_id) join movies m ON (ma.movie_id=m.movie_id)
  where a.name = v_actor limit 5; 
END;
$$ LANGUAGE plpgsql;

