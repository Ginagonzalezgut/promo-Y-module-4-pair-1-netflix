CREATE DATABASE netflix;
USE netflix;

CREATE TABLE movies(
idMovies INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
title VARCHAR(45) NOT NULL,
genre VARCHAR(45) NOT NULL,
image VARCHAR(1000) NOT NULL,
category VARCHAR(45) NOT NULL,
year INT
);

CREATE TABLE users(
idUsers INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
user VARCHAR(45) NOT NULL,
password VARCHAR(45) NOT NULL,
name VARCHAR(45) NOT NULL,
email VARCHAR(45) NOT NULL,
plan_details VARCHAR(45) NOT NULL
);

CREATE TABLE actors(
idActor INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
name VARCHAR(45) NOT NULL,
lastname VARCHAR(45) NOT NULL,
country VARCHAR(45) NOT NULL,
birthday DATE
);

-- EJERCICIO 1, insertar datos
INSERT INTO movies (title, genre, image, category, year) VALUES 
("Pulp Fiction", "Crimen" , "https://pics.filmaffinity.com/pulp_fiction-210382116-large.jpg", "Top 10", 1994),
("La vita è bella", "Comedia", "https://pics.filmaffinity.com/la_vita_e_bella-646167341-mmed.jpg", "Top 10", 1996),
("Forrest Gump", "Comedia", "https://pics.filmaffinity.com/forrest_gump-212765827-mmed.jpg", "Top 10", 1994);

INSERT INTO users (user, password, name, email, plan_details) VALUES
("laura_dev", "laura", "Laura", "laura@gmail.com", "Standard"),
("maria_dev", "maria", "Maria", "maria@gmail.com", "Standard"),
("ester_dev", "ester", "Ester", "ester@gmail.com", "Standard");

INSERT INTO actors (name, lastname, country, birthday) VALUES
("Tom", "Hanks", "Estados Unidos", "1956-07-09"),
("Roberto", "Benigni", "Italia", "1952-10-27"),
("John", "Travolta", "Estados Unidos", "1954-02-18");

-- Consulta y modifica informacion 

SELECT * FROM movies;

SELECT title, genre FROM movies WHERE year > 1990;

SELECT title FROM movies WHERE category = "Top 10";

-- LINEA DE CODIGO PARA EJECUTAR SENTENCIAS QUE NO CONSIDERA SEGURAS EN CASO DE MODIFICACIONES O ELIMINACION 
SET SQL_SAFE_UPDATES = 0;
UPDATE movies SET year = 1997 WHERE title = "La vita è bella";

SELECT * FROM actors; 

SELECT * FROM actors WHERE birthday LIKE "1950%" OR "1960%";

SELECT name, lastname FROM actors WHERE country = "Estados Unidos";

SELECT * FROM users WHERE plan_details = "Standard";

DELETE FROM users WHERE name LIKE "M%";

ALTER TABLE actors ADD image VARCHAR (1000) ;

-- Eliminar tabla con DROP TABLE nombredelatabla
-- Eliminar Base de datos DROP DATABASE nombredebd

-- EJERCICIO 1-- pensar la relacion (en diagrama)
-- EJERCICIO 2- Crea la relacion Users movies
-- 1 crea una nueva relacion entre la tabla users y movies, que contenga el id de la tabla users y la tabla movies 
CREATE TABLE user_has_movies (
fk_users INT,
fk_movies INT
);
-- 2 insterta datos para que la usuaria con el id 1 tenga como favoritas las peliculas con el id 1 y 2 
-- la usuaria con id 3 (porque la 2 la borramos) tenga como favorita solo la pelicula con id 2
INSERT INTO user_has_movies (fk_users, fk_movies) VALUES 
(1,1),
(1,2),
(3,2);
 
 -- añadir una columna de score para saber que puntuacion le ha dado cada usuaria a una pelicula.
ALTER TABLE user_has_movies ADD score FLOAT;

UPDATE users_has_movies 
SET score = 9 
WHERE fk_users = 1 AND fk_movies = 1;

UPDATE users_has_movies 
SET score = 8 
WHERE fk_users = 1 AND fk_movies = 2;

UPDATE users_has_movies 
SET score = 8.5 
WHERE fk_users = 3 AND fk_movies = 2;

-- EJERCICIO 3 crea la relación movie-actors

CREATE TABLE movies_has_actors (
fk_movies INT,
fk_actors int
);







