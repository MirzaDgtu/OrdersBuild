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
                                'SET LastUser = %d ' +                      // Обновление статуса последнего пользователя
                                'WHERE ID = %d';                            //-----************************-----//

      SSQLGetLastUserLocal = 'SELECT ID, ' +
                                    'UserLogin, ' +                          //-----************************-----//
            	                      'UserName,    ' +                        //--Получение последнего пользователя--//
                                    'LastUser ' +                            //----из локальной таблицы Users----//
                            'FROM Users ' +                                  //----который выбирался для входа в программу
                            ' WHERE LastUser = 1 ' +                         //-----************************-----//
                            'Order BY UserName';                             //-----************************-----//

                                      // Параметры соединения с удаленный сервером

      SSQLGetConnectSetting   = 'SELECT  ID, ' +                              //-----************************-----//
                                        'ServerName, ' +                      //-----************************-----//
                                        'UserLogin, ' +                       //-----************************-----//
                                        'UserPassword, ' +                    // Получение настроек для подключения
                                        'InitialCatalog, ' +                  // к удаленному серверу из SqlLite базы
                                        'Port  ' +                            //-----************************-----//
                                 'FROM TableSetting ' +                       //-----************************-----//
                                 'ORDER BY ID DESC ' +                        //-----************************-----//
                                  'LIMIT 1';                                  //-----************************-----//


      SSQLAddConnectionSetting = 'INSERT INTO TableSetting(ServerName, ' +                                    //-----**********-----//
                                                          'InitialCatalog, ' +                                //--Добавление новых--//
                                                          'UserLogin, ' +                                     //-параметров соединия//
                                                          'UserPassword, '  +                                 //-----**********-----//
                                                          'Port) ' +                                          //-----**********-----//
                                 'VALUES                  (''%s'', ''%s'', ''%s'', ''%s'', %d)';              //-----**********-----//



                                                                // Список реестров

      SSQLGetReestrs             = 'EXEC DELIVERY..S_GetReestrs';               // Получение списка реестров с удаленного сервера

      SSQLGetReestrsLocal        = 'SELECT R.UID, ' +                                       //-----**********-----//
                                          'R.ProjectName as "ProjectName::VARCHAR(50)", ' + //-----**********-----//
                                          'I.Screen ' +                                     // Получение списка реестров с локальной базы
                                   'FROM Reestrs R ' +                                      //-----**********-----//
                                   ' LEFT JOIN Icons I ON I.UID = 12';                      //-----**********-----//

      SSQLAddReestrs             = 'INSERT INTO Reestrs(UID, ' +                //-----**********************************-----//
                                                       'ProjectName) ' +        // Добавление списка реестров в локальную базу
                                   'VALUES             (%d, ''%s'')';           //-----**********************************-----//

      SSQLDeleteReestrs          = 'DELETE FROM Reestrs';                       // Очистка списка реестров в локальной базы



                 // Получение справочников из локальной базы
      SSQLGetBrieforgLocal        = 'SELECT DISTINCT BRIEFORG, ' +                                             //-----*********-----//
                                    '                I.Screen  ' +                                             //-----*********-----//
                                    'FROM OrdersHeader ' +                                                     //--Список коротких--//
                                    ' LEFT JOIN Icons I ON I.UID = 14 ' +                                      //--кодов клиентов---//
                                    'WHERE BRIEFORG IS NOT NULL AND ' +                                        //-----*********-----//
                                           'BRIEFORG != ''''';                                                 //-----*********-----//

      SSQLGetDriversLocal        = 'SELECT DISTINCT L_CP2_PLAT, ' +                                            //-----*********-----//
                                   '                I.Screen   ' +                                             //-----*********-----//
                                   'FROM OrdersHeader ' +                                                      //-----*********-----//
                                   ' LEFT JOIN Icons I ON I.UID = 20 ' +                                       //-Список  водителей-//
                                   'WHERE L_CP2_PLAT IS NOT NULL AND ' +                                       //-----*********-----//
                                         'L_CP2_PLAT != ''''';                                                 //-----*********-----//

      SSQLGetAgentsLocal         = 'SELECT DISTINCT L_CP1_PLAT, ' +                                            //-----*********-----//
                                   '                I.Screen   ' +                                             //-----*********-----//
                                   'FROM OrdersHeader ' +                                                      //--Список  агентов--//
                                   ' LEFT JOIN Icons I ON I.UID = 16 '  +                                      //-----*********-----//
                                   'WHERE L_CP1_PLAT IS NOT NULL AND ' +                                       //-----*********-----//
                                         'L_CP1_PLAT != ''''';                                                 //-----*********-----//

      SSQLGetVidDocLocal       = 'SELECT DISTINCT VID_DOC, ' +                                                 //-----*********-----//
                                   '                I.Screen ' +                                               //-----*********-----//
                                   'FROM OrdersHeader ' +                                                      //---Список типов----//
                                   ' LEFT JOIN Icons I ON I.UID = 18 ' +                                       //-----операции------//
                                   'WHERE VID_DOC IS NOT NULL AND ' +                                          //-----*********-----//
                                         'VID_DOC != ''''';                                                    //-----*********-----//


implementation

end.
