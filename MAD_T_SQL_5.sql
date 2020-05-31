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
nombre varchar(20),------------
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
nl_habitacion varchar(20),
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
id_habitacion INT FOREIGN KEY REFERENCES habitacion_hotel (id_hab),
rfc VARCHAR(13) FOREIGN KEY REFERENCES cliente (rfc),
cant_pers int,
anticipo money ,
forma_pago varchar (10),
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
id_reservacio INT FOREIGN KEY REFERENCES reservaciones (clave_reservacion),
CONSTRAINT con_pkres_ser PRIMARY KEY( id_res_ser )
);

Create Table disponible (
id_disponible int identity (1,1),
id_hab INT FOREIGN KEY REFERENCES habitacion_hotel (id_hab),
fecha_ini DATETIME null,
fecha_fin DATETIME null,
CONSTRAINT con_pk_disp PRIMARY KEY( id_disponible )
)

--SELECT * FROM usuario

INSERT INTO pais (abrev ,nombre) VALUES ('ARG', 'Argentina');						
INSERT INTO pais (abrev ,nombre) VALUES ('ARM', 'Armenia');						
INSERT INTO pais (abrev ,nombre) VALUES ('AUS', 'Australia');						
INSERT INTO pais (abrev ,nombre) VALUES ('AUT', 'Austria');						
INSERT INTO pais (abrev ,nombre) VALUES ('BEL', 'Bélgica');						
INSERT INTO pais (abrev ,nombre) VALUES ('BOL', 'Bolivia');						
INSERT INTO pais (abrev ,nombre) VALUES ('BRA', 'Brasil');						
INSERT INTO pais (abrev ,nombre) VALUES ('CAN', 'Canadá');						
INSERT INTO pais (abrev ,nombre) VALUES ('CHL', 'Chile');						
INSERT INTO pais (abrev ,nombre) VALUES ('CHN', 'China');						
INSERT INTO pais (abrev ,nombre) VALUES ('COL', 'Colombia');						
INSERT INTO pais (abrev ,nombre) VALUES ('CRI', 'Costa Rica');						
INSERT INTO pais (abrev ,nombre) VALUES ('HRV', 'Croacia');						
INSERT INTO pais (abrev ,nombre) VALUES ('CUB', 'Cuba');						
INSERT INTO pais (abrev ,nombre) VALUES ('ECU', 'Ecuador');						
INSERT INTO pais (abrev ,nombre) VALUES ('EGY', 'Egipto');						
INSERT INTO pais (abrev ,nombre) VALUES ('SLV', 'El Salvador');						
INSERT INTO pais (abrev ,nombre) VALUES ('FRA', 'Francia');						
INSERT INTO pais (abrev ,nombre) VALUES ('DEU', 'Alemania');						
INSERT INTO pais (abrev ,nombre) VALUES ('HND', 'Honduras');						
INSERT INTO pais (abrev ,nombre) VALUES ('ITA', 'Italia');						
INSERT INTO pais (abrev ,nombre) VALUES ('JPN', 'Japón');						
INSERT INTO pais (abrev ,nombre) VALUES ('LVA', 'Letonia');						
INSERT INTO pais (abrev ,nombre) VALUES ('MDG', 'Madagascar');						
INSERT INTO pais (abrev ,nombre) VALUES ('MYS', 'Malasia');						
INSERT INTO pais (abrev ,nombre) VALUES ('MEX', 'México');						
INSERT INTO pais (abrev ,nombre) VALUES ('MAR', 'Marruecos');						
INSERT INTO pais (abrev ,nombre) VALUES ('NZL', 'Nueva Zelanda');						
INSERT INTO pais (abrev ,nombre) VALUES ('NIC', 'Nicaragua');						
INSERT INTO pais (abrev ,nombre) VALUES ('NGA', 'Nigeria');						
INSERT INTO pais (abrev ,nombre) VALUES ('PRK', 'Corea del Norte');						
INSERT INTO pais (abrev ,nombre) VALUES ('NOR', 'Noruega');						
INSERT INTO pais (abrev ,nombre) VALUES ('PAN', 'Panamá');						
INSERT INTO pais (abrev ,nombre) VALUES ('PRY', 'Paraguay');						
INSERT INTO pais (abrev ,nombre) VALUES ('PER', 'Perú');						
INSERT INTO pais (abrev ,nombre) VALUES ('POL', 'Polonia');						
INSERT INTO pais (abrev ,nombre) VALUES ('PRT', 'Portugal');						
INSERT INTO pais (abrev ,nombre) VALUES ('PRI', 'Puerto Rico');						
INSERT INTO pais (abrev ,nombre) VALUES ('ROU', 'Rumanía');						
INSERT INTO pais (abrev ,nombre) VALUES ('RUS', 'Rusia');						
INSERT INTO pais (abrev ,nombre) VALUES ('SRB', 'Serbia');						
INSERT INTO pais (abrev ,nombre) VALUES ('SVK', 'Eslovaquia');						
INSERT INTO pais (abrev ,nombre) VALUES ('SVN', 'Eslovenia');						
INSERT INTO pais (abrev ,nombre) VALUES ('ZAF', 'Sudáfrica');						
INSERT INTO pais (abrev ,nombre) VALUES ('KOR', 'Corea del Sur');						
INSERT INTO pais (abrev ,nombre) VALUES ('ESP', 'España');						
INSERT INTO pais (abrev ,nombre) VALUES ('SWE', 'Suecia');						
INSERT INTO pais (abrev ,nombre) VALUES ('CHE', 'Suiza');						
INSERT INTO pais (abrev ,nombre) VALUES ('SYR', 'Siria');						
INSERT INTO pais (abrev ,nombre) VALUES ('TTO', 'Trinidad y Tobago');						
INSERT INTO pais (abrev ,nombre) VALUES ('TUN', 'Túnez');						
INSERT INTO pais (abrev ,nombre) VALUES ('TUR', 'Turquía');						
INSERT INTO pais (abrev ,nombre) VALUES ('GBR', 'Reino Unido');						
INSERT INTO pais (abrev ,nombre) VALUES ('USA', 'Estados Unidos ');						
INSERT INTO pais (abrev ,nombre) VALUES ('URY', 'Uruguay');						
INSERT INTO pais (abrev ,nombre) VALUES ('VEN', 'Venezuela');						

INSERT INTO ciudad (nombre, clave_pais) VALUES ('Aguascalientes',	26	);
INSERT INTO ciudad (nombre, clave_pais) VALUES ('Ensenada',	26	);
INSERT INTO ciudad (nombre, clave_pais) VALUES ('Mexicali',	26	);
INSERT INTO ciudad (nombre, clave_pais) VALUES ('Tijuana',	26	);
INSERT INTO ciudad (nombre, clave_pais) VALUES ('La Paz',	26	);
INSERT INTO ciudad (nombre, clave_pais) VALUES ('Los Cabos',	26	);
INSERT INTO ciudad (nombre, clave_pais) VALUES ('Campeche',	26	);
INSERT INTO ciudad (nombre, clave_pais) VALUES ('Ciudad del Carmen',	26	);
INSERT INTO ciudad (nombre, clave_pais) VALUES ('Saltillo',	26	);
INSERT INTO ciudad (nombre, clave_pais) VALUES ('Monclova-Frontera',	26	);
INSERT INTO ciudad (nombre, clave_pais) VALUES ('La Laguna',	26	);
INSERT INTO ciudad (nombre, clave_pais) VALUES ('Piedras Negras',	26	);
INSERT INTO ciudad (nombre, clave_pais) VALUES ('Tecomán',	26	);
INSERT INTO ciudad (nombre, clave_pais) VALUES ('Colima-Villa de Álvarez',	26	);
INSERT INTO ciudad (nombre, clave_pais) VALUES ('Manzanillo',	26	);
INSERT INTO ciudad (nombre, clave_pais) VALUES ('Tuxtla Gutiérrez',	26	);
INSERT INTO ciudad (nombre, clave_pais) VALUES ('Tapachula',	26	);
INSERT INTO ciudad (nombre, clave_pais) VALUES ('Chihuahua',	26	);
INSERT INTO ciudad (nombre, clave_pais) VALUES ('Juárez',	26	);
INSERT INTO ciudad (nombre, clave_pais) VALUES ('Valle de México',	26	);
INSERT INTO ciudad (nombre, clave_pais) VALUES ('Durango',	26	);
INSERT INTO ciudad (nombre, clave_pais) VALUES ('Celaya',	26	);
INSERT INTO ciudad (nombre, clave_pais) VALUES ('Guanajuato',	26	);
INSERT INTO ciudad (nombre, clave_pais) VALUES ('Irapuato',	26	);
INSERT INTO ciudad (nombre, clave_pais) VALUES ('León',	26	);
INSERT INTO ciudad (nombre, clave_pais) VALUES ('La Piedad-Pénjamo',	26	);
INSERT INTO ciudad (nombre, clave_pais) VALUES ('San Francisco del Rincón',	26	);
INSERT INTO ciudad (nombre, clave_pais) VALUES ('Salamanca',	26	);
INSERT INTO ciudad (nombre, clave_pais) VALUES ('Acapulco',	26	);
INSERT INTO ciudad (nombre, clave_pais) VALUES ('Chilpancingo',	26	);
INSERT INTO ciudad (nombre, clave_pais) VALUES ('Tula',	26	);
INSERT INTO ciudad (nombre, clave_pais) VALUES ('Tulancingo',	26	);
INSERT INTO ciudad (nombre, clave_pais) VALUES ('Pachuca',	26	);
INSERT INTO ciudad (nombre, clave_pais) VALUES ('Guadalajara',	26	);
INSERT INTO ciudad (nombre, clave_pais) VALUES ('Ocotlán',	26	);
INSERT INTO ciudad (nombre, clave_pais) VALUES ('Puerto Vallarta',	26	);
INSERT INTO ciudad (nombre, clave_pais) VALUES ('Toluca',	26	);
INSERT INTO ciudad (nombre, clave_pais) VALUES ('Zamora-Jacona',	26	);
INSERT INTO ciudad (nombre, clave_pais) VALUES ('Morelia',	26	);
INSERT INTO ciudad (nombre, clave_pais) VALUES ('Uruapan',	26	);
INSERT INTO ciudad (nombre, clave_pais) VALUES ('Cuautla',	26	);
INSERT INTO ciudad (nombre, clave_pais) VALUES ('Cuernavaca	',	26	);
INSERT INTO ciudad (nombre, clave_pais) VALUES ('Tepic',	26	);
INSERT INTO ciudad (nombre, clave_pais) VALUES ('Monterrey',	26	);
INSERT INTO ciudad (nombre, clave_pais) VALUES ('Oaxaca	',	26	);
INSERT INTO ciudad (nombre, clave_pais) VALUES ('Tehuantepec-Salina Cruz',	26	);
INSERT INTO ciudad (nombre, clave_pais) VALUES ('Puebla-Tlaxcala',	26	);
INSERT INTO ciudad (nombre, clave_pais) VALUES ('Tehuacán',	26	);
INSERT INTO ciudad (nombre, clave_pais) VALUES ('Querétaro',	26	);
INSERT INTO ciudad (nombre, clave_pais) VALUES ('San Juan del Río',	26	);
INSERT INTO ciudad (nombre, clave_pais) VALUES ('Cancún	',	26	);
INSERT INTO ciudad (nombre, clave_pais) VALUES ('Chetumal	',	26	);
INSERT INTO ciudad (nombre, clave_pais) VALUES ('Rioverde-Ciudad Fernández',	26	);
INSERT INTO ciudad (nombre, clave_pais) VALUES ('San Luis Potosí-Soledad',	26	);
INSERT INTO ciudad (nombre, clave_pais) VALUES ('Los Mochis',	26	);
INSERT INTO ciudad (nombre, clave_pais) VALUES ('Culiacán',	26	);
INSERT INTO ciudad (nombre, clave_pais) VALUES ('Mazatlán',	26	);
INSERT INTO ciudad (nombre, clave_pais) VALUES ('Ciudad Obregón',	26	);
INSERT INTO ciudad (nombre, clave_pais) VALUES ('Guaymas',	26	);
INSERT INTO ciudad (nombre, clave_pais) VALUES ('Hermosillo',	26	);
INSERT INTO ciudad (nombre, clave_pais) VALUES ('Cárdenas',	26	);
INSERT INTO ciudad (nombre, clave_pais) VALUES ('Villahermosa',	26	);
INSERT INTO ciudad (nombre, clave_pais) VALUES ('Tampico-Pánuco',	26	);
INSERT INTO ciudad (nombre, clave_pais) VALUES ('Matamoros',	26	);
INSERT INTO ciudad (nombre, clave_pais) VALUES ('Nuevo Laredo',	26	);
INSERT INTO ciudad (nombre, clave_pais) VALUES ('Reynosa-Río Bravo',	26	);
INSERT INTO ciudad (nombre, clave_pais) VALUES ('Ciudad Victoria',	26	);
INSERT INTO ciudad (nombre, clave_pais) VALUES ('Tlaxcala-Apizaco',	26	);
INSERT INTO ciudad (nombre, clave_pais) VALUES ('Veracruz',	26	);
INSERT INTO ciudad (nombre, clave_pais) VALUES ('Córdoba',	26	);
INSERT INTO ciudad (nombre, clave_pais) VALUES ('Orizaba',	26	);
INSERT INTO ciudad (nombre, clave_pais) VALUES ('Xalapa',	26	);
INSERT INTO ciudad (nombre, clave_pais) VALUES ('Poza Rica',	26	);
INSERT INTO ciudad (nombre, clave_pais) VALUES ('Coatzacoalcos',	26	);
INSERT INTO ciudad (nombre, clave_pais) VALUES ('Minatitlán',	26	);
INSERT INTO ciudad (nombre, clave_pais) VALUES ('Mérida',	26	);
INSERT INTO ciudad (nombre, clave_pais) VALUES ('Zacatecas-Guadalupe',	26	);
				
				
				
				
				
DROP TABLE disponible
DROP TABLE res_ser
DROP TABLE reservaciones
DROP TABLE cliente
DROP TABLE ref_hotel
DROP TABLE servicios
DROP TABLE habitacion_hotel
DROP TABLE habitacion
DROP TABLE hotel
DROP TABLE usuario_pais
DROP TABLE ciudad
DROP TABLE pais
DROP TABLE usuario


 
