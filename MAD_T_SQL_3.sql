-- CREATE DATABASE MAD_DB;

USE MAD_DB
go


CREATE TABLE usuario(
clave_usuario int identity(70000,10),
contra varchar(20),
nombre varchar(50),
apellido varchar(50),
no_nomina int,
fecha_nac datetime,
domicilio varchar(70) null,
tel_casa bigint null,
tel_cel bigint null,
CONSTRAINT con_pkusu PRIMARY KEY( clave_usuario    )
);

CREATE TABLE pais(
clave_pais int identity(1,1),
nombre varchar(4),
CONSTRAINT con_pkpais PRIMARY KEY( clave_pais   )
);

CREATE TABLE usuario_pais(
id INT IDENTITY(1000,1),
clave_pais INT FOREIGN KEY REFERENCES pais(clave_pais),
clave_usuario INT FOREIGN KEY REFERENCES usuario(clave_usuario),
CONSTRAINT con_pkusu_pais PRIMARY KEY( clave_pais, clave_usuario   )
);

CREATE TABLE hotel(
clave_hotel int identity(10000,10),
nombre varchar(20),
no_pisos tinyint,
domicilio varchar(50),
turistico bit,
cant_habitacion tinyint,
fecha_ini datetime,
clave_pais INT FOREIGN KEY REFERENCES pais(clave_pais),
clave_usuario INT FOREIGN KEY REFERENCES usuario (clave_usuario ),
CONSTRAINT con_pkhot PRIMARY KEY( clave_hotel  )
);

CREATE TABLE habitacion(
id_habitacion int identity(5000000,10),
no_camas tinyint,
tipos_cama varchar(20),
precioxnoche money,
nl_habitacion varchar(20),
frente_a varchar(20),
CONSTRAINT con_pkhab PRIMARY KEY( id_habitacion    )
);

CREATE TABLE habitacion_hotel(
id_habitacion int identity(7000000,10),
disponible bit ,
clave_hotel INT FOREIGN KEY REFERENCES hotel (clave_hotel),
clave_habitacion INT FOREIGN KEY REFERENCES habitacion (id_habitacion),
CONSTRAINT con_pkhab_hot PRIMARY KEY( id_habitacion    )
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
frente_playa bit,
no_pisicnas tinyint,
salon_eventos varchar(20),
clave_hotel INT FOREIGN KEY REFERENCES hotel (clave_hotel),
CONSTRAINT con_pkrhot PRIMARY KEY( id_referencia   )
);

CREATE TABLE cliente(
nombre varchar(50),
apellido varchar(50),
domicilio varchar(50),
rfc varchar(13),
correo  varchar(30),
tel_casa tinyint,
tel_cel tinyint,
referencia varchar(30),
fecha_nac datetime,
CONSTRAINT con_pkcli PRIMARY KEY( rfc  )
);

CREATE TABLE reservaciones(
clave_reservacion int identity(100000,10),
id_habitacion INT FOREIGN KEY REFERENCES habitacion (id_habitacion),
rfc VARCHAR(13) FOREIGN KEY REFERENCES cliente (rfc),
cant_pers tinyint,
anticipo money ,
forma_pago varchar (10),
fecha_ini datetime,
fecha_fin datetime,
check_in BIT,
check_out BIT ,
CONSTRAINT con_pkreser PRIMARY KEY( clave_reservacion )
);


CREATE TABLE res_ser(
id_res_ser int identity(100000,10),
numero int,
id_servicio INT FOREIGN KEY REFERENCES servicios (id_servicio),
id_reservacio INT FOREIGN KEY REFERENCES reservaciones (clave_reservacion),
CONSTRAINT con_pkres_ser PRIMARY KEY( id_res_ser )
);

--SELECT * FROM usuario








DROP TABLE res_ser
DROP TABLE reservaciones
DROP TABLE cliente
DROP TABLE ref_hotel
DROP TABLE servicios
DROP TABLE habitacion_hotel
DROP TABLE habitacion
DROP TABLE hotel
DROP TABLE usuario_pais
DROP TABLE pais
DROP TABLE usuario

select * from usuario
select * from hotel