CREATE PROCEDURE [dbo].[InsertTrip]
	@loadId NVARCHAR(50),
	@dispatchDate DATE,
	@NewTripId NVARCHAR(50) OUTPUT
AS
	
	IF NOT EXISTS (SELECT 1 FROM Load WHERE loadId = @loadId)
		THROW 50000,'No such Loadid was found, Sire!',1
	DECLARE @TripId NVARCHAR(50) = 
		'TRIP'+RIGHT('00000000' + Cast(NEXT VALUE FOR dbo.TripSeq as NVARCHAR(8)),8)
	INSERT INTO Trip(tripId,loadId,dispatchDate)
	values
		(@TripId,@loadId, @dispatchDate)
	
	SET @NewTripId = @TripId;
	
