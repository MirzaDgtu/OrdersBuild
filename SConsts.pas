unit SConsts;

interface

resourcestring

                                    // ������ � ��������� �������� USERS

      SSQLClearUsersLocal              = 'DELETE FROM Users';                    // ������� ������ �������������

      SSQLAddUsersLocal                = 'INSERT INTO Users (ID, ' +             //-----************************-----//
                                                             'UserLogin, ' +     // ������ ������������ � ������� Users
                                                             'UserName)  ' +     //-----************************-----//
                                         'VALUES (%d, ''%s'', ''%s'')';          //-----************************-----//

      SSQLGetUsersLocal   = 'SELECT ID, ' +
                                   'UserLogin, ' +                          //-----************************-----//
            	                     'UserName,    ' +                        //--��������� ������ �������������--//
                                   'LastUser, ' +                           //----�� ��������� ������� Users----//
                                   'I.Screen, ' +                            //-----************************-----//
                                   ' (SELECT II.SCREEN ' +
                                   '  FROM USERS UU ' +
                                   '  WHERE UU.LastUser = 1 ' +
                                   '	      AND UU.ID = U.ID) AS "LastUserScreen" ' +
                            'FROM Users U ' +                                 //-----************************-----//
                            ' LEFT JOIN Icons I ON I.UID = 2 ' +            //-----************************-----//
                            ' LEFT JOIN Icons II ON II.UID = 13 '+
                            'Order BY UserName';                            //-----************************-----//

      SSQLUpdateLastUserLocal = 'UPDATE Users ' +                           //-----************************-----//
                                'SET LastUser = %d ' +                      // ���������� ������� ���������� ������������
                                'WHERE ID = %d';                            //-----************************-----//

      SSQLGetLastUserLocal = 'SELECT ID, ' +
                                    'UserLogin, ' +                          //-----************************-----//
            	                      'UserName,    ' +                        //--��������� ���������� ������������--//
                                    'LastUser ' +                            //----�� ��������� ������� Users----//
                            'FROM Users ' +                                  //----������� ��������� ��� ����� � ���������
                            ' WHERE LastUser = 1 ' +                         //-----************************-----//
                            'Order BY UserName';                             //-----************************-----//

                                      // ��������� ���������� � ��������� ��������

      SSQLGetConnectSetting   = 'SELECT  ID, ' +                              //-----************************-----//
                                        'ServerName, ' +                      //-----************************-----//
                                        'UserLogin, ' +                       //-----************************-----//
                                        'UserPassword, ' +                    // ��������� �������� ��� �����������
                                        'InitialCatalog, ' +                  // � ���������� ������� �� SqlLite ����
                                        'Port  ' +                            //-----************************-----//
                                 'FROM TableSetting ' +                       //-----************************-----//
                                 'ORDER BY ID DESC ' +                        //-----************************-----//
                                  'LIMIT 1';                                  //-----************************-----//


      SSQLAddConnectionSetting = 'INSERT INTO TableSetting(ServerName, ' +                                    //-----**********-----//
                                                          'InitialCatalog, ' +                                //--���������� �����--//
                                                          'UserLogin, ' +                                     //-���������� ��������//
                                                          'UserPassword, '  +                                 //-----**********-----//
                                                          'Port) ' +                                          //-----**********-----//
                                 'VALUES                  (''%s'', ''%s'', ''%s'', ''%s'', %d)';              //-----**********-----//



                                                                // ������ ��������

      SSQLGetReestrs             = 'EXEC DELIVERY..S_GetReestrs';               // ��������� ������ �������� � ���������� �������

      SSQLGetReestrsLocal        = 'SELECT R.UID, ' +                                       //-----**********-----//
                                          'R.ProjectName as "ProjectName::VARCHAR(50)", ' + //-----**********-----//
                                          'I.Screen ' +                                     // ��������� ������ �������� � ��������� ����
                                   'FROM Reestrs R ' +                                      //-----**********-----//
                                   ' LEFT JOIN Icons I ON I.UID = 12';                      //-----**********-----//

      SSQLAddReestrs             = 'INSERT INTO Reestrs(UID, ' +                //-----**********************************-----//
                                                       'ProjectName) ' +        // ���������� ������ �������� � ��������� ����
                                   'VALUES             (%d, ''%s'')';           //-----**********************************-----//

      SSQLDeleteReestrs          = 'DELETE FROM Reestrs';                       // ������� ������ �������� � ��������� ����



                 // ��������� ������������ �� ��������� ����
      SSQLGetBrieforgLocal        = 'SELECT DISTINCT BRIEFORG, ' +                                             //-----*********-----//
                                    '                I.Screen  ' +                                             //-----*********-----//
                                    'FROM OrdersHeader ' +                                                     //--������ ��������--//
                                    ' LEFT JOIN Icons I ON I.UID = 14 ' +                                      //--����� ��������---//
                                    'WHERE BRIEFORG IS NOT NULL AND ' +                                        //-----*********-----//
                                           'BRIEFORG != ''''';                                                 //-----*********-----//

      SSQLGetDriversLocal        = 'SELECT DISTINCT L_CP2_PLAT, ' +                                            //-----*********-----//
                                   '                I.Screen   ' +                                             //-----*********-----//
                                   'FROM OrdersHeader ' +                                                      //-----*********-----//
                                   ' LEFT JOIN Icons I ON I.UID = 20 ' +                                       //-������  ���������-//
                                   'WHERE L_CP2_PLAT IS NOT NULL AND ' +                                       //-----*********-----//
                                         'L_CP2_PLAT != ''''';                                                 //-----*********-----//

      SSQLGetAgentsLocal         = 'SELECT DISTINCT L_CP1_PLAT, ' +                                            //-----*********-----//
                                   '                I.Screen   ' +                                             //-----*********-----//
                                   'FROM OrdersHeader ' +                                                      //--������  �������--//
                                   ' LEFT JOIN Icons I ON I.UID = 16 '  +                                      //-----*********-----//
                                   'WHERE L_CP1_PLAT IS NOT NULL AND ' +                                       //-----*********-----//
                                         'L_CP1_PLAT != ''''';                                                 //-----*********-----//

      SSQLGetVidDocLocal       = 'SELECT DISTINCT VID_DOC, ' +                                                 //-----*********-----//
                                   '                I.Screen ' +                                               //-----*********-----//
                                   'FROM OrdersHeader ' +                                                      //---������ �����----//
                                   ' LEFT JOIN Icons I ON I.UID = 18 ' +                                       //-----��������------//
                                   'WHERE VID_DOC IS NOT NULL AND ' +                                          //-----*********-----//
                                         'VID_DOC != ''''';                                                    //-----*********-----//


              //   ������������ ���������

      SSQLAddCollectorOrder = 'INSERT INTO ProcessedDoc (FolioUID, ' +                                          //-----************-----//
                                                        'OrderDate, ' +                                         //-----************-----//
                                                        'Keeper,    ' +                                         //---���������� ��������� ���������
                                                        'KeeperUID, ' +                                         //-----� ������� ProcessedDoc-----//
                                                        'Collector, ' +                                         //-----************-----//
                                                        'CollectorUID, ' +                                      //-----************-----//
                                                        'OrderBuildDate) ' +                                    //-----************-----//
                              'VALUES 	(''%s'', ''%s'', ''%s'', %d, ''%s'', %d, ''%s'')';                      //-----************-----//


      SSQLGetCollectorOrders = 'SELECT 	UID, ' +                                                                //-----************-----//
                                       'FolioUID, ' +                                                           //-----************-----//
                                       'OrderDate, ' +                                                          //-----************-----//
                                       'Keeper, ' +                                                             //---��������� ������ ��������� ���������---//
                                       'KeeperUID, ' +                                                          //---��������� ���������---//
                                       'Collector, ' +                                                          //-----************-----//
                                       'CollectorUID, ' +                                                       //-----************-----//
                                       'OrderBuildDate, ' +                                                     //-----************-----//
                                       'I.Screen ' +                                                            //-----************-----//
                                    'FROM ProcessedDoc ' +                                                      //-----************-----//
                                    ' LEFT JOIN Icons I ON I.UID = 7 ' +                                        //-----************-----//
                                    'WHERE CollectorUID = %d  ' +                                               //-----************-----//
                                    'ORDER BY UID';                                                             //-----************-----//


    SSQLGetCollectCountOrders = 'SELECT DISTINCT CollectorUID, ' +                                              //-----************-----//
                                               ' Collector, ' +                                                 //-----************-----//
                                               ' COUNT(FolioUID)as "DocKol::INT", ' +                           //-----************-----//
                                               ' I.Screen ' +                                                   //---��������� ������ ���������
                                'FROM ProcessedDoc ' +                                                          //---� ���������� ��������� ������
                                '  LEFT JOIN Icons I ON I.UID = 22 ' +                                          //-----************-----//
                                'WHERE OrderDate BETWEEN ''%s'' and ''%s'' ' +                                  //-----************-----//
                                'GROUP BY Keeper, ' +                                                           //-----************-----//
                                         'KeeperUID, ' +                                                        //-----************-----//
                                         'I.Screen ';                                                           //-----************-----//

    SSQLClearCollectOrders = 'DELETE FROM ProcessedDoc';                                                        // ������� ���� ������� �� ��������� ���������

    SSQLDeleteCollectOrder = 'DELETE FROM ProcessedDoc ' +
                             'WHERE UID = %d';                                                                  // �������� ������������� ��������� �� ���������





implementation

end.
