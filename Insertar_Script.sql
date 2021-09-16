------------------- PAIS -------------------
select * from pais;
select COUNT(*) from pais;
delete from pais;

insert into pais(nombrecli_pais)
select distinct pais_cliente
from temporal
where temporal.pais_cliente is not null;

-------------- TIENDA ---------------------
select * from tienda;
select COUNT(*) from tienda;

insert into tienda (direccion_tienda)
select distinct direccion_tienda
from temporal
where temporal.direccion_tienda is not null;

----------------- PELICULA -----------------
select * from pelicula;
select COUNT(*) from pelicula;
delete from pelicula;

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
select * from pelicula_idioma;
select COUNT(*) from pelicula;
delete from pelicula;

insert into pelicula_idioma(idioma_original)
select distinct lenguaje_pelicula
from temporal
where temporal.lenguaje_pelicula is not null;

---------------- DIRECCION -----------------
select * from direccion_cliente;
select COUNT(*)from direccion_cliente;
delete from direccion_cliente;

insert into direccion_cliente(codigo_postal)
select distinct codigo_postal_cliente
from temporal
where temporal.codigo_postal_cliente is not null;

----------------- PAGO_EMPLEADO -----------------
select * from pago_empleado;
select COUNT(*) from pago_empleado;
delete from pago_empleado;

insert into pago_empleado(pago, fecha_pago,empleado_venta)
select distinct monto_a_pagar, fecha_pago, temporal.nombre_empleado
from temporal
where temporal.fecha_pago is not null;

----------------- CIUDAD ------------------
select * from ciudad;
select COUNT(*) from ciudad;
delete from ciudad;

insert into ciudad (ciudad,pais_id_pais)
select distinct ciudad_cliente, id_pais 
from (select distinct
        t.ciudad_cliente, p.id_pais
        from temporal t, pais p
        where t.pais_cliente = p.nombrecli_pais
        and  t.ciudad_cliente is not null
        order by t.ciudad_cliente);


------------------ CATEGORIA --------------------
select * from categoria;
select COUNT(*) from categoria;
delete from categoria;

insert into categoria(tema_pelicula, categoria_nombre, pelicula_id_pelicula)
select distinct NOMBRE_PELICULA, CATEGORIA_PELICULA, id_pelicula
    from(select distinct
        t.nombre_pelicula, t.categoria_pelicula, peli.id_pelicula
        from temporal t, pelicula peli
        where t.nombre_pelicula = peli.titulo
        order by t.nombre_pelicula
    );

------------------ CLIENTE -----------------------
select * from cliente;
select COUNT(*) from cliente;
delete from cliente;

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
select * from renta;
select COUNT(*) from renta;
delete from renta;

insert into renta(fecha_renta_ini, venta, fecha_renta_fin, pelicula_id_pelicula)
select distinct FECHA_RENTA, COSTO_RENTA, FECHA_RETORNO, id_pelicula
    from(select distinct
    t.fecha_renta, t.costo_renta, t.fecha_retorno, peli.id_pelicula
    from temporal t, pelicula peli
    where t.nombre_pelicula = peli.titulo
    and t.fecha_renta is not null and t.fecha_retorno is not null
    order by t.fecha_renta
    );
    

-------------------- ACTOR --------------------
select * from actor;
select COUNT(*)from actor;
delete from actor;

insert into actor(nombre, pelicula_id_pelicula)
select distinct ACTOR_PELICULA, id_pelicula
    from(select distinct
        t.actor_pelicula, peli.id_pelicula
        from temporal t, pelicula peli
        where t.NOMBRE_PELICULA = peli.titulo
        and actor_pelicula is not null
        order by t.actor_pelicula
        );
-------------------- VISITA -----------------------
select * from visita;
select COUNT(*) from visita;
select * from cliente;

insert into visita (cliente_id_cliente, tienda_id_tienda)
select distinct id_cliente, id_tienda 
    from( select distinct cli.id_cliente, tie.id_tienda
        from temporal t, cliente cli, tienda tie
        where t.correo_cliente = cli.email 
        and cli.id_cliente is not null
        order by cli.id_cliente
    );

------------------- EMPLEADO ----------------------
select * from empleado;





















