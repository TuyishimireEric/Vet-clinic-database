/* Find all animals whose name ends in "mon". */
SELECT * FROM animals WHERE name LIKE '%mon';

/* List the name of all animals born between 2016 and 2019 */
SELECT name FROM animals WHERE date_of_birth BETWEEN '2016-01-01' AND '2019-01-01';

/* List the name of all animals that are neutered and have less than 3 escape attempts. */
SELECT name from animals WHERE neutered = true AND escape_attempts < 3;

/* List the date of birth of all animals named either "Agumon" or "Pikachu". */
SELECT date_of_birth FROM animals WHERE name = 'Agumon' or name =  'Pikachu';

/* List name and escape attempts of animals that weigh more than 10.5kg */
SELECT name, escape_attempts FROM animals WHERE weight_kg > 10.5;

/* Find all animals that are neutered. */
SELECT * from animals WHERE neutered = true;

/* Find all animals not named Gabumon. */
SELECT * from animals WHERE name != 'Gabumon';

/* Find all animals with a weight between 10.4kg and 17.3kg (including the animals with the weights that equals precisely 10.4kg or 17.3kg) */
SELECT * from animals WHERE weight_kg BETWEEN 10.4 AND 17.3;

/* all inside transaction update  queries */
BEGIN TRANSACTION;
  ALTER TABLE animals RENAME COLUMN species TO unspecified;
ROLLBACK TRANSACTION;

BEGIN TRANSACTION;
  UPDATE animals SET species = 'digimon' WHERE Name like '%mon';
  UPDATE animals SET species = 'pokemon' WHERE species is null;
COMMIT TRANSACTION;
SELECT * FROM animals;

BEGIN;
  DELETE FROM animals;
ROLLBACK;
SELECT * FROM animals;

BEGIN;
  DELETE FROM animals WHERE date_of_birth >= '2022-01-01';
  SAVEPOINT savepoint1;
  UPDATE animals SET weight_kg = weight_kg * -1;
  ROLLBACK SAVEPOINT savepoint1;
  UPDATE animals SET weight_kg = weight_kg * -1 WHERE weight_kg <0;
COMMIT;


/* Queries to answer questions */
SELECT count(*) as number_of_animals FROM animals;
SELECT count(*) FROM animals WHERE escape_attempts = 0;
SELECT avg(weight_kg) FROM animals;
SELECT escape_attempts, neutered FROM animals WHERE escape_attempts = (SELECT MAX(escape_attempts) FROM animals);
SELECT species, max(weight_kg) as max_weight, min(weight_kg) as min_weight from animals GROUP BY species;
SELECT avg(escape_attempts) as avg_escape_attempt, species FROM animals WHERE date_of_birth BETWEEN '1990-01-01' AND '2000-01-01' GROUP BY species;


/* query multiple tables Queries to answer questions */
SELECT animals.name FROM animals INNER JOIN owners ON animals.owners_id = owners.id WHERE owners.full_name = 'Melody Pond';
SELECT animals.name FROM animals INNER JOIN species ON animals.species_id = species.id WHERE species.id = '1';
SELECT owners.full_name, animals.name FROM animals RIGHT JOIN owners ON animals.owners_id = owners.id;
SELECT species.name, COUNT(*) FROM animals JOIN species ON animals.species_id = species.id GROUP by species.name;
SELECT animals.name FROM animals JOIN owners ON animals.owners_id = owners.id JOIN species ON animals.species_id = species.id WHERE species.name = 'digimon' AND owners.full_name = 'Jennifer Orwell';
SELECT animals.name FROM animals JOIN owners ON animals.owners_id = owners.id WHERE owners.id = 5 AND animals.escape_attempts = 0;
SELECT owners.full_name, COUNT(*) FROM owners JOIN animals ON owners.id = animals.owners_id GROUP BY owners.full_name ORDER BY COUNT (*) DESC LIMIT 1;



  




