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