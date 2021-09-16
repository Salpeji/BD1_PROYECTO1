-- 200925238 Samuel Perez, Script Tabla Temp DDL: 
------------ ELIMINACION DE TABLAS ----------------
DROP TABLE ACTOR CASCADE CONSTRAINTS;
DROP TABLE CATEGORIA CASCADE CONSTRAINTS;
DROP TABLE CIUDAD CASCADE CONSTRAINTS;
DROP TABLE CLIENTE CASCADE CONSTRAINTS;
DROP TABLE DIRECCION_CLIENTE CASCADE CONSTRAINTS;
DROP TABLE EMPLEADO CASCADE CONSTRAINTS;
DROP TABLE PAGO_EMPLEADO CASCADE CONSTRAINTS;
DROP TABLE PAIS CASCADE CONSTRAINTS;
DROP TABLE PELICULA CASCADE CONSTRAINTS;
DROP TABLE PELICULA_IDIOMA CASCADE CONSTRAINTS;
DROP TABLE RENTA CASCADE CONSTRAINTS;
DROP TABLE TIENDA CASCADE CONSTRAINTS;
DROP TABLE VISITA CASCADE CONSTRAINTS;

-------------- ELIMINACION DE TRIGGER's --------------
/*DROP TRIGGER TRIG_ACTOR;
DROP TRIGGER TRIG_CATEGORIA;
DROP TRIGGER TRIG_CIUDAD;
DROP TRIGGER TRIG_CLIENTE;
DROP TRIGGER TRIG_DIRECCION_CLIENTE;
DROP TRIGGER TRIG_EMPLEADO;
DROP TRIGGER TRIG_PAGO_EMPLEADO;
DROP TRIGGER TRIG_PAIS;
DROP TRIGGER TRIG_PELICULA;
DROP TRIGGER TRIG_PELICULA_IDIOMA;
DROP TRIGGER TRIG_RENTA;
DROP TRIGGER TRIG_TIENDA;
DROP TRIGGER TRIG_VISITA;*/

-- ELIMINAR SECUENCIADOR --
DROP SEQUENCE cfab;

--- SECUENCIADOR ---
CREATE SEQUENCE cfab
START WITH 1
INCREMENT BY 1;

----------- TABLAS Y PRIMARY KEY DB_VideoTeca --------
create table CLIENTE (
id_cliente number(8)  primary key,
nombre varchar2(75) not null,
email varchar2(75) not null,
fecha_registro TIMESTAMP not null,
status varchar2(10) not null,
dir_tienda varchar2(75) not null,
dir_cliente varchar2(75) not null,
TIENDA_id_tienda number(4) not null
);

create table VISITA (
id_visita number(8) primary KEY not null,
CLIENTE_id_cliente number(10) not null,
TIENDA_id_tienda number(4) not null
);

create table PAIS(
id_pais number(8) primary key not null,
nombreCLI_pais varchar2(75) not null
);

create table CIUDAD(
id_ciudad number(8) primary KEY not null,
ciudad varchar2(25) not null,
PAIS_id_pais number(8)
);

create table DIRECCION_CLIENTE(
id_direccion number(8) primary KEY not null,
codigo_postal varchar(50) not null
);

create table PELICULA(
id_pelicula number(9) primary KEY not null,
titulo varchar2(75) not null,
descripcion varchar2(200) not null,
anio_lanzada varchar2(20) not null,
duracion varchar2(25) not null,
dias_renta varchar2(25) not null,
costo_renta varchar2(75) not null,
costo_mal_estado varchar2(75) not null,
clasificacion varchar2(75) not null,
TIENDA_id_tienda number(4) not null
);

create table EMPLEADO(
id_empleado number(4) primary KEY not null,
nombre varchar2(75) not null,
apellido varchar2(75) not null,
direccion varchar2(30) not null,
email varchar2(75) not null,
status varchar2(10) not null,
usuario varchar2(75) not null,
contrasenia varchar2(75) not null,
tienda_direccion_trabajo varchar2(75) not null,
puesto varchar2(75) not null,
PAGO_EMPLEADO_id_pago number(5) not null,
TIENDA_id_tienda number(4) not null
);

create table TIENDA(
id_tienda number(4) primary KEY not null,
direccion_tienda varchar2(75) not null
);

create table PAGO_EMPLEADO(
id_pago number(5) primary KEY not null,
pago varchar2(75) not null,
fecha_pago TIMESTAMP not null,
empleado_venta varchar2(50) not null
);

create table CATEGORIA(
id_categoria number(10) primary KEY not null,
tema_pelicula varchar2(75) not null,
categoria_nombre varchar2(75) not null,
PELICULA_id_pelicula number(9) not null
);

create table ACTOR(
id_actor number(15) primary KEY not null,
nombre varchar2(75) not null,
PELICULA_id_pelicula number(9) not null
);

create table RENTA(
id_renta number(15) primary KEY not null,
fecha_renta_ini TIMESTAMP not null,
venta numeric(10,2) not null,
fecha_renta_fin TIMESTAMP not null,
PELICULA_id_pelicula number(9) not null
);

create table PELICULA_IDIOMA(
id_pelicula_idioma number(20) primary KEY not null,
idioma_original varchar2(75) not null
);

------------------------ KEY FOREIGN ------------------------
alter table CLIENTE
add constraint fk_id_tienda
foreign key (TIENDA_id_tienda)
references TIENDA(id_tienda) on delete cascade;

alter table VISITA
add constraint fk_id_cliente
foreign key (CLIENTE_id_cliente)
references CLIENTE (id_cliente) on delete cascade;

alter table VISITA
add constraint fk_id_tienda0
foreign key (TIENDA_id_tienda)
references TIENDA (id_tienda) on delete cascade;

alter table PELICULA
add constraint fk_id_tienda1
foreign key (TIENDA_id_tienda)
references TIENDA(id_tienda) on delete cascade;

alter table EMPLEADO
add constraint fk_id_pago
foreign key (PAGO_EMPLEADO_id_pago)
references PAGO_EMPLEADO(id_pago) on delete cascade;

alter table EMPLEADO
add constraint fk_id_tienda2
foreign key (TIENDA_id_tienda)
references TIENDA(id_tienda) on delete cascade;

alter table CATEGORIA
add constraint fk_id_pelicula
foreign key (PELICULA_id_pelicula)
references PELICULA(id_pelicula) on delete cascade;

alter table ACTOR
add constraint fk_id_pelicula1
foreign key (PELICULA_id_pelicula)
references PELICULA(id_pelicula) on delete cascade;

alter table RENTA
add constraint fk_id_pelicula2
foreign key (PELICULA_id_pelicula)
references PELICULA(id_pelicula) on delete cascade;

alter table CIUDAD
add constraint fk_id_pais
foreign key (PAIS_id_pais)
references PAIS(id_pais) on delete cascade;

-------------------- CHECK REFERENCIA --------------------
alter table PAGO_EMPLEADO
add constraint ck_pago
check (pago >= 0);

alter table PAGO_EMPLEADO
add constraint ck_empleado_venta
check (empleado_venta >= 0);

alter table PELICULA
add constraint ck_costo_renta_mal_estado
check (costo_renta >=0 and costo_mal_estado >=0);

alter table RENTA
add constraint ck_venta
check (venta >=0);

------------------------- TRIGGER -------------------------
CREATE TRIGGER TRIG_ACTOR
BEFORE INSERT ON ACTOR
FOR EACH ROW
BEGIN
SELECT cfab.NEXTVAL INTO :NEW.id_actor FROM DUAL;
END;

CREATE TRIGGER TRIG_CATEGORIA
BEFORE INSERT ON CATEGORIA
FOR EACH ROW
BEGIN
SELECT cfab.NEXTVAL INTO :NEW.id_categoria FROM DUAL;
END;

CREATE TRIGGER TRIG_CIUDAD
BEFORE INSERT ON CIUDAD
FOR EACH ROW
BEGIN
SELECT cfab.NEXTVAL INTO :NEW.id_ciudad FROM DUAL;
END;

CREATE TRIGGER TRIG_CLIENTE
BEFORE INSERT ON CLIENTE
FOR EACH ROW
BEGIN
SELECT cfab.NEXTVAL INTO :NEW.id_cliente FROM DUAL;
END;

CREATE TRIGGER TRIG_DIRECCION_CLIENTE
BEFORE INSERT ON DIRECCION_CLIENTE
FOR EACH ROW
BEGIN
SELECT cfab.NEXTVAL INTO :NEW.id_direccion FROM DUAL;
END;

CREATE TRIGGER TRIG_EMPLEADO
BEFORE INSERT ON EMPLEADO
FOR EACH ROW
BEGIN
SELECT cfab.NEXTVAL INTO :NEW.id_empleado FROM DUAL;
END;

CREATE TRIGGER TRIG_PAGO_EMPLEADO
BEFORE INSERT ON PAGO_EMPLEADO
FOR EACH ROW
BEGIN
SELECT cfab.NEXTVAL INTO :NEW.id_pago FROM DUAL;
END;

CREATE TRIGGER TRIG_PAIS
BEFORE INSERT ON PAIS
FOR EACH ROW
BEGIN
SELECT cfab.NEXTVAL INTO :NEW.id_pais FROM DUAL;
END;

CREATE TRIGGER TRIG_PELICULA
BEFORE INSERT ON PELICULA
FOR EACH ROW
BEGIN
SELECT cfab.NEXTVAL INTO :NEW.id_pelicula FROM DUAL;
END;

CREATE TRIGGER TRIG_PELICULA_IDIOMA
BEFORE INSERT ON PELICULA_IDIOMA
FOR EACH ROW
BEGIN
SELECT cfab.NEXTVAL INTO :NEW.id_pelicula_idioma FROM DUAL;
END;

CREATE TRIGGER TRIG_RENTA
BEFORE INSERT ON RENTA
FOR EACH ROW
BEGIN
SELECT cfab.NEXTVAL INTO :NEW.id_renta FROM DUAL;
END;

CREATE TRIGGER TRIG_TIENDA
BEFORE INSERT ON TIENDA
FOR EACH ROW
BEGIN
SELECT cfab.NEXTVAL INTO :NEW.id_tienda FROM DUAL;
END;

CREATE TRIGGER TRIG_VISITA
BEFORE INSERT ON VISITA
FOR EACH ROW
BEGIN
SELECT cfab.NEXTVAL INTO :NEW.id_visita FROM DUAL;
END;

--------------------- OTROS QUERY's ---------------------
alter table ciudad
modify ciudad varchar2(75);


