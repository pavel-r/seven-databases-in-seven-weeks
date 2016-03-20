CREATE TABLE countries (
 country_code char (2) PRIMARY KEY,
 country_name text UNIQUE
);

INSERT INTO countries (country_code, country_name) 
VALUES ('us','UnitedStates'),('mx','Mexico'),('au','Australia'),('gb','UnitedKingdom'),('de','Germany'),('ll','Loompaland');

CREATE TABLE cities (
 name text NOT NULL,
 postal_code varchar(9) CHECK (postal_code <> ''),
 country_code char(2) REFERENCES countries,
 PRIMARY KEY(country_code,postal_code)
);

INSERT INTO cities 
VALUES ('Portland','97205','us');

-- UPDATE cities SET postal_code='97205' WHERE name='Portland';
-- COMMIT;

CREATE TABLE venues (
 venue_id SERIAL PRIMARY KEY,
 name varchar(255),
 street_address text,
 type char(7) CHECK (type in ('public','private')) DEFAULT 'public',
 postal_code varchar(9),
 country_code char(2),
 FOREIGN KEY (country_code, postal_code) REFERENCES cities(country_code, postal_code) MATCH FULL
);

INSERT INTO venues (name, postal_code, country_code) 
VALUES ('CrystalBallroom','97205','us');

CREATE TABLE events (
	event_id SERIAL PRIMARY KEY,
	title text,
	starts timestamp,
	ends timestamp,
	venue_id int REFERENCES venues
);

CREATE INDEX events_title ON events USING hash(title);

insert into venues (name, postal_code, country_code) values ('Voodoo Donuts', '97205', 'us') returning venue_id;

insert into events (title, starts, ends, venue_id, event_id) 
values ('LARP Club', '2012-02-15 17:30:00', '2012-02-15 19:30:00', 2, 1);

insert into events (title, starts, ends, event_id) 
values ('April Fools Day', '2012-04-01 17:30:00', '2012-04-01 23:59:00', 2);

insert into events (title, starts, ends, event_id) 
values ('Christmas Day', '2012-12-25 00:00:00', '2012-12-25 23:59:00', 3); 

create index events_start on events using btree (starts);

-- TASK

select e.title, c.country_name from events e 
 join venues v on e.venue_id = v.venue_id 
 join countries c on v.country_code = c.country_code;

alter table venues add column active boolean default 'true';



INSERT INTO events (title, starts, ends, venue_id) VALUES ( 'Moby' , '2012-02-06 21:00' , '2012-02-06 23:00' ,( SELECT venue_id FROM venues WHERE name = 'Crystal Ballroom' ) ); 

INSERT INTO events (title, starts, ends, venue_id) VALUES ( 'Wedding' , '2012-02-26 21:00' , '2012-02-06 23:00' ,( SELECT venue_id FROM venues WHERE name = 'Voodoo Donuts' ) );

INSERT INTO events (title, starts, ends, venue_id) VALUES ( 'Dinner with Mon' , '2012-02-26 18:00' , '2012-02-06 20:30' ,( SELECT venue_id FROM venues WHERE name = 'My Place' ) );

INSERT INTO events (title, starts, ends) VALUES ( 'Valentines Day' , '2012-02-06 21:00' , '2012-02-06 23:00'); 

