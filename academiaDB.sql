CREATE DATABASE IF NOT EXISTS academiaDB;

USE academiaDB;

/* En primer lugar se genera la tabla profesor por que no tiene ninguna FK */
CREATE TABLE profesores (
    DNI_profesor        VARCHAR(9)  PRIMARY KEY,
    nombre_profesor     VARCHAR(50),
    apellido1_profesor  VARCHAR(50),
    apellido2_profesor  VARCHAR(50),
    direccion_profesor  VARCHAR(50),
    titulo              VARCHAR(50),
    gana                DECIMAL(6,2) NOT NULL,

    UNIQUE (nombre_profesor, apellido1_profesor, apellido2_profesor)
);

/*A continuación se procede con la tabla cursos porque coge la FK de profesores y dependerá alumnos de ella*/

CREATE TABLE cursos (
    cod_curso       INTEGER         PRIMARY KEY,
    nombre_curso    VARCHAR(50)     UNIQUE,
    maximo_alumnos  INTEGER,
    fecha_inicio    DATE,
    fecha_fin       DATE,
    num_horas       DECIMAL(4,1)    NOT NULL,
    DNI_profesor    VARCHAR(9),

    DNI_profesor FOREING KEY (DNI_profesor) REFERENCES profesores (DNI_profesor),
    CHECK (fecha_inicio < fecha_fin)
);

CREATE TABLE alumnos (
    DNI_alumno          VARCHAR(9)      PRIMARY KEY,
    nombre_alumno       VARCHAR(50),
    apellido1_alumno    VARCHAR(50),
    apellido2_alumno    VARCHAR(50),
    direccion_alumno    VARCHAR(50),
    sexo_alumno         CHAR(1)         CHECK (sexo_alumno IN ('H','M')),
    fecha_nacimiento    DATE,
    cod_curso           INTEGER         NOT NULL,

    FOREING KEY (cod_curso) REFERENCES cursos (cod_curso)
);

INSERT INTO profesores 
    VALUES ('32432455', 'Juan', 'Arch', 'López', 'Puerta Negra, 4', 'Ing. Informática', 7500),
    ('43215643', 'María', 'Oliva', 'Rubio', 'Juan Alfonso, 32', 'Lda. Filología Inglesa', 5400);