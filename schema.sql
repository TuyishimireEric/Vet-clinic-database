/* Database schema to keep the structure of entire database. */

vet_clinic=# CREATE TABLE animals( 
    id int primary key,
    name text,
    date_of_birth date,
    escape_attempts int,
    neutered bit, 
    weight_kg dec 
);
