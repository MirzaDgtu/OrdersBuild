									SELECT  H.UID, 
                                             H.JournalNo,
                                             H.OrderUID, 
                                             H.FolioUID, 
                                             H.OrderNo,  
                                             H.OrderDate,
                                             H.Status,   
                                             H.BRIEFORG, 
                                             H.ORGANIZNKL,
                                             H.L_CP1_PLAT,
                                             H.L_CP2_PLAT,
                                             H.VID_DOC,    
                                             H.SUM_POR,    
                                             H.SUM_ROZN,   
                                             H.StrikeCode, 
                                             H.NAMEP_USER, 
                                             H.ADRES_USER, 
                                             H.ProjectName, 
                                             (SELECT Count(Article)
                                              FROM OrdersMove M
                                              WHERE M.FolioUID = H.FolioUID) AS "ColProd::SMALLINT", 
                                             (SELECT Count(Article) 
                                              FROM OrdersMove M 
                                              WHERE M.FolioUID = H.FolioUID AND 
                                              M.Status = 1) AS "ColBuildProd::SMALLINT", 
                                              Date_Device, 
                                              I.Screen, 
                                              ifnull(PD.CollectorUID, 0) as "CollectorUID::SMALLINT",
                                              PD.Collector, 
                                              ifNull(PD.KeeperUID, 0) as "KeeperUID::SMALLINT", 
                                              PD.Keeper 
                                     FROM OrdersHeader H 
                                     LEFT JOIN ProcessedDoc PD ON PD.FolioUID = H.FolioUID 
                                     left join Icons I ON I.UID = (SELECT CASE WHEN IfNull(H.Status,0) = 0 THEN 7 
                                                                               WHEN IfNull(H.Status,0) = 1 THEN 7 
                                                                               WHEN IfNull(H.Status, 0) = 2 THEN 26
                                                                               WHEN IfNull(H.Status, 0) = 3 THEN 24 
                                                                               END)