# Tutorial de Oracle sql Developer Datamodeler
## Escrito por Juan David Bolaños, revisado por Angela Villota Gómez.

## Introducción

Este tutorial tiene como objetivo permitir a los estudiantes del curso Modelado de Sistemas de Información familiarizarse con la herramienta Oracle sql Developer Datamodeler, una herramienta que asiste el diseño lógico de una base de datos (i.e., creación de modelo conceptual y el esquema de la base de datos)

Las instrucciones de este tutorial se explicarán a través del diseño paso a paso de un ejemplo básico mientras se explican cada uno de los conceptos y componentes utilizados.
Al finalizar la guía, se espera que los estudiantes se encuentren en la capacidad de (1) iniciar y persistir un proyecto con la herramienta; (2) diseñar un modelo Entidad-Relación entendiendo cada elemento empleado, transformar el modelo anterior a un modelo Relacional y generar un scrit DDL para la creación de una base de datos.

> Como caso práctico, se sugiere realizar el diseño lógico de una base de datos de un instituto que desea almacenar la información de sus estudiantes y de sus materias matriculadas en un solo periodo académico, así como la información de los profesores y de las materias que estos dictan.
El modelo Entidad-Relación(E/R) completo que da solución al anterior caso es el que se ilustra en la siguiente figura. 

![Alt text](images/Diagrama.jpg?raw=true "Diagrama E/R") 

Esta guía permite que el estudiante comprenda la representación de un modelo E/R bajo la notación propuesta por Peter Chen, en un modelo lógico del sistema de gestión de base de datos de Oracle Database. Para ello, se irán desarrollando cada uno de los elementos del modelo lógico de Oracle mientras se explican los conceptos necesarios y cómo se relacionan con cada uno de los elementos de la notación de Chen.


1. **Instalación**
   
    La herramienta Datamodeler 19.4 con su respectivo JDK se puede descargar gratuitamente desde [*oracle.com*](https://www.oracle.com/tools/downloads/sql-data-modeler-downloads.html). 
    La descarga requiere la creación de una cuenta Oracle, una vez se crea esta cuenta se inicia la descarga de una carpeta comprimida donde se encuentra el ejecutable de la aplicación, este es el archivo *datamodeler.exe*
   
2. **Iniciar un proyecto**
   
    Al ejecutar el programa, se inicia su interfaz gráfica en donde se puede observar en la parte superior una barra de herramientas horizontal con las clásicas opciones como lo son *Archivo, Editar, Ver, ente otros.*
    Si es la primera vez que esta aplicación es ejecutada y anteriormene se contaba con alguna otra versión instalada, la herramienta preguntará si desea importar proyectos de otras versiones, así como ciertas configuraciones, por ser esta la primera interacción con la herramienta omitiremos esta opción.

    Por otro lado, se pueden observar unas pestañas llamadas **Explorador, Mensajes-Log y Navegador**, ubicadas en la parte izquierda, inferior y derecha de la herramienta, respectivamente. Adicionalmente, en el centro de la herramienta se encuentra el espacio de trabajo donde se podrán ver y editar los archivos de los proyectos. 
    En *Mensajes-Log* se muestran todos los logs que la herramienta genera como mensaje de salida al realizar diferentes acciones. 
    En *Navegador* se muestra una vista alejada del archivo que tengamos abierto en nuestro espacio de trabajo el cual, por el momento, muestra tres pestañas, llamadas "Logical(Sin título_1)", "Relational(Sin_título_1)" y una de Bienvenida de Oracle, esta última puede cerrarse. Estas dos primeras pestañas son el modelo lógico y el modelo relacional del diseño que se genera por defecto al iniciar el programa, este diseño tiene por nombre "Sin título_1".

    En la siguiente figura se puede observar la pestaña *Explorador*, si esta pestaña no aparece se debe hacer clic en la opción *Explorador* del menú *Ver*.

    ![Alt text](images/Explorador.JPG?raw=true "Explorador") 

    En esta pestaña se encontrarán todos los proyectos (Diseños) que se tengan abiertos, así como la estructura de cada uno de estos y los principales archivos editables, tal como lo son el *Modelo Lógico* y los *Modelos Relacionales*, los cuales se detallarán en las siguientes secciones.

3. **Modelo Lógico**

    [//]: # (Esta explicación esta muy bien, pero no deja claro cuál es la diferencia entre un modelo E-R y un modelo lógico.  Porque el modelo E-R es un modelo conceptual)

    Un modelo lógico en datamodeler es, de acuerdo a la docuementación oficial de Oracle en [*(oracle-sql-developer-data-modeler-users-guide)*](Documents/oracle-sql-developer-data-modeler-users-guide.pdf), un diagrama Entidad-Relación que proporciona una vista de la información del negocio independiente de la implementación. Un modelo lógico está compuesto por un conjunto de Entidades, Relaciones, Herencias, Vistas, Subvistas y Visualizaciones. 
    Estos conceptos se desarrollarán posteriormente en esta guía, a continuación, se muestra la estructura de un modelo lógico.

    ![Alt text](images/ModeloLogico.JPG?raw=true "Modelo Lógico")

    Como se mencionó anteriormente, el modelo lógico del diseño actual tiene por nombre "Logical(Sin título_1)", si este no se encuentra visible se debe hacer clic derecho sobre *Modelo Lógico* y seleccionar la opción *Mostrar*, de esta manera, se habilita un menú de herramientas para la edición del modelo, este menú es el siguiente.

    ![Alt text](images/MenuModeloLogico.JPG?raw=true "Menú Modelo Lógico")
   
  * **Entidad**
  
    Una entidad es un objeto o concepto del que se quiere almacenar cierta información. Una entidad está compuesta por un conjunto de atributos de los cuales uno de ellos debe ser el identificador único o llave de la entidad.
    Una entidad finalmente es mapeada a una tabla del modelo relacional.
    Para crear una entidad se debe hacer clic en la opción de *Nueva Entidad* del menú de herramientas del modelo lógico y luego hacer doble clic sobre cualquier lugar del editor del modelo lógico, esto abrirá la siguiente pantalla.

    ![Alt text](images/MenuEntidad.JPG?raw=true "Menú Entidad")

    En este menú se ingresa el nombre de la entidad, su abreviatura, entre otros campos, por conveniencia los nombres de las entidades se escriben en singular. A la izquierda de este menú se pueden observar las posibles pestañas para la configuración de la entidad, entre estas se encuentran *Atributos, Identificadores únicos, Relaciones y Comentarios.*

    > ¿Recuerdas el caso práctico enunciado al inicio de la guía? Para iniciar a diseñar dicho modelo, debemos crear nuestra primera entidad para modelar a los estudiantes. Para ello, se debe crear una nueva entidad ingresando `ESTUDIANTE` como nombre de la entidad y `ESTUD` como abreviatura. Continuaremos ahora con sus atributos. 
    
  * **Atributo**
    
    Un atributo (propiedad, campo) es una característica común de una entidad en particular. Estos atributos son mapeados finalmente a una columna de una tabla en el modelo relacional.
    Para visualizar los atributos de una entidad se debe abrir la pestaña *Atributos* de las propiedades de la entidad, lo cual muestra una lista con los atributos y los campos de cada uno de ellos, como se muestra en la siguiente figura.
    
    ![Alt text](images/MenuAtributo.JPG?raw=true "Menú Atributo")

    Para agregar un atributo a la entidad, se debe hacer clic en el botón '+' y llenar todos los campos requeridos. Cada atributo requiere un nombre, un tipo de dato y posiblemente algunos parámetros dependiendo del tipo de dato seleccionado.
    Además, datamodeler permite seleccionar si un atributo es *UID Primario* (Clave primaria de la entidad) o si es *Obligatorio*.
    Si se selecciona un atributo como UID primario, este también será obligatorio. 
    No pueden existir dos registros distintos en esta tabla con igual valor en el atributo definido como UID.

    A continuación, se muestra un ejemplo de cómo se llenan los campos del atributo identificador de la entidad `ESTUDIANTE`, es decir, su llave primaria. La siguient efigura ilustra este ejemplo. 

    ![Alt text](images/EstudianteID.JPG?raw=true "ID Estudiante")
    
    Los campos necesarios para un atributo son los siguientes:

    * *Nombre*: Es el nombre del atributo, este debe ser lo más claro y completo posible. Como se desea agregar el identificador de la entidad Estudiante se sugiere ingresar `ID_ESTUDIANTE`.

    * *Tipo de Dato*: Permite especificarle al atributo un dominio, un tipo lógico, dintinto, de colección o estructurado. Un dominio describe un conjunto de posibles valores para ciertos atributos añadiendo algunas restricciones, estos pueden ser creados por la herramienta. Sin embargo, como a cada dominio se le debe seleccionar finalmente un tipo lógico y buscando una mayor simplicidad para el desarrollo de esta guía, no se usarán los dominios y solo se usarán los tipos lógicos. Seleccionar *Lógico* tipo de dato de la entidad. 

    * *Tipo de Origen*: Es la especificación del tipo de dato lógico del atributo, permite seleccionar gran variedad de tipos como lo son *Boolean, CHAR, BLOB, Datetime, Numeric, VARCHAR, entre otros*. El tipo de dato lógico sugerido para un identificador es numérico, esto debido a que permitirá posteriormente agregarle generadores de claves secuenciales a la base de datos, así como darle un orden de acuerdo a la creación de cada registro. Seleccionar *Numeric* como tipo de origen del atributo. Si desea conocer más sobre los tipos de datos de Oracle se recomienda visitar la página [*docs.oracle.com*](https://docs.oracle.com/cd/B28359_01/server.111/b28318/datatype.htm#CNCPT012).
    
    Al seleccionar el tipo de origen se puede observar que se habilitan nuevos campos dependiendo del tipo de origen que se seleccione, en este caso al seleccionar *Numeric* se habilitan las opciones *Presición y Escala*. Este tipo de dato permite almacenar tanto números enteros como fraccionales, la precisión es el número total de dígitos desde el dígito más signficativo hasta el menos significativo, mientras que la escala es el número de dígitos desde la coma hacia el dígito menos significativo. 
    Supongamos que se desea almacenar alrededor de mil estudiantes.  Entonces la precisión es `4` y la escala `0` porque esta precisión y escala permiten un máximo valor de 9999 sin cifras decimales.

    Finalmente se selecciona la opción UIDPrimario para definir a este atributo como el identificador de la entidad.

    Existen atributos que pueden ser únicos pero no necesariamente primarios. Por ejemplo, el número de documento de identificación nacional (cédula) de un estudiante es un atributo único para el sistema, y a su vez, es obligatatio pero no primario ya que hemos definido ya otro atributo como el identificador de la entidad.

    Para agregar un identificador único se deben seguir los siguentes pasos que vamos a explicar con el ejemplo ilustrado en la siguiente figura.

    ![Alt text](images/EstudianteCedula.JPG?raw=true "Cedula Estudiante")

    Primero se crea el atributo llenando el formulario del ejemplo anterior. Para crear el atributo `CEDULA_ESTUDIANTE` se selecciona el tipo de origen *VARCHAR*.
    El tipo de origen *VARCHAR*  depliega los campos *Tamaño y Unidades*.
    Digite `10` como tamaño y seleccione  *CHAR* en las unidades. De esta forma, estamos declarando que la `CEDULA_ESTUDIANTE` tendrá máximo 10 caracteres.

    A continuación, abra la pestaña *Identificadores Únicos* del frame de la izquierda. En esta pestaña se muestran los atributos únicos de la entidad, aquí se encuentra ya una clave única con nombre es "Estudiante PK" la cual hace referencia a la clave primaria previamente agregada, es decir, al atributido identificador.
    Para crear una nueva clave única se debe seleccionar la opción '+', esto genera un nuevo item en la lista de claves únicas el cual tendrá por defecto el nombre de "Key 2", al hacer doble clic sobre este item se despliega un submenú donde se debe definir cuáles atributos harán parte de esta nueva clave única de la entidad.
    Para agregar el atributo de cédula a esta nueva clave única, se debe hacer clic sobre este atributo y posteriormente hacer clic en la flecha derecha, moviendolo de la lista de la izquierda a la lista de la derecha, esto finalmente debe verse como lo muestra la siguiente figura. 
    Aplicar los cambios.

    ![Alt text](images/EstudianteCedulaUnica.JPG?raw=true "Cedula Estudiante Unica")

    En este momento el nuevo identificador único ya ha sido creado con el nombre "Key_2", para cambiarlo dirigirse a la pestaña *General* sobre este mismo submenú. Se sugiere el nombre de `CEDULA_UK`.
    
    > Ahora, usted deberá agregar dos nuevos atributos a la entidad `ESTUDIANTE`.  Estos atributos permiten al sistema almacenar el nombre y la edad de los estudiantes, el nombre debe ser obligatorio mientras que la edad no.

    La siguiente figura muestra el resultado final. En la entidad se puede apreciar que datamodeler utiliza el símbolo '#' para representar identificadores primarios, la 'U' para los atributos únicos, el '*' para los atributos obligatorios y la 'o' para los atributos opcionales.

    ![Alt text](images/EstudianteEntidad.JPG?raw=true "Entidad Estudiante")

    Esta entidad en notación de Chen estaría representada por el siguiente diagrama. Observe que la entidad del modelo lógico de Oracle contiene mucha más información que la brindada por en el modelo en notación de Chen, como lo es la obligatoriedad de cada atributo o sus tipos de datos.

    ![Alt text](images/DiagramaEstudiante.jpg?raw=true "Entidad Estudiante")

  * **Relación**

    Una relación es una asociación que existe entre dos entidades, una de ellas denominada como entidad origen y la otra como entidad destino, para cada entidad de la relación existe una cardinalidad. La cardinalidad define el número de ocurrencias que pueden existir de la entidad destino dada una sola ocurrencia de la entidad origen. La cardinalidad puede tomar los valores de 1:1 (uno a uno), de 1:N (1 a muchos) o de N:M (muchos a muchos). 
    Una relación puede ser identificante o no. Las relaciones identificantes finalmente son mapeada al identificador primario de la entidad destino.

    > Se pide al estudiante que cree una nueva entidad para que el sistema pueda almacenar las materias que el estudiante podrá matricular, una materia tiene su identificador, un nombre y un número de creditos, siendo todos estos obligatorios. La siguiente figura ilustra el cómo debería verse la entidad `MATERIA`.

    ![Alt text](images/EstudianteMateria.JPG?raw=true "Entidades Estudiante y Materia")

    Ambas entidades en notación de Chen estarían representadas por el siguiente diagrama.

    ![Alt text](images/DiagramaEstudianteMateria.jpg?raw=true "Diagrama E/R Estudiante y Materia")

    Observe que, al acceder a las propiedas de la entidad Materia mediante doble clic sobre esta, se ha generado un nuevo atributo cuyas propiedades no se pueden modificar.
    Este nuevo atributo hace referencia al atributo primario del profesor, es decir, al identificador del profesor, por tanto este atributo se convierte en una clave primaria que siempre apuntará a algún registro de la tabla Profesor, esto se puede evidenciar en la siguiente figura.

    ![Alt text](images/MateriaClaveProfesor.JPG?raw=true "Clave foránea de Profesor en Materia")

    Ahora vamos a crear la relación. El sistema también require registrar en su base de datos las materias que están cursando los estudiantes, dado a que un estudiante puede cursar muchas materias y que una materia puede ser cursada por muchos estudiantes, la relación entre ambas entidades es N:M.
    Para crear una relación N:M se debe hacer clic en la opción de *Nueva Relación N:M* del menú de herramientas del modelo lógico, luego hacer clic sobre la entidad origen y finalmente otro clic sobre la entidad destino, abriendo de esta manera un menú donde se solicita el nombre de la relación entre ambas entidades, ingresar `ESTUDIANTE_MATERIA`. Por conveniencia, el nombre de las relaciones se puede generar mediante la concatenación del nombre de ambas entidades. Una vez aceptados los cambios, se logra crear la relación entre Estudiante y Materia como lo muestra la siguiente figura.

    ![Alt text](images/RelacionEstudMateria.JPG?raw=true "Relación Estudiante y Materia")

    Esta relación, en notación de Chen estaría representada por el siguiente diagrama.

    ![Alt text](images/DiagramaRelacionEstudMateria.jpg?raw=true "Diagrama E/R Relación Estudiante y Materia")

    > Se pide ahora al estudiante que cree una nueva entidad que le permita al sistema almacenar los profesores para poder registrar las materias que estos imparten, se sabe que una materia es impartida por un solo profesor, del profesor se solicita almancenar su nombre y fecha en la que ingresó al sistema. Una vez creada la entidad `PROFESOR` se espera tener lo siguiente.

    ![Alt text](images/ProfesorAgregado.JPG?raw=true "Entidades Profesor")

    A diferencia de la anterior relación, una materia es impartida por solo un profesor, por tanto la relación que se debe agregar es una relación 1:N de Materia a Profesor, para ello se hace el mismo procedimiento de la relación anterior solo que en esta ocasión debe hacerse mediante la opción *Nueva Relación 1:N*. Al realizar esto, se espera tener lo siguiente.

    ![Alt text](images/ModeloCompleto.JPG?raw=true "Relación Profesor y Materia")

    Finalmente, hemos terminado de pasar el modelo E/R en notación de Chen, ilustrado en la siguiente figura, a un modelo lógico de Oracle listo para ser implementado.

    ![Alt text](images/Diagrama.jpg?raw=true "Clave foránea de Profesor en Materia")

4. **Guardar(exportar) un proyecto**
    
    Para guardar un proyecto se debe hacer clic en la opción *Guardar como...* del menú *Archivo*, esto despliega el submenú que se ilustra en la siguiente figura.

    ![Alt text](images/Guardar.JPG?raw=true "Guardar como...")

    Observe que en el campo del nombre del archivo se encuentra por defecto el caracter `/`, este debe borrarse para poder ingresar el nombre deseado del proyecto. Por ejemplo, si queremos que el proyecto tenga como nombre `guia`, en el campo se debe ingresar exactamente la palabra `guia` y no `/guia`, ya que este último genera errores al guardar. Hacer clic sobre la opción *Guardar*.

    Si desea asegurarse de que el proceso de guardado ha sido realizado con éxito y sin ningún tipo de error, puede observar en la pestaña *Mensajes - Log* en la parte inferior de la pantalla donde el programa imprime cada uno de las acciones realizadas. 
    La siguiente figura ilustra un ejemplo de los mensajes que deberían salir al  guardar correctamente el proyecto `guia`, aquí también se puede observar la ruta donde el proyecto fue guardado. Si esta pestaña no se encuentra visible hacer clic en la opción *Log* del menú *Ver*.

    ![Alt text](images/GuardarLogs.JPG?raw=true "Guardar Logs")

    El proceso de guardado genera una carpeta y un archivo, ambos con el nombre ingresado. En este caso, en la ruta seleccionada se crean una carpeta con nombre *guia* y un archivo llamado *guia.dmd*, tal como se ilustra en la siguiente figura.

    ![Alt text](images/Archivos.JPG?raw=true "Archivos")

    En la carpeta *guia* se encuentran todos los archivos necesarios para el proyecto, que en conjunto generan todo el diseño realizado. Por otro lado, el archivo *guia.dmd* es un archivo propio de Oracle, más precisamente de SQL Developer Data Modeler, en este se almacena la estructura de los datos y sus relaciones para poder ser visualizadas por la herramienta. Ambos son necesarios.

5. **Abrir(importar) un proyecto**

    Para abrir un proyecto, solo es necesario hacer clic en la opción *Abrir* del *Menú* y seleccionar el archivo con extensión *.dmd*, este debe estar en la mismo directorio que la carpeta que se generó al momento de guardar el proyecto. 
    Por ejemplo, si queremos abrir el proyecto de la presente guía, se debe seleccionar el archivo *guia.dmd*, el cual debe estar en la mismo directorio de la carpeta *guia*.
    Esto abrirá un submenú en el que se solicita seleccionar los modelos relacionales asociados al proyecto, dado a que por el momento solo se tiene el modelo relacional que el programa genera por defecto, se procede a hacer clic en *Aceptar*.

    Si desea asegurarse de que el proyecto fue abierto correctamente se puede observar la pestaña logs del programa donde se esperaría ver lo que se muestra en la siguiente figura.

    ![Alt text](images/AbrirLogs.JPG?raw=true "Abrir Logs")
   
6. **Subvista como gestión de entidades**

    (No estoy muy seguro si explicar esto en esta guía)
   
7. **Modelo Relacional**
    
  
8. Generación automática de un script *.ddl*