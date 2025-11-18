# Proyecto de Estudio!
    
**Estructura del documento principal:**

# ForSport. Tu tienda online de indumentaria deportiva!

**Asignatura**: Bases de Datos I (FaCENA-UNNE)

**Integrantes**:
•	Alegre Leis, Federico Gabriel
•	Altamirano, Alex Lisandro
•	Fernández, Lucas Agustín
•	Sánchez, Osvaldo Abraham


**Año**: 2025

## CAPÍTULO I: INTRODUCCIÓN

### Caso de estudio

TEMA: Implementación de una base de datos para la gestión de un sistema de ventas online en una empresa de indumentaria deportiva.


## Definición o planteamiento del problema

Como equipo nos planteamos inquietudes a la hora de definir un tipo de proyecto apto para el desarrollo del mismo dentro de la asignatura, y como opción más aceptada encontramos un sistema de ventas que puede ser adaptado al rubro deportivo. Con esto en mente indagamos cuáles son nuestras mayores inquietudes respecto al mismo y aparecieron cuestiones como: 
¿Cómo se realiza la gestión de este tipo de sistema de ventas?.
¿Qué tan escalable puede llegar a ser?.
¿Qué facilidades en cuanto a las funcionalidades se pueden aportar para que sea mas amigable con los diferentes usuarios?.
¿Será redituable para un negocio el mantenimiento del sistema?.
¿Cómo se llevan a cabo las operaciones para llegar a algún dato calculado útil en el sistema?.

## OBJETIVO DEL PROYECTO:
En cuanto a los objetivos que proyectamos en el mismo visualizamos la creacion de un sistema web autónomo que funcionará como una tienda en línea de indumentaria deportiva. Este tiene que desarrollarse como una aplicación web responsiva, y accesible desde navegadores modernos en computadoras y dispositivos móviles. Conectará con servicios externos como la pasarela de pagos Mercado Pago (billeteras virtuales), o a traves de tarjetas bancarizadas, para procesar transacciones y utilizará una base de datos relacional para almacenar información de productos, usuarios y pedidos. El sistema incluirá dos interfaces principales: una para usuarios finales (clientes) y otra para administradores.

Objetivos Generales: Crear un sistema para la gestión venta de productos online de una empresa de indumentaria deportiva que sea amigable para los usuarios y que opere de manera eficiente..

### Objetivos Específicos
Definir una interfaz amigable para los usuarios como filtro por talle, marca, y precio adaptable a dispositivos móviles.
Definir perfiles de Administrador y Usuario para realizar las diferentes operaciones para cada uno de ellos promoviendo la seguridad del sistema. 
Implementar diferentes métodos de pago para la compra de los productos.
Diseñar un panel administrativo centralizado que permita gestionar productos, talles, precios, stock, pedidos y usuarios con validaciones dinámicas y retroalimentación visual.
Diseñar una arquitectura modular que permite agregar nuevas funcionalidades (como cupones, reseñas, o nuevos métodos de pago) sin afectar el núcleo del sistema.
Implementar reportes en tiempo real de ventas, productos más vendidos, márgenes y comportamiento de usuarios.


## CAPITULO II: MARCO CONCEPTUAL O REFERENCIAL <br>
Como problemática del sector de ventas de productos de una tienda, es que se enfrentan a los cambios que producen las nuevas tecnologías que es la compra de productos en línea que es hoy día más utilizado por su facilidad de compra sin moverse de casa. Por eso es indispensable crear un sistema que permita dicha compra de los productos que ofrece nuestra tienda de indumentaria deportiva, de esta manera poder llegar a más clientes.

Para ello se ha realizado un análisis del problema y se ha encontrado la necesidad de crear una página web para la venta de nuestros productos.
Para organizar los datos hemos utilizado SQL Server que es un motor de bases de datos relacional que nos permite almacenar los datos de nuestra tienda de manera organizada y segura.
Para ello se han diseñado tablas que definen los elementos de nuestro sistemas, entre los principales son producto, usuario, proveedor, categoría de los productos entre otros.
El uso de está herramienta nos permite organizar los datos de manera eficiente y segura cuidando la integridad de los datos.

Como resultado obtendremos un sistema capaz de guardar los productos, proveedores y usuarios de manera segura y sin alterar los datos de estas entidades ni que se mezclen entre ellos. Así los clientes podrán comprar los productos de manera fácil y segura. Y el usuario del sistema promociona sus productos, realiza compras a los proveedores y vende los productos con distintos métodos de pago.


##  Tema 1: Manejo de permisos a nivel de usuarios de base de datos. 

  Los permisos de bases de datos en SQL Server son reglas que determinan qué acciones puede realizar un usuario o rol dentro de una base de datos específica. 
  Los permisos y roles de bases de datos en SQL Server sirven para controlar el acceso y las acciones que cada usuario puede realizar dentro de una base de datos. 
  Son fundamentales para garantizar la seguridad, la integridad de los datos y una administración eficiente.
  - Usuarios de bases de datos: Un usuario de base de datos es una identidad dentro de una base específica que representa a alguien (o algo) que puede acceder y operar sobre los objetos de esa base de datos, que son las tablas, vistas, procedimientos, etc.
  - PERMISOS: Los permisos son derechos que se asignan a un usuario, así se define que puede hacer o no en una base de datos.
     - Se pueden agregar permisos específicos a diferentes usuarios. La mayoría de la asignacion de permiso tienen el siguiente formato:
      `<authorization> <permission> ON <securable>::<name> TO <principal>;`
       
### ROLES: 

  Un rol de bases de datos es un conjunto de permisos que pueden ser asignados a uno o varios usuarios, que tentrán permisos comunes.
  - Existen dos tipos de roles en el nivel de base de datos: los roles fijos de base de datos que están predefinidos en la base de datos y los roles de base de datos definidos por el usuario que el usuario puede crear.
  - Los roles fijos de base de datos se definen en el nivel de base de datos y existen en cada una de ellas.
  - Para asignar un rol a un usuario se utiliza la siguiente cláusula: <br>
    En el siguiente ejemplo se agrega el usuario 'Ben' al rol en el nivel de base de datos fijo db_datareader. <br>
    `ALTER ROLE db_datareader ADD MEMBER Ben;` <br>


- ROLES A NIVEL DE SERVIDOR: <br> Los permisos a nivel de servidor en un DBMS como SQL Server son privilegios que afectan a toda la instancia del servidor, no solo a una base de datos específica. Se gestionan mediante roles fijos de servidor (como sysadmin, serveradmin, securityadmin) y permiten realizar tareas globales como crear bases de datos, administrar logins, configurar el servidor o detener la instancia del servidor. <br>
- PERMISOS Y ROLES A NIVEL DE BASES DE DATOS: <br> Los permisos a nivel de base de datos son privilegios que se aplican dentro de una base específica, no en todo el servidor.
Controlan qué operaciones puede realizar un usuario sobre los objetos de esa base de datos  por ejemplo, Tablas, Vistas, Procedimientos, Esquemas, etc.

## **TEMA 2: Optimización de consultas a través de índices** 

### Introduccion

Los índices son estructuras de datos que permiten a SQL Server localizar y recuperar filas con mayor eficacia, ahorrando tiempo y recursos informáticos. Los índices funcionan organizando los datos de forma que permitan búsquedas más rápidas. En lugar de escanear toda la tabla fila a fila (un proceso conocido como escaneo de la tabla), SQL Server puede utilizar el índice para encontrar las filas necesarias mucho más rápidamente que si tuviera que recorrer cada entrada de la tabla.

Hay dos tipos fundamentales de índices en SQL Server:

•	Índices agrupados: Determina el orden físico de los datos de una tabla. Cuando se crea un índice agrupado en una tabla, las filas se almacenan en el disco en el orden de la columna indexada. Esto es especialmente beneficioso para las consultas de rango, ya que permite un acceso secuencial eficiente a las filas.

•	Índices no agrupados: Los índices no agrupados no afectan al orden físico de los datos. En su lugar, crean una estructura independiente que contiene punteros a las filas de datos reales. Los índices no agrupados son útiles para mejorar el rendimiento de las consultas que filtran u ordenan basándose en columnas no incluidas en el índice agrupado.

### Ventajas:
Los índices tienen de este modo tienen un impacto positivo principal en las consultas SQL, ya que aceleran drásticamente la recuperación de datos al permitir que el motor de la base de datos encuentre filas rápidamente en lugar de escanear toda la tabla, por lo que decimos que permite una Recuperación de datos más rápida: Un índice actúa como un índice de un libro, permitiendo al motor de la base de datos ir directamente a los datos relevantes, evitando escanear cada fila de la tabla.
Eficiencia de recursos: Las consultas optimizadas con índices consumen menos recursos de CPU y memoria, mejorando el rendimiento general del sistema.
Además, mejora en ORDER BY y GROUP BY: Los índices pueden acelerar las operaciones de clasificación y agrupación, ya que los datos ya están en un orden específico. Permitiendo asi una Reducción de costos (en la nube): Al usar menos recursos, los índices pueden reducir los costos de operación en servicios de bases de datos en la nube. 


## **Tema 3: Manejo de transacciones y transacciones anidadas**

### Introducción

El manejo de transacciones en SQL garantiza que un conjunto de operaciones se ejecute como una unidad atómica: o se completan todas, o ninguna. Las transacciones anidadas son transacciones iniciadas dentro de otra transacción, pero en SQL Server no son independientes: solo la transacción externa controla el COMMIT o ROLLBACK.

Una transacción es un bloque de instrucciones que asegura las propiedades **ACID**:

* **Atomicidad**: todas las operaciones se ejecutan o ninguna.  
* **Consistencia**: la base de datos pasa de un estado válido a otro.  
* **Aislamiento**: los cambios no son visibles hasta que se confirma la transacción.  
* **Durabilidad**: una vez confirmada, los cambios son permanentes.


### Transacciones anidadas

En SQL Server, cuando se ejecuta un `BEGIN TRANSACTION` dentro de otra transacción, no se crea una transacción independiente. En realidad, se incrementa un contador interno (`@@TRANCOUNT`).

* Cada **`BEGIN TRANSACTION`** aumenta el contador.  
* Cada **`COMMIT`** lo reduce en 1\.  
* Solo cuando el contador llega a 0 se confirma realmente la transacción.  
* Un **`ROLLBACK`** revierte toda la transacción, sin importar el nivel.  
* Si en el nivel interno se ejecuta **`ROLLBACK`**, se cancela toda la transacción, no solo la parte interna.


### Ventajas:

* Proporcionar **durabilidad**: los cambios confirmados persisten incluso ante fallos del sistema.   
* Permitir el **control de errores** con **`TRY...CATCH`** y decidir entre **`COMMIT`** o **`ROLLBACK`**.  
* Asegurar el **aislamiento** entre procesos concurrentes, evitando lecturas sucias.  
* Evitar **datos intermedios inválidos** durante operaciones críticas.  
* Mejorar la **robustez y confiabilidad** de aplicaciones que dependen de la base de datos.  
* Simplificar la **auditoría** y trazabilidad de cambios, al agrupar operaciones en bloques lógicos.  
* Optimizar la **seguridad lógica**, asegurando que las reglas de negocio se cumplan de forma integral.

##  Tema 4: Indices Columnares  
### ¿Que Hacen los indices columnares? ###
Los indices columnares usan el almacenamiento de datos basado en columnas, lo que permite lograr ganancias de hasta 10 veces el rendimiento de las consultas en el almacenamiento de datos sobre el almacenamiento tradicional orientado a filas.

### ¿Cuando usar los indices columnares? ###
Es recomendable usar un indice columnar en los siguientes casos:
- Cuando se tienen que analizar grandes volúmenes de datos en bases de datos para data warehousing (OLAP) y se realizan operaciones de lectura intensivas, como agregaciones (SUM, AVG, COUNT).
- Son ideales para análisis operativos en tiempo real sobre tablas que son modificadas con frecuencia, usando un índice de almacén de columnas no agrupado.
- Tambien funcionan mejor con datos estáticos que no se actualizan o eliminan con frecuencia.

### Ventajas: ###

- Mejora el rendimiento de consultas analíticas complejas.
- Reduce el espacio en disco debido a la alta tasa de compresión de datos.
- Optimiza la velocidad de las consultas de agregación y filtrado, especialmente en grandes volúmenes de datos.

### Desventajas: ###

- No es adecuado para cargas de trabajo con muchas actualizaciones, inserciones o eliminaciones, ya que los índices Columnstore son más adecuados para consultas de solo lectura.


## CAPÍTULO III: METODOLOGÍA SEGUIDA 

 **a) Cómo se realizó el Trabajo Práctico**
 
En primera instancia se definio el objeto de estudio del proyecto a realizar, dado un acuerdo comun entre los integrantes en base a un proyecto a su vez llevado a cabo en otra asignatura, se establecieron los requerimientos necesarios para cumplir con las reglamentaciones del informe que solicitaron los profesores de la materia 'Base de Datos I' y se delegaron tareas pertinentes a cada integrante logrando en reiteradas ocasiones puestas en comun para el avance del mismo.
 

 **b) Herramientas (Instrumentos y procedimientos)**
 El trabajo se realizo utilizando las siguientes herramientas:
 1. Se utilizo MySQL como el sistema de gestor de bases de datos relacional, seleccionado por su robustez y facilidad de uso.
 2. Se empleo Microsoft SQL Server para el desarrollo y escritura de las consultas SQL.
 3. Mediante ERDplus elaboramos un diagrama en el modelo relacional a partir de especificaciones de los requerimientos que fueron surgiendo al plantear el problema en cuestión.
 4. Se utilizo GitHub como plataforma de control de versiones y colaboracion en equipo. Permitiendo compartir, revisar y fusionar las partes del trabajo del equipo de manera eficiente.

## CAPÍTULO IV: DESARROLLO DEL TEMA / PRESENTACIÓN DE RESULTADOS 

### Diagrama relacional (https://github.com/AbrahamCtes/basesdatos_proyecto_estudio/blob/01614020c5d0198407924c463556cea09a6cf8f9/doc/diagrama_relacional_proyecto.png)
### Diccionario de datos

Acceso al documento [PDF](doc/diccionario_datos.pdf) del diccionario de datos.


### Desarrollo TEMA 1 "Manejo de permisos a nivel de usuarios de base de datos"

Los permisos de bases de datos en SQL Server son reglas que determinan qué acciones puede realizar un usuario o rol dentro de una base de datos específica. Los permisos y roles de bases de datos en SQL Server sirven para controlar el acceso y las acciones que cada usuario puede realizar dentro de una base de datos. Son fundamentales para garantizar la seguridad, la integridad de los datos y una administración eficiente. 

> Acceder a la siguiente carpeta para la descripción completa del tema [scripts-> tema_1](script/tema01_nombre_tema)

### Desarrollo TEMA 2 "Optimización de consultas a través de índices"

La optimización de consultas a través de índices en SQL mejora el rendimiento de las bases de datos al acelerar la recuperación de datos, reduciendo el tiempo de ejecución y el consumo de recursos. Los índices agrupados ordenan físicamente los datos de la tabla, son más rápidos en la recuperación porque no necesitan pasos de búsqueda adicionales y solo puede haber uno por tabla. Los índices no agrupados almacenan información en una ubicación separada, requieren más espacio y permiten crear múltiples índices en una tabla, lo que es útil para búsquedas frecuentes en columnas específicas.  

> Acceder a la siguiente carpeta para la descripción completa del tema [scripts-> tema_2](script/tema02_nombre_tema)

### Desarrollo TEMA 3 "Manejo de transacciones y transacciones anidada"

El manejo de transacciones en SQL garantiza que un conjunto de operaciones se ejecute como una unidad atómica: o se completan todas, o ninguna. Las transacciones anidadas son transacciones iniciadas dentro de otra transacción, pero en SQL Server no son independientes: solo la transacción externa controla el COMMIT o ROLLBACK.

> Acceder a la siguiente carpeta para la descripción completa del tema [scripts-> tema_2](script/tema02_nombre_tema)

### Desarrollo TEMA 4 "Indices Columnares en SQL server"

Los índices columnares en SQL Server (o columnstore indexes) son un tipo de índice optimizado para consultas analíticas y procesamiento de grandes volúmenes de datos.
En lugar de almacenar los datos por filas (como en los índices tradicionales), los almacenan por columnas, lo que mejora la compresión y la velocidad de lectura en escenarios de data warehousing o business intelligence.
Se los usan principalmente para consultas y analisis operativos en tiempo real.

> Acceder a la siguiente carpeta para la descripción completa del tema [scripts-> tema_4](script/tema04_Indices_Columnares)

... 


## CAPÍTULO V: CONCLUSIONES

El MANEJO DE PERMISOS Y ROLES DE BASES DE DATOS son muy utiles en terminos de seguridad, porque no permite el acceso no deseado de los datos y tambien protegen la integridad de los datos.
De mas esta decir que en los sistemas de información es muy importante garantizar la seguridad de los datos para que los usuarios confíen en que sus datos están protegidos. 
Ademas, de esta manera tambien se ayuda a poder asignar las funciones que pueden ejercer cada usuario del sistema y facilitar la asignación de roles para cada funcionalidad e impedir el acceso a datos que no son acorde a su funcionalidad.

La OPTIMIZACION DEL RENDIMIENTO DE UNA BUSQUEDA SQL SIN INDICES, Y CON INDICES muestra una mejora drástica. Sin índices, la búsqueda implica un table scan que recorre la tabla completa, siendo muy ineficiente. Un índice clúster ordena físicamente los datos de la tabla y es más rápido para las consultas que usan la columna indexada, ya que va directamente a los datos. Un índice no clúster crea una estructura de datos separada que apunta a la ubicación de los datos, lo que es útil cuando se necesita indexar múltiples columnas o cuando no se puede tener un índice clúster. 

Las TRANSACCIONES en SQL Server aseguran que varias operaciones se ejecuten como una sola unidad, garantizando que los datos solo se actualicen si todo el proceso termina con éxito. 
Se usaron casos de prueba donde quedo registrado que al ocurrir errores tales como claves foráneas inválidas o restricciones de stock, el uso de TRY...CATCH con ROLLBACK evita cambios parciales y mantiene la consistencia. 
El uso de transacciones simples permiten un manejo mas directo y suficiente para la mayoría de escenarios. A su vez las transacciones anidadas permiten mayor control en procesos complejos, aunque en SQL Server dependen del contador @@TRANCOUNT y un fallo interno puede revertir todo. De esta manera, el uso correcto de transacciones, ya sean simples o anidadas, es fundamental para garantizar integridad, confiabilidad y control de errores en la base de datos.

EL uso de INDICES COLUMNARES en una tabla de datos mejora la eficiencia en las consultas, siempre y cuando se apliquen en los contextos correctos ya mencionados, en las pruebas tambien se pudo comprobar que su uso mejoro el rendimiento en la consulta, lo que demuestra que mejora las consultas que requieren un análisis intensivo de datos en grandes volúmenes.
Presentando beneficios como: Mejora en la velocidad de las consultas analíticas esultando ideales para consultas que involucran WHERE, JOIN, ORDER BY y GROUP BY, ya que solo cargan en memoria los segmentos de las columnas utilizadas.
Compresión de datos, lo que reduce los requisitos de almacenamiento y acelera la lectura.
Procesamiento paralelo: al paralelizar la carga de trabajo entre varios procesadores, mejoran el rendimiento de las consultas.
Utilizan menos recursos de CPU y memoria para tareas específicas, especialmente en cargas de trabajo pesadas, lo que se traduce en mayor eficiencia.


## BIBLIOGRAFÍA DE CONSULTA

 
•   1-Fernández Isern, G., Colomer Vila, J., Hernández Olasagarre, M. B., & Blanco García, E. Gestión de datos: Triggers, procedimientos y funciones. Universitat Oberta de Catalunya, 2023. Disponible en: UOC
• 	2-Calbimonte, D. Funciones frente a los procedimientos almacenados en SQL Server. SQLShack, 2019. Disponible en: SQLShack
• 	3-Sierra, E. Optimización de consultas con índices en SQL: Guía práctica para programadores. Informática Sierra, 2025. Disponible en: Informática Sierra
• 	4-DataCamp. Optimización de consultas SQL: 15 técnicas para mejorar el rendimiento. Blog de ingeniería de datos, 2025. Disponible en: DataCamp
• 	5-Microsoft Learn. Transacciones (Transact-SQL) – SQL Server. Documentación oficial. Disponible en: Microsoft Learn
• 	6-DataCamp. Comprender las Transacciones SQL: Guía completa. Tutorial actualizado en 2025. Disponible en: DataCamp


