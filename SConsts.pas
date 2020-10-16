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




implementation

end.
