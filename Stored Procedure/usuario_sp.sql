USE [MAD_DB]
GO
/****** Object:  StoredProcedure [dbo].[SP_USUARIO]    Script Date: 23/05/2020 09:40:53 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [dbo].[SP_USUARIO]
@contra varchar(50) null,

@nombre VARCHAR(50) null,

@apellido varchar (50) null,

@no_nomina BIGINT null,

@fecha_nac DATETIME null,

@domicilio VARCHAR(50) null,

@tel_casa BIGINT null,

@tel_cel BIGINT null,

@caso int null
AS

IF @caso = 1
BEGIN
INSERT INTO usuario ( no_nomina, nombre,apellido,domicilio, tel_casa, tel_cel , fecha_nac) 
VALUES ( @no_nomina,@nombre,@apellido,@domicilio,@tel_casa,@tel_cel, @fecha_nac);
END

IF @caso = 2
BEGIN
SELECT no_nomina As Nomina, nombre AS Nombre, apellido AS Apellido , domicilio As Domicilio FROM usuario ;
END

IF @caso = 3
BEGIN
DELETE FROM usuario WHERE no_nomina = @no_nomina;  
END

IF @caso = 4
BEGIN
UPDATE usuario SET nombre = @nombre, apellido = @apellido, domicilio = @domicilio, tel_casa = @tel_casa, tel_cel = @tel_cel, fecha_nac = @fecha_nac
 WHERE no_nomina = @no_nomina;
END


