CREATE DATABASE MAD_DB;

USE MAD_DB
go


CREATE TABLE usuario(

contra varchar(20),
nombre varchar(50),
apellido varchar(50),
no_nomina int,
fecha_nac datetime,
domicilio varchar(70) null,
tel_casa bigint null,
tel_cel bigint null,
CONSTRAINT con_pkusu PRIMARY KEY( no_nomina  )
);

CREATE TABLE pais(
clave_pais int identity(1,1),
abrev varchar(4),
nombre varchar(20),
CONSTRAINT con_pkpais PRIMARY KEY( clave_pais   )
);

CREATE TABLE ciudad(
clave_ciudad int identity(1,1),
nombre varchar(40),
clave_pais INT FOREIGN KEY REFERENCES pais(clave_pais),
CONSTRAINT con_pkciudad PRIMARY KEY( clave_ciudad   )
);


CREATE TABLE usuario_pais(
id INT IDENTITY(1000,1),
clave_pais INT FOREIGN KEY REFERENCES pais(clave_pais),
no_nomina INT FOREIGN KEY REFERENCES usuario(no_nomina),
CONSTRAINT con_pkusu_pais PRIMARY KEY( id  )
);

CREATE TABLE hotel(
clave_hotel int identity(10000,10),
nombre varchar(50) UNIQUE,------------
no_pisos tinyint,-------
domicilio varchar(50),-------------
turistico bit,-------
cant_habitacion tinyint,-----
fecha_ini datetime,------------
clave_pais INT FOREIGN KEY REFERENCES pais(clave_pais),-----
clave_ciudad INT FOREIGN KEY REFERENCES ciudad(clave_ciudad),-----
CONSTRAINT con_pkhot PRIMARY KEY( clave_hotel  )
);

CREATE TABLE habitacion(
id_habitacion int identity(5000000,10),
no_camas tinyint,
tipos_cama varchar(20),
precioxnoche money,
nl_habitacion varchar(20) UNIQUE,
frente_a varchar(20),
capacidad int,
CONSTRAINT con_pkhab PRIMARY KEY( id_habitacion    )
);

CREATE TABLE habitacion_hotel(
id_hab int identity(7000000,10),
clave_hotel INT FOREIGN KEY REFERENCES hotel (clave_hotel),
id_habitacion INT FOREIGN KEY REFERENCES habitacion (id_habitacion),
CONSTRAINT con_pkhab_hot PRIMARY KEY( id_hab   )
);

CREATE TABLE servicios(
id_servicio int identity(500,10),
costo money ,
t_servicio varchar(20),
clave_hotel INT FOREIGN KEY REFERENCES hotel (clave_hotel),
CONSTRAINT con_pkserv PRIMARY KEY( id_servicio    )
);


CREATE TABLE ref_hotel(
id_referencia int identity(5000,10),
frente_playa bit,----------
no_pisicnas tinyint,-------------

clave_hotel INT FOREIGN KEY REFERENCES hotel (clave_hotel),
CONSTRAINT con_pkrhot PRIMARY KEY( id_referencia   )
);

CREATE TABLE cliente(
nombre varchar(50),
apellidom varchar(50),
apellidop varchar(50),
domicilio varchar(50),
rfc varchar(13),
correo  varchar(30),
tel_casa BIGINT,
tel_cel BIGINT,
referencia varchar(30),
fecha_nac datetime,
CONSTRAINT con_pkcli PRIMARY KEY( rfc  )
);

CREATE TABLE reservaciones(
clave_reservacion int identity(100000,10),
id_hab INT FOREIGN KEY REFERENCES habitacion_hotel (id_hab),
rfc VARCHAR(13) FOREIGN KEY REFERENCES cliente (rfc),
cant_pers int,
anticipo money ,
forma_pago varchar (50),
pago_total money null,
fecha_ini datetime,
fecha_fin datetime,
reservado bit DEFAULT 1,
check_in bit DEFAULT 0,
cancel bit 
CONSTRAINT con_pkreser PRIMARY KEY( clave_reservacion )
);


CREATE TABLE res_ser(
id_res_ser int identity(100000,10),
numero int,
id_servicio INT FOREIGN KEY REFERENCES servicios (id_servicio),
clave_reservacion INT FOREIGN KEY REFERENCES reservaciones (clave_reservacion),
CONSTRAINT con_pkres_ser PRIMARY KEY( id_res_ser )
);





				
				
				
				


