/* Database schema to keep the structure of entire database. */

vet_clinic=# CREATE TABLE animals( 
    id int primary key,
    name text,
    date_of_birth date,
    escape_attempts int,
    neutered boolean, 
    weight_kg float
);

ALTER TABLE animals
ADD COLUMN species text;

/* query multiple tables */
CREATE TABLE owners( id SERIAL PRIMARY KEY, full_name text, age dec);
CREATE TABLE species( id SERIAL PRIMARY KEY, name text);
ALTER TABLE animals DROP COLUMN species;
ALTER TABLE animals ADD COLUMN species_id INT REFERENCES species(id);
ALTER TABLE animals ADD COLUMN owners_id INT REFERENCES owners(id);

