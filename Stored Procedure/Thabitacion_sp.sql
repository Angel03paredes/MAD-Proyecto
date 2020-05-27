USE [MAD_DB]
GO
/****** Object:  StoredProcedure [dbo].[SP_THabitaciones]    Script Date: 27/05/2020 12:00:02 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER PROCEDURE [dbo].[SP_THabitaciones] 



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
SELECT tipos_cama from habitacion ;

 END


