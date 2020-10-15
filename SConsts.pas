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
                                   'I.Screen ' +                            //-----************************-----//
                            'FROM Users ' +                                 //-----************************-----//
                            ' LEFT JOIN Icons I ON I.UID = 2 ' +            //-----************************-----//
                            'Order BY UserName';                            //-----************************-----//

      SSQLUpdateLastUserLocal = 'UPDATE Users ' +                           //-----************************-----//
                                'SET LastUser = %d ' +                      // ���������� ������� ���������� ������������
                                'WHERE ID = %d';                            //-----************************-----//

      SSQLGetLastUserLocal = 'SELECT ID, ' +
                                    'UserLogin, ' +                          //-----************************-----//
            	                      'UserName,    ' +                        //--��������� ���������� ������������--//
                                    'LastUser ' +                            //----�� ��������� ������� Users----//
                            'FROM Users ' +                                  //----������� ��������� ��� ����� � ���������
                            ' WHERE Las�User = 1 ' +                         //-----************************-----//
                            'Order BY UserName';                             //-----************************-----//




implementation

end.
