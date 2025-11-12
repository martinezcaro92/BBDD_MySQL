/* Crea una base de datos llamada padronDB si no existe*/
CREATE DATABASE IF NOT EXISTS padronDB;

/* Muestra las bases de datos existentes*/
SHOW DATABASES;

/*A partir de las bbdd existentes, selecciona padronDB*/
USE padronDB;

/*Crear una tabla llamada "ciudadanos" con 5 campos y restricciones a los campos/atributos/columnas 
    De esta forma falla al introducirlo en el SGBD MySQL*/
CREATE TABLE IF NOT EXISTS ciudadanos (
    DNI_ciudadano VARCHAR(9) PRIMARY KEY,
    nombre_ciudadano VARCHAR(100) NOT NULL,
    apellidos_ciudadano VARCHAR(150) NOT NULL,
    telefono_ciudadano INTEGER CHECK (telefono_ciudadano LIKE '9________' OR telefono_ciudadano LIKE '6________' OR telefono_ciudadano LIKE '7________'),
    id_municipio INTEGER FOREIGN KEY REFERENCES municipios(id_municipio)
);

/* Modificación del FK en las tablas anteriores */
CREATE TABLE IF NOT EXISTS ciudadanos (
    DNI_ciudadano VARCHAR(9) PRIMARY KEY,
    nombre_ciudadano VARCHAR(100) NOT NULL,
    apellidos_ciudadano VARCHAR(150) NOT NULL,
    telefono_ciudadano INTEGER CHECK (telefono_ciudadano LIKE '9________' OR telefono_ciudadano LIKE '6________' OR telefono_ciudadano LIKE '7________'),
    id_municipio INTEGER NOT NULL,

    FOREIGN KEY (id_municipio) REFERENCES municipios(id_municipio)
);

/* Al introducir los comandos anteriores (CREATE TABLE para ciudadanos), nos da error porque utilizamos una 
    FK de una tabla que no existe previamente. Por lo tanto, tenemos que comenzar creando las tablas que menos
    dependencias tienen. */

/* Crear tabla llamada "comarcas" con 3 campos y restricciones a los campos/atributos/columnas */
CREATE TABLE IF NOT EXISTS comarcas (
    id_comarca INTEGER PRIMARY KEY,
    nombre_comarca VARCHAR(100) NOT NULL,
    extension_comarca DECIMAL(10,2) NOT NULL
);

/* Crear tabla llamada "municipios" con 3 campos y restricciones a los campos/atributos/columnas 
    De esta forma falla al introducirlo en el SGBD MySQL*/
CREATE TABLE IF NOT EXISTS municipios (
    id_municipio INTEGER PRIMARY KEY,
    nombre_municipio VARCHAR(100) NOT NULL,
    habitantes_municipio INTEGER NOT NULL,
    id_comarca INTEGER FOREIGN KEY REFERENCES comarcas(id_comarca)
);

/* Modificación del FK en las tablas anteriores */
CREATE TABLE IF NOT EXISTS municipios (
    id_municipio INTEGER PRIMARY KEY,
    nombre_municipio VARCHAR(100) NOT NULL,
    habitantes_municipio INTEGER NOT NULL,
    id_comarca INTEGER NOT NULL,

    /*De este modo ponemos la restricción a la tabla, no a dato/columna/atributo*/
    FOREIGN KEY (id_comarca) REFERENCES comarcas(id_comarca)
);

/* Mostrar las tablas creadas en padronDB */
SHOW TABLES;

/* Mostrar la estructura de la tabla ciudadanos */
DESCRIBE ciudadanos;

/* Modificar la tabla ciudadano para que nombre_ciudadano tenga un tamaño máximo de 100 caracteres */ 
ALTER TABLE ciudadanos
MODIFY nombre_ciudadano VARCHAR(150) NOT NULL;

INSERT INTO Persons (ID, LastName, FirstName, Age)  
    VALUES (1, 'Re', 'Miguel', 17);