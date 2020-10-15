unit SConsts;

interface

resourcestring

  // Работа с локальной таблицой USERS

      SSQLClearUsersLocal              = 'DELETE FROM Users';                    // Очистка списка пользователей

      SSQLAddUsersLocal                = 'INSERT INTO Users (ID, ' +             //-----************************-----//
                                                             'UserLogin, ' +     // Запись пользователя в таблицу Users
                                                             'UserName)  ' +     //-----************************-----//
                                         'VALUES (%d, ''%s'', ''%s'')';          //-----************************-----//

      SSQLGetUsersLocal   = 'SELECT ID, ' +
                                   'UserLogin, ' +                          //-----************************-----//
            	                     'UserName,    ' +                        //--Получение списка пользователей--//
                                   'LastUser, ' +                           //----из локальной таблицы Users----//
                                   'I.Screen ' +                            //-----************************-----//
                            'FROM Users ' +                                 //-----************************-----//
                            ' LEFT JOIN Icons I ON I.UID = 2 ' +            //-----************************-----//
                            'Order BY UserName';                            //-----************************-----//

      SSQLUpdateLastUserLocal = 'UPDATE Users ' +                           //-----************************-----//
                                'SET LastUser = %d ' +                      // Обновление статуса последнего пользователя
                                'WHERE ID = %d';                            //-----************************-----//

      SSQLGetLastUserLocal = 'SELECT ID, ' +
                                    'UserLogin, ' +                          //-----************************-----//
            	                      'UserName,    ' +                        //--Получение последнего пользователя--//
                                    'LastUser ' +                            //----из локальной таблицы Users----//
                            'FROM Users ' +                                  //----который выбирался для входа в программу
                            ' WHERE LasеUser = 1 ' +                         //-----************************-----//
                            'Order BY UserName';                             //-----************************-----//




implementation

end.
