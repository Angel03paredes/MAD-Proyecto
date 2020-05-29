CREATE PROCEDURE [dbo].[SP_THabitaciones] 



@Tcamas     VARCHAR(50) = null,

@no_camas   VARCHAR(50) = null,

@preciox   money = null,

@Ubicacion VARCHAR(50) = null,

@nivel VARCHAR(50) = null,

@Npersonas INT = null,

@caso int = null


AS

IF @caso = 1
Begin
INSERT INTO habitacion (tipos_cama,no_camas,precioxnoche,frente_a,nl_habitacion,capacidad)
 VALUES ( @Tcamas,@no_camas,@preciox,@Ubicacion,@nivel,@Npersonas);

 END

 IF @caso = 2
Begin
SELECT nl_habitacion,precioxnoche,no_camas from habitacion ;

 END
