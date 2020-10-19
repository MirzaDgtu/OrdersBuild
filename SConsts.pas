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

                                      // ѕараметры соединени€ с удаленный сервером

      SSQLGetConnectSetting   = 'SELECT  ID, ' +                              //-----************************-----//
                                        'ServerName, ' +                      //-----************************-----//
                                        'UserLogin, ' +                       //-----************************-----//
                                        'UserPassword, ' +                    // ѕолучение настроек дл€ подключени€
                                        'InitialCatalog, ' +                  // к удаленному серверу из SqlLite базы
                                        'Port  ' +                            //-----************************-----//
                                 'FROM TableSetting ' +                       //-----************************-----//
                                 'ORDER BY ID DESC ' +                        //-----************************-----//
                                  'LIMIT 1';                                  //-----************************-----//


      SSQLAddConnectionSetting = 'INSERT INTO TableSetting(ServerName, ' +                                    //-----**********-----//
                                                          'InitialCatalog, ' +                                //--ƒобавление новых--//
                                                          'UserLogin, ' +                                     //-параметров соедини€//
                                                          'UserPassword, '  +                                 //-----**********-----//
                                                          'Port) ' +                                          //-----**********-----//
                                 'VALUES                  (''%s'', ''%s'', ''%s'', ''%s'', %d)';              //-----**********-----//



                                                                // —писок реестров

      SSQLGetReestrs             = 'EXEC DELIVERY..S_GetReestrs';               // ѕолучение списка реестров с удаленного сервера

      SSQLGetReestrsLocal        = 'SELECT R.UID, ' +                             // ѕолучение списка реестров с локальной базы
                                          'R.ProjectName, ' +
                                          'I.Screen ' +
                                   'FROM Reestrs R ' +
                                   ' LEFT JOIN Icons I ON I.UID = 12';

      SSQLAddReestrs             = 'INSERT INTO Reestrs(UID, ' +                // ƒобавление списка реестров в локальную базу
                                                       'ProjectName) ' +
                                   'VALUES             (%d, ''%s'')';

      SSQLDeleteReestrs          = 'DELETE FROM Reestrs';                       // ќчистка списка реестров в локальной базы

implementation

end.
