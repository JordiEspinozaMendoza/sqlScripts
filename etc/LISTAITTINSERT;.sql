USE LISTAITT;
INSERT INTO ALUMNOS VALUES (
    -- Matricula
    'A01',
    -- Nombre
    'Juan',
    -- email
    'juan@juan.com'
);
INSERT INTO DOCENTES VALUES(
    -- Matricula
    'A02',
    -- Nombre
    'Juan',
    -- email
    'fer@fer.com' 
)
INSERT INTO MATERIAS VALUES(
    -- Clave
    'M01',
    -- Nombre
    'Programacion'
)
INSERT INTO LISTAS VALUES(
    -- Matricula
    'L01',
    -- Fecha de emision
    '2020-01-01',
    -- Periodo
    'AGO-DIC-21',
    -- Paquete
    'PAQUETE A',
    -- Horario
    '01-07 PM',
    -- Nombre
    'Lista 1',
    -- Matricula docente
    'A02',
    -- Clave materia
    'M01'
)
INSERT INTO DETALLESLISTA VALUES(
    -- Matricula
    'L01',
    -- Matricula alumno
    'A01'
)