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

      SSQLGetReestrsLocal        = 'SELECT R.UID, ' +                             // ��������� ������ �������� � ��������� ����
                                          'R.ProjectName, ' +
                                          'I.Screen ' +
                                   'FROM Reestrs R ' +
                                   ' LEFT JOIN Icons I ON I.UID = 12';

      SSQLAddReestrs             = 'INSERT INTO Reestrs(UID, ' +                // ���������� ������ �������� � ��������� ����
                                                       'ProjectName) ' +
                                   'VALUES             (%d, ''%s'')';

      SSQLDeleteReestrs          = 'DELETE FROM Reestrs';                       // ������� ������ �������� � ��������� ����

implementation

end.
