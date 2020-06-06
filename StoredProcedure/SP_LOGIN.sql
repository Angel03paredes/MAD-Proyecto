CREATE PROCEDURE [dbo].[SP_LOGIN]
@usuario int,
@contra VARCHAR(50)

AS

SELECT no_nomina FROM VW_LOGIN WHERE no_nomina = @usuario AND contra = @contra;
