CREATE PROCEDURE [dbo].[SP_HOTEL]



@Name    VARCHAR(50) = null,

@Address   VARCHAR(50) = null,

@ZoneT BIT = null,

@Floor TINYINT = null,

@Beach INT = null,

@DATE DATETIME = null,

@PISC INT = null,

@City   INT = null,

@ELIGEP INT = null,

@Room INT = null,

@caso int = null,

@costo MONEY = null,

@servicio VARCHAR(50) = null,

@veces BIGINT =null,

@hab BIGINT = null,

@hotel INT = null

AS

IF @caso = 1
Begin
INSERT INTO hotel (nombre,domicilio,clave_pais,clave_ciudad,turistico,fecha_ini,no_pisos,cant_habitacion)
 VALUES ( @Name,@Address,@ELIGEP,@City,@ZoneT,@DATE,@Floor,@Room );
 
 INSERT INTO ref_hotel (frente_playa,no_pisicnas,clave_hotel)
 VALUES (@Beach, @PISC,@@IDENTITY);
 END

 IF @caso = 2
Begin
SELECT Hotel, Domicilio,  Ciudad,  Pais ,Clave
FROM VW_HOTEL
END


  IF @caso = 3
Begin
DECLARE @vari int;
SET @vari = (SELECT MAX(clave_hotel) FROM hotel)
INSERT INTO servicios (costo,t_servicio,clave_hotel) VALUES (@costo,@servicio,@vari) ;

 END

 IF @caso = 4
Begin
DECLARE @vari2 int;
SET @vari2 = (SELECT MAX(clave_hotel) FROM hotel)


DECLARE @cnt INT = 0;

WHILE @cnt < @veces
BEGIN
INSERT INTO habitacion_hotel(clave_hotel,id_habitacion) VALUES (@vari2,@hab) ;
   SET @cnt = @cnt + 1;
END;





 END


 IF @caso = 5
Begin
UPDATE hotel SET nombre = @Name ,domicilio = @Address,clave_pais = @ELIGEP ,clave_ciudad = @City,turistico = @ZoneT,fecha_ini = @DATE,no_pisos = @Floor,cant_habitacion =  @Room
 Where clave_hotel = @hotel;
 
UPDATE  ref_hotel SET frente_playa = @Beach,no_pisicnas = @PISC
 Where clave_hotel = @hotel;
 END
 

  IF @caso = 6
Begin



DECLARE @cnt2 INT = 0;

WHILE @cnt2 < @veces
BEGIN
INSERT INTO habitacion_hotel(clave_hotel,id_habitacion) VALUES (@hotel,@hab) ;
   SET @cnt2 = @cnt2 + 1;
END

END
