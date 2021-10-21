CREATE DATABASE LISTAITT;

USE LISTAITT;

-- CREATE TABLE ALUMNOS(
--     matricula VARCHAR(10) PRIMARY KEY NOT NULL,
--     nombre VARCHAR(50) NOT NULL,
--     correo VARCHAR(50) NOT NULL,
-- )
-- CREATE TABLE DOCENTES(
--     claveDocente VARCHAR(10) PRIMARY KEY NOT NULL,
--     nombre VARCHAR(50) NOT NULL,
--     correo VARCHAR(50) NOT NULL,
-- )
-- CREATE TABLE MATERIAS(
--     claveMateria VARCHAR(10) PRIMARY KEY NOT NULL,
--     nombre VARCHAR(50) NOT NULL,
-- )
-- CREATE TABLE LISTAS(
--     folio VARCHAR(10) PRIMARY KEY NOT NULL,
--     fechaEmision DATE NOT NULL,
--     periodo VARCHAR(20) NOT NULL,
--     paquete VARCHAR(20) NOT NULL,
--     horario VARCHAR(20) NOT NULL,
--     nombre VARCHAR(50) NOT NULL,

--     claveDocente VARCHAR(10) NOT NULL,
--     claveMateria VARCHAR(10) NOT NULL,

--     CONSTRAINT FK_DOCENTES FOREIGN KEY (claveDocente) REFERENCES DOCENTES(claveDocente),
--     CONSTRAINT FK_MATERIAS FOREIGN KEY (claveMateria) REFERENCES MATERIAS(claveMateria)
-- )
-- CREATE TABLE DETALLESLISTA(
--     folio VARCHAR(10) NOT NULL,
--     matricula VARCHAR(10) NOT NULL,

--     FOREIGN KEY (folio) REFERENCES LISTAS(folio),
--     FOREIGN KEY (matricula) REFERENCES ALUMNOS(matricula),

--     PRIMARY KEY (folio, matricula)
-- )
