CREATE VIEW [dbo].[vw_TripSummary]
AS
SELECT 
	t.tripId,
	tk.unitNumber as truck,
	d.firstName + ' ' + d.lastName as driverName,
	l.loadType as loadType,
	t.dispatchDate,
	de.actualDatetime as deliveryDateTime,
	t.actualDistanceMiles as totalDistance,
	t.actualDurationHours as duration,
	t.fuelGallonsUsed as fuelUsed,
	t.averageMpg as mpg	
from trip as t
join Driver as d
on t.driverId = d.driverId
join Truck as tk
on t.truckId = tk.truckId
join Load as l
on t.loadId = l.loadId
join Customer as c
on l.customerId = c.customerId
join DeliveryEvent as de
on t.tripId = de.tripId
Where t.tripStatus = 'Completed'