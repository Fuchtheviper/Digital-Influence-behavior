#Table
SELECT gt.Generation, ut.Gender, ut.Area, dt.Device, lt.Location, dut.TimeSpent FROM DeviceUsage_Table dut
JOIN Users_Table ut ON dut.UserID = ut.UserID 
JOIN Generations_Table gt ON ut.GenerationID = gt.GenerationID
JOIN Devices_Table dt ON dut.DeviceID = dt.DeviceID
JOIN Locations_Table lt ON dut.LocationID = lt.LocationID;

#Average Time spent per user by generation and device
SELECT gt.Generation,
dt.Device,
ROUND((SUM(dut.TimeSpent)/gen.TotalUsers), 2) AS AvgTimePerUser
FROM DeviceUsage_Table dut
JOIN Users_Table ut ON dut.UserID = ut.UserID 
JOIN Generations_Table gt ON ut.GenerationID = gt.GenerationID
JOIN Devices_Table dt ON dut.DeviceID = dt.DeviceID
JOIN (
    SELECT ut.GenerationID, COUNT(DISTINCT ut.UserID) AS TotalUsers
    FROM Users_Table ut
    GROUP BY ut.GenerationID
) AS gen ON gt.GenerationID = gen.GenerationID
GROUP BY gt.Generation, dt.Device
ORDER BY AvgTimePerUser DESC;

#Device usage in each location
SELECT dt.Device, lt.Location, COUNT(lt.Location) AS TotalUsage  FROM DeviceUsage_Table dut 
JOIN Devices_Table dt ON dut.DeviceID = dt.DeviceID
JOIN Locations_Table lt ON dut.LocationID = lt.LocationID
GROUP BY dt.Device, lt.Location
ORDER BY TotalUsage desc;