unit SConsts;

interface

resourcestring

                            /// --- ������ � ��������� ����� ������ --- ///

                                    // ������ � ��������� �������� USERS

      SSQLClearUsersLocal              = 'DELETE FROM Users';               // ������� ������ �������������

      SSQLAddUsersLocal                = 'INSERT INTO Users (ID, ' +        //-----************************-----//
                                                             'UserLogin, ' +// ������ ������������ � ������� Users
                                                             'UserName)  ' +//-----************************-----//
                                         'VALUES (%d, ''%s'', ''%s'')';     //-----************************-----//

      SSQLGetUsersLocal   = 'SELECT ID, ' +
                                   'UserLogin, ' +                          //-----************************-----//
            	                     'UserName,    ' +                        //--��������� ������ �������������--//
                                   'LastUser, ' +                           //----�� ��������� ������� Users----//
                                   'I.Screen, ' +                           //-----************************-----//
                                   ' (SELECT II.SCREEN ' +
                                   '  FROM USERS UU ' +
                                   '  WHERE UU.LastUser = 1 ' +
                                   '	      AND UU.ID = U.ID) AS "LastUserScreen" ' +
                            'FROM Users U ' +                               //-----************************-----//
                            ' LEFT JOIN Icons I ON I.UID = 2 ' +            //-----************************-----//
                            ' LEFT JOIN Icons II ON II.UID = 13 '+
                            'Order BY UserName';                            //-----************************-----//

      SSQLUpdateLastUserLocal = 'UPDATE Users ' +                           //-----************************-----//
                                'SET LastUser = %d ' +                      // ���������� ������� ���������� ������������
                                'WHERE ID = %d';                            //-----************************-----//

      SSQLGetLastUserLocal = 'SELECT ID, ' +
                                    'UserLogin, ' +                         //-----************************-----//
            	                      'UserName,    ' +                       //--��������� ���������� ������������--//
                                    'LastUser ' +                           //----�� ��������� ������� Users----//
                            'FROM Users ' +                                 //----������� ��������� ��� ����� � ���������
                            ' WHERE LastUser = 1 ' +                        //-----************************-----//
                            'Order BY UserName';                            //-----************************-----//


                                    // ��������

      SSQLGetCollectors = 	'SELECT C.UID, ' +                              //----****************----//
                                   'C.Name, ' +                             //--- ��������� ������ ---//
                                   'I.Screen ' +                            //------- ��������� ------//
                            'FROM Collectors C ' +                          //----****************----//
                                'LEFT JOIN Icons I ON I.UID = 22';          //----****************----//

      SSQLDeleteCollectors  = 'DELETE FROM Collectors';                     //--- �������� ������ ���������

      SSQLAddCollectorLocal = 'INSERT INTO Collectors(UID, ' +              // ���������� �������� �
                                                     'NAME) ' +             // ��������� ���� ������
                              'VALUES (%d, ''%s'')';                        // -- *******************--//
                                    // ��������� ���������� � ��������� ��������

      SSQLGetConnectSetting   = 'SELECT  ID, ' +                             //-----************************-----//
                                        'ServerName, ' +                     //-----************************-----//
                                        'UserLogin, ' +                      //-----************************-----//
                                        'UserPassword, ' +                   // ��������� �������� ��� �����������
                                        'InitialCatalog, ' +                 // � ���������� ������� �� SqlLite ����
                                        'Port  ' +                           //-----************************-----//
                                 'FROM TableSetting ' +                      //-----************************-----//
                                 'ORDER BY ID DESC ' +                       //-----************************-----//
                                  'LIMIT 1';                                 //-----************************-----//


      SSQLAddConnectionSetting = 'INSERT INTO TableSetting(ServerName, ' +                                //-----**********-----//
                                                          'InitialCatalog, ' +                            //--���������� �����--//
                                                          'UserLogin, ' +                                 //-���������� ��������//
                                                          'UserPassword, '  +                             //-----**********-----//
                                                          'Port) ' +                                      //-----**********-----//
                                 'VALUES                  (''%s'', ''%s'', ''%s'', ''%s'', %d)';          //-----**********-----//



                                                                // ������ ��������

           SSQLGetReestrsLocal        = 'SELECT R.UID, ' +                                                     //-----**********-----//
                                          'R.ProjectName as "ProjectName::VARCHAR(50)", ' +               //-----**********-----//
                                          'I.Screen ' +                                                   // ��������� ������ �������� � ��������� ����
                                   'FROM Reestrs R ' +                                                    //-----**********-----//
                                   ' LEFT JOIN Icons I ON I.UID = 12';                                    //-----**********-----//

      SSQLAddReestrs             = 'INSERT INTO Reestrs(UID, ' +                                          //-----**********************************-----//
                                                       'ProjectName) ' +                                  // ���������� ������ �������� � ��������� ����
                                   'VALUES             (%d, ''%s'')';                                     //-----**********************************-----//

      SSQLDeleteReestrs          = 'DELETE FROM Reestrs';                                                 // ������� ������ �������� � ��������� ����


                                                              // ��������� ������������ �� ��������� ����
      SSQLGetBrieforgLocal        = 'SELECT DISTINCT BRIEFORG, ' +                                        //-----*********-----//
                                    '                I.Screen  ' +                                        //-----*********-----//
                                    'FROM OrdersHeader ' +                                                //--������ ��������--//
                                    ' LEFT JOIN Icons I ON I.UID = 14 ' +                                 //--����� ��������---//
                                    'WHERE BRIEFORG IS NOT NULL AND ' +                                   //-----*********-----//
                                           'BRIEFORG != ''''';                                            //-----*********-----//

      SSQLGetDriversLocal        = 'SELECT DISTINCT L_CP2_PLAT, ' +                                       //-----*********-----//
                                   '                I.Screen   ' +                                        //-----*********-----//
                                   'FROM OrdersHeader ' +                                                 //-----*********-----//
                                   ' LEFT JOIN Icons I ON I.UID = 20 ' +                                  //-������  ���������-//
                                   'WHERE L_CP2_PLAT IS NOT NULL AND ' +                                  //-----*********-----//
                                         'L_CP2_PLAT != ''''';                                            //-----*********-----//

      SSQLGetAgentsLocal         = 'SELECT DISTINCT L_CP1_PLAT, ' +                                       //-----*********-----//
                                   '                I.Screen   ' +                                        //-----*********-----//
                                   'FROM OrdersHeader ' +                                                 //--������  �������--//
                                   ' LEFT JOIN Icons I ON I.UID = 16 '  +                                 //-----*********-----//
                                   'WHERE L_CP1_PLAT IS NOT NULL AND ' +                                  //-----*********-----//
                                         'L_CP1_PLAT != ''''';                                            //-----*********-----//

      SSQLGetVidDocLocal       = 'SELECT DISTINCT VID_DOC, ' +                                            //-----*********-----//
                                   '                I.Screen ' +                                          //-----*********-----//
                                   'FROM OrdersHeader ' +                                                 //---������ �����----//
                                   ' LEFT JOIN Icons I ON I.UID = 18 ' +                                  //-----��������------//
                                   'WHERE VID_DOC IS NOT NULL AND ' +                                     //-----*********-----//
                                         'VID_DOC != ''''';                                               //-----*********-----//


              //   ������������ ���������

      SSQLAddCollectorOrder = 'INSERT INTO ProcessedDoc (FolioUID, ' +                                    //-----**********************-----//
                                                        'OrderDatePD, ' +                                 //-----**********************-----//
                                                        'Keeper,    ' +                                   //-----**********************-----//
                                                        'KeeperUID, ' +                                   //---���������� ��������� ���������
                                                        'Collector, ' +                                   //-----� ������� ProcessedDoc-----//
                                                        'CollectorUID, ' +                                //-----**********************-----//
                                                        'OrderBuildDate,  ' +                             //-----**********************-----//
                                                        'Status) ' +                                      //-----**********************-----//
                              'VALUES 	(''%s'', ''%s'', ''%s'', %d, ''%s'', %d, ''%s'', %d)';            //-----**********************-----//


      SSQLGetCollectorOrders = 'SELECT 	PD.UID, ' +                                                       //-----************-----//
                                       'PD.FolioUID, ' +                                                  //-----************-----//
                                       'PD.OrderDatePD, ' +                                               //-----************-----//
                                       'PD.Keeper, ' +                                                    //-----************-----//
                                       'PD.KeeperUID, ' +                                                 //-----************-----//
                                       'PD.Collector, ' +                                                 //-----************-----//
                                       'PD.CollectorUID, ' +                                              //---��������� ������ ��������� ���������---//
                                       'PD.OrderBuildDate, ' +                                            //---��������� ���������---//
                                       'I.Screen ' +                                                      //-----************-----//
                                    'FROM ProcessedDoc PD ' +                                             //-----************-----//
                                    'left join Icons I ON I.UID = (SELECT CASE WHEN IfNull(PD.Status,0) = 0 THEN 7 ' +   //-----*******************-----//
                                                                           'WHEN IfNull(PD.Status,0) = 1 THEN 7 ' +       //-----*******************-----//
                                                                           'WHEN IfNull(PD.Status, 0) = 2 THEN 26 ' +     //-----*******************-----//
                                                                           'WHEN IfNull(PD.Status, 0) = 3 THEN 24 ' +     //-----*******************-----//
                                                                           'END) ' +                                      //-----*******************-----//
                                    'WHERE CollectorUID = %d  ' +                                         //-----************-----//
                                    'ORDER BY PD.FolioUID';                                               //-----************-----//


      SSQLGetCollectCountOrders = 'SELECT DISTINCT CollectorUID, ' +                                      //-----************-----//
                                                 ' Collector, ' +                                         //-----************-----//
                                                 ' COUNT(FolioUID)as "DocKol::INT", ' +                   //-----************-----//
                                                 ' I.Screen ' +                                           //---��������� ������ ���������
                                  'FROM ProcessedDoc ' +                                                  //---� ���������� ��������� ������
                                  '  LEFT JOIN Icons I ON I.UID = 22 ' +                                  //-----************-----//
                                  'WHERE OrderDatePD BETWEEN ''%s'' and ''%s'' ' +                        //-----************-----//
                                  'GROUP BY CollectorUID, ' +                                                   //-----************-----//
                                           'Collector, ' +                                                //-----************-----//
                                           'I.Screen ';                                                   //-----************-----//

      SSQLGetCollectCountOrdersOverride = 'SELECT DISTINCT CollectorUID, ' +                                      //-----************-----//
                                                 ' Collector, ' +                                         //-----************-----//
                                                 ' COUNT(FolioUID)as "DocKol::INT", ' +                   //-----************-----//
                                                 ' I.Screen, ' +                                          //---��������� ������ ���������
                                                 ' Status ' +                                             //-----************-----//
                                  'FROM ProcessedDoc ' +                                                  //---� ���������� ��������� ������
                                  '  LEFT JOIN Icons I ON I.UID = 22 ';                                   //-----************-----//
                                 // 'GROUP BY CollectorUID, ' +                                             //-----************-----//
                                 //          'Collector, ' +                                                //-----************-----//
                                 //          'I.Screen ';                                                   //-----************-----//

      SSQLGetCollectOrdersAtCollectUID = 'SELECT DISTINCT CollectorUID, ' +                               //-----************-----//
                                                 ' Collector, ' +                                         //-----************-----//
                                                 ' COUNT(FolioUID)as "DocKol::INT", ' +                   //-----************-----//
                                                 ' I.Screen ' +                                           //---��������� ������ ���������
                                          'FROM ProcessedDoc ' +                                          //---� ���������� ��������� ������
                                          '  LEFT JOIN Icons I ON I.UID = 22 ' +                          //-----************-----//
                                          'WHERE OrderDatePD BETWEEN ''%s'' and ''%s'' ' +                //-----************-----//
                                          '      CollectorUID = %d ' +                                    //-----************-----//
                                          'GROUP BY CollectorUID, ' +                                           //-----************-----//
                                                   'Collector, ' +                                        //-----************-----//
                                                   'I.Screen ';

      SSQLClearProcessedOrders = 'DELETE FROM ProcessedDoc';                                                // ������� ���� ������� �� ��������� ���������

      SSQLDeleteProcessedOrder = 'DELETE FROM ProcessedDoc ' +                                              // �������� ������������� ��������� �� ���������
                               'WHERE FolioUID = %s';


                                         //-----  ���������

      SSQLGetOrdersHeaderLocal     = 'SELECT  H.UID, ' +                                                  //-----*******************-----//
                                             'H.JournalNo,   ' +                                          //-----*******************-----//
                                             'H.OrderUID,    ' +                                          //-----*******************-----//
                                             'H.FolioUID,    ' +                                          //-----*******************-----//
                                             'H.OrderNo,     ' +                                          //-----*******************-----//
                                             'H.OrderDate,   ' +                                          //-----*******************-----//
                                             'H.Status,      ' +                                          //-----*******************-----//
                                             'H.BRIEFORG,    ' +                                          //-----*******************-----//
                                             'H.ORGANIZNKL,  ' +                                          //-----*******************-----//
                                             'H.L_CP1_PLAT,  ' +                                          //-----*******************-----//
                                             'H.L_CP2_PLAT,  ' +                                          //-----*******************-----//
                                             'H.VID_DOC,     ' +                                          //--- ��������� ������� ����������
                                             'H.SUM_POR,     ' +                                          //--- �� ��������� ��
                                             'H.SUM_ROZN,    ' +                                          //-----*******************-----//
                                             'H.StrikeCode,  ' +                                          //-----*******************-----//
                                             'H.NAMEP_USER,  ' +                                          //-----*******************-----//
                                             'H.ADRES_USER,  ' +                                          //-----*******************-----//
                                             'H.ProjectName,  ' +                                         //-----*******************-----//
                                             '(SELECT Count(Article) ' +                                  //-----*******************-----//
                                              'FROM OrdersMove M ' +                                      //-----*******************-----//
                                              'WHERE M.FolioUID = H.FolioUID) AS "ColProd::SMALLINT", ' + //-----*******************-----//
                                             '(SELECT Count(Article) ' +                                  //-----*******************-----//
                                              'FROM OrdersMove M ' +                                      //-----*******************-----//
                                              'WHERE M.FolioUID = H.FolioUID AND ' +                      //-----*******************-----//
                                              'M.Status = 1) AS "ColBuildProd::SMALLINT", ' +             //-----*******************-----//
                                              'Date_Device, ' +                                           //-----*******************-----//
                                              'I.Screen, ' +                                              //-----*******************-----//
                                              'ifnull(PD.CollectorUID, 0) as "CollectorUID::SMALLINT", ' +               //-----*******************-----//
                                              'PD.Collector, ' +                                                         //-----*******************-----//
                                              'ifNull(PD.KeeperUID, 0) as "KeeperUID::SMALLINT", ' +                     //-----*******************-----//
                                              'PD.Keeper ' +                                                             //-----*******************-----//
                                     'FROM OrdersHeader H ' +                                                            //-----*******************-----//
                                     'LEFT JOIN ProcessedDoc PD ON PD.FolioUID = H.FolioUID ' +                          //-----*******************-----//
                                     'left join Icons I ON I.UID = (SELECT CASE WHEN IfNull(H.Status,0) = 0 THEN 7 ' +   //-----*******************-----//
                                                                               'WHEN IfNull(H.Status,0) = 1 THEN 7 ' +   //-----*******************-----//
                                                                               'WHEN IfNull(H.Status, 0) = 2 THEN 26 ' + //-----*******************-----//
                                                                               'WHEN IfNull(H.Status, 0) = 3 THEN 24 ' + //-----*******************-----//
                                                                               'END)';                                   //-----*******************-----//


      SSQLGetOrdersMove            = 'SELECT FolioUID,  ' +
                                            'Article,   ' +                                               //-----*********-----//
                                            'StrikeCode,' +                                               //-----*********-----//
                                            'ProductName, ' +                                             //-----*********-----//
                                            'EDIN_IZMER,' +                                               //-----*********-----//
                                            'Packages,  ' +                                               //-----*********-----//
                                            'EDN_V_UPAK,' +                                               //-----*********-----//
                                            'Qty,       ' +                                               //-----*********-----//
                                            'Price,     ' +                                               //��������� �����������//
                                            'Sum_Predm, ' +                                               //-----���������-----//
                                            'KON_KOLCH, ' +                                               //-----*********-----//
                                            'IfNull(Status, 0) as "Status::SMALLINT", ' +                 //-----*********-----//
                                            'Date_Device, ' +                                             //-----*********-----//
                                            'I.Screen ' +                                                 //-----*********-----//
                                     'FROM OrdersMove M  ' +                                              //-----*********-----//
                                     'LEFT JOIN Icons I ON I.UID = 1 ' +                                  //-----*********-----//
                                     'WHERE FolioUID = %d ';                                              //-----*********-----//




      SSQLGetCountOrdersHeader          = 'SELECT count(H.UID) as ''CountNacl::SMALLINT'', ' +
                                          '      (SELECT COUNT (H1.UID) ' +
                                          '       FROM OrdersHeader H1 ' +
                                          '       WHERE H1.Status = 3 AND ' +
                                          '             H1.UID = H.UID) as ''CountBuild::SMALLINT'' ' +
                                          'FROM OrdersHeader H ';


      SSQLUpdateStatusOrdersHeader      = 'UPDATE OrdersHeader ' +                                        //------*******************-----//
                                          'SET Status = %d, ' +                                           //-----���������� �������-------//
                                          '    Date_Device = datetime(''now'',''localtime'') ' +          //--��������� � ��������� ����--//
                                          'WHERE FolioUID = ''%s''';                                      //------*******************-----//



      SSQLUpdateStatusOrdersMove   = 'UPDATE OrdersMove ' +                                               //-----*****************-----//
                                     'SET Status = %d, ' +                                                //-----���������� �������----//
                                     '    DATE_Device = datetime(''now'',''localtime'') ' +               //--������ � ���� ������� ---//
                                     'WHERE FolioUID = %s AND ' +                                         //-----� ��������� ���� -----//
                                           'Article = ''%s''';                                            //-----*****************-----//


      SSQLDeleteOrdersMoveLocal         = 'DELETE FROM OrdersMove ' +                                          //----- �������� ������� ��� ----//     -- ����� �� ������������
                                     'WHERE FolioUID = %d';                                               //----������������� ��������� ---//

      SSQLClearOrdersMoveLocal          = 'DELETE FROM OrdersMove';                                       //---- ������� ������� ������ ������� -- //

      SSQLClearOrdersHeadLocal          = 'DELETE FROM OrdersHeader';                                     //---- ������� ������ ���������� � ��������� ��

      SSQLSetDefaultStatusHeadOrders = 'UPDATE OrdersHeader ' +                                           //--- ��������� ���������� ������� ��� ---//
                                       '  SET Status = 0 ' +                                              //---      ������������� ��������      ---//
                                       'WHERE FolioUID = %s';                                             //-----******************************-----//

      SSQLSetDefaultStatusOrdersMove = 'UPDATE OrdersMove ' +                                             //--- ��������� ��������� �������� ������� ---//
                                       '  SET Status = 0  ' +                                             //---   ��� ������� ������������ ��������� ---//
                                       'WHERE FolioUID = %s';                                             //-----**********************************-----//

      SSQLAddOrdersHeader = 'INSERT INTO OrdersHeader(UID, ' +                                                //-----*********-----//
                                                'JournalNo, ' +                                               //-----*********-----//
                                                'OrderUID, ' +                                                //-----*********-----//
                                                'FolioUID, ' +                                                //-----*********-----//
                                                'OrderNo, ' +                                                 //-----*********-----//
                                                'OrderDate, ' +                                               //-----*********-----//
                                                'Status, ' +                                                  //-���������� ���������-//
                                                'BRIEFORG, ' +                                                //--� ��������� ����-//
                                                'ORGANIZNKL, ' +                                              //-----*********-----//
                                                'L_CP1_PLAT, ' +                                              //-----*********-----//
                                                'L_CP2_PLAT, ' +                                              //-----*********-----//
                                                'VID_DOC, ' +                                                 //-----*********-----//
                                                'SUM_ROZN, ' +                                                //-----*********-----//
                                                'SUM_POR, ' +                                                 //-----*********-----//
                                                'StrikeCode, ' +                                              //-----*********-----//
                                                'NAMEP_USER, ' +                                              //-----*********-----//
                                                'ADRES_USER, ' +                                              //-----*********-----//
                                                'ProjectName, ' +
                                                'Date_Device) ' +                                             //-----*********-----//
                            'VALUES (%d, %d, %d, %d, %d, ''%s'', %d, ''%s'', ''%s'', ''%s'', ''%s'', ''%s'', ''%s'', ''%s'', %d, ''%s'', ''%s'', ''%s'', ''%s'')';

      SSQLAddOrdersMove    = 'INSERT INTO OrdersMove(FolioUID, ' +                                                  //-----*********-----//
                                                   'Article, ' +                                                    //-----*********-----//
                                                   'StrikeCode, ' +                                                 //-----*********-----//
                                                   'ProductName, ' +                                                //-----*********-----//
                                                   'EDIN_IZMER, ' +                                                 //-----*********-----//
                                                   'Packages, ' +                                                   //���������� �����������//
                                                   'EDN_V_UPAK, ' +                                                 //-----���������-----//
                                                   'Qty, ' +                                                        //-----*********-----//
                                                   'Price, ' +                                                      //-----*********-----//
                                                   'Sum_Predm, ' +                                                  //-----*********-----//
                                                   'KON_KOLCH, ' +
                                                   'STATUS) ' +
                            'VALUES (%d, ''%s'', ''%s'', ''%s'', ''%s'', ''%s'', ''%s'', ''%s'', ''%s'', ''%s'', ''%s'', %d)';  //-----*********-----//







                                             /// ----- ������ � ��������� �������� ---- ///

    SSQLGetUsers   = 'EXEC DELIVERY..S_GetAuditEmployees %d';                                             // ��������� ������ �������������
    SSQLGetReestrs = 'EXEC DELIVERY..S_GetReestrs';                                                       // ��������� ������ ��������
    SSQLGetCollectorsOrdersBuild = 'EXEC STOREHOUSE..O_GetCollectorsOrdersBuild';                         // ��������� ������ ���������
    SSQLGetJournalOrders         = 'EXEC DELIVERY..A_GetJournalOrders ''%s'', ''%s'', ''%s''';            // ������ ���������
    SSQLGetPrintOrderDetails     = 'EXEC DELIVERY..A_GetPrintOrderDetails %d';                            // ����������� ���������
    SSQLGetProcessedDocs         = 'EXEC DELIVeRY..S_GetProcessedDocs ''%s'', ''%s''';                    // �������� ������ ������������ ����������



    SSQLInsProcessedDoc = 'EXEC DELIVERY..S_InsProcessedDoc ''%s'', ''%s'', ''%s'', %d, ''%s'', %d, ''%s'', %d';
    SSQLLoadNaclAudit                 = 'EXEC DELIVERY..S_LoadNaclAudit %d, %d, ''%s'', %d, %d, ''%s''';                   // --Headers-- //
    SSQLLoadMoveAudit                 = 'EXEC DELIVERY..S_LoadMoveAudit %d, %d, ''%s'', ''%s'', ''%s'', %d, %d, ''%s''';   // ---Moves---//

implementation

end.
