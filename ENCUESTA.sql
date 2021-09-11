-- CREATE DATABASE ENCUESTAS;
USE ENCUESTAS;

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