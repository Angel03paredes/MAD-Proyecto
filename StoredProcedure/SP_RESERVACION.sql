CREATE PROCEDURE SP_RESERVACION
@caso BIGINT = null,
@hab BIGINT = null,
@rfc varchar(13) = null,
@cant_pers BIGINT,
@anticipo MONEY = null,
@forma_pago VARCHAR(50) = null,
@fecha_ini DATETIME = null,
@fecha_fin DATETIME = null
AS

IF @caso = 1
Begin
INSERT INTO  reservaciones(id_habitacion,rfc,cant_pers,anticipo,forma_pago,fecha_ini,fecha_fin,reservado,check_in,cancel)
VALUES(@hab,@rfc,@cant_pers,@anticipo,@forma_pago,@fecha_ini,@fecha_fin,1,0,0)
END

Delete From reservaciones 

