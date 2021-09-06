DROP TABLE TEMPORAL;

CREATE TABLE TEMPORAL (
    NOMBRE_CLIENTE VARCHAR2(150),
    CORREO_CLIENTE VARCHAR2(150),
    CLIENTE_ACTIVO VARCHAR2(150),
    FECHA_CREACION TIMESTAMP,
    TIENDA_PREFERIDA VARCHAR2(150),
    DIRECCION_CLIENTE VARCHAR2(150),
    CODIGO_POSTAL_CLIENTE VARCHAR2(150),
    CIUDAD_CLIENTE VARCHAR2(150),
    PAIS_CLIENTE VARCHAR2(150),
    FECHA_RENTA TIMESTAMP,
    FECHA_RETORNO TIMESTAMP,
    MONTO_A_PAGAR VARCHAR2(150),
    FECHA_PAGO TIMESTAMP,
    NOMBRE_EMPLEADO VARCHAR2(150),
    CORREO_EMPLEADO VARCHAR2(150),
    EMPLEADO_ACTIVO VARCHAR2(150),
    TIENDA_EMPLEADO VARCHAR2(150),
    USUARIO_EMPLEADO VARCHAR2(150),
    CONTRASENA_EMPLEADO VARCHAR2(150),
    DIRECCION_EMPLEADO VARCHAR2(150),
    CODIGO_POSTAL_EMPLEADO VARCHAR2(150),
    CIUDAD_EMPLEADO VARCHAR2(150),
    PAIS_EMPLEADO VARCHAR2(150),
    NOMBRE_TIENDA VARCHAR2(150),
    ENCARGADO_TIENDA VARCHAR2(150),
    DIRECCION_TIENDA VARCHAR2(150),
    CODIGO_POSTAL_TIENDA VARCHAR2(150),
    CIUDAD_TIENDA VARCHAR2(150),
    PAIS_TIENDA VARCHAR2(150),
    TIENDA_PELICULA VARCHAR2(150),
    NOMBRE_PELICULA VARCHAR2(150),
    DESCRIPCION_PELICULA VARCHAR2(150),
    ANO_LANZAMIENTO VARCHAR2(150),
    DIAS_RENTA VARCHAR2(150),
    COSTO_RENTA VARCHAR2(150),
    DURACION VARCHAR2(150),
    COSTO_POR_DANO VARCHAR2(150),
    CLASIFICACION VARCHAR2(150),
    LENGUAJE_PELICULA VARCHAR2(150),
    CATEGORIA_PELICULA VARCHAR2(150),
    ACTOR_PELICULA VARCHAR2(150)
);

--SELECT COUNT(*) FROM TEMPORAL;
SELECT * FROM TEMPORAL;