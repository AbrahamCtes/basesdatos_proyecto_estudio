Tema 1: Manejo de permisos a nivel de usuarios de base de datos.
  Los permisos de bases de datos en SQL Server son reglas que determinan qué acciones puede realizar un usuario o rol dentro de una base de datos específica.
  Son fundamentales para proteger los datos, organizar el acceso y evitar errores o abusos.
  Usuarios de bases de datos: Un usuario de base de datos en SQL Server es una identidad dentro de una base específica que representa a alguien (o algo) que puede acceder y operar sobre los objetos de esa base de datos, que son las tablas, vistas, procedimientos, etc.
  Los permisos y roles de bases de datos en SQL Server sirven para controlar el acceso y las acciones que cada usuario puede realizar dentro de una base de datos.
  Son fundamentales para garantizar la seguridad, la integridad de los datos y una administración eficiente.
  Un rol de bases de datos es un conjunto de permisos que pueden ser asignados a uno o varios usuarios, que tentrán permisos comunes.
  Existen dos tipos de roles en el nivel de base de datos: los roles fijos de base de datos que están predefinidos en la base de datos y los roles de base de datos definidos por el usuario que el usuario puede crear.
  Los roles fijos de base de datos se definen en el nivel de base de datos y existen en cada una de ellas.
  Para asignar un rol a un usuario se utiliza la siguiente cláusula:
    En el siguiente ejemplo se agrega el usuario 'Ben' al rol en el nivel de base de datos fijo db_datareader.
    ALTER ROLE db_datareader ADD MEMBER Ben;
    Ejemplos de roles fijos de base de datos:
    - db_owner: acceso total a la base.
    - db_datareader: puede hacer SELECT en todas las tablas.
    - db_datawriter: puede INSERT, UPDATE, DELETE en todas las tablas.
    - db_ddladmin: puede crear y modificar objetos.

Se pueden agregar permisos específicos a diferentes usuarios.
  La mayoría de la asignacion de permiso tienen el siguiente formato:
  <authorization> <permission> ON <securable>::<name> TO <principal>;
     Donde:
     <authorization> debe ser GRANT, REVOKEo DENY.
     <permission> establece la acción que permite o prohíbe.
     ON <securable>::<name> es el tipo de elemento protegible (servidor, objeto de servidor, base de datos u objeto de base de datos) y su nombre.
     Algunos permisos no requieren <securable>::<name> porque es inequívoco o inadecuado en el contexto.
     <principal> es la entidad de seguridad (inicio de sesión, usuario o rol) que recibe o pierde el permiso. En este caso sería un usuario.
      Ejemplos:
      GRANT SELECT ON dbo.Clientes TO UsuarioVentas;
      DENY DELETE ON dbo.Clientes TO UsuarioVentas;
      REVOKE UPDATE ON dbo.Clientes FROM UsuarioVentas;

      GRANT: Otorga un permiso.
      REVOKE: Revoca permiso previamente otorgado o denegado.
      DENY: Niega permiso explícitamente (tiene prioridad sobre GRANT).

      Conclusión: EL MANEJO DE PERMISOS Y ROLES DE BASES DE DATOS SON MUY UTILES EN TERMINOS DE SEGURIDAD, PORQUE NO PERMITE EL ACCESO NO DESEADO DE LOS DATOS Y TAMBIEN PROTEGER LA INTEGRIDAD DE LOS DATOS.
      EN LOS SISTEMAS DE INFORMACIÓN ES MUY IMPORTANTE GARANTIZAR LA SEGURIDAD DE LOS DATOS PARA QUE LOS USUARIOS CONFÍEN EN QUE SUS DATOS ESTÁN PROTEGIDOS.
      TAMBIEN AYUDA A PODER ASIGNAR LAS FUNCIONES QUE PUEDEN EJERCER CADA USUARIO DEL SISTEMA Y FACILITAR LA ASIGNACIÓN DE ROLES PARA CADA FUNCIONALIDAD E IMPEDIR EL ACCESO A DATOS QUE NO SON ACORDE A SU FUNCIONALIDAD.
      
