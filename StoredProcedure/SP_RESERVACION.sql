
ALTER PROCEDURE [dbo].[SP_RESERVACION]
@caso BIGINT = null,
@hab BIGINT = null,
@rfc varchar(13) = null,
@cant_pers BIGINT,
@anticipo MONEY = null,
@forma_pago VARCHAR(50) = null,
@fecha_ini DATETIME = null,
@fecha_fin DATETIME = null,
@nomina BIGINT = null,
@clave_pais BIGINT = null,
@clave_ciudad BIGINT = null,
@clave_hotel VARCHAR(50) = null

AS
Delete From reservaciones 
IF @caso = 1
Begin
INSERT INTO  reservaciones(id_habitacion,rfc,cant_pers,anticipo,forma_pago,fecha_ini,fecha_fin,reservado,check_in,cancel)
VALUES(@hab,@rfc,@cant_pers,@anticipo,@forma_pago,@fecha_ini,@fecha_fin,1,0,0)
INSERT INTO disponible (id_hab,fecha_ini,fecha_fin) 
VALUES (@hab,@fecha_ini,@fecha_fin)
END

IF @caso = 2
BEGIN
SELECT B.clave_pais AS clave, B.abrev AS pais From 
usuario_pais A INNER JOIN  pais B
ON A.clave_pais = B.clave_pais
WHERE A.no_nomina = @nomina
END


IF @caso = 3
 

BEGIN
SELECT  A.nombre AS Hotel , A.turistico AS Turistico, A.domicilio As Domicilio, B.frente_playa AS Playa
 FROM
 hotel A INNER JOIN ref_hotel B
 ON A.clave_hotel = B.clave_hotel
 WHERE A.clave_ciudad = @clave_ciudad;
END


IF @caso = 4
BEGIN
DECLARE @c_cl INT =0;
SET @c_cl = (SELECT  clave_hotel From hotel WHERE nombre = @clave_pais AND clave_ciudad = @clave_ciudad) ;
 
SELECT  B.id_hab As Clave, A.nl_habitacion AS Tipo, A.precioxnoche AS Precio, A.frente_a As Frente,A.capacidad AS Capacidad  
FROM 
habitacion A INNER JOIN habitacion_hotel B
ON A.id_habitacion = B.id_habitacion
INNER JOIN disponible C
ON B.id_hab = C.id_hab
 WHERE B.clave_hotel = @c_cl AND  @fecha_ini < C.fecha_ini  AND @fecha_fin < C.fecha_ini
  OR
 B.clave_hotel = @c_cl AND  @fecha_ini > C.fecha_fin  AND @fecha_fin > C.fecha_fin

END
