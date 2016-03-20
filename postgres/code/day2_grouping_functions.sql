
INSERT INTO events (title, starts, ends, venue_id) VALUES ( 'Moby' , '2012-02-06 21:00' , '2012-02-06 23:00' ,( SELECT venue_id FROM venues WHERE name = 'Crystal Ballroom' ) ); 

INSERT INTO events (title, starts, ends, venue_id) VALUES ( 'Wedding' , '2012-02-26 21:00' , '2012-02-06 23:00' ,( SELECT venue_id FROM venues WHERE name = 'Voodoo Donuts' ) );

INSERT INTO events (title, starts, ends, venue_id) VALUES ( 'Dinner with Mon' , '2012-02-26 18:00' , '2012-02-06 20:30' ,( SELECT venue_id FROM venues WHERE name = 'My Place' ) );

INSERT INTO events (title, starts, ends) VALUES ( 'Valentines Day' , '2012-02-06 21:00' , '2012-02-06 23:00'); 

