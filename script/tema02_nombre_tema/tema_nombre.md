TEMA 2: Optimización de consultas a través de índices.

Los índices son estructuras de datos que permiten a SQL Server localizar y recuperar filas con mayor eficacia, ahorrando tiempo y recursos informáticos. Los índices funcionan organizando los datos de forma que permitan búsquedas más rápidas. 
En lugar de escanear toda la tabla fila a fila (un proceso conocido como escaneo de la tabla), SQL Server puede utilizar el índice para encontrar las filas necesarias mucho más rápidamente que si tuviera que recorrer cada entrada de la tabla.

Hay dos tipos fundamentales de índices en SQL Server:

•	Índices agrupados: Determina el orden físico de los datos de una tabla. Cuando se crea un índice agrupado en una tabla, las filas se almacenan en el disco en el orden de la columna indexada. Esto es especialmente beneficioso para las consultas de rango, ya que permite un acceso secuencial eficiente a las filas.

•	Índices no agrupados: Los índices no agrupados no afectan al orden físico de los datos. En su lugar, crean una estructura independiente que contiene punteros a las filas de datos reales. Los índices no agrupados son útiles para mejorar el rendimiento de las consultas que filtran u ordenan basándose en columnas no incluidas en el índice agrupado.
Entre otros tipos de índices que pueden encontrarse en SQL se hallan:

•	Índice Único: Se asegura de que no existan valores duplicados en la columna o columnas que indexa. Se aplica la integridad de los datos.

•	Índice Compuesto: Se crea sobre dos o más columnas. Permite optimizar consultas que incluyen múltiples condiciones en la cláusula WHERE.

Los índices tienen de este modo tienen un impacto positivo principal en las consultas SQL, ya que aceleran drásticamente la recuperación de datos al permitir que el motor de la base de datos encuentre filas rápidamente en lugar de escanear toda la tabla, por lo que decimos que permite una Recuperación de datos más rápida: Un índice actúa como un índice de un libro, permitiendo al motor de la base de datos ir directamente a los datos relevantes, evitando escanear cada fila de la tabla.
Eficiencia de recursos: Las consultas optimizadas con índices consumen menos recursos de CPU y memoria, mejorando el rendimiento general del sistema.
Además, mejora en ORDER BY y GROUP BY: Los índices pueden acelerar las operaciones de clasificación y agrupación, ya que los datos ya están en un orden específico. Permitiendo asi una Reducción de costos (en la nube): Al usar menos recursos, los índices pueden reducir los costos de operación en servicios de bases de datos en la nube. 

Conclusion:
Aquí se observa como en nuestra tabla ‘venta’ iniciamos una búsqueda sin un índice previo. Luego de a ver cargado un millón de registros a la misma.
Al iniciar la búsqueda sin implementar ningún tipo de indice de los mencionados, el resultado que obtenemos es un recorrido total de las filas pertenecientes a la tabla uno por uno, lo que se conoce como ‘Table Scan’, lo cual claramente demanda un tiempo considerable y es menos optimo. 
En nuestro ejemplo decidimos obtener un rango de fechas entre el 1ro de enero de 2017 y 31 de diciembre de 2023, por lo que la opción de trabajar con un índice agrupado (CLUSTER) por fecha resulta ideal, ya que agrupa las filas según este criterio y luego solo recorre aquellas en las que la búsqueda es efectiva. Se nota que al hacerlo sin índice el tiempo que demando fue de 9 segundos, mientras que al obtenerlo por medio de dicho índice el tiempo de búsqueda se reduce a 5 segundo. A la hora de realizar la búsqueda con un índice no agrupado (NON CLUSTERED) incluyendo a la columna ‘total’ el tiempo demandado para la consulta si bien fue menor que al no usar índices resulto en una demanda mayor comparado con el índice de tipo Cluster, no obteniendo asi un mejor rendimiento.

<img width="886" height="470" alt="image" src="https://github.com/user-attachments/assets/a9769042-d633-44c9-bdab-ca83992512db" />
<img width="886" height="475" alt="image" src="https://github.com/user-attachments/assets/19cff6ec-aeb3-4c16-8a84-b353dbc37d6a" />
<img width="886" height="467" alt="image" src="https://github.com/user-attachments/assets/d0e7955f-1bde-4545-bb3b-c58ab5171009" />

