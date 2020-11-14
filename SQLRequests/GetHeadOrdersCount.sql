SELECT count(H.UID) as CountNacl, 
	  (SELECT COUNT (H1.UID)
		FROM OrdersHeader H1
		WHERE H1.Status = 3 AND
			  H1.UID = H.UID) as CountBuild
FROM OrdersHeader H 