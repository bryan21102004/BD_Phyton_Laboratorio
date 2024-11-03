from connect_SQL import connect_to_sql_server

# Probamos la conexión a la BD
connection = connect_to_sql_server()
if connection:
    print("Conexión establecida correctamente desde el archivo de prueba.")
    connection.close()
else:
    print("No se pudo establecer la conexión.")



#Funcion que inserta un préstamo
def InsertarPrestamo(ID_Estudiante,ID_Ejemplar):
    connection= connect_to_sql_server()
    cursor= connection.cursor()
    sql="{CALL InsertarPrestamos(?,?)}"
    cursor.execute(sql,(ID_Estudiante,ID_Ejemplar))
    cursor.commit()
    print('Prestamos ingresado correctamente')
    cursor.close()
    connection.close()


#Funcion que consulta Libros
def ConsultarLibros(ID_Libro=None,Nombre_Libro=None, ISBN=None, Cantidad_Paginas=None, Editorial=None):
    connection = connect_to_sql_server()
    if connection:
        cursor = connection.cursor()
        sql = "{CALL ConsultarLibros(?,?,?,?,?)}"
        cursor.execute(sql,(ID_Libro,Nombre_Libro,ISBN,Cantidad_Paginas,Editorial))
        libros = cursor.fetchone()
        
        if libros:
            print("Libro encontrado:")
            print(f"ID_Libro: {libros[0]}")
            print(f"Nombre_Libro: {libros[1]}")
            print(f"ISBN: {libros[2]}")
            print(f"Cantidad_Paginas: {libros[3]}")
            print(f"Editorial: {libros[4]}")
            print(f"Fecha_Publicacion: {libros[5]}")
        else:
            print("No se encontró ningun libro con ese código.")
        
        cursor.close()
        connection.close()


#Funcion que actualiza Autores
def ActualizarAutores(ID_Autor, Nombre_Autor):
    connection= connect_to_sql_server()
    cursor=connection.cursor()
    sql= "{CALL ActualizarAutores(?,?)}"
    connection.execute(sql,(ID_Autor,Nombre_Autor))
    connection.commit()
    print('Autor actualizado correctamente')
    cursor.close()
    connection.close()





#Funcion que elimina estudiantes
def EliminarEstudiantes(ID_Estudiante):
    connection = connect_to_sql_server()
    if connection:
        cursor = connection.cursor()
        # Verificar si el estudiante tiene préstamos activos
        persona_prestamo_activo = "SELECT COUNT(*) FROM PRESTAMOS WHERE ID_Estudiante = ? AND Estado = 'Activo'"
        cursor.execute(persona_prestamo_activo, (ID_Estudiante,))
        prestamos_activos = cursor.fetchone()[0]
        
        if prestamos_activos > 0:
            print(f"No se puede eliminar el estudiante con ID {ID_Estudiante} porque tiene préstamos activos.")
        else:
            # Eliminar al estudiante si no tiene préstamos activos
            estudiantes_sin_prestamos = "DELETE FROM ESTUDIANTE WHERE ID_Estudiante = ?"
            cursor.execute(estudiantes_sin_prestamos, (ID_Estudiante,))
            connection.commit()
            print(f"Estudiante con ID {ID_Estudiante} fue eliminado correctamente.")
          
        cursor.close()
        connection.close()





#Pruebas
InsertarPrestamo(35,10)
#ConsultarLibros(Nombre_Libro='Soledad')
#ActualizarAutores(1,'Margarita Rojas Morera')
#EliminarEstudiantes(30)