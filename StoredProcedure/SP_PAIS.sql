CREATE PROCEDURE [dbo].[SP_PAIS] 
@nomina int = null,
@idpais int = null,
@caso int  = null

AS

IF @caso = 1
BEGIN
INSERT INTO usuario_pais (clave_pais, no_nomina) VALUES ( @idpais, @nomina);
END

IF @caso = 2
BEGIN
SELECT clave_pais , abrev FROM VW_PAIS ;
END

IF @caso = 3
BEGIN
SELECT clave_ciudad, nombre from VW_CIUDAD WHERE clave_pais = @idpais
END
