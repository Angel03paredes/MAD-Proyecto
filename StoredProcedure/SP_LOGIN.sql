CREATE PROCEDURE [dbo].[SP_LOGIN]
@usuario int,
@contra VARCHAR(50)

AS

SELECT * FROM usuario WHERE no_nomina = @usuario AND contra = @contra;
