/* Se crea la base de datos almacenDB */
CREATE DATABASE IF NOT EXISTS almacenDB;

/*Se comprueba que la base de datos ha sido creada correctamente*/
SHOW DATABASES;

/*Selecciona la base de datos creada mediante USE*/
USE almacenDB;

/*Creamos una tabla para Proovedores*/
CREATE TABLE IF NOT EXISTS proveedores (
    id_P INTEGER PRIMARY KEY,
    pnombre VARCHAR(100) NOT NULL,
    categoria VARCHAR(50) NOT NULL,
    ciudad VARCHAR(100) NOT NULL
);

/*Creamos una tabla para Componentes*/
CREATE TABLE IF NOT EXISTS componentes (
    id_C INTEGER PRIMARY KEY,
    cnombre VARCHAR(100) NOT NULL,
    color VARCHAR(50) NOT NULL,
    peso INTEGER NOT NULL,
    ciudad VARCHAR(100) NOT NULL
);

/*Creamos una tabla para Articulos*/
CREATE TABLE IF NOT EXISTS articulos (
    id_T INTEGER PRIMARY KEY,
    tnombre VARCHAR(100) NOT NULL,
    ciudad VARCHAR(50) NOT NULL
);

/*Creamos una tabla para los ENVIOS*/
CREATE TABLE IF NOT EXISTS envios (
    id_P INTEGER NOT NULL,
    id_C INTEGER NOT NULL,
    id_T INTEGER NOT NULL,
    cantidad INTEGER NOT NULL,

    FOREIGN KEY (id_P) REFERENCES proveedores(id_P),
    FOREIGN KEY (id_C) REFERENCES componentes(id_C),
    FOREIGN KEY (id_T) REFERENCES articulos(id_T)
);

/* Ver las tablas creadas*/
SHOW TABLES;

/* Ver información de las tablas creadas*/
DESCRIBE proveedores;
DESCRIBE componentes;
DESCRIBE articulos;
DESCRIBE envios;

