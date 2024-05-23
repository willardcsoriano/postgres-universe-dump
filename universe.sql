-- Connect to the database server
\connect postgres freecodecamp

-- Create the universe database
CREATE DATABASE universe;
\c universe

-- Create tables
CREATE TABLE galaxy (
    galaxy_id SERIAL PRIMARY KEY,
    name VARCHAR(255) UNIQUE NOT NULL,
    type TEXT NOT NULL,
    num_of_stars BIGINT NOT NULL,
    diameter_kly NUMERIC NOT NULL,
    is_barred BOOLEAN NOT NULL
);

CREATE TABLE star (
    star_id SERIAL PRIMARY KEY,
    name VARCHAR(255) UNIQUE NOT NULL,
    galaxy_id INT REFERENCES galaxy(galaxy_id) NOT NULL,
    type TEXT NOT NULL,
    mass_solar INT NOT NULL,
    is_main_sequence BOOLEAN NOT NULL
);

CREATE TABLE planet (
    planet_id SERIAL PRIMARY KEY,
    name VARCHAR(255) UNIQUE NOT NULL,
    star_id INT REFERENCES star(star_id) NOT NULL,
    type TEXT NOT NULL,
    mass_earth INT NOT NULL,
    has_rings BOOLEAN NOT NULL
);

CREATE TABLE moon (
    moon_id SERIAL PRIMARY KEY,
    name VARCHAR(255) UNIQUE NOT NULL,
    planet_id INT REFERENCES planet(planet_id) NOT NULL,
    diameter_km NUMERIC NOT NULL,
    is_geologically_active BOOLEAN NOT NULL
);

CREATE TABLE comet (
    comet_id SERIAL PRIMARY KEY,
    name VARCHAR(255) UNIQUE NOT NULL,
    star_id INT REFERENCES star(star_id) NOT NULL,
    perihelion_distance NUMERIC NOT NULL,
    is_periodic BOOLEAN NOT NULL
);

-- Insert data into galaxy table
INSERT INTO galaxy (name, type, num_of_stars, diameter_kly, is_barred) VALUES
('Milky Way', 'Spiral', 100000000000, 105.7, true),
('Andromeda', 'Spiral', 1000000000000, 220, false),
('Triangulum', 'Spiral', 40000000, 60, false),
('Whirlpool', 'Spiral', 800000000, 76, true),
('Pinwheel', 'Spiral', 1000000000, 170, false),
('Sombrero', 'Elliptical', 800000000, 50, false);

-- Insert data into star table
INSERT INTO star (name, galaxy_id, type, mass_solar, is_main_sequence) VALUES
('Sun', 1, 'G-type', 1, true),
('Sirius', 1, 'A-type', 2, true),
('Proxima Centauri', 2, 'M-type', 0.12, true),
('Betelgeuse', 2, 'M-type', 20, false),
('Rigel', 3, 'B-type', 18, false),
('Vega', 3, 'A-type', 2.1, true);

-- Insert data into planet table
INSERT INTO planet (name, star_id, type, mass_earth, has_rings) VALUES
('Mercury', 1, 'Terrestrial', 0.055, false),
('Venus', 1, 'Terrestrial', 0.815, false),
('Earth', 1, 'Terrestrial', 1, false),
('Mars', 1, 'Terrestrial', 0.107, false),
('Jupiter', 1, 'Gas Giant', 317.8, true),
('Saturn', 1, 'Gas Giant', 95.2, true),
('Uranus', 1, 'Ice Giant', 14.6, true),
('Neptune', 1, 'Ice Giant', 17.2, true),
('Gliese 581g', 3, 'Super-Earth', 3.1, false),
('HD 209458b', 4, 'Hot Jupiter', 220, true),
('Kepler-22b', 5, 'Super-Earth', 2.4, false),
('TrES-2b', 6, 'Gas Giant', 150, true);

-- Insert data into moon table
INSERT INTO moon (name, planet_id, diameter_km, is_geologically_active) VALUES
('Moon', 3, 3474.2, false),
('Phobos', 4, 22.2, false),
('Deimos', 4, 12.4, false),
('Io', 5, 3643.2, true),
('Europa', 5, 3121.6, true),
('Ganymede', 5, 5262.4, false),
('Callisto', 5, 4820.6, false),
('Titan', 6, 5150, true),
('Enceladus', 6, 504.2, true),
('Mimas', 6, 396.4, false),
('Tethys', 6, 1066, false),
('Dione', 6, 1122.6, false),
('Rhea', 6, 1527.6, false),
('Iapetus', 6, 1469, false),
('Miranda', 7, 471.6, false),
('Ariel', 7, 1158.8, false),
('Umbriel', 7, 1169.4, false),
('Titania', 7, 1577.8, false),
('Oberon', 7, 1522.8, false),
('Triton', 8, 2706.8, true);

-- Insert data into comet table
INSERT INTO comet (name, star_id, perihelion_distance, is_periodic) VALUES
('Halleys Comet', 1, 0.586, true),
('Hale-Bopp', 1, 0.914, true),
('Comet NEOWISE', 1, 0.295, false),
('Comet Hyakutake', 1, 0.230, false),
('Comet Encke', 1, 0.336, true),
('Comet Borrelly', 1, 0.175, true);
