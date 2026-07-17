CREATE TRIGGER [tg_PreventCompletedTripDelete]
ON [dbo].[Trip]
INSTEAD OF DELETE
AS
BEGIN
	IF EXISTS 
		(
		SELECT 1
		FROM deleted
		WHERE tripStatus = 'Completed'
		)
		THROW 50001,'Cannot delete completed trips',1

		DELETE 
		FROM Trip
		WHERE tripId IN
			(
				SELECT tripId
				FROM deleted
			)
END
