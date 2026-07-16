CREATE VIEW [dbo].[vw_ActiveTrips]
	AS 
	SELECT 
		t.truckId,
		d.firstName + ' ' + d.lastName as driverName,
		tk.unitNumber,
		c.customerName,
		r.originCity + ', ' + r.originState as origin,
		r.destinationCity + ', ' + r.destinationState as destination,
		t.tripStatus
	FROM Trip as t
	join Driver as d
		on t.driverId = d.driverId
	join Truck as tk
		on t.truckId = tk.truckId
	join Load as l
		on t.loadId = l.loadId
	join Customer as c
		on l.customerId = c.customerId
	join Route as r
		on l.routeId = r.routeId
	WHERE t.tripStatus IN ('Not Started','Started')
