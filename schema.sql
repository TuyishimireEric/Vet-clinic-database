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

/* add "join table" for visits */
CREATE TABLE vets(
    id SERIAL PRIMARY KEY, 
    name text, 
    age dec, 
    date_of_graduation date
);

CREATE TABLE specializations (
    species_id INT, vets_id INT, 
    FOREIGN kEY (species_id) REFERENCES species(id), 
    FOREIGN kEY (vets_id) REFERENCES vets(id),
    PRIMARY kEY (species_id, vets_id)
);

CREATE TABLE visits (
    id SERIAL, 
    animals_id INT, 
    vets_id INT, 
    date_of_visit DATE, 
    FOREIGN KEY (animals_id) REFERENCES animals(id),
    FOREIGN KEY (vets_id) REFERENCES vets(id), 
    PRIMARY KEY (id)
);

---------- database performance audit -------------------
ALTER TABLE owners ADD COLUMN email VARCHAR(120);
