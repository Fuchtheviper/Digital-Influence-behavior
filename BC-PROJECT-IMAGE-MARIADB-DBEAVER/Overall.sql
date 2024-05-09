#User
SELECT ut.UserID, gt.Generation, ut.Gender, ut.Area FROM Users_Table ut 
JOIN Generations_Table gt ON ut.GenerationID = gt.GenerationID;

#Total user by generation
SELECT gt.Generation, COUNT(gt.Generation) AS UsersAmount  FROM Users_Table ut 
JOIN Generations_Table gt ON ut.GenerationID = gt.GenerationID
GROUP BY gt.Generation
ORDER BY UsersAmount desc;

#Total user by area
SELECT Area , COUNT(Area) AS UsersAmount  FROM Users_Table
GROUP BY Area
ORDER BY UsersAmount desc;

#Device Usage
SELECT dt.Device, COUNT(dt.Device) AS DeviceAmount  FROM DeviceUsage_Table dut 
JOIN Devices_Table dt  ON dut.DeviceID  = dt.DeviceID
GROUP BY dt.Device
ORDER BY DeviceAmount desc;

#Social Media Usage
SELECT smpt.Platform, COUNT(smpt.Platform) as TotalUsed  
FROM SocialMediaUsage_Daily_Table smudt 
JOIN SocialMediaPlatforms_Table smpt ON smudt.PlatformID = smpt.PlatformID 
GROUP BY smpt.Platform
ORDER BY COUNT(smpt.Platform) desc;

#Activity
SELECT smudt.ActivityType, COUNT(smudt.ActivityType) AS TotalActivities  FROM SocialMediaUsage_Daily_Table smudt 
JOIN SocialMediaPlatforms_Table smpt ON smudt.PlatformID = smpt.PlatformID
GROUP BY smudt.ActivityType
ORDER BY TotalActivities desc;