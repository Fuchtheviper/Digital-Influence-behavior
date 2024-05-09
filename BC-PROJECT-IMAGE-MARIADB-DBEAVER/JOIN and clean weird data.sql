#Join all table to get the data
SELECT
gt.Generation,
ut.gender,
ut.Area,
lt.Location,
dt.Device,
smpt.Platform,
dut.TimeSpent,
smudt.ActivityType,
smudt.ActivityEngagement
FROM DeviceUsage_Table dut
JOIN Users_Table ut ON dut.UserID = ut.UserID
JOIN Generations_Table gt ON ut.GenerationID = gt.GenerationID
JOIN Locations_Table lt ON dut.LocationID = lt.LocationID
JOIN Devices_Table dt ON dt.DeviceID = dut.DeviceID
JOIN SocialMediaUsage_Daily_Table smudt ON dut.UserID = smudt.UserID
JOIN SocialMediaPlatforms_Table smpt ON smudt.PlatformID = smpt.PlatformID;

#Filter abnormal data
SELECT
gt.Generation,
ut.gender,
ut.Area,
lt.Location,
dt.Device,
smpt.Platform,
dut.TimeSpent,
smudt.ActivityType,
smudt.ActivityEngagement
FROM DeviceUsage_Table dut
JOIN Users_Table ut ON dut.UserID = ut.UserID
JOIN Generations_Table gt ON ut.GenerationID = gt.GenerationID
JOIN Locations_Table lt ON dut.LocationID = lt.LocationID
JOIN Devices_Table dt ON dt.DeviceID = dut.DeviceID
JOIN SocialMediaUsage_Daily_Table smudt ON dut.UserID = smudt.UserID
JOIN SocialMediaPlatforms_Table smpt ON smudt.PlatformID = smpt.PlatformID
WHERE NOT(
  (lt.location IN ('Public Area', 'Transportation') AND dt.Device IN ('SmartTV', 'PC')) OR
  (smudt.ActivityType ='Create Content' AND dt.Device ='SmartTV')
);

#Delete abnormal data
DELETE dut, smudt
FROM DeviceUsage_Table dut
JOIN Users_Table ut ON dut.UserID = ut.UserID
JOIN Generations_Table gt ON ut.GenerationID = gt.GenerationID
JOIN Locations_Table lt ON dut.LocationID = lt.LocationID
JOIN Devices_Table dt ON dut.DeviceID = dt.DeviceID
JOIN SocialMediaUsage_Daily_Table smudt ON dut.UserID = smudt.UserID
JOIN SocialMediaPlatforms_Table smpt ON smudt.PlatformID = smpt.PlatformID
WHERE (
    (lt.Location IN ('Public Area', 'Transportation') AND dt.Device IN ('SmartTV', 'PC')) OR
    (smudt.ActivityType ='Create Content' AND dt.Device ='SmartTV')
);