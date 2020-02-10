# Tutorial de Oracle sql Developer Datamodeler

## Introducción

Este tutorial tiene como objetivo permitir a los estudiantes del curso Modelado de Sistemas de Información familiarizarse con la herramienta Oracle sql Developer Datamodeler, una herramienta para el diseño de modelos de bases de datos, a través el diseño paso a paso de un ejemplo práctico y básico mientras se explican cada uno de los conceptos y componentes utilizados, al finalizar la guía se espera que el estudiante este en la capacidad de iniciar y persistir un proyecto en la herramienta, diseñar un modelo Entidad-Relación entendiendo cada elemento empleado, transformar el modelo anterior a un modelo Relacional y generar un scrit DDL para la creación de una base de datos.

1. **Instalación**
   
   La herramienta Datamodeler 19.4 con su respectivo JDK se puede descargar gratuiramente desde [*oracle.com*](https://www.oracle.com/tools/downloads/sql-data-modeler-downloads.html), la descarga requiere la creación de una cuenta Oracle.
   
2. **Iniciar un proyecto**
   
   Al ejecutar el programa, se inicia su interfaz gráfica en donde se puede observar en la parte superior una barra con las clásicas opciones de un programa como lo son *Archivo, Editar, Ver, ente otros.* Por otro lado, se puede observar una pestaña llamada **Explorador** tal como lo muestra la siguiente captura. Si esta pestaña no aparece hacer clic en la opción *Explorador* del menú *Ver*

   ![Alt text](images/Explorador.jpg?raw=true "Explorador")

   En esta pestaña se encontrarán todos los proyectos (Diseños) que se tengan abiertos, así como la estructura de cada uno de estos y los principales archivos editables, tal como lo son el *Modelo Lógico* y los *Modelos Relacionales*, los cuales se detallarán en las siguientes secciones. Por defecto, el programa inicia con un diseño abierto llamado "Sin título_1".

3. **Modelo Lógico**

    Un modelo lógico en datamodeler es, de acuerdo a la docuementación oficial de Oracle [*(oracle-sql-developer-data-modeler-users-guide)*](Documents/oracle-sql-developer-data-modeler-users-guide.pdf), un diagrama Entidad-Relación que proporiciona una vista independiente de la implementación de la información del negocio. Un modelo lógico está compuesto por un conjunto de Entidades, Relaciones, Herencias, Vistas, Subvistas y Visualizaciones. Gran parte de los anteriores conceptos se desarrollarán en la presente guía, a continuación se muestra una captura la estructura de un modelo lógico.

    ![Alt text](images/ModeloLogico.jpg?raw=true "Modelo Lógico")

    Para poder abrir el editor del modelo lógico, se debe hacer clic derecho sobre *Modelo Lógico* y seleccionar la opción *Mostrar*, de esta manera, se habilita un menú de herramientas para la edición del modelo, este menú es el siguiente.

    ![Alt text](images/MenuModeloLogico.jpg?raw=true "Menú Modelo Lógico")
   
  * **Entidad**
  
    Una entidad es un objeto o concepto del que se quiere almacenar cierta información, compuesto por un conjunto de atributos de los cuales uno de ellos debe ser el identificador único de la entidad, esta entidad finalmente es mapeada a una tabla del modelo relacional. Para crear una entidad se debe hacer clic en la opción de *Nueva Entidad* del menú de herramientas del modelo lógico y luego hacer clic sobre cualquier lugar del editor, esto abrirá la siguiente pantalla.

    ![Alt text](images/MenuEntidad.jpg?raw=true "Menú Entidad")

    En este menú se ingresa el nombre de la entidad, su abreviatura, entre otros campos, por conveniencia los nombres de las entidades se escriben en singular. A la izquierda de este menú se pueden observar las posibles pestañas para la configuración de la entidad, entre estas se encuentran *Atributos, Identificadores únicos, Relaciones y Comentarios.*

    > Como caso práctico, se sugiere realizar el modelo lógico de un sistema que desea almacenar la información de estudiantes y de su país de nacimiento. Para ello, ingresar `ESTUDIANTE` como nombre de la entidad y `ESTUD` como abreviatura. En las siguientes secciones se irá desarrollando dicho modelo.
    
  * **Atributo**
    
    Un atributo (propiedad, campo) es una característica común de una entidad en particular. Para agregar atributos a la entidad se debe abrir la pestaña *Atributos* de la entidad,luego hacer clic en el botón *+* y llenar todos los campos requeridos como se muestra a continuación. Estos tributos son mapeados finalmente a una columna de una tabla en el modelo relacional.

    ![Alt text](images/MenuAtributo.jpg?raw=true "Menú Atributo")

    Cada atributo requiere un nombre, un tipo de dato y posiblemente algunos parámetros dependiendo del tipo de dato seleccionado. Además, datamodeler permite seleccionar si un atributo es *UID Primario* (Clave primaria de la entidad) o si es *Obligatorio*, cabe mencionar que si se selecciona un atributo como UID primario este también será obligatorio y, en efecto, también será un identificador único de la entidad, lo cual implica que el diseño del modelo no permitirá ingresar dos registros a esta tabla con igual valor en dicho atributo.

    Para agregar la clave primaria de la entidad Estudiante, ingresar en nombre `ESTUDIANTE_ID`, seleccionar la opción *Lógico* como tipo de dato y *NUMERIC* como tipo de origen, esto desplegará dos nuevas opciones las cuales son la *Precisión y Escala* del atributo. Este tipo de dato permite almacenar tanto números enteros como fraccionales, la precisión es el número total de dígitos desde el dígito más signficativo hasta el menos significativo, mientras que la escala es el número de dígitos desde la coma hacia el digito menos significativo, como se desea almacenar alrededor de mil estudiantes, ingresar `4` como precisión y `0` como escala, notese que una precisión de 4 permite un máximo valor de 9999 y que este no tendrá parte fraccional. Lo anterior debe evidenciarse de esta forma.

    ![Alt text](images/EstudianteID.jpg?raw=true "ID Estudiante")
    
    Por otro lado, algunos atributos pueden ser únicos pero no necesariamente obligatorios, como es el caso del número de documento de identificación nacional (cédula) de un estudiante el cual es un atributo único para el sistema, pero no primario. Para agregar este identificador único, primero se debe crear el atributo como se hizo anteriormente con el identificador, ingresar para este nuevo atributo el nombre de `CEDULA_ESTUDIANTE` y tipo de origen *VARCHAR*, esto depliega los campos *Tamaño y Unidades*, ingresar `10` y seleccionar como unidad *CHAR*, es decir, este dato tendrá máximo 10 caracteres. Luego, se debe abrir la pestaña *Identificadores Únicos* donde se muestran los atributos únicos de la entidad, aquí se encuentra ya el identificador primario previamente agregado. Seleccionar la opción *+* y hacer doble clic en el nuevo item de la lista, lo cual despliega un submenú donde se debe agregar el atributo haciendo clic sobre este y posteriormente en la flecha derecha, mostrando lo siguiente.

    ![Alt text](images/EstudianteCedula.jpg?raw=true "Cedula Estudiante")

    El nuevo identificador único ya ha sido creado con un nombre por defecto, en este caso es "Key_2", para cambiarlo dirigirse a la pestaña *General* sobre este mismo submenú. 
    
    > Agregar dos nuevos atributos a la entidad que permitan al sistema almacenar el nombre y la edad de los estudiantes, el nombre debe ser obligatorio mientras que la edad no.

    Finalmente, se espera obsevar la siguiente entidad.

    ![Alt text](images/EstudianteEntidad.jpg?raw=true "Entidad Estudiante")

  * **Relación**



    * Origen - Destino
    * Claves foráneas
    * Cardinalidades
    * Identificación de relación 
4. Guardar (exportar) un proyecto en un archivo *.dmd*
5. Subvista como gestión de entidades
6. Ingeniería a un modelo Relacional
7. Generación automática de un script *.ddl*