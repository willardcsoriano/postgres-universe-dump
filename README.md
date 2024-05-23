# Universe Database Dump

This repository contains the SQL dump file for the `universe` database. The `universe.sql` file includes the SQL commands required to create the database schema and populate it with sample data. This project is part of the freeCodeCamp curriculum.

## Contents

- `universe.sql`: SQL dump file containing the database schema and data.

## Database Schema

The `universe` database consists of the following tables:

1. **galaxy**
   - `galaxy_id`: Serial primary key
   - `name`: Unique name of the galaxy (VARCHAR)
   - `type`: Type of galaxy (TEXT)
   - `num_of_stars`: Number of stars in the galaxy (BIGINT)
   - `diameter_kly`: Diameter in kilolight-years (NUMERIC)
   - `is_barred`: Indicates if the galaxy is barred (BOOLEAN)

2. **star**
   - `star_id`: Serial primary key
   - `name`: Unique name of the star (VARCHAR)
   - `galaxy_id`: Foreign key referencing `galaxy(galaxy_id)`
   - `type`: Type of star (TEXT)
   - `mass_solar`: Mass of the star in solar masses (INT)
   - `is_main_sequence`: Indicates if the star is a main sequence star (BOOLEAN)

3. **planet**
   - `planet_id`: Serial primary key
   - `name`: Unique name of the planet (VARCHAR)
   - `star_id`: Foreign key referencing `star(star_id)`
   - `type`: Type of planet (TEXT)
   - `mass_earth`: Mass of the planet in Earth masses (INT)
   - `has_rings`: Indicates if the planet has rings (BOOLEAN)

4. **moon**
   - `moon_id`: Serial primary key
   - `name`: Unique name of the moon (VARCHAR)
   - `planet_id`: Foreign key referencing `planet(planet_id)`
   - `diameter_km`: Diameter in kilometers (NUMERIC)
   - `is_geologically_active`: Indicates if the moon is geologically active (BOOLEAN)

5. **comet**
   - `comet_id`: Serial primary key
   - `name`: Unique name of the comet (VARCHAR)
   - `star_id`: Foreign key referencing `star(star_id)`
   - `perihelion_distance`: Perihelion distance in AU (NUMERIC)
   - `is_periodic`: Indicates if the comet is periodic (BOOLEAN)

## Sample Data

The `universe.sql` file includes sample data for each table:

- **galaxy**: Milky Way, Andromeda, Triangulum, Whirlpool, Pinwheel, Sombrero
- **star**: Sun, Sirius, Proxima Centauri, Betelgeuse, Rigel, Vega
- **planet**: Mercury, Venus, Earth, Mars, Jupiter, Saturn, Uranus, Neptune, Gliese 581g, HD 209458b, K
