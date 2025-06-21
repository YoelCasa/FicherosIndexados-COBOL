IDENTIFICATION DIVISION.
       PROGRAM-ID. Ficheros-indexados.
       ENVIRONMENT DIVISION.
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.
           SELECT EMPLEAD-ARCHIVO
           ASSIGN TO "empleado.csv"
           ORGANIZATION IS INDEXED
           RECORD KEY EMPLEADOS-ID
           ACCESS MODE IS DYNAMIC
           FILE STATUS IS FS-STATUS.
       DATA DIVISION.
       FILE SECTION.
       FD  EMPLEAD-ARCHIVO.
       01  EMPLEADO-REGISTRO.
           05 EMPLEADOS-ID PIC 9(6).
           05 EMPLEADOS-NOMBRE PIC X(20).
           05 EMPLEADOS-APELLIDO PIC X(50).
       WORKING-STORAGE SECTION.
       01  PET-ID PIC X(30)
           VALUE "Introduzca el id: ".
       01  PET-NOMBRE PIC X(30)
           VALUE "Introduzca tu nombre: ".
       01  PET-APELLIDOS PIC X(30)
           VALUE "Introduzca tus apellidos: ".

       01  WS PIC X VALUE 'N'.
           88 SI-NO VALUE 'Y'.

       01  WS-EOF PIC X VALUE 'N'.
           88 FIN-FICHERO VALUE 'Y'.

       01  FS-STATUS PIC X(2).
           88 FS-OK VALUE '00'.

       01  aux PIC X.
       PROCEDURE DIVISION.
       MAIN-PROCEDURE.
           PERFORM APERTURA.

           DISPLAY "Desea seguir insertando registros(S/N)?"
           ACCEPT aux.
           IF aux = 'n' OR aux='N'
               SET SI-NO TO TRUE
           END-IF.
           PERFORM PREGUNTA UNTIL SI-NO.

           PERFORM CIERRE.

           OPEN INPUT EMPLEAD-ARCHIVO.
           
           IF NOT FS-OK 
               DISPLAY "Error al abrir el archivo"
               PERFORM FIN-PROGRAMA
           END-IF.
               
           READ EMPLEAD-ARCHIVO NEXT RECORD
               AT END  
                   SET FIN-FICHERO to TRUE
           END-READ.
           
           PERFORM LECTURA UNTIL FIN-FICHERO.


           PERFORM CIERRE.
           PERFORM FIN-PROGRAMA.

       PREGUNTA.

           INITIALIZE EMPLEADO-REGISTRO.

           DISPLAY PET-ID.
           ACCEPT EMPLEADOS-ID.
           DISPLAY PET-NOMBRE.
           ACCEPT EMPLEADOS-NOMBRE.
           DISPLAY PET-APELLIDOS.
           ACCEPT EMPLEADOS-APELLIDO.

           WRITE EMPLEADO-REGISTRO.

           DISPLAY "Desea seguir insertando registros(S/N)?"
           ACCEPT aux.
           IF aux = 'n' OR aux='N'
               SET SI-NO TO TRUE
           END-IF.

       LECTURA.
           PERFORM VALIDAR.
           READ EMPLEAD-ARCHIVO NEXT RECORD
               AT END
                   SET FIN-FICHERO TO TRUE
           END-READ.

       VALIDAR.
           DISPLAY " ID: " FUNCTION TRIM(EMPLEADOS-ID)
                   " Nombre: " FUNCTION TRIM(EMPLEADOS-NOMBRE)
                   " Apellidos: " FUNCTION TRIM(EMPLEADOS-APELLIDO).

       APERTURA.
           OPEN EXTEND EMPLEAD-ARCHIVO.

           IF NOT FS-OK
               OPEN OUTPUT EMPLEAD-ARCHIVO
           END-IF.
       CIERRE.
           CLOSE EMPLEAD-ARCHIVO.
       FIN-PROGRAMA.
            STOP RUN.
       END PROGRAM Ficheros-indexados.
