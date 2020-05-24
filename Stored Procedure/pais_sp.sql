USE [MAD_DB]
GO
/****** Object:  StoredProcedure [dbo].[SP_PAIS]    Script Date: 23/05/2020 09:40:43 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [dbo].[SP_PAIS] 
@nomina int,
@idpais int,
@caso int null
AS

IF @caso = 1
BEGIN
INSERT INTO usuario_pais (clave_pais, no_nomina) VALUES ( @idpais, @nomina);
END

IF @caso = 2
BEGIN
SELECT clave_pais , abrev FROM pais ;
END


