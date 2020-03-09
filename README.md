# Tutorial de Oracle sql Developer Datamodeler
## Escrito por Juan David Bolaños, revisado por Angela Villota Gómez.

## Introducción

Este tutorial tiene como objetivo permitir a los estudiantes del curso Modelado de Sistemas de Información familiarizarse con la herramienta Oracle sql Developer Datamodeler.
Datamodeler es una herramienta para el diseño de modelos de datos. Las instrucciones se explicarán a través del diseño paso a paso de un ejemplo básico mientras se explican cada uno de los conceptos y componentes utilizados.
Al finalizar la guía, se espera que los estudiantes se encuentre en la capacidad de (1) iniciar y persistir un proyecto con la herramienta; (2) diseñar un modelo Entidad-Relación entendiendo cada elemento empleado, transformar el modelo anterior a un modelo Relacional y generar un scrit DDL para la creación de una base de datos.

> Como caso práctico, se sugiere realizar el modelo lógico de un sistema de un instituto que desea almacenar la información de sus estudiantes y de sus materias matriculadas en un solo periodo académico, así como la información de los profesores y de las materias que estos dictan. Este modelo se irá desarrollando a medida que se explican cada uno de los conceptos necesarios.

1. **Instalación**
   
    La herramienta Datamodeler 19.4 con su respectivo JDK se puede descargar gratuitamente desde [*oracle.com*](https://www.oracle.com/tools/downloads/sql-data-modeler-downloads.html). 
    La descarga requiere la creación de una cuenta Oracle, una vez se crea esta cuenta se inicia la descarga de una carpeta comprimida donde se encuentra el ejecutable de la aplicación, este es el archivo *datamodeler.exe*
   
2. **Iniciar un proyecto**
   
    [//]: # (Cuáles son los requerimientos? )
     [//]: # (Al iniciar la herramienta quiere actualizar el jdk, y pregunta si se quiere importar proyectos de versiones antiguas)
    Al ejecutar el programa, se inicia su interfaz gráfica en donde se puede observar en la parte superior una barra de herramientas horizontal con las clásicas opciones como lo son *Archivo, Editar, Ver, ente otros.*
    Si es la primera vez que esta aplicación es ejecutada y anteriormene se contaba con alguna otra versión instalada, la herramienta preguntará si desea importar proyectos de otras versiones así como ciertas configuraciones, por ser esta la primera interacción con la herramienta omitiremos esta opción.

    Por otro lado, se pueden observar unas pestañas llamadas **Explorador, Mensajes-Log y Navegador**, ubicadas en la parte izquierda, inferior y derecha de la herramienta, respectivamente. Adicionalmente, en el centro de la herramienta se encuentra el espacio de trabajo donde se podrán ver y editar los archivos de los proyectos. 
    En *Mensajes-Log* se muestran todos los logs que la herramienta genera como mensaje de salida al realizar diferentes acciones. 
    En *Navegador* se muestra una vista alejada del archivo que tengamos abierto en nuestro espacio de trabajo el cual, por el momento, muestra tres pestañas, llamadas "Logical(Sin título_1)", "Relational(Sin_título_1)" y una de Bienvenida de Oracle, esta última puede cerrarse. Estas dos primeras pestañas son el modelo lógico y el modelo relacional del diseño que se genera por defecto al iniciar el programa, este diseño tiene por nombre "Sin título_1".

    En la siguiente figura se puede observar la pestaña *Explorador*, si esta pestaña no aparece se debe hacer clic en la opción *Explorador* del menú *Ver*.

    ![Alt text](images/Explorador.JPG?raw=true "Explorador") 

    En esta pestaña se encontrarán todos los proyectos (Diseños) que se tengan abiertos, así como la estructura de cada uno de estos y los principales archivos editables, tal como lo son el *Modelo Lógico* y los *Modelos Relacionales*, los cuales se detallarán en las siguientes secciones.

3. **Modelo Lógico**

    [//]: # (Esta explicación esta muy bien, pero no deja claro cuál es la diferencia entre un modelo E-R y un modelo lógico.  Porque el modelo E-R es un modelo conceptual )

    Un modelo lógico en datamodeler es, de acuerdo a la docuementación oficial de Oracle [*(oracle-sql-developer-data-modeler-users-guide)*](Documents/oracle-sql-developer-data-modeler-users-guide.pdf), un diagrama Entidad-Relación que proporciona una vista de la información del negocio independiente de la implementación. Un modelo lógico está compuesto por un conjunto de Entidades, Relaciones, Herencias, Vistas, Subvistas y Visualizaciones. 
    Estos conceptos se desarrollarán posteriormente en esta guía, a continuación se muestra la estructura de un modelo lógico.

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
    Para visualizar los atributos de una entidad se debe abrir la pestaña *Atributos* de la las propiedades de la entidad, lo cual muestra una lista con los atributos y los campos de cada uno de ellos, como se muestra en la siguiente figura.
    
    ![Alt text](images/MenuAtributo.JPG?raw=true "Menú Atributo")

    Para agregar un atributo a la entidad, se debe hacer clic en el botón '+' y llenar todos los campos requeridos. Cada atributo requiere un nombre, un tipo de dato y posiblemente algunos parámetros dependiendo del tipo de dato seleccionado.
    Además, datamodeler permite seleccionar si un atributo es *UID Primario* (Clave primaria de la entidad) o si es *Obligatorio*.
    Si se selecciona un atributo como UID primario, este también será obligatorio. 
    No pueden existir dos registros distintos en esta tabla con igual valor en el atributo definido como UID.

    A continuación se muestra un ejemplo de cómo se llenan los campos del atributo identificador de la entidad `ESTUDIANTE`, es decir, su llave primaria. La siguient efigura ilustra este ejemplo. 

    ![Alt text](images/EstudianteID.JPG?raw=true "ID Estudiante")
    
    Los campos necesarios para un atributo son los siguientes:

    * *Nombre*: Es el nombre del atributo, este debe ser lo más claro y completo posible. Como se desea agregar el identificador de la entidad Estudiante se sugiere ingresar `ID_ESTUDIANTE`.

    * *Tipo de Dato*: Permite especificarle al atributo un dominio, un tipo lógico, dintinto, de colección o estructurado. Un dominio describe un conjunto de posibles valores para ciertos atributos añadiendo algunas restricciones, estos pueden ser creados por la herramienta. Sin embargo, como a cada dominio se le debe seleccionar finalmente un tipo lógico y buscando una mayor simplicidad para el desarrollo de esta guía, no se usarán los dominios y solo se usarán los tipos lógicos. Seleccionar *Lógico* tipo de dato de la entidad. 

    * *Tipo de Origen*: Es la especificación del tipo de dato lógico del atributo, permite seleccionar gran variedad de tipos como lo son *Boolean, CHAR, BLOB, Datetime, Numeric,VARCHAR, entre otros*. El tipo de dato lógico sugerido para un identificador es numérico, esto debido a que permitirá posteriormente agregarle generadores de claves secuenciales a la base de datos, así como darle un orden de acuerdo a la creación de cada registro. Seleccionar *Numeric* como tipo de origen del atributo. Si desea conocer más sobre los tipos de datos de Oracle se recomienda visitar la página [*docs.oracle.com*](https://docs.oracle.com/cd/B28359_01/server.111/b28318/datatype.htm#CNCPT012).
    
    Al seleccionar el tipo de origen se puede observar que se habilitan nuevos campos dependiendo del tipo de origen que se seleccione, en este caso al seleccionar *Numeric* se habilitan las opciones *Presición y Escala*. Este tipo de dato permite almacenar tanto números enteros como fraccionales, la precisión es el número total de dígitos desde el dígito más signficativo hasta el menos significativo, mientras que la escala es el número de dígitos desde la coma hacia el dígito menos significativo. 
    Supongamos que se desea  Como se desea almacenar alrededor de mil estudiantes.  Entonces la precisión es `4`  y la escala `0` porque esta precisión y escala permiten un máximo valor de 9999 sin cifras decimales.

    Finalmente se selecciona la opción UIDPrimario para definir a este atributo como el identificador de la entidad.

    Existen atributos que pueden ser únicos pero no necesariamente obligatorios. *Pregunta: peroson claves? o tampoco?*.  Por ejemplo, el número de documento de identificación nacional (cédula) de un estudiante el cual es un atributo único para el sistema, pero no primario *Pregunta: único y/o obligatorio?*. 
    Para agregar un identificador único se deben seguir los siguentes pasos que vamos a explicar con el ejemplo ilustrado en la figura *X*.
    Primero se crea el atributo llenando el formulario del ejemplo anterior.  
    Para crear el atributo  `CEDULA_ESTUDIANTE` se selecciona el tipo de origen *VARCHAR*.
    El tipo de origen  *VARCHAR*  depliega los campos *Tamaño y Unidades* que quieren decir *completar*
    Digite  `10` como tamaño y seleccione  *CHAR* en las unidades.  De esta forma,  estamos declarando que la `CEDULA_ESTUDIANTE` tendrá máximo 10 caracteres.
    A continuación abra la pestaña *Identificadores Únicos* del frame de la izquierda.  En esta pestaña se muestran los atributos únicos de la entidad, aquí se encuentra ya el identificador primario previamente agregado. 
    *Para hacer... lo que se quiera hacer con esta explicación* se debe .... Revisa esta explicación porque no pude seguir las instrucciones.
    Seleccionar la opción '+' y hacer doble clic en el nuevo item que se agregó a la lista, lo cual despliega un submenú donde se debe agregar el atributo al identificador único haciendo clic sobre este y posteriormente en la flecha derecha, mostrando lo siguiente.

    ![Alt text](images/EstudianteCedula.JPG?raw=true "Cedula Estudiante")

    En este momento el nuevo identificador único ya ha sido creado con un nombre por defecto, en este caso es "Key_2", para cambiarlo dirigirse a la pestaña *General* sobre este mismo submenú. 
    
    > Ahora, usted deberá agregar dos nuevos atributos a la entidad `ESTUDIANTE`.  Estos atributos permiten al sistema almacenar el nombre y la edad de los estudiantes, el nombre debe ser obligatorio mientras que la edad no.

    La figura *X* muestra el resultado final. En la entidad se puede apreciar que datamodeler utiliza el símbolo '#' para representar identificadores primarios, la 'U' para los atributos únicos, el '*' para los atributos obligatorios y la 'o' para los atributos opcionales.

    ![Alt text](images/EstudianteEntidad.JPG?raw=true "Entidad Estudiante")

  * **Relación**

    Una relación es una asociación que existe entre dos entidades, una de ellas denominada como entidad origen y la otra como entidad destino, para cada entidad existe una cardinalidad. La cardinalidad define el número de ocurrencias que pueden existir de la entidad destino dada una sola ocurrencia de la entidad origen. La cardinalidad puede tomar los valores de 1:1 (uno a uno), de 1:N (1 a muchos) o de N:M (muchos a muchos). Una relación puede ser identificante o no, una relación identificante finalmente es mapeada al identificador primario de la entidad destino.

    > Se pide al estudiante que cree una nueva entidad para que el sistema pueda almacenar las materias que el estudiante podrá matricular, una materia tiene su identificador, un nombre y un número de creditos, siendo todos estos obligatorios. Una vez hecho esto se espera tener lo siguiente:

    ![Alt text](images/EstudianteMateria.JPG?raw=true "Entidades Estudiante y Materia")

    El sistema también require registrar en su base de datos las materias que están cursando los estudiantes, dado a que un estudiante puede cursar muchas materias y que una materia puede ser cursada por muchos estudiantes, la relación entre ambas entidades es N:M. Para crear una relación N:M se debe hacer clic en la opción de *Nueva Relación N:M* del menú de herramientas del modelo lógico, luego hacer clic sobre la entidad origen y finalmente otro clic sobre la entidad destino, abriendo de esta manera un menú donde se solicita el nombre de la relación entre ambas entidades, ingresar `ESTUDIANTE_MATERIA`, por conveniencia, el nombre de las relaciones se puede generar mediante la concatenación del nombre de ambas entidades. Una vez aceptados los cambios, se logra crear la relación entre Estudiante y Materia observando lo siguiente.

    ![Alt text](images/RelacionEstudMateria.JPG?raw=true "Relación Estudiante y Materia")

    > Se pide ahora al estudiante que cree una nueva entidad que le permita al sistema almacenar los profesores para poder registrar las materias que estos imparten, se sabe que una materia es impartida por un solo profesor, del profesor se solicita almancenar su nombre y fecha en la que ingresó al sistema. Una vez creada la entidad Profesor se espera tener lo siguiente.

    ![Alt text](images/RelacionEstudMateria.JPG?raw=true "Entidades Estudiante, Materia y Profesor")

    A diferencia de la anterior relación, una materia es impartida por solo un profesor, por tanto la relación que se debe agregar es una relación 1:N de Materia a Profesor, para ello se hace el mismo procedimiento de la relación anterior solo que en esta ocasión mediante la opción *Nueva Relación 1:N*. Al finalizar lo anterior, se obtiene lo siguiente.

    ![Alt text](images/ModeloCompleto.JPG?raw=true "Relación Profesor y Materia")

    Observe que al acceder a las propiedas de la entidad Materia mediante doble clic sobre esta, se ha generado un nuevo atributo cuyas propiedades no se pueden modificar, este hace referencia al atributo primario del profesor, es decir, al identificador del profesor, por tanto este nuevo atributo se convierte en una clave primaria que siempre apuntará a algún registro de la otra entidad.


4. Guardar (exportar) un proyecto en un archivo *.dmd*
   
5. Subvista como gestión de entidades
   
6. Ingeniería a un modelo Relacional
   
7. Generación automática de un script *.ddl*