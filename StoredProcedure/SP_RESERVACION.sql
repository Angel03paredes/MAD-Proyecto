
CREATE PROCEDURE [dbo].[SP_RESERVACION]
@caso BIGINT = null,
@hab varchar(50) =null,
@rfc varchar(50) = null,
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
@monto Money = null,
@CANTIDAD BIGINT = null,
@NUMEROR BIGINT =null,
@idSERVICIO BIGINT =null

AS
Delete From reservaciones 
IF @caso = 1
Begin

-- Delete reservaciones from reservaciones where id_hab IS NULL 

--SELECT* FROM dbo.reservaciones
DECLARE @hab2 int

SET @hab2 = (SELECT dbo.udfNetSale(@hab,@clave_hotel,@fecha_ini,@fecha_fin))

--select * from reservaciones
INSERT INTO  reservaciones(id_hab,rfc,cant_pers,anticipo,forma_pago,fecha_ini,fecha_fin,reservado,check_in,cancel)
VALUES(@hab2,@rfc,@cant_pers,@anticipo,@forma_pago,@fecha_ini,@fecha_fin,1,0,0)
 



DECLARE @clave int
SET @clave = (SELECT MAX(clave_reservacion) FROM dbo.reservaciones)
SELECT @clave , correo FROM cliente Where rfc = @rfc
END

 

IF @caso = 2
BEGIN
SELECT B.clave_pais AS clave, B.abrev AS pais From 
usuario_pais A INNER JOIN  pais B
ON A.clave_pais = B.clave_pais
WHERE A.no_nomina = @nomina
END
--DELETE FROM dbo.reservaciones


 

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
 
SELECT Count(Tipo.nl_habitacion) AS Cantidad,  TIPO.nl_habitacion AS Tipo,TIPO.precioxnoche AS Precio, TIPO.frente_a As Frente,TIPO.capacidad AS Capacidad
	--CHECKED.fecha_ini, CHECKED.fecha_fin
FROM  hotel as WESTERN  
inner JOIN habitacion_hotel as ROOM 
	ON WESTERN.clave_hotel = ROOM.clave_hotel 
inner JOIN habitacion as TIPO 
	ON ROOM.id_habitacion =TIPO.id_habitacion  
full JOIN reservaciones as CHECKED 
	ON CHECKED.id_hab = ROOM.id_hab

	
WHERE WESTERN.nombre = @clave_hotel AND  CHECKED.fecha_ini IS NULL OR WESTERN.nombre = @clave_hotel AND  @fecha_ini NOT BETWEEN CHECKED.fecha_ini AND CHECKED.fecha_fin 
AND  @fecha_fin NOT BETWEEN CHECKED.fecha_ini AND CHECKED.fecha_fin
GROUP BY Tipo.nl_habitacion,tipo.precioxnoche,tipo.frente_a,tipo.capacidad

 


 

 

 

END


IF @caso = 5
BEGIN
 UPDATE reservaciones SET  check_in = 1 where  clave_reservacion = @cl_res AND cancel = 0 AND  reservado = 1 AND check_in = 0;
END

IF @caso = 6
BEGIN




BEGIN TRY 
IF not exists(select 1 FROM reservaciones where reservado =0 and check_in =0 and clave_reservacion=@num_res )

Select C.t_servicio AS Servicio,C.costo AS Costo, 
A.anticipo as ADELANTO,A.cant_pers as PERSONAS,
A.forma_pago, D.precioxnoche as PRECIOS ,
C.id_servicio as Identificador ,DATEDIFF(dd,A.fecha_ini,A.fecha_fin) AS DIAS
FROM reservaciones A 
INNER JOIN habitacion_hotel B 
ON A.id_hab = B.id_hab 
INNER JOIN servicios C 
ON B.clave_hotel = c.clave_hotel 
INNER JOIN habitacion D 
ON D.id_habitacion = B.id_habitacion 
WHERE A.clave_reservacion = @num_res
ELSE

SELECT 1/0

END TRY 

BEGIN CATCH 

THROW 51000, 'Error.', 1;  



END CATCH



---raiserror('',1,1)
 
END

IF @caso = 7 
BEGIN
UPDATE reservaciones SET pago_total = @monto ,  reservado = 0, check_in = 0 where clave_reservacion = @num_res
END

IF @caso = 8
BEGIN
INSERT INTO res_ser (numero,id_servicio,clave_reservacion) VALUES(@CANTIDAD,@idSERVICIO,@NUMEROR)            

END
IF @caso = 9
BEGIN 
UPDATE reservaciones SET cancel = 1 WHERE clave_reservacion = @cl_res AND reservado = 1 AND check_in = 0
END
