unit SConsts;

interface

resourcestring

  // –абота с локальной таблицой USERS

      SSQLClearUsersLocal              = 'DELETE FROM Users';                    // ќчистка списка пользователей

      SSQLAddUsersLocal                = 'INSERT INTO Users (ID, ' +             //-----************************-----//
                                                             'UserLogin, ' +     // «апись пользовател€ в таблицу Users
                                                             'UserName)  ' +     //-----************************-----//
                                         'VALUES (%d, ''%s'', ''%s'')';          //-----************************-----//

      SSQLGetUsersLocal   = 'SELECT ID, ' +
                                   'UserLogin, ' +                          //-----************************-----//
            	                     'UserName,    ' +                        //--ѕолучение списка пользователей--//
                                   'LastUser, ' +                           //----из локальной таблицы Users----//
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
                                'SET LastUser = %d ' +                      // ќбновление статуса последнего пользовател€
                                'WHERE ID = %d';                            //-----************************-----//

      SSQLGetLastUserLocal = 'SELECT ID, ' +
                                    'UserLogin, ' +                          //-----************************-----//
            	                      'UserName,    ' +                        //--ѕолучение последнего пользовател€--//
                                    'LastUser ' +                            //----из локальной таблицы Users----//
                            'FROM Users ' +                                  //----который выбиралс€ дл€ входа в программу
                            ' WHERE LastUser = 1 ' +                         //-----************************-----//
                            'Order BY UserName';                             //-----************************-----//




implementation

end.
