SELECT DISTINCT PD.CollectorUID, 
				PD.Collector, 
				COUNT(PD.FolioUID) as "DocKol::INT",
				I.Screen 
  FROM ProcessedDoc PD
	LEFT JOIN Icons I ON I.UID = 22 
  GROUP BY PD.CollectorUID,
		   PD.Collector,		
		   I.Screen 