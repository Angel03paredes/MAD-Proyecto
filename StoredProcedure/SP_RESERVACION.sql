ALTER PROCEDURE [dbo].[SP_RESERVACION]
@caso BIGINT = null,
@hab INT = null,
@rfc varchar(13) = null,
@cant_pers INT=null,
@anticipo MONEY = null,
@forma_pago VARCHAR(50) = null,
@fecha_ini DATETIME = null,
@fecha_fin DATETIME = null,
@nomina BIGINT = null,
@clave_pais BIGINT = null,
@clave_ciudad BIGINT = null,
@clave_hotel VARCHAR(50) = null,
@cl_res BIGINT = null,
@num_res BIGINT = null,
@monto Money = null

AS
--Delete From reservaciones 
IF @caso = 1
Begin

 

INSERT INTO  reservaciones(id_hab,rfc,cant_pers,anticipo,forma_pago,fecha_ini,fecha_fin,reservado,check_in,cancel)
VALUES(@hab,@rfc,@cant_pers,@anticipo,@forma_pago,@fecha_ini,@fecha_fin,1,0,0)
 

 


DECLARE @clave int
SET @clave = (SELECT MAX(clave_reservacion) FROM dbo.reservaciones)
SELECT @clave
END

 

IF @caso = 2
BEGIN
SELECT B.clave_pais AS clave, B.abrev AS pais From 
usuario_pais A INNER JOIN  pais B
ON A.clave_pais = B.clave_pais
WHERE A.no_nomina = @nomina
END
DELETE FROM dbo.reservaciones


 

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

 


--DECLARE @c_cl INT =0;
--SET @c_cl = (SELECT  clave_hotel From hotel WHERE clave_pais= @clave_pais AND clave_ciudad = @clave_ciudad) ;
 
SELECT  ROOM.id_hab As Clave, TIPO.nl_habitacion AS Tipo,TIPO.precioxnoche AS Precio, TIPO.frente_a As Frente,TIPO.capacidad AS Capacidad  
FROM  hotel as WESTERN  FULL OUTER JOIN habitacion_hotel as ROOM ON WESTERN.clave_hotel = ROOM.clave_hotel 
FULL OUTER JOIN habitacion as TIPO ON ROOM.id_habitacion =TIPO.id_habitacion  
LEFT JOIN reservaciones as CHECKED ON CHECKED.id_hab = ROOM.id_hab


WHERE WESTERN.nombre = @clave_hotel 

 


 

 

 

END


IF @caso = 5
BEGIN
 UPDATE reservaciones SET  check_in = 1 where  clave_reservacion = @cl_res AND cancel = 0 AND  reservado = 1 AND check_in = 0;
END

IF @caso = 6
BEGIN
 Select C.t_servicio AS Servicio,C.costo AS Costo, A.anticipo,A.cant_pers,A.forma_pago, D.precioxnoche FROM 
 reservaciones A INNER JOIN habitacion_hotel B ON A.id_hab = B.id_hab INNER JOIN servicios C ON
 B.clave_hotel = c.clave_hotel INNER JOIN habitacion D ON D.id_habitacion = B.id_habitacion WHERE A.clave_reservacion = @num_res

END

IF @caso = 7 
BEGIN
UPDATE reservaciones SET anticipo = @monto ,  reservado = 0, check_in = 0 where clave_reservacion = @num_res
END
