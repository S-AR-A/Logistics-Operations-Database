CREATE VIEW [dbo].[vw_TripSummary]
AS
SELECT 
	t.tripId,
	tk.unitNumber AS truck,
	d.firstName + ' ' + d.lastName AS driverName,
	l.loadType AS loadType,
	t.dispatchDate,
	de.actualDatetime AS deliveryDateTime,
	t.actualDistanceMiles AS totalDistance,
	t.actualDurationHours AS duration,
	t.fuelGallonsUsed AS fuelUsed,
	t.averageMpg AS mpg	
FROM Trip AS t
JOIN Driver AS d
ON t.driverId = d.driverId
JOIN Truck AS tk
ON t.truckId = tk.truckId
JOIN Load AS l
ON t.loadId = l.loadId
JOIN Customer AS c
ON l.customerId = c.customerId
JOIN DeliveryEvent AS de
ON t.tripId = de.tripId
WHERE t.tripStatus = 'Completed'