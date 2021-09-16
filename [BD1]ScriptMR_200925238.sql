-- Script DDL Creacion DB, Samuel Perez 200925238
----------------------- ELIMINANDO Y BORRANDO USUARIO --------------------------
drop user BD_VideoTeca cascade;

------------------ CREO EL USUARIO -------------------
create user BD_VideoTeca identified by Sam26
default tablespace system
temporary tablespace temp
quota unlimited on system;

-------------- PRIVILEGIOS ESTE USUARIO --------------
grant create session to BD_VideoTeca;

------- CREACION TABLAS DENTRO DE DB_VIDEOTECA------
grant create table to BD_VideoTeca;

------------- CREACION DE VISTAS ------------------
grant create view to BD_VideoTeca;

------------ CONFIGURACION PROCEDIMIENTOS ---------
grant create procedure to BD_VideoTeca;

----------- CONFIGURACION PARA SECUENCIAS ---------
grant create sequence to BD_VideoTeca;

------------------------- DESPUES DE CONECTAR: ---------------------------------
------------- ADMIN DENTRO DE TABLAS 
grant all on CLIENTE to BD_VideoTeca;
grant all on VISITA to BD_VideoTeca;
grant all on EMPLEADO to BD_VideoTeca;
grant all on TIENDA to BD_VideoTeca;
grant all on CIUDAD to BD_VideoTeca;
grant all on DIRECCION_CLIENTE to BD_VideoTeca;
grant all on RENTA to BD_VideoTeca;
grant all on PAGO_EMPLEADO to BD_VideoTeca;
grant all on PELICULA to BD_VideoTeca;
grant all on CATEGORIA to BD_VideoTeca;
grant all on ACTOR to BD_VideoTeca;
grant all on PELICULA_IDIOMA to BD_VideoTeca;

-------------- VERIFICAMOS CONEXION 
select user from dual;
































