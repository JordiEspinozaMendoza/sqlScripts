-- Create database ejercicio_vista;
use ejercicio_vista
GO

--  create table socios(
--   documento char(8) not null,
--   nombre varchar(40),
--   domicilio varchar(30),
--   constraint PK_socios_documento
--    primary key (documento)
--  );

--  create table profesores(
--   documento char(8) not null,
--   nombre varchar(40),
--   domicilio varchar(30),
--   constraint PK_profesores_documento
--    primary key (documento)
--  );

--  create table cursos(
--   numero tinyint identity,
--   deporte varchar(20),
--   dia varchar(15),
--    constraint CK_inscritos_dia check (dia in('lunes','martes','miercoles','jueves','viernes','sabado')),
--   documentoprofesor char(8),
--   constraint PK_cursos_numero
--    primary key (numero),
--  );

--  create table inscritos(
--   documentosocio char(8) not null,
--   numero tinyint not null,
--   matricula char(1),
--   constraint CK_inscritos_matricula check (matricula in('s','n')),
--   constraint PK_inscritos_documento_numero
--    primary key (documentosocio,numero)
--  );

/* 2- Ingrese algunos registros para todas las tablas: */
--  insert into socios values('30000000','Fabian Fuentes','Caseros 987');
--  insert into socios values('31111111','Gaston Garcia','Guemes 65');
--  insert into socios values('32222222','Hector Huerta','Sucre 534');
--  insert into socios values('33333333','Ines Irala','Bulnes 345');

--  insert into profesores values('22222222','Ana Acosta','Avellaneda 231');
--  insert into profesores values('23333333','Carlos Caseres','Colon 245');
--  insert into profesores values('24444444','Daniel Duarte','Sarmiento 987');
--  insert into profesores values('25555555','Esteban Lopez','Sucre 1204');

--  insert into cursos values('tenis','lunes','22222222');

--  insert into cursos values('tenis','martes','22222222');
--  insert into cursos values('natacion','miercoles','22222222');
--  insert into cursos values('natacion','jueves','23333333');
--  insert into cursos values('natacion','viernes','23333333');
--  insert into cursos values('futbol','sabado','24444444');
--  insert into cursos values('futbol','lunes','24444444');
--  insert into cursos values('basquet','martes','24444444');

--  insert into inscritos values('30000000',1,'s');
--  insert into inscritos values('30000000',3,'n');
--  insert into inscritos values('30000000',6,null);
--  insert into inscritos values('31111111',1,'s');
--  insert into inscritos values('31111111',4,'s');
--  insert into inscritos values('32222222',8,'s');

/*3- Elimine la vista "vista_club" si existe:*/
--  if object_id('vista_club') is not null drop view vista_club;

/*4- Cree una vista en la que aparezca el nombre y documento del socio, el deporte, 
el día y el nombre del profesor.*/

-- CREATE VIEW VISTA_CLUB AS
-- SELECT s.nombre AS "Nombre socio", s.documento, c.deporte, c.dia, p.nombre AS "Nombre profesor" FROM inscritos i
-- INNER JOIN socios s ON i.documentosocio = s.documento
-- INNER JOIN cursos c ON i.numero = c.numero
-- INNER JOIN profesores p ON c.documentoprofesor = p.documento
-- GO

/*5- Muestre la información contenida en la vista.*/

-- SELECT * FROM VISTA_CLUB
-- GO

/*6- Realice una consulta a la vista donde muestre la cantidad de socios inscriptos en 
cada deporte ordenados por cantidad.*/
-- CREATE VIEW SOCIOS_INSCRITOS_POR_DEPORTE AS
-- SELECT c.deporte, COUNT(i.documentosocio) AS "Cantidad de socios inscriptos" FROM inscritos i
-- INNER JOIN cursos c ON i.numero = c.numero
-- GROUP BY c.deporte
-- GO 

-- SELECT * FROM SOCIOS_INSCRITOS_POR_DEPORTE
-- GO

-- 7- Muestre (consultando la vista) los cursos (deporte y día) para los cuales no hay inscritos.
-- SELECT c.deporte, c.dia FROM cursos c
-- LEFT OUTER JOIN inscritos i ON c.numero = i.numero
-- WHERE i.documentosocio IS NULL
-- GROUP BY c.deporte, c.dia
-- GO


-- 8- Muestre los nombres de los socios que no se han inscripto en ningún curso (consultando la vista)

-- SELECT s.nombre FROM socios s
-- WHERE s.documento NOT IN (SELECT i.documentosocio FROM inscritos i)
-- GO

-- 9- Muestre (consultando la vista) los profesores que no tienen asignado ningún deporte aún.

-- SELECT p.nombre FROM profesores p
-- WHERE p.documento NOT IN (SELECT c.documentoprofesor FROM cursos c)
-- GO

-- 10- Muestre (consultando la vista) el nombre y documento de los socios que deben matrículas.
-- CREATE VIEW SOCIOS_MATRICULA AS
-- SELECT s.nombre, s.documento FROM socios s
-- WHERE s.documento IN (SELECT i.documentosocio FROM inscritos i WHERE i.matricula = 'n')
-- GO

-- 11- Consulte la vista y muestre los nombres de los profesores y los días en que asisten al club para impartir sus clases.
-- CREATE VIEW PROFESORES_DIAS AS
-- SELECT p.nombre, c.dia FROM cursos c 
-- INNER JOIN profesores p ON c.documentoprofesor = p.documento
-- GO

-- 12- Muestre la misma información anterior pero ordenada por día.
-- CREATE VIEW PROFESORES_DIAS_ORDER AS
-- SELECT p.nombre, c.dia FROM cursos c 
-- INNER JOIN profesores p ON c.documentoprofesor = p.documento
-- ORDER BY c.dia 
-- GO

-- 13- Muestre todos los socios que son compañeros en tenis los lunes.
-- CREATE VIEW TENIS_LUNES AS
-- SELECT s.nombre, c.deporte, c.dia FROM inscritos i
-- INNER JOIN socios s ON i.documentosocio = s.documento
-- INNER JOIN cursos c ON  c.numero = i.numero
-- WHERE c.deporte = 'tenis' AND c.dia = 'lunes'
-- GO 


-- 14- Elimine la vista "vista_inscritos" si existe y créela para que muestre la cantidad de inscritos por curso, 
-- incluyendo el número del curso, el nombre del deporte y el día.
-- if object_id('vista_inscritos') is not null drop view vista_inscritos
-- GO

CREATE VIEW vista_inscritos AS 
SELECT c.numero, c.deporte, c.dia, COUNT(c.numero) AS "Cantidad de socios inscritos" FROM cursos c
RIGHT OUTER JOIN inscritos i ON c.numero = i.numero
GROUP BY c.numero, c.deporte, c.dia
GO
 

-- 15- Consulte la vista:
SELECT * FROM vista_inscritos
