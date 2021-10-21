-- CREATE DATABASE ENCUESTAS;
USE ENCUESTAS;

CREATE TABLE ENCUESTA (
    folio INT NOT NULL PRIMARY KEY,
    licenciatura VARCHAR(50) NOT NULL,
    fecha DATE NOT NULL,
    tipo VARCHAR(50) NOT NULL,
)
CREATE TABLE Pregunta (
    id INT PRIMARY KEY,
    pregunta VARCHAR(255) NOT NULL,
    respuesta VARCHAR(255) NOT NULL,

)
CREATE TABLE PREGUNTA_ENCUESTA (
    id_pregunta INT NOT NULL,
    folio_encuesta INT NOT NULL,

    CONSTRAINT FK_PREGUNTA_ENCUESTA_PREGUNTA FOREIGN KEY (id_pregunta) REFERENCES Pregunta(id),
    CONSTRAINT FK_PREGUNTA_ENCUESTA_ENCUESTA FOREIGN KEY (folio_encuesta) REFERENCES ENCUESTA(folio),

    PRIMARY KEY (id_pregunta, folio_encuesta)
)

INSERT INTO ENCUESTA VALUES(
    1,
    'Licenciatura en Informatica',
    '2020-06-01',
    'Encuesta de Calidad'
)
INSERT INTO Pregunta VALUES(
    1,
    '¿Como califica la atencion en el servicio?',
    '1'
)
INSERT INTO PREGUNTA_ENCUESTA VALUES(
    1,
    1
)