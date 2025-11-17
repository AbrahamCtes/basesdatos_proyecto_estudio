# Tema 4: Indices Columnares #
### ¿Que Hacen los indices columnares? ###
Los indices columnares usan el almacenamiento de datos basado en columnas, lo que permite lograr ganancias de hasta 10 veces el rendimiento de las consultas en el almacenamiento de datos sobre el almacenamiento tradicional orientado a filas.

### ¿Cuando usar los indices columnares? ###
Es recomendable usar un indice columnar en los siguientes casos:
- Cuando se tienen que analizar grandes volúmenes de datos en bases de datos para data warehousing (OLAP) y se realizan operaciones de lectura intensivas, como agregaciones (SUM, AVG, COUNT).
- Son ideales para análisis operativos en tiempo real sobre tablas que son modificadas con frecuencia, usando un índice de almacén de columnas no agrupado.
- Tambien funcionan mejor con datos estáticos que no se actualizan o eliminan con frecuencia.

### ¿Cuando no es recomendable usar los indices columnares? ###
No es recomendable usar cuando:
- En tablas con muy pocos registros, el beneficio de los índices es mínimo o nulo, e incluso puede ser contraproducente.
- Si la columna que se intenta indexar se modifica con mucha frecuencia, cada actualización requerirá reordenar el índice, lo cual consume muchos recursos.
- Si la columna tiene muy pocos valores únicos (por ejemplo, una columna booleana o de estado), el índice no será muy útil.
- Columnas de texto o datos binarios muy grandes.
- Si la consulta utiliza la columna como filtro y devuelve un porcentaje muy alto (90% de la tabla como ejemplo)de los datos de la tabla, el índice no es beneficioso.

### Creacion de un indice columnar ###
´CREATE COLUMNSTORE INDEX idx_columnstore ON tabla´

### Eliminacion de un indice columnar ###
´DROP INDEX idx_columnstore ON tabla´
