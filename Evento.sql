-- 1. Crea una base de datos denominada Evento, y actívala para almacenar información de
-- los participantes en un Evento, (1 pto)
-- CREATE DATABASE Evento;
USE Evento;
-- 2. Crea un tipo de dato denominado &quot;texto&quot; que sea de tipo char (30). (1 pto)
EXEC sp_addtype texto, 'CHAR(30)';
-- 3. Crea las tablas necesarias para registrar a los participantes en un Evento, el cual puede
-- ser de diferentes tipos, las tablas requeridas son: (1 pto)
CREATE TABLE Participantes(
    IDPartic INT,
    apPaterno texto,
    apMaterno texto,
    nombre VARCHAR(30),
    telefono VARCHAR(12),
    tipoParticipante VARCHAR(30),
);
CREATE TABLE EVENTO(
    IDEvento INT,
    nombreEvento VARCHAR(30),
    lugarEvento VARCHAR(30),
    fechaEvento VARCHAR(12),
    tipoEvento VARCHAR(30),
);
CREATE TABLE EVENTOPARTICIPANTES(
    IDEvento INT,
    IDPartic INT,
);
-- 4. Crea las restricciones para agregar llaves primarias y foráneas de las tablas. (1 pto)
ALTER TABLE Participantes ADD PRIMARY KEY (IDPartic);
ALTER TABLE EVENTO ADD PRIMARY KEY (IDEvento);
ALTER TABLE EVENTOPARTICIPANTES ADD PRIMARY KEY (IDEvento, IDPartic);
ALTER TABLE EVENTOPARTICIPANTES ADD FOREIGN KEY (IDEvento) REFERENCES EVENTO(IDEvento);
ALTER TABLE EVENTOPARTICIPANTES ADD FOREIGN KEY (IDPartic) REFERENCES Participantes(IDPartic);
GO
-- 5. Crea una regla que garantice que el Tipo de evento, sólo sea uno de los siguientes
-- valores: Académico, social, Deportivo. (2 pto)
CREATE RULE TIPO_EVENTO AS @tipoEvento IN ('Académico', 'Social', 'Deportivo')
GO
EXEC sp_bindrule TIPO_EVENTO, 'EVENTO.tipoEvento';
GO
-- 6. Modifica la tabla participantes y agrega el atributo CorreoElectrónico varchar(50) (1 pto)
ALTER TABLE Participantes ADD CorreoElectronico VARCHAR(50)
GO
-- 7. Crea una regla denominada FormatoCorreo que garantice que el correo tenga intermedio
-- el carácter @ (2 pto)
CREATE RULE FormatoCorreo AS @correo LIKE '%@%'
GO
EXEC sp_bindrule FormatoCorreo, 'Participantes.CorreoElectronico';
GO
-- 8. Crea un valor por default denominado año, con el valor de 2021. Asigna el valor por
-- default al dato creado denominado AñoEvento. (1 pto)
CREATE DEFAULT YEARDEFAULT AS 2021
GO
EXEC sp_bindefault YEARDEFAULT, 'EVENTO.fechaEvento';
-- 9. Crea una consulta que despliegue los datos del idevento = 1 y el nombre y apellido de los
-- participantes de este evento (1 pto).
SELECT EVENTO.IDEvento, EVENTO.nombreEvento,PARTICIPANTES.*
FROM EVENTO
INNER JOIN EVENTOPARTICIPANTES ON EVENTOPARTICIPANTES.IDEvento = EVENTO.IDEvento
INNER JOIN PARTICIPANTES ON PARTICIPANTES.IDPartic = EVENTOPARTICIPANTES.IDPartic
WHERE EVENTO.IDEvento = 1;
-- 10. Despliega los datos de los participantes ordenados por ApPaterno (1 pto).
-- Agrega. El script y la verificación dl funcionamiento de los objetos creados.
SELECT * FROM Participantes ORDER BY apPaterno;

INSERT INTO Participantes VALUES (1, 'Perez', 'Gonzalez', 'Juan', '55555555', 'Académico', 'juan@juan.com');
INSERT INTO Participantes VALUES (2, 'Chavez', 'Toledo', 'Isma', '45454545', 'Invitado', 'selvin@sel.com');
INSERT INTO Participantes VALUES (3, 'Garcia', 'Pedraza', 'Jesus', '8585858', 'Invitado', 'jesus@jesus.com');

INSERT INTO EVENTO VALUES (1, 'Evento 1', 'Lima', '2020-01-01', 'Académico');
INSERT INTO EVENTO VALUES (2, 'Evento 2', 'Lima', '2020-01-02', 'Social');
INSERT INTO EVENTO VALUES (3, 'Evento 3', 'Lima', '2020-01-03', 'Deportivo');

INSERT INTO EVENTOPARTICIPANTES VALUES (1, 1);
INSERT INTO EVENTOPARTICIPANTES VALUES (1, 2);
INSERT INTO EVENTOPARTICIPANTES VALUES (1, 3);
INSERT INTO EVENTOPARTICIPANTES VALUES (2, 1);
INSERT INTO EVENTOPARTICIPANTES VALUES (2, 2);
INSERT INTO EVENTOPARTICIPANTES VALUES (2, 3);
INSERT INTO EVENTOPARTICIPANTES VALUES (3, 1);
INSERT INTO EVENTOPARTICIPANTES VALUES (3, 2);
INSERT INTO EVENTOPARTICIPANTES VALUES (3, 3);