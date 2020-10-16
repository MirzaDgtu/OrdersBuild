unit DataBaseLocal;

interface

uses System.SysUtils, System.IOUtils;

type
  TLocalDataBase = class
    private
      procedure addTables();
    public
      function checkExistsDataBase(Name: string): Boolean;
      procedure Create();
      procedure Delete();
  end;

resourcestring

    SSQLExistsCountTable = 'SELECT count(*) as ColTable FROM sqlite_master WHERE type=''''table''''';            // Получает количество существующих таблиц

    // Создание таблиц
    SSQLCreateDataBase   = '$ sqlite3 SqlLiteBase.db';                                                                                          // Запрос на создание базы данных
    SSQLCreateUsers      = 'CREATE TABLE IF NOT EXISTS "Users" ( "ID"	INTEGER PRIMARY KEY, ' +                                                  //--*********************************--//
                                                   '"UserLogin"	VARCHAR(10), ' +                                                                //--******Создает таблицу Users******--//
                                                   '"UserName"	VARCHAR(50), ' +                                                                //--*********************************--//
                                                   '"LastUser" INTEGER)';                                                                       //--*********************************--//

    SSQLCreateTableSetting = 'CREATE TABLE IF NOT EXISTS "TableSetting" ("ID"	INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT UNIQUE, ' +                          // Создает таблицу   TableSetting
                                                           ' "ServerName"	TEXT, ' +
                                                           ' "UserLogin"	TEXT, ' +
                                                           ' "UserPassword"	TEXT, ' +
                                                           ' "InitialCatalog"	TEXT)';

    SSQLCreateOrdersHeader  = 'CREATE TABLE IF NOT EXISTS "OrdersHeader" ( "UID"	INTEGER, ' +                                                                // Создает таблицу OrdersHeader
                                                            '"JournalNo"	INTEGER, ' +
                                                            '"OrderUID"	INTEGER, ' +
                                                            '"FolioUID"	REAL, ' +
                                                            '"OrderNo"	REAL, ' +
                                                            '"OrderDate"	TEXT, ' +
                                                            '"Status" INTEGER DEFAULT ''0''  NOT NULL, ' +
                                                            '"BRIEFORG"	VARCHAR(20), ' +
                                                            '"ORGANIZNKL"	VARCHAR(50), ' +
                                                            '"L_CP1_PLAT"	VARCHAR(30), ' +
                                                            '"L_CP2_PLAT"	VARCHAR(30), ' +
                                                            '"VID_DOC"	VARCHAR(50), ' +
                                                            '"SUM_ROZN"	FLOAT, ' +
                                                            '"SUM_POR"	FLOAT, ' +
                                                            '"StrikeCode"	VARCHAR(30), ' +
                                                            '"NAMEP_USER"	VARCHAR(110), ' +
                                                            '"ADRES_USER"	VARCHAR(150), ' +
                                                            '"ProjectName"	VARCHAR(50), ' +
                                                            '"Date_Device" NUMERIC)';

    SSQLCreateOrdersMove = 'CREATE TABLE IF NOT EXISTS "OrdersMove" ("FolioUID" INTEGER  NULL, ' +                                                            // Создает таблицу OrdersMove
                                                      '"Article" VARCHAR(20)  NULL, ' +
                                                      '"StrikeCode" VARCHAR(30)  NULL, ' +
                                                      '"ProductName" VARCHAR(200)  NULL, ' +
                                                      '"EDIN_IZMER" FLOAT  NULL, ' +
                                                      '"Packages" FLOAT  NULL, ' +
                                                      '"EDN_V_UPAK" VARCHAR(20)  NULL, ' +
                                                      '"Qty" FLOAT  NULL, ' +
                                                      '"Price" FLOAT  NULL, ' +
                                                      '"Sum_Predm" FLOAT  NULL, ' +
                                                      '"KON_KOLCH" Float  NULL, ' +
                                                      '"Status" INTEGER DEFAULT ''0'' NOT NULL, ' +
                                                      '"Date_Device" TEXT NULL)';

    SSQLCreateStatuses  =  'CREATE TABLE IF NOT EXISTS "Statuses" ("UID" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT UNIQUE, ' +
                                                                  '"Name" varchar(30) Not Null)';

    SSQLCreateStatistics = 'CREATE TABLE IF NOT EXISTS "Statistics" ("CollectedAll" INTEGER DEFAULT ''0'' NULL, ' +
                                                                    '"CollectedCurrent" INTEGER DEFAULT ''0'' NULL)';

    SSQLCreateReestrs    = 'CREATE TABLE IF NOT EXISTS "Reestrs" ("UID"	INTEGER NOT NULL, ' +
                                                                  '"ProjectName"	TEXT NOT NULL)';

    SSQLCreateIcons      = 'CREATE TABLE IF NOT EXISTS "Icons" ("UID"	INTEGER NOT NULL UNIQUE, ' +
                                                                '"Screen"	BLOB, '   +
                                                                '"Description"	TEXT, ' +
                                                                'PRIMARY KEY("UID" AUTOINCREMENT))';


    // Удаление таблиц
    SSQLDeleteUsers            = 'DROP TABLE IF EXISTS USERS';

    SSQLDeleteTableSetting     = 'DROP TABLE IF EXISTS TableSetting';

    SSQLDeleteOrdersHeader     = 'DROP TABLE IF EXISTS OrdersHeader';

    SSQLDeleteOrdersMove       = 'DROP TABLE IF EXISTS OrdersMove';

    SSQLDeleteStatuses         = 'DROP TABLE IF EXISTS Statuses';

    SSQLDeleteStatistics       = 'DROP TABLE IF EXISTS Statistics';

    SSQLDeleteReestrs          = 'DROP TABLE IF EXISTS Reestrs';

    SSQLDeleteIcons            = 'DROP TABLE IF EXISTS Icons';


implementation

uses ModuleDataLocal, SConsts;


{ TLocalDataBase }

procedure TLocalDataBase.addTables;
begin
  //
end;

function TLocalDataBase.checkExistsDataBase(Name: string): Boolean;
begin
   //
end;

procedure TLocalDataBase.Create;
begin

end;

procedure TLocalDataBase.Delete;
begin
  //
end;

end.
