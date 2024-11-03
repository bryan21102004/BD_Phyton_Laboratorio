
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


--Procedimiento almacenado que inserta un préstamo
CREATE PROCEDURE InsertarPrestamos
    @ID_Estudiante INT,
	@ID_Ejemplar INT
	
AS
BEGIN
	SET NOCOUNT ON;
	DECLARE @Fecha_Devolucion DATE;
	SET @Fecha_Devolucion =DATEADD(DAY,15,GETDATE());

	INSERT INTO PRESTAMOS(ID_Estudiante,ID_Ejemplar,Fecha_Prestamo,Fecha_Devolucion,Estado)
	VALUES (@ID_Estudiante, @ID_Ejemplar,GETDATE(),@Fecha_Devolucion,'Activo');

END
GO

--Procedimiento almacenado para consultar libros
CREATE PROCEDURE ConsultarLibros
    @ID_Libro INT = NULL,
    @Nombre_Libro VARCHAR(255) = NULL,
    @ISBN VARCHAR(50) = NULL,
    @Cantidad_Paginas INT = NULL,
    @Editorial VARCHAR(255) = NULL
	
AS
BEGIN
    SET NOCOUNT ON;

    SELECT * 
    FROM LIBROS
    WHERE (@ID_Libro IS NULL OR ID_Libro = @ID_Libro)
      AND (@Nombre_Libro IS NULL OR Nombre_Libro = @Nombre_Libro)
      AND (@ISBN IS NULL OR ISBN = @ISBN)
      AND (@Cantidad_Paginas IS NULL OR Cantidad_Paginas = @Cantidad_Paginas)
      AND (@Editorial IS NULL OR Editorial = @Editorial)
	  
END;
GO





--Procedimiento almacenado que actualiza autores
 CREATE PROCEDURE ActualizarAutores
    @ID_Autor INT,          
    @Nombre_Autor VARCHAR(55)
AS
BEGIN
    SET NOCOUNT ON;

    UPDATE AUTOR
    SET 
    Nombre_Autor = @Nombre_Autor  
    WHERE ID_Autor = @ID_Autor;
END;
GO


--Procedimiento almacenado para eliminar estudiantes
CREATE PROCEDURE EliminarEstudiantes
	@ID_Estudiante INT
AS
BEGIN
	SET NOCOUNT ON;
DELETE FROM ESTUDIANTE
WHERE @ID_Estudiante= @ID_Estudiante;
   
END
GO
