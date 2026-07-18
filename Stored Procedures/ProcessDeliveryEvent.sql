CREATE PROCEDURE [dbo].[ProcessDeliveryEvent]
   -- eventId NVARCHAR(50),
   -- loadId NVARCHAR(50) NOT NULL,
   @TripId                  NVARCHAR(50),
   @EventType               NVARCHAR(10),
   @FacilityId              NVARCHAR(50),
   @ScheduledDatetime       DATETIME2(7),
   -- actualDatetime DATETIME2(7) NOT NULL,
   @DetentionMinutes        SMALLINT,
   -- onTimeFlag NVARCHAR(50) NOT NULL,
   --@LocationCity            NVARCHAR(50),
   --@LocationState           NVARCHAR(3),
   @ActualDistanceMiles     SMALLINT = 0,
   @ActualDurationHours     FLOAT(53) = 0,
   @FuelGallonsUsed         DECIMAL(19,4) = 0,
   @IdleTimeHours           FLOAT(53) = 0
AS
BEGIN
SET NOCOUNT ON;
    BEGIN TRY

        BEGIN TRAN
        DECLARE @CurrentTime DATETIME2(7) = SYSDATETIME();

        IF @EventType = 'Pickup'
        BEGIN   
            IF NOT EXISTS (
                SELECT 1 
                FROM Trip  
                WHERE tripId = @TripId
                    AND tripStatus = 'Not Started'
            )
                THROW 50001, 'No such trip with ''Not Started''status exists, sire!',1

            EXEC dbo.StartTrip 
                @TripId                 
        END
        ELSE IF @EventType = 'Delivery'
        BEGIN
            IF NOT EXISTS (
                SELECT 1 
                FROM Trip  
                WHERE tripId = @TripId
                    AND tripStatus = 'Started'
            )
                THROW 50001, 'No such trip with ''Started''status exists, sire!',1

            EXEC dbo.CompleteTrip 
                @TripId,
                @ActualDistanceMiles,
                @ActualDurationHours,
                @FuelGallonsUsed,
                @IdleTimeHours 
                            
        END
        ELSE
            THROW 50002,'Invalid eventType, sire!',1

        INSERT INTO dbo.DeliveryEvent
                (
                    eventId,
                    loadId,
                    tripId,
                    eventType,
                    facilityId,
                    scheduledDatetime,
                    actualDatetime,
                    detentionMinutes,
                    onTimeFlag,
                    locationCity,
                    locationState
                )
                VALUES
                (
                    RIGHT('00000000' + CAST(NEXT VALUE FOR dbo.DeliveryEventSeq AS NVARCHAR(8)),8),
                    (
                        SELECT loadId
                        FROM Trip
                        WHERE tripId = @TripId
                    ),
                    @TripId,
                    @EventType,
                    @FacilityId,
                    @ScheduledDatetime,
                    @CurrentTime,
                    @DetentionMinutes,
                    CASE 
                        WHEN @ScheduledDatetime >= @CurrentTime THEN 1
                        ELSE 0
                    END,
                    (
                        SELECT city
                        FROM Facility
                        WHERE facilityId = @FacilityId
                     ),
                     (
                        SELECT [state]
                        FROM Facility
                        WHERE facilityId = @FacilityId
                     )
                )

        COMMIT

    END TRY
    BEGIN CATCH

        IF @@TRANCOUNT > 0
            ROLLBACK;
        THROW

    END CATCH
    RETURN 0
END
