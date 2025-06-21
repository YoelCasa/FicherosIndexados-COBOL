# FicherosIndexados-COBOL

Este programa se trata de un programa básico que sirve para trabajar con ficheros indexados usando el lenguaje de programaión COBOL. En este caso, este programa consiste en la inserción de nuevos registros en un fichero que lo hemos llamado "empleados.csv", y lo hemos definido como un fichero indexado cuya clave primaria es el id.
Posteriormente, cuando el usuario finaliza de añadir nuevos registros, se procede a la lectura del fichero indexado para corroborar visualmente si han sido introducidos correctamente.
NOTA: Como Open extend coloca el puntero al final del fichero indexado después de insertar un registro nuevo, después de que el usuario no desee introducir nuevos registros, se debe proceder a cerrar el archivo y proceder a abrirlo únicamente en modo lectura (INPUT). De esta manera se produce la lectura del mismo de forma correcta.
