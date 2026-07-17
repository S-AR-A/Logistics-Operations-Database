CREATE VIEW [dbo].[vw_ActiveTrips]
	AS 
	SELECT 
		t.truckId,
		d.firstName + ' ' + d.lastName AS driverName,
		tk.unitNumber AS truck,
		c.customerName,
		r.originCity + ', ' + r.originState AS origin,
		r.destinationCity + ', ' + r.destinationState AS destination,
		t.tripStatus
	FROM Trip AS t
	LEFT JOIN Driver AS d
		ON t.driverId = d.driverId
	LEFT JOIN Truck AS tk
		ON t.truckId = tk.truckId
	JOIN Load AS l
		ON t.loadId = l.loadId
	JOIN Customer AS c
		ON l.customerId = c.customerId
	JOIN Route AS r
		ON l.routeId = r.routeId
	WHERE t.tripStatus IN ('Not Started','Started')
