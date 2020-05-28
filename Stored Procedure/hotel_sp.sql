
CREATE PROCEDURE SP_HOTEL



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

@caso int = null


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
SELECT A.nombre , A.domicilio, B.nombre , C.nombre FROM 
hotel A INNER JOIN ciudad B 
ON  A.clave_ciudad = B.clave_ciudad 
INNER JOIN pais C 
ON C.clave_pais = A.clave_pais;

END


 