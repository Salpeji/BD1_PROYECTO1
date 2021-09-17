------------------- PAIS -------------------
insert into pais(nombrecli_pais)
select distinct pais_cliente
from temporal
where temporal.pais_cliente is not null;

----------------- TIENDA -------------------
insert into tienda (direccion_tienda)
select distinct direccion_tienda
from temporal
where temporal.direccion_tienda is not null;

----------------- PELICULA -----------------
insert into pelicula(titulo,descripcion,anio_lanzada,duracion,dias_renta,costo_renta,costo_mal_estado,clasificacion,tienda_id_tienda)
select distinct nombre_pelicula, descripcion_pelicula, ano_lanzamiento, duracion, dias_renta, costo_renta, costo_por_dano, clasificacion, id_tienda
from(select distinct
    t.nombre_pelicula, t.descripcion_pelicula, t.ano_lanzamiento, t.duracion, t.dias_renta, t.costo_renta, t.costo_por_dano, t.clasificacion, tie.id_tienda
    from temporal t, tienda tie
    where t.direccion_tienda = tie.direccion_tienda
    and t.nombre_pelicula is not null
    order by t.nombre_pelicula
);

-------------- PELICULA_IDIOMA -------------
insert into pelicula_idioma(idioma_original)
select distinct lenguaje_pelicula
from temporal
where temporal.lenguaje_pelicula is not null;

---------------- DIRECCION -----------------
insert into direccion_cliente(codigo_postal)
select distinct codigo_postal_cliente
from temporal
where temporal.codigo_postal_cliente is not null;

----------------- CIUDAD ------------------
insert into ciudad (ciudad,pais_id_pais)
select distinct ciudad_cliente, id_pais 
from (select distinct
        t.ciudad_cliente, p.id_pais
        from temporal t, pais p
        where t.pais_cliente = p.nombrecli_pais
        and  t.ciudad_cliente is not null
        order by t.ciudad_cliente);

------------------ CATEGORIA --------------
insert into categoria(tema_pelicula, categoria_nombre, pelicula_id_pelicula)
select distinct NOMBRE_PELICULA, CATEGORIA_PELICULA, id_pelicula
    from(select distinct
        t.nombre_pelicula, t.categoria_pelicula, peli.id_pelicula
        from temporal t, pelicula peli
        where t.nombre_pelicula = peli.titulo
        order by t.nombre_pelicula
    );

------------------ CLIENTE -----------------
insert into cliente(nombre, email, fecha_Registro, status, dir_tienda, dir_cliente, tienda_id_tienda)
select distinct nombre_cliente, correo_cliente, fecha_creacion, cliente_activo, direccion_tienda, direccion_cliente, id_tienda
    from(select distinct 
        t.nombre_cliente, t.correo_cliente, t.fecha_creacion, t.cliente_activo, t.direccion_tienda, t.direccion_cliente, tie.id_tienda
        from temporal t, tienda tie
        where t.direccion_tienda = tie.direccion_tienda
        and t.fecha_creacion is not null
        order by t.nombre_cliente
    );

------------------ RENTA ------------------
insert into renta(fecha_renta_ini, venta, fecha_renta_fin, pelicula_id_pelicula)
select distinct FECHA_RENTA, COSTO_RENTA, FECHA_RETORNO, id_pelicula
    from(select distinct
    t.fecha_renta, t.costo_renta, t.fecha_retorno, peli.id_pelicula
    from temporal t, pelicula peli
    where t.nombre_pelicula = peli.titulo
    and t.fecha_renta is not null and t.fecha_retorno is not null
    order by t.fecha_renta
    );
    
-------------------- ACTOR -----------------
insert into actor(nombre, pelicula_id_pelicula)
select distinct ACTOR_PELICULA, id_pelicula
    from(select distinct
        t.actor_pelicula, peli.id_pelicula
        from temporal t, pelicula peli
        where t.NOMBRE_PELICULA = peli.titulo
        and actor_pelicula is not null
        order by t.actor_pelicula
        );
        
-------------------- VISITA -----------------
insert into visita (cliente_id_cliente, tienda_id_tienda)
select distinct id_cliente, id_tienda 
    from( select distinct cli.id_cliente, tie.id_tienda
        from temporal t, cliente cli, tienda tie
        where t.correo_cliente = cli.email 
        and cli.id_cliente is not null
        order by cli.id_cliente
    );

----------------- PAGO_EMPLEADO --------------
insert into pago_empleado(pago, fecha_pago, empleado_venta, EMPLEADO_id_empleado)
select distinct MONTO_A_PAGAR, FECHA_PAGO, NOMBRE_EMPLEADO, id_empleado
    from(select distinct t.MONTO_A_PAGAR, t.FECHA_PAGO, t.NOMBRE_EMPLEADO, emp.id_empleado
        from temporal t, empleado emp
        where t.DIRECCION_EMPLEADO = emp.direccion   
        and t.FECHA_PAGO is not null 
        order by t.MONTO_A_PAGAR
    );

------------------- EMPLEADO ------------------
insert into empleado(nombre, direccion, email, status, usuario, contrasenia, tienda_direccion_trabajo, tienda_id_tienda)
select distinct NOMBRE_EMPLEADO, DIRECCION_EMPLEADO, CORREO_EMPLEADO, EMPLEADO_ACTIVO, USUARIO_EMPLEADO, CONTRASENA_EMPLEADO, TIENDA_EMPLEADO, id_tienda
    from( select distinct t.NOMBRE_EMPLEADO, t.DIRECCION_EMPLEADO, t.CORREO_EMPLEADO, t.EMPLEADO_ACTIVO, t.USUARIO_EMPLEADO, t.CONTRASENA_EMPLEADO, t.TIENDA_EMPLEADO, tie.id_tienda
        from temporal t, tienda tie
        where t.TIENDA_EMPLEADO = tie.DIRECCION_TIENDA
        and t.NOMBRE_EMPLEADO is not null
        order by TIENDA_EMPLEADO
    );



















