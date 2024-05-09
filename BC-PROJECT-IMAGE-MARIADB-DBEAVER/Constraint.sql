#DeviceUsage
ALTER TABLE DeviceUsage_Table
ADD PRIMARY KEY (DeviceUsageID);

ALTER TABLE DeviceUsage_Table
ADD FOREIGN KEY (UserID) REFERENCES Users_Table(UserID);

ALTER TABLE DeviceUsage_Table
ADD FOREIGN KEY (DeviceID) REFERENCES Devices_Table(DeviceID);

ALTER TABLE DeviceUsage_Table
ADD FOREIGN KEY (LocationID) REFERENCES Locations_Table(LocationID);

#SocialMediaUsage
ALTER TABLE SocialMediaUsage_Daily_Table
ADD PRIMARY KEY (SocialMediaUsageID);

ALTER TABLE SocialMediaUsage_Daily_Table
ADD FOREIGN KEY (UserID) REFERENCES Users_Table(UserID);

ALTER TABLE SocialMediaUsage_Daily_Table
ADD FOREIGN KEY (PlatformID) REFERENCES SocialMediaPlatforms_Table(PlatformID);

#Users
ALTER TABLE Users_Table
ADD PRIMARY KEY (UserID);

ALTER TABLE Users_Table
ADD FOREIGN KEY (GenerationID) REFERENCES Generations_Table(GenerationID);

#Devices
ALTER TABLE Devices_Table
ADD PRIMARY KEY (DeviceID);

#Generations
ALTER TABLE Generations_Table
ADD PRIMARY KEY (GenerationID);

#Locations
ALTER TABLE Locations_Table
ADD PRIMARY KEY (LocationID);

#SocialMediaPlatforms
ALTER TABLE SocialMediaPlatforms_Table
ADD PRIMARY KEY (PlatformID);



