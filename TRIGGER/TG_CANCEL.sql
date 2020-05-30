CREATE TRIGGER [dbo].[TG_CANCEL]
ON [dbo].[reservaciones]
INSTEAD OF DELETE

AS

BEGIN
UPDATE reservaciones SET cancel = 1 WHERE fecha_ini < GETDATE() AND reservado = 1 AND check_in = 0 ;
END
