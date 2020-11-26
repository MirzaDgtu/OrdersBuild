SELECT KA.KeeperUid,
	   KA.KeeperName,
	   KA.CollectorUid,
	   KA.CollectorName,
	   I.Screen
FROM KeeperAccess KA	
	LEFT JOIN Icons I ON I.UID = 1