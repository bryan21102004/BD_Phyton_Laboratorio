CREATE DATABASE Lab_5

USE Lab_5

CREATE TABLE ESTUDIANTE(
ID_Estudiante INT IDENTITY(1,1) PRIMARY KEY,
Nombre_Estudiante VARCHAR(55),
Apellidos_Estudiante VARCHAR(55),
Telefono VARCHAR(25),
Direccion VARCHAR(55),
Carrera VARCHAR(55),
ID_Localizacion INT,
FOREIGN KEY (ID_Localizacion) REFERENCES LOCALIZACION(ID_Localizacion)
)

CREATE TABLE LIBROS(
ID_Libro INT IDENTITY(1,1) PRIMARY KEY,
Nombre_Libro VARCHAR(55),
ISBN VARCHAR(15),
Cantidad_Paginas INT,
Editorial VARCHAR(25),
Fecha_Publicacion VARCHAR(25),
)


CREATE TABLE AUTOR(
ID_Autor INT IDENTITY (1,1) PRIMARY KEY,
Nombre_Autor VARCHAR(55),
)

CREATE TABLE EJEMPLAR(
ID_Ejemplar INT IDENTITY(1,1) PRIMARY KEY,
Cantidad_Ejemplares VARCHAR(55),
ID_Libro INT,
ID_Localizacion INT,
FOREIGN KEY(ID_Localizacion) REFERENCES LOCALIZACION(ID_Localizacion),
FOREIGN KEY(ID_Libro) REFERENCES LIBROS(ID_Libro)
)

CREATE TABLE PRESTAMOS(
ID_Prestamo INT IDENTITY(1,1) PRIMARY KEY,
ID_Estudiante INT NOT NULL,
ID_Ejemplar INT NOT NULL,
Fecha_Prestamo DATE DEFAULT GETDATE(),   
Fecha_Devolucion DATE,
Estado VARCHAR(25) DEFAULT 'Activo',
FOREIGN KEY (ID_Estudiante) REFERENCES ESTUDIANTE(ID_Estudiante),
FOREIGN KEY (ID_Ejemplar) REFERENCES EJEMPLAR(ID_Ejemplar)
)


CREATE TABLE LOCALIZACION(
ID_Localizacion INT IDENTITY(1,1) PRIMARY KEY,
Recinto VARCHAR(25),
)



SELECT * FROM ESTUDIANTE
SELECT * FROM AUTOR
SELECT * FROM EJEMPLAR
SELECT * FROM LIBROS
SELECT * FROM PRESTAMOS
SELECT * FROM LOCALIZACION
















