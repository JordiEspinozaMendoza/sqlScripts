-- Ejercicio.
-- * Realiza una base de datos con información referente a libros, editorial, autor,
-- * Considera que un libro fue editado por una editorial, puede tener varios autores, tiene una fecha de edición, etc.
-- * Crea la base de datos
CREATE DATABASE T19
GO 

USE T19
GO

CREATE TABLE Editorales(
    id VARCHAR(255) PRIMARY KEY NOT NULL,
    nombre VARCHAR(255) NOT NULL,
)
GO
CREATE TABLE Autores(
    id VARCHAR(255) PRIMARY KEY NOT NULL,
    nombre VARCHAR(255) NOT NULL,
)
GO
CREATE TABLE Libros(
    id VARCHAR(255) PRIMARY KEY NOT NULL,
    titulo VARCHAR(255) NOT NULL,
    editorial VARCHAR(255) NOT NULL,
    autor VARCHAR(255) NOT NULL,
    fecha_publicacion DATE NOT NULL,

    CONSTRAINT FK_Editorial FOREIGN KEY (editorial) REFERENCES Editorales(id),
)
GO

CREATE TABLE LibrosAutores(
    libro VARCHAR(255) NOT NULL,
    autor VARCHAR(255) NOT NULL,

    PRIMARY KEY (libro, autor),
    CONSTRAINT FK_Libros FOREIGN KEY (libro) REFERENCES Libros(id),
    CONSTRAINT FK_Autores FOREIGN KEY (autor) REFERENCES Autores(id),
)
GO

-- * Añade registros a cada tabla.
INSERT INTO Editorales VALUES ('1', 'Editorial 1'), ('2', 'Editorial 2'), ('3', 'Editorial 3')
GO
INSERT INTO Autores VALUES ('1', 'Autor 1'), ('2', 'Autor 2'), ('3', 'Autor 3')
GO
INSERT INTO Libros VALUES ('1', 'Libro 1', '1', '1', '2019-01-01'), ('2', 'Libro 2', '2', '2', '2019-02-02'), ('3', 'Libro 3', '3', '3', '2019-03-03')
GO
INSERT INTO LibrosAutores VALUES ('1', '1'), ('1', '2'), ('1', '3'), ('2', '1'), ('2', '2'), ('2', '3'), ('3', '1'), ('3', '2'), ('3', '3')
GO
USE T19
GO
-- * Actualiza información.
-- * Escriba una secuencia de comandos para añadir toda esta
-- * información, para que se ejecute o falle completamente.
UPDATE Libros SET titulo = 'Libro 1 modificado' WHERE id = '1'
UPDATE Autores SET nombre = 'Autor 3 modificado' WHERE id = '3'
UPDATE LibrosAutores SET libro = '1' WHERE libro = '2'
GO
-- * Realiza en la base de datos un lote de transacciones en el que puedas
-- * insertar y actualizar información a cada tabla.
-- * Modifica los datos de una editorial.
-- * Agrega un registro a tabla autor.
-- * Elimina el registro a una tabla autor.

USE T19
BEGIN TRAN
    UPDATE Editorales SET nombre = 'Editorial 1 modificada' WHERE id = '1'
    GO
    INSERT INTO Autores VALUES ('23', 'Autor 23')
    GO
    DELETE FROM Autores WHERE id = '52'
    GO
COMMIT TRAN
GO

USE T19
GO
SELECT * FROM Libros
GO
SELECT * FROM Autores
GO
SELECT * FROM LibrosAutores
GO
