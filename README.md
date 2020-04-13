# Tutorial de Oracle sql Developer Datamodeler
## Escrito por Juan David Bolaños, revisado por Angela Villota Gómez.

## Introducción

Este tutorial tiene como objetivo permitir a los estudiantes del curso Modelado de Sistemas de Información familiarizarse con la herramienta Oracle sql Developer Datamodeler, una herramienta que asiste el diseño lógico de una base de datos (i.e., creación de modelo conceptual y el esquema de la base de datos)

Las instrucciones de este tutorial se explicarán a través del diseño paso a paso de un ejemplo básico mientras se explican cada uno de los conceptos y componentes utilizados.
Al finalizar la guía, se espera que los estudiantes se encuentren en la capacidad de (1) iniciar y persistir un proyecto con la herramienta; (2) diseñar un modelo Entidad-Relación entendiendo cada elemento empleado, transformar el modelo anterior a un modelo Relacional y generar un script DDL para la creación de una base de datos.

Esta guía permite que el estudiante represente usando la notación pata de gallina,  un modelo E/R originalmente especificado en la notación propuesta por Peter Chen.  Para ello, se irán desarrollando cada uno de los elementos del modelo lógico de Oracle mientras se explican los conceptos necesarios y cómo se relacionan con cada uno de los elementos de la notación de Chen.

> Como caso práctico, se seguirá paso a paso el diseño lógico de una base de datos de un instituto que desea almacenar la información de sus estudiantes y de sus materias matriculadas en un solo periodo académico, así como la información de los profesores y de las materias que estos dictan.
El modelo Entidad-Relación (E/R) completo que da solución al anterior caso es el que se ilustra en la siguiente figura. 

![Alt text](images/Diagrama.jpg?raw=true "Diagrama E/R") 




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
    Para crear una entidad se debe hacer clic en la opción de *Nueva Entidad* del menú de herramientas del modelo lógico y luego hacer clic sobre cualquier lugar del editor del modelo lógico, esto abrirá la siguiente pantalla.

    ![Alt text](images/MenuEntidad.JPG?raw=true "Menú Entidad")

    En este menú se ingresa el nombre de la entidad, su abreviatura, entre otros campos, por conveniencia los nombres de las entidades se escriben en singular. A la izquierda de este menú se pueden observar las posibles pestañas para la configuración de la entidad, entre estas se encuentran *Atributos, Identificadores únicos, Relaciones y Comentarios.*

    > ¿Recuerdas el caso práctico enunciado al inicio de la guía? el siguiente es un fragmento de este con solo la información del estudiante\
    ![Alt text](images/DiagramaEstudiante.jpg?raw=true "Entidad Estudiante")\

     El primer paso para hacer el modelo usando la herramienta es crear la entidad estudiante. Para ello, se debe crear una nueva entidad ingresando `ESTUDIANTE` como nombre de la entidad y `ESTUD` como abreviatura. Continuaremos ahora con sus atributos.
    
    
  * **Atributo**
    
    Un atributo (propiedad, campo) es una característica común de una entidad en particular. Estos atributos son mapeados finalmente a una columna de una tabla en el modelo relacional.
    Para visualizar los atributos de una entidad se debe abrir la pestaña *Atributos* en las propiedades de la entidad, lo cual muestra una lista con los atributos y los campos de cada uno de ellos, como se muestra en la siguiente figura.
    
    ![Alt text](images/MenuAtributo.JPG?raw=true "Menú Atributo")

    Para agregar un atributo a la entidad, se debe hacer clic en el botón '+' y llenar todos los campos requeridos. Cada atributo requiere un nombre, un tipo de dato y posiblemente algunos parámetros dependiendo del tipo de dato seleccionado.
    Además, datamodeler permite seleccionar si un atributo es *UID Primario* (hace parte de la llave primaria de la entidad) o si es *Obligatorio* (not null).
    Los atributos que conforman la llave primaria son únicos y obligatorios. 
    
    A continuación, se muestra un ejemplo de cómo se llenar los campos del atributo identificador de la entidad `ESTUDIANTE`, es decir, su llave primaria. La siguiente figura ilustra este ejemplo. 

    ![Alt text](images/EstudianteID.JPG?raw=true "ID Estudiante")
    
    Los campos necesarios para un atributo son los siguientes:

    * *Nombre*: Es el nombre del atributo, este debe ser lo más claro y completo posible. Como se desea agregar el identificador de la entidad Estudiante se sugiere ingresar `ID_ESTUDIANTE`.

    * *Tipo de Dato*: Permite especificarle al atributo un dominio o un tipo lógico, o si este es dintinto, de colección o estructurado. Un dominio describe un conjunto de posibles valores para ciertos atributos añadiendo algunas restricciones, estos pueden ser creados por la herramienta.
    En este ejemplo se usarán los tipos lógicos y más adelante se explicarán los dominios. Seleccionar *Lógico* tipo de dato de la entidad. 

    * *Tipo de Origen*: Es la especificación del tipo de dato lógico del atributo, permite seleccionar gran variedad de tipos como lo son *Boolean, CHAR, BLOB, Datetime, Numeric, VARCHAR, entre otros*. 
    El tipo de dato lógico sugerido para un identificador es el numérico, esto debido a que permitirá posteriormente agregarle generadores de claves secuenciales a la base de datos, así como darle un orden de acuerdo a la creación de cada registro. Seleccione *Numeric* como tipo de origen del atributo.
    Si desea conocer más sobre los tipos de datos de Oracle se recomienda visitar la página [*docs.oracle.com*](https://docs.oracle.com/cd/B28359_01/server.111/b28318/datatype.htm#CNCPT012).
    
    Al seleccionar el tipo de origen se puede observar que se habilitan nuevos campos dependiendo del tipo de origen que se seleccione, en este caso al seleccionar *Numeric* se habilitan las opciones *Presición y Escala*. 
    Este tipo de dato permite almacenar tanto números enteros como fraccionales, la precisión es el número total de dígitos desde el dígito más signficativo hasta el menos significativo, mientras que la escala es el número de dígitos desde la coma hacia el dígito menos significativo. 
    Supongamos que se desea almacenar alrededor de mil estudiantes.  Entonces la precisión sería `4` y la escala `0` porque esta precisión y escala permiten un máximo valor de 9999 sin cifras decimales.

    Finalmente se selecciona la opción *UIDPrimario* para definir a este atributo como el identificador de la entidad.

    Existen atributos que pueden ser únicos pero no necesariamente primarios. Por ejemplo, el número de documento de identificación nacional (cédula) de un estudiante es un atributo único para el sistema, y a su vez, es obligatatio pero no primario ya que hemos definido ya otro atributo como el identificador de la entidad.

    Para agregar un identificador único se deben seguir los siguentes pasos que vamos a explicar con el ejemplo ilustrado en la siguiente figura.

    ![Alt text](images/EstudianteCedula.JPG?raw=true "Cedula Estudiante")

    Primero se crea el atributo llenando el formulario del ejemplo anterior. Para crear el atributo `CEDULA_ESTUDIANTE` se selecciona el tipo de origen *VARCHAR* del tipo de dato *Lógico*.
    El tipo de origen *VARCHAR*  depliega los campos *Tamaño y Unidades*.
    Digite `10` como tamaño y seleccione  *CHAR* en las unidades. De esta forma, estamos declarando que la `CEDULA_ESTUDIANTE` tendrá máximo 10 caracteres. Seleccione la opción *Obligtorio* para definir que este atributo no puede ser nulo.

    A continuación, abra la pestaña *Identificadores Únicos* del frame de la izquierda. En esta pestaña se muestran los atributos únicos de la entidad, aquí se encuentra ya una clave única generada automáticamente con nombre "Estudiante PK", la cual hace referencia a la clave primaria previamente agregada, es decir, al atributido identificador de la entidad.

    Para crear una nueva clave única se debe seleccionar la opción '+', esto genera un nuevo item en la lista de claves únicas el cual tendrá por defecto el nombre de "Key 2", al hacer doble clic sobre este item se despliega un submenú donde se debe definir cuáles atributos harán parte de esta nueva clave única de la entidad.
    Para agregar el atributo de cédula a esta nueva clave única, se debe hacer clic sobre este atributo y posteriormente hacer clic en la flecha derecha, moviendolo de la lista de la izquierda a la lista de la derecha, esto finalmente debe verse como lo muestra la siguiente figura. 
    Aplique los cambios.

    ![Alt text](images/EstudianteCedulaUnica.JPG?raw=true "Cedula Estudiante Unica")

    En este momento el nuevo identificador único ya ha sido creado con el nombre "Key_2", para cambiarlo dirigirse a la pestaña *General* sobre este mismo submenú. Se sugiere el nombre de `CEDULA_UK`.
    
    > Ahora, usted deberá agregar dos nuevos atributos a la entidad `ESTUDIANTE`.  Estos atributos permiten al sistema almacenar el nombre y la edad de los estudiantes, el nombre debe ser obligatorio mientras que la edad no.

    La siguiente figura muestra el resultado final. En la entidad se puede apreciar que Datamodeler utiliza el símbolo '#' para representar identificadores primarios, la 'U' para los atributos únicos, el '*' para los atributos obligatorios y la 'o' para los atributos opcionales.

    ![Alt text](images/EstudianteEntidad.JPG?raw=true "Entidad Estudiante")

    Esta entidad en notación de Chen estaría representada por el siguiente diagrama.

    ![Alt text](images/DiagramaEstudiante.jpg?raw=true "Entidad Estudiante")\
    Observe que la entidad del modelo lógico de Oracle contiene más información que la brindada por en el modelo en notación de Chen, como por ejemplo la obligatoriedad de cada atributo o sus tipos de datos. Esto se debe a que el modelo E-R es un modelo conceptual y el modelo lógico de Oracle contiene información de la especificación del esquema de la base de datos.

  * **Relación**

    Una relación es una asociación que existe entre dos entidades, una de ellas denominada como entidad origen y la otra como entidad destino, para cada entidad de la relación existe una cardinalidad. La cardinalidad define el número de ocurrencias que pueden existir de la entidad destino dada una sola ocurrencia de la entidad origen. La cardinalidad puede tomar los valores de 1:1 (uno a uno), de 1:N (1 a muchos) o de N:M (muchos a muchos). 
    Una relación puede ser identificante o no. Las relaciones identificantes finalmente son mapeadas al identificador primario de la entidad destino.

    > Se pide al estudiante que cree una nueva entidad para que el sistema pueda almacenar las materias que el estudiante podrá matricular, una materia tiene su identificador, un nombre y un número de creditos, siendo todos estos obligatorios. La siguiente figura ilustra el cómo debería verse la entidad `MATERIA`.

    ![Alt text](images/EstudianteMateria.JPG?raw=true "Entidades Estudiante y Materia")

    Ambas entidades en notación de Chen estarían representadas por el siguiente diagrama.

    ![Alt text](images/DiagramaEstudianteMateria.jpg?raw=true "Diagrama E/R Estudiante y Materia")

    Ahora vamos a crear una la relación. En el ejemplo, el sistema requiere registrar en su base de datos las materias que están cursando los estudiantes. Como un estudiante puede cursar muchas materias y una materia puede ser cursada por muchos estudiantes, la relación entre ambas entidades es N:M (de muchos a muchos).
    Para crear una relación N:M se debe hacer clic en la opción de *Nueva Relación N:M* del menú de herramientas del modelo lógico, luego hacer clic sobre la entidad origen y finalmente otro clic sobre la entidad destino.

    En el ejemplo, la entidad origen es estudiante y la entidad destino es materia.  Una vez se señale las entidades, se abre un menú donde se solicita toda la información sobre la relación, ingresar `ESTUDIANTE_MATERIA` como nombre de la relación. Por conveniencia, el nombre de las relaciones se puede generar mediante la concatenación del nombre de ambas entidades.
    Asegurarse de que las opciones *Origen Opcional* y *Destino opcional* se encuentren seleccionadas ya que esto permite definir que la relación cuenta con sus dos entidades como opcionales. La siguiente figura ilustra la realización de las anteriores instrucciones.

    ![Alt text](images/PropiedadesRelacionEstudMateria.JPG?raw=true "Propiedades Relación Estudiante y Materia")

    Una vez aceptados los cambios, se logra crear la relación entre Estudiante y Materia como lo muestra la siguiente figura.

    ![Alt text](images/RelacionEstudMateria.JPG?raw=true "Relación Estudiante y Materia")

    Esta relación, en notación de Chen estaría representada por el siguiente diagrama.

    ![Alt text](images/DiagramaRelacionEstudMateria.jpg?raw=true "Diagrama E/R Relación Estudiante y Materia")

    > Se pide ahora al estudiante que cree una nueva entidad que le permita al sistema almacenar los profesores para poder registrar las materias que estos imparten, se sabe que una materia es impartida por un solo profesor, del profesor se solicita almancenar su nombre y fecha en la que ingresó al sistema. Una vez creada la entidad `PROFESOR` se espera tener lo siguiente.

    ![Alt text](images/ProfesorAgregado.JPG?raw=true "Entidades Profesor")

    A diferencia de la anterior relación, una materia es impartida por solo un profesor y un profesor puede impartir varias materias, por tanto la relación que se debe agregar es una relación 1:N de Profesor a Materia, para ello se hace el mismo procedimiento de la relación anterior solo que en esta ocasión debe hacerse mediante la opción *Nueva Relación 1:N*, ingrese `PROFESOR_MATERIA` como nombre de la relación. Al realizar esto, se espera tener lo siguiente.

    ![Alt text](images/ModeloCompleto.JPG?raw=true "Relación Profesor y Materia")

    Observe que al acceder a las propiedas de la entidad Materia mediante doble clic sobre esta, en la lista de sus atributos se ha generado uno nuevo cuyas propiedades no se pueden modificar.
    Este nuevo atributo hace referencia a la clave primaria (identificador) de la entidad Profesor. Esto es debido a que este nuevo atributo es una clave foránea de la entidad Materia que siempre apuntará a algún registro de la tabla Profesor, esto se puede evidenciar en la siguiente figura.
    De esta manera, cada registro de la tabla Materia conoce cuál es el registro del profesor que la imparte mediante su identificador.

    ![Alt text](images/MateriaClaveProfesor.JPG?raw=true "Clave foránea de Profesor en Materia")

    Finalmente, hemos terminado de pasar el modelo E/R en notación de Chen, ilustrado en la siguiente figura, a un modelo lógico de Oracle listo para ser implementado.

    ![Alt text](images/Diagrama.jpg?raw=true "Clave foránea de Profesor en Materia")

4. **Guardar(exportar) un proyecto**
    
    Para guardar un proyecto se debe hacer clic en la opción *Guardar como...* del menú *Archivo*, esto despliega el submenú que se ilustra en la siguiente figura.

    ![Alt text](images/Guardar.JPG?raw=true "Guardar como...")

    Observe que en el campo del nombre del archivo se encuentra por defecto el caracter `/`, este debe borrarse para poder ingresar el nombre deseado del proyecto. Por ejemplo, si queremos que el proyecto tenga como nombre `guia`, en el campo se debe ingresar exactamente la palabra `guia` y no `/guia`, ya que este último genera errores al guardar. Escoja o cree un directorio para guardar el proyecto y haga clic sobre la opción *Guardar*.

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
   
   
6. **Modelo Relacional**

    El modelo relacional consta de un conjunto de tablas que reflejan las entidades del modelol lógico y todos los atributos de cada entidad.
    En el modelo de datos de este tutorial, un solo modelo relacional reflejará todo el modelo lógico; sin embargo, para otros modelos de datos más complejos, se pueden crear uno o más modelos relacionales, cada uno de los cuales refleja todo o un subconjunto del modelo lógico. La estructura de un modelo lógico es la siguiente.

    ![Alt text](images/EstructuraRelacional.JPG?raw=true "Estructura Modelo Relacional")

    Datamodeler permite generar automáticamente un modelo relacional partiendo de un modelo lógico, esto se puede realizar haciendo clic en la opción de *Realizar Ingeniería a Modelo Relacional* en el menú de herramientas del modelo lógico, esta opción se ilustra a continaución.

    ![Alt text](images/OpcionIngenieria.JPG?raw=true "Realizar Ingeniería")

    Al hacer clic en la anterior opción, se despliega un menú donde se debe seleccionar qué elementos del modelo lógico se desean convertir a un modelo relacional, por defecto todo el modelo lógico se encuentra seleccionado, asegurarse de no seleccionar la opción *Aplicar Traducción de Nombre*. Esta confiruación se debe ver de la siguiente forma.

    ![Alt text](images/Ingenieria.JPG?raw=true "Opciones Ingeniería")

    Haga clic en *Realizar Ingeniería* para que se genere automáticamente el modelo relacional. Dado a que esta transformación genera un modelo ralacional cuyas tablas pueden quedar desorganizadas o sobrepuestas, si lo desea puede hacer clic derecho sobre cada tabla y luego hacer clic izquierdo en la opción *Cambiar Tamaño para Hacer Visible*.
    Adicionalmente, hacer clic derecho sobre el lienzo del modelo relacional, luego clic izquierdo en *Diseño*, *Diseño automático* y finalmente seleccione alguno de los diseños que ahí se listan. El modelo relacional resultante debe quedar como se muestra en la siguiente figura.

    ![Alt text](images/ModeloRelacional.JPG?raw=true "Modelo Relacional")

    Como se puede observar, se han creado cuatro tablas en el modelo relacional provenientes de tres entidades del modelo lógico. Para cada entidad se ha creado una tabla, sin embargo, se ha generado una tabla con nombre *ESTUDIANTE_MATERIA* la cual representa la relación de muchos a muchos entre las entidades Estudiante y Materia. A continuación, se revisarán estas tablas generadas, iniciando con la tabla Estudiante.

    ![Alt text](images/TablaEstudiante.JPG?raw=true "Tabla Estudiante")

    La tabla Estudiante cuenta con las columnas que representan los atributos con los que se creó su entidad en el modelo lógico, como se puede observar, la clave primaria se representa por una `P` en la columna. Bajo las columnas se encuentran las *Claves Primarias*, *Claves Ajenas* y *Restricciones de Clave Única*, en la tabla Estudiante se puede observar `ID_ESTUDIANTE` como su clave primeria y la la clave única generada anteriormente que apunta a `CEDULA_ESTUDIANTE`.

    ![Alt text](images/TablaMateria.JPG?raw=true "Tabla Materia")

    En la tabla Materia, se puede observar que al final se encuentra una clave foránea que apunta a la clave primaria de la tabla Profesor, es decir, a su identificador. La clave foránea se representa por una `F` en la columna.
    La tabla profesor cuenta únicamente con sus columnas y su clave primaria. Por otro lado, a continuación, se muestra la tabla *ESTUDIANTE_MATERIA*.

    ![Alt text](images/TablaEstudianteMateria.JPG?raw=true "Tabla Estudiante_Materia")

    En la anterior tabla, se puede observar que existen dos claves foráneas y una clave primaria, así como dos columnas. Las claves foráneas hacen referencia a las claves primarias de las tablas en cuestión, es decir, de Estudiante y Materia, siendo estas `ESTUDIANTE_ID` y `MATERIA_ID` respectivamente.
    La clave primaria en esta tabla es una clave compuesta por sus dos claves foráneas, esto quiere decir que un registro de esta tabla requiere y debe apuntar a una clave primaria de un registro tanto de la tabla Estudiante como de la tabla Materia. Estas columnas se representan mediante `PF`.
   
  
7. **Generación automática de un script *.ddl***

    