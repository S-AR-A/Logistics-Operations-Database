CREATE PROCEDURE [dbo].[InsertTrip]
	@loadId NVARCHAR(50),
	@dispatchDate DATE
AS
	IF NOT EXISTS (SELECT 1 FROM Load WHERE loadId = @loadId)
		THROW 50000,'No such LoadiD was found, Sire!',0
	INSERT INTO Trip(tripId,loadId,dispatchDate)
	values
		('TRIP'+RIGHT('00000000' + Cast(NEXT VALUE FOR dbo.TripSeq as NVARCHAR(8)),8),@loadId, @dispatchDate)
RETURN 0
