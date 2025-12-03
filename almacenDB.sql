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
    categoria INTEGER NOT NULL,
    ciudad VARCHAR(100) NOT NULL
);

/*Creamos una tabla para Componentes*/
CREATE TABLE IF NOT EXISTS componentes (
    id_C INTEGER PRIMARY KEY,
    cnombre VARCHAR(5) NOT NULL,
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

/*Insertar datos en la tabla Proveedores*/
INSERT INTO proveedores (id_P, pnombre, categoria, ciudad) 
VALUES (1, 'CARLOS', 20, 'SEVILLA'),
(2,'JUAN',10,'MADRID'),
(3,'JOSE',30,'SEVILLA'),
(4,'INMA',20,'SEVILLA'),
(5,'EVA',30,'CACERES');

/*Insertar datos en la tabla Componentes*/
INSERT INTO componentes (id_C, cnombre, color, peso, ciudad) 
VALUES (1, 'X3A', 'ROJO', 12, 'SEVILLA'),
 (2,'B85','VERDE',17,'MADRID'),
 (3,'C4B','AZUL',17,'MALAGA'),
 (4,'C4B','ROJO',14,'SEVILLA'),
 (5,'VT8','AZUL',12,'MADRID'),
 (6,'C30','ROJO',19,'SEVILLA');

/*Insertar datos en la tabla Articulos*/
INSERT INTO articulos (id_T, tnombre, ciudad)
VALUES (1, 'CLASIFICADORA', 'MADRID'),
 (2,'PERFORADORA','MALAGA'),
 (3,'LECTORA','CACERES'),
 (4,'CONSOLA','CACERES'),
 (5,'MEZCLADORA','SEVILLA'),
 (6,'TERMINAL','BARCELONA'),
 (7,'CINTA','SEVILLA');

/*Insertar datos en la tabla Envios*/
INSERT INTO envios (id_P, id_C, id_T, cantidad)
VALUES (1, 1, 1, 200),
(1,1,4,700),
 (2,3,1,400),
 (2,3,1,400),
 (2,3,2,200),
 (2,3,3,200),
 (2,3,4,500),
 (2,3,5,600),
 (2,3,6,400),
 (2,3,7,800),
 (2,5,2,100),
 (3,1,1,200),
 (3,2,2,500),
 (4,3,2,300),
 (4,6,7,200),
 (5,2,2,200),
 (5,2,4,100),
 (5,3,1,100),
 (5,3,4,800),
 (5,5,5,400),
 (5,6,4,500);

 /* consultar los envío con P4*/
SELECT * FROM envios WHERE id_P = 4;
SELECT COUNT(*) FROM envios WHERE id_P = 4;

SELECT DISTINCT * FROM envios WHERE id_T = 2;

SELECT id_P FROM envios WHERE cantidad = 500;