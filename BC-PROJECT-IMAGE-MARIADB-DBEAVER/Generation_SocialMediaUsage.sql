#User and Social Media Usage
SELECT gt.Generation, smpt.Platform, smudt.ActivityType, smudt.ActivityEngagement FROM SocialMediaUsage_Daily_Table smudt 
JOIN Users_Table ut ON smudt.UserID = ut.UserID 
JOIN SocialMediaPlatforms_Table smpt ON smudt.PlatformID = smpt.PlatformID 
JOIN Generations_Table gt ON ut.GenerationID  = gt.GenerationID;

#Platform used per user by generation
SELECT gt.Generation, smpt.Platform, ROUND(COUNT(smudt.PlatformID)/gen.TotalUsers, 2) as PlatformUsedPerUser FROM SocialMediaUsage_Daily_Table smudt 
JOIN Users_Table ut ON smudt.UserID = ut.UserID 
JOIN SocialMediaPlatforms_Table smpt ON smudt.PlatformID = smpt.PlatformID 
JOIN Generations_Table gt ON ut.GenerationID  = gt.GenerationID
JOIN (SELECT ut.GenerationID, COUNT(DISTINCT ut.UserID) AS TotalUsers
    FROM Users_Table ut
    GROUP BY ut.GenerationID
)AS gen ON gt.GenerationID = gen.GenerationID
GROUP BY gt.Generation, smpt.Platform
ORDER BY PlatformUsedPerUser desc;

#Activities by generations
SELECT gt.Generation, smudt.ActivityType, ROUND(COUNT(smudt.ActivityType)/gen.TotalUsers, 2) as ActivityPerUser  FROM SocialMediaUsage_Daily_Table smudt 
JOIN Users_Table ut ON smudt.UserID = ut.UserID 
JOIN SocialMediaPlatforms_Table smpt ON smudt.PlatformID = smpt.PlatformID 
JOIN Generations_Table gt ON ut.GenerationID  = gt.GenerationID
JOIN (SELECT ut.GenerationID, COUNT(DISTINCT ut.UserID) AS TotalUsers
    FROM Users_Table ut
    GROUP BY ut.GenerationID
)AS gen ON gt.GenerationID = gen.GenerationID
GROUP BY gt.Generation, smudt.ActivityType
ORDER BY ActivityPerUser desc;

