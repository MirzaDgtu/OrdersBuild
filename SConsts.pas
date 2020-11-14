unit SConsts;

interface

resourcestring

                            /// --- Работа с локальной БАЗОЙ ДАННЫХ --- ///

                                    // Работа с локальной таблицой USERS

      SSQLClearUsersLocal              = 'DELETE FROM Users';               // Очистка списка пользователей

      SSQLAddUsersLocal                = 'INSERT INTO Users (ID, ' +        //-----************************-----//
                                                             'UserLogin, ' +// Запись пользователя в таблицу Users
                                                             'UserName)  ' +//-----************************-----//
                                         'VALUES (%d, ''%s'', ''%s'')';     //-----************************-----//

      SSQLGetUsersLocal   = 'SELECT ID, ' +
                                   'UserLogin, ' +                          //-----************************-----//
            	                     'UserName,    ' +                        //--Получение списка пользователей--//
                                   'LastUser, ' +                           //----из локальной таблицы Users----//
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
                                'SET LastUser = %d ' +                      // Обновление статуса последнего пользователя
                                'WHERE ID = %d';                            //-----************************-----//

      SSQLGetLastUserLocal = 'SELECT ID, ' +
                                    'UserLogin, ' +                         //-----************************-----//
            	                      'UserName,    ' +                       //--Получение последнего пользователя--//
                                    'LastUser ' +                           //----из локальной таблицы Users----//
                            'FROM Users ' +                                 //----который выбирался для входа в программу
                            ' WHERE LastUser = 1 ' +                        //-----************************-----//
                            'Order BY UserName';                            //-----************************-----//


                                    // Сборщики

      SSQLGetCollectors = 	'SELECT C.UID, ' +                              //----****************----//
                                   'C.Name, ' +                             //--- Получение списка ---//
                                   'I.Screen ' +                            //------- сборщиков ------//
                            'FROM Collectors C ' +                          //----****************----//
                                'LEFT JOIN Icons I ON I.UID = 22';          //----****************----//

      SSQLDeleteCollectors  = 'DELETE FROM Collectors';                     //--- Удаление списка сборщиков

      SSQLAddCollectorLocal = 'INSERT INTO Collectors(UID, ' +              // Добавление сборщика в
                                                     'NAME) ' +             // локальную базу данных
                              'VALUES (%d, ''%s'')';                        // -- *******************--//
                                    // Параметры соединения с удаленный сервером

      SSQLGetConnectSetting   = 'SELECT  ID, ' +                             //-----************************-----//
                                        'ServerName, ' +                     //-----************************-----//
                                        'UserLogin, ' +                      //-----************************-----//
                                        'UserPassword, ' +                   // Получение настроек для подключения
                                        'InitialCatalog, ' +                 // к удаленному серверу из SqlLite базы
                                        'Port  ' +                           //-----************************-----//
                                 'FROM TableSetting ' +                      //-----************************-----//
                                 'ORDER BY ID DESC ' +                       //-----************************-----//
                                  'LIMIT 1';                                 //-----************************-----//


      SSQLAddConnectionSetting = 'INSERT INTO TableSetting(ServerName, ' +                                //-----**********-----//
                                                          'InitialCatalog, ' +                            //--Добавление новых--//
                                                          'UserLogin, ' +                                 //-параметров соединия//
                                                          'UserPassword, '  +                             //-----**********-----//
                                                          'Port) ' +                                      //-----**********-----//
                                 'VALUES                  (''%s'', ''%s'', ''%s'', ''%s'', %d)';          //-----**********-----//



                                                                // Список реестров

           SSQLGetReestrsLocal        = 'SELECT R.UID, ' +                                                     //-----**********-----//
                                          'R.ProjectName as "ProjectName::VARCHAR(50)", ' +               //-----**********-----//
                                          'I.Screen ' +                                                   // Получение списка реестров с локальной базы
                                   'FROM Reestrs R ' +                                                    //-----**********-----//
                                   ' LEFT JOIN Icons I ON I.UID = 12';                                    //-----**********-----//

      SSQLAddReestrs             = 'INSERT INTO Reestrs(UID, ' +                                          //-----**********************************-----//
                                                       'ProjectName) ' +                                  // Добавление списка реестров в локальную базу
                                   'VALUES             (%d, ''%s'')';                                     //-----**********************************-----//

      SSQLDeleteReestrs          = 'DELETE FROM Reestrs';                                                 // Очистка списка реестров в локальной базы


                                                              // Получение справочников из локальной базы
      SSQLGetBrieforgLocal        = 'SELECT DISTINCT BRIEFORG, ' +                                        //-----*********-----//
                                    '                I.Screen  ' +                                        //-----*********-----//
                                    'FROM OrdersHeader ' +                                                //--Список коротких--//
                                    ' LEFT JOIN Icons I ON I.UID = 14 ' +                                 //--кодов клиентов---//
                                    'WHERE BRIEFORG IS NOT NULL AND ' +                                   //-----*********-----//
                                           'BRIEFORG != ''''';                                            //-----*********-----//

      SSQLGetDriversLocal        = 'SELECT DISTINCT L_CP2_PLAT, ' +                                       //-----*********-----//
                                   '                I.Screen   ' +                                        //-----*********-----//
                                   'FROM OrdersHeader ' +                                                 //-----*********-----//
                                   ' LEFT JOIN Icons I ON I.UID = 20 ' +                                  //-Список  водителей-//
                                   'WHERE L_CP2_PLAT IS NOT NULL AND ' +                                  //-----*********-----//
                                         'L_CP2_PLAT != ''''';                                            //-----*********-----//

      SSQLGetAgentsLocal         = 'SELECT DISTINCT L_CP1_PLAT, ' +                                       //-----*********-----//
                                   '                I.Screen   ' +                                        //-----*********-----//
                                   'FROM OrdersHeader ' +                                                 //--Список  агентов--//
                                   ' LEFT JOIN Icons I ON I.UID = 16 '  +                                 //-----*********-----//
                                   'WHERE L_CP1_PLAT IS NOT NULL AND ' +                                  //-----*********-----//
                                         'L_CP1_PLAT != ''''';                                            //-----*********-----//

      SSQLGetVidDocLocal       = 'SELECT DISTINCT VID_DOC, ' +                                            //-----*********-----//
                                   '                I.Screen ' +                                          //-----*********-----//
                                   'FROM OrdersHeader ' +                                                 //---Список типов----//
                                   ' LEFT JOIN Icons I ON I.UID = 18 ' +                                  //-----операции------//
                                   'WHERE VID_DOC IS NOT NULL AND ' +                                     //-----*********-----//
                                         'VID_DOC != ''''';                                               //-----*********-----//


              //   Отработанные документы

      SSQLAddCollectorOrder = 'INSERT INTO ProcessedDoc (FolioUID, ' +                                    //-----**********************-----//
                                                        'OrderDatePD, ' +                                 //-----**********************-----//
                                                        'Keeper,    ' +                                   //-----**********************-----//
                                                        'KeeperUID, ' +                                   //---Добавление собранной накладной
                                                        'Collector, ' +                                   //-----в таблицу ProcessedDoc-----//
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
                                       'PD.CollectorUID, ' +                                              //---Получение списка собранных накладных---//
                                       'PD.OrderBuildDate, ' +                                            //---выбранный сборщиком---//
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
                                                 ' I.Screen ' +                                           //---Получение списка сборщиков
                                  'FROM ProcessedDoc ' +                                                  //---и количества собранных заявок
                                  '  LEFT JOIN Icons I ON I.UID = 22 ' +                                  //-----************-----//
                                  'WHERE OrderDatePD BETWEEN ''%s'' and ''%s'' ' +                        //-----************-----//
                                  'GROUP BY CollectorUID, ' +                                                   //-----************-----//
                                           'Collector, ' +                                                //-----************-----//
                                           'I.Screen ';                                                   //-----************-----//

      SSQLGetCollectCountOrdersOverride = 'SELECT DISTINCT CollectorUID, ' +                                      //-----************-----//
                                                 ' Collector, ' +                                         //-----************-----//
                                                 ' COUNT(FolioUID)as "DocKol::INT", ' +                   //-----************-----//
                                                 ' I.Screen, ' +                                          //---Получение списка сборщиков
                                                 ' Status ' +                                             //-----************-----//
                                  'FROM ProcessedDoc ' +                                                  //---и количества собранных заявок
                                  '  LEFT JOIN Icons I ON I.UID = 22 ';                                   //-----************-----//
                                 // 'GROUP BY CollectorUID, ' +                                             //-----************-----//
                                 //          'Collector, ' +                                                //-----************-----//
                                 //          'I.Screen ';                                                   //-----************-----//

      SSQLGetCollectOrdersAtCollectUID = 'SELECT DISTINCT CollectorUID, ' +                               //-----************-----//
                                                 ' Collector, ' +                                         //-----************-----//
                                                 ' COUNT(FolioUID)as "DocKol::INT", ' +                   //-----************-----//
                                                 ' I.Screen ' +                                           //---Получение списка сборщиков
                                          'FROM ProcessedDoc ' +                                          //---и количества собранных заявок
                                          '  LEFT JOIN Icons I ON I.UID = 22 ' +                          //-----************-----//
                                          'WHERE OrderDatePD BETWEEN ''%s'' and ''%s'' ' +                //-----************-----//
                                          '      CollectorUID = %d ' +                                    //-----************-----//
                                          'GROUP BY CollectorUID, ' +                                           //-----************-----//
                                                   'Collector, ' +                                        //-----************-----//
                                                   'I.Screen ';

      SSQLClearProcessedOrders = 'DELETE FROM ProcessedDoc';                                                // Очистка всех записей из собранных накладных

      SSQLDeleteProcessedOrder = 'DELETE FROM ProcessedDoc ' +                                              // Удаление определенного документа из собранных
                               'WHERE FolioUID = %s';


                                         //-----  Документы

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
                                             'H.VID_DOC,     ' +                                          //--- Получение реестра документов
                                             'H.SUM_POR,     ' +                                          //--- из локальной БД
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
                                            'Price,     ' +                                               //Получение детализации//
                                            'Sum_Predm, ' +                                               //-----накладной-----//
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
                                          'SET Status = %d, ' +                                           //-----Обновление статуса-------//
                                          '    Date_Device = datetime(''now'',''localtime'') ' +          //--накладной в локальной базе--//
                                          'WHERE FolioUID = ''%s''';                                      //------*******************-----//



      SSQLUpdateStatusOrdersMove   = 'UPDATE OrdersMove ' +                                               //-----*****************-----//
                                     'SET Status = %d, ' +                                                //-----Обновление статуса----//
                                     '    DATE_Device = datetime(''now'',''localtime'') ' +               //--товара и даты отметки ---//
                                     'WHERE FolioUID = %s AND ' +                                         //-----в локальной базе -----//
                                           'Article = ''%s''';                                            //-----*****************-----//


      SSQLDeleteOrdersMoveLocal         = 'DELETE FROM OrdersMove ' +                                          //----- Удаление товаров при ----//     -- лучше не пользоваться
                                     'WHERE FolioUID = %d';                                               //----корректировке наклданой ---//

      SSQLClearOrdersMoveLocal          = 'DELETE FROM OrdersMove';                                       //---- Очистка полного списка товаров -- //

      SSQLClearOrdersHeadLocal          = 'DELETE FROM OrdersHeader';                                     //---- Очистка списка документов с локальной БД

      SSQLSetDefaultStatusHeadOrders = 'UPDATE OrdersHeader ' +                                           //--- Установка дефолтного статуса для ---//
                                       '  SET Status = 0 ' +                                              //---      определенного значения      ---//
                                       'WHERE FolioUID = %s';                                             //-----******************************-----//

      SSQLSetDefaultStatusOrdersMove = 'UPDATE OrdersMove ' +                                             //--- Установка дефолного значения статуса ---//
                                       '  SET Status = 0  ' +                                             //---   для товаров определенной накладной ---//
                                       'WHERE FolioUID = %s';                                             //-----**********************************-----//

      SSQLAddOrdersHeader = 'INSERT INTO OrdersHeader(UID, ' +                                                //-----*********-----//
                                                'JournalNo, ' +                                               //-----*********-----//
                                                'OrderUID, ' +                                                //-----*********-----//
                                                'FolioUID, ' +                                                //-----*********-----//
                                                'OrderNo, ' +                                                 //-----*********-----//
                                                'OrderDate, ' +                                               //-----*********-----//
                                                'Status, ' +                                                  //-Добавление документа-//
                                                'BRIEFORG, ' +                                                //--в локальную базу-//
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
                                                   'Packages, ' +                                                   //Добавление детализации//
                                                   'EDN_V_UPAK, ' +                                                 //-----накладной-----//
                                                   'Qty, ' +                                                        //-----*********-----//
                                                   'Price, ' +                                                      //-----*********-----//
                                                   'Sum_Predm, ' +                                                  //-----*********-----//
                                                   'KON_KOLCH, ' +
                                                   'STATUS) ' +
                            'VALUES (%d, ''%s'', ''%s'', ''%s'', ''%s'', ''%s'', ''%s'', ''%s'', ''%s'', ''%s'', ''%s'', %d)';  //-----*********-----//







                                             /// ----- Работа с удаленным сервером ---- ///

    SSQLGetUsers   = 'EXEC DELIVERY..S_GetAuditEmployees %d';                                             // Получение списка пользователей
    SSQLGetReestrs = 'EXEC DELIVERY..S_GetReestrs';                                                       // Получение списка реестров
    SSQLGetCollectorsOrdersBuild = 'EXEC STOREHOUSE..O_GetCollectorsOrdersBuild';                         // Получение списка сборщиков
    SSQLGetJournalOrders         = 'EXEC DELIVERY..A_GetJournalOrders ''%s'', ''%s'', ''%s''';            // Список накладных
    SSQLGetPrintOrderDetails     = 'EXEC DELIVERY..A_GetPrintOrderDetails %d';                            // Детализация документа
    SSQLGetProcessedDocs         = 'EXEC DELIVeRY..S_GetProcessedDocs ''%s'', ''%s''';                    // Получить список отработанных документов



    SSQLInsProcessedDoc = 'EXEC DELIVERY..S_InsProcessedDoc ''%s'', ''%s'', ''%s'', %d, ''%s'', %d, ''%s'', %d';
    SSQLLoadNaclAudit                 = 'EXEC DELIVERY..S_LoadNaclAudit %d, %d, ''%s'', %d, %d, ''%s''';                   // --Headers-- //
    SSQLLoadMoveAudit                 = 'EXEC DELIVERY..S_LoadMoveAudit %d, %d, ''%s'', ''%s'', ''%s'', %d, %d, ''%s''';   // ---Moves---//

implementation

end.
