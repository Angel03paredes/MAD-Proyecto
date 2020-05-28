CREATE PROCEDURE SP_CLIENTE



@nombre varchar(50),
@apellidoP varchar(50),
@apellidoM varchar(50),
@domicilio varchar(50),
@RFC varchar(13),
@correo  varchar(30),
@telcasa tinyint,
@telcel tinyint,
@Referencia varchar(30),
@Fecha_NA datetime


AS
Select * from cliente
INSERT INTO cliente(nombre,apellidop,apellidom,domicilio,rfc,correo,tel_casa,tel_cel,referencia,fecha_nac)
VALUES(@nombre,@apellidoP,@apellidoM,@domicilio,@RFC,@correo,@telcasa,@telcel,@Referencia,@Fecha_NA)