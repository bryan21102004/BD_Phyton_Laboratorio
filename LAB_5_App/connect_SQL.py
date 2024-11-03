import pyodbc
def connect_to_sql_server():
    # Parámetros de conexión
    server = 'Andrés'
    database = 'Lab_5'
    username = 'user3'
    password = 'root'

    # Definir la cadena de conexión
    conn_str = f'DRIVER={{ODBC Driver 17 for SQL Server}};SERVER={server};DATABASE={database};UID={username};PWD={password}'

    try:
        # Conectarse a la base de datos
        connection = pyodbc.connect(conn_str)
        print("Connection established successfully")
        return connection
    except pyodbc.Error as e:
        print(f"Connection failed: {e}")
        return None