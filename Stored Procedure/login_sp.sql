USE [MAD_DB]
GO
/****** Object:  StoredProcedure [dbo].[SP_LOGIN]    Script Date: 24/05/2020 08:19:06 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [dbo].[SP_LOGIN]
@usuario int,
@contra VARCHAR(50)

AS

SELECT * FROM usuario WHERE no_nomina = @usuario AND contra = @contra;

