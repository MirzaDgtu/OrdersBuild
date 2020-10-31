unit SConsts;

interface

resourcestring

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

      SSQLGetReestrs             = 'EXEC DELIVERY..S_GetReestrs';                                         // ��������� ������ �������� � ���������� �������

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

      SSQLAddCollectorOrder = 'INSERT INTO ProcessedDoc (FolioUID, ' +                                    //-----************-----//
                                                        'OrderDate, ' +                                   //-----************-----//
                                                        'Keeper,    ' +                                   //-----************-----//
                                                        'KeeperUID, ' +                                   //---���������� ��������� ���������
                                                        'Collector, ' +                                   //-----� ������� ProcessedDoc-----//
                                                        'CollectorUID, ' +                                //-----************-----//
                                                        'OrderBuildDate) ' +                              //-----************-----//
                              'VALUES 	(''%s'', ''%s'', ''%s'', %d, ''%s'', %d, ''%s'')';                //-----************-----//


      SSQLGetCollectorOrders = 'SELECT 	UID, ' +                                                          //-----************-----//
                                       'FolioUID, ' +                                                     //-----************-----//
                                       'OrderDate, ' +                                                    //-----************-----//
                                       'Keeper, ' +                                                       //-----************-----//
                                       'KeeperUID, ' +                                                    //-----************-----//
                                       'Collector, ' +                                                    //-----************-----//
                                       'CollectorUID, ' +                                                 //---��������� ������ ��������� ���������---//
                                       'OrderBuildDate, ' +                                               //---��������� ���������---//
                                       'I.Screen ' +                                                      //-----************-----//
                                    'FROM ProcessedDoc ' +                                                //-----************-----//
                                    ' LEFT JOIN Icons I ON I.UID = 7 ' +                                  //-----************-----//
                                    'WHERE CollectorUID = %d  ' +                                         //-----************-----//
                                    'ORDER BY UID';                                                       //-----************-----//


    SSQLGetCollectCountOrders = 'SELECT DISTINCT CollectorUID, ' +                                        //-----************-----//
                                               ' Collector, ' +                                           //-----************-----//
                                               ' COUNT(FolioUID)as "DocKol::INT", ' +                     //-----************-----//
                                               ' I.Screen ' +                                             //---��������� ������ ���������
                                'FROM ProcessedDoc ' +                                                    //---� ���������� ��������� ������
                                '  LEFT JOIN Icons I ON I.UID = 22 ' +                                    //-----************-----//
                                'WHERE OrderDate BETWEEN ''%s'' and ''%s'' ' +                            //-----************-----//
                                'GROUP BY Keeper, ' +                                                     //-----************-----//
                                         'KeeperUID, ' +                                                  //-----************-----//
                                         'I.Screen ';                                                     //-----************-----//

    SSQLClearCollectOrders = 'DELETE FROM ProcessedDoc';                                                  // ������� ���� ������� �� ��������� ���������

    SSQLDeleteCollectOrder = 'DELETE FROM ProcessedDoc ' +
                             'WHERE UID = %d';                                                            // �������� ������������� ��������� �� ���������


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
                                              'ifnull(PD.CollectorUID, 0) as "CollectorUID::SMALLINT", ' +           //-----*******************-----//
                                              'PD.Collector, ' +                                          //-----*******************-----//
                                              'ifNull(PD.KeeperUID, 0) as "KeeperUID::SMALLINT", ' +                  //-----*******************-----//
                                              'PD.Keeper ' +                                             //-----*******************-----//
                                     'FROM OrdersHeader H ' +                                             //-----*******************-----//
                                     'LEFT JOIN ProcessedDoc PD ON PD.FolioUID = H.FolioUID ' +           //-----*******************-----//
                                     'LEFT JOIN Icons I on I.UID = 7';                                    //-----*******************-----//


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


      SSQLGetCountOrdersHeader          = 'SELECT count(UID) as ''CountNacl::SMALLINT'', ' +              //----******************************--//
                                                 '(SELECT COUNT(Status) ' +                               //----��������� ���������� ���������--//
                                                 'FROM OrdersHeader ' +                                   //-------� ���������  ���������-------//
                                                 'WHERE Status = 2) as ''CountBuild::SMALLINT'' ' +       //----******************************--//
                                          'FROM OrdersHeader';                                            //----******************************--//


      SSQLUpdateStatusOrdersHeader      = 'UPDATE OrdersHeader ' +                                        //------*******************-----//
                                          'SET Status = %d, ' +                                           //-----���������� �������-------//
                                          '    Date_Device = datetime(''now'',''localtime'') ' +          //--��������� � ��������� ����--//
                                          'WHERE FolioUID = ''%s''';                                      //------*******************-----//



      SSQLUpdateStatusOrdersMove   = 'UPDATE OrdersMove ' +                                               //-----*****************-----//
                                     'SET Status = %d, ' +                                                //-----���������� �������----//
                                     '    DATE_Device = datetime(''now'',''localtime'') ' +               //--������ � ���� ������� ---//
                                     'WHERE FolioUID = %d AND ' +                                         //-----� ��������� ���� -----//
                                           'Article = ''%s''';                                            //-----*****************-----//


      SSQLDeleteOrdersMove         = 'DELETE FROM OrdersMove ' +                                          //----- �������� ������� ��� ----//
                                     'WHERE FolioUID = %d';                                               //----������������� ��������� ---//

      SSQLClearOrdersMove          = 'DELETE FROM OrdersMove';                                            //---- ������� ������� ������ ������� -- //

      SSQLInsProcessedDoc          = 'INSERT INTO ProcessedDoc (FolioUID, ' +                            //-----**************************-----//
                                                               'OrderDatePD, ' +                         //-----**************************-----//
                                                               'Keeper, ' +                              //-----**************************-----//
                                                               'KeeperUID, ' +                           //--- ���������� ���������� ���������-//
                                                               'Collector, ' +                           //---    � ������� ProcessedDoc    ---//
                                                               'CollectorUID, ' +                        //-----**************************-----//
                                                               'OrderBuildDate) ' +                      //-----**************************-----//
                                     'VALUES (''%s'', ''%s'', ''%s'', %d, ''%s'', %d. ''%s'') ';         //-----**************************-----//




implementation

end.
