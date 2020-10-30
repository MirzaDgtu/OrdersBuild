object AppDataLocal: TAppDataLocal
  OldCreateOrder = False
  Height = 391
  Width = 381
  object Connection: TFDConnection
    Params.Strings = (
      'Database=D:\Projects\OrdersBuild\SqlLiteBase.db'
      'DriverID=SQLite')
    Connected = True
    LoginPrompt = False
    BeforeConnect = ConnectionBeforeConnect
    Left = 24
    Top = 16
  end
  object SQLiteDriver: TFDPhysSQLiteDriverLink
    Left = 88
    Top = 16
  end
  object GUIxWaitCursor: TFDGUIxWaitCursor
    Provider = 'FMX'
    Left = 168
    Top = 16
  end
  object Command: TFDQuery
    Connection = Connection
    Left = 240
    Top = 16
  end
  object EveryOne: TFDQuery
    Connection = Connection
    Left = 304
    Top = 16
  end
  object Reestrs: TFDQuery
    BeforeOpen = ReestrsBeforeOpen
    Connection = Connection
    Left = 72
    Top = 72
    object ReestrsUID: TIntegerField
      FieldName = 'UID'
    end
    object ReestrsProjectName: TStringField
      FieldName = 'ProjectName'
      Size = 30
    end
    object ReestrsScreen: TBlobField
      FieldName = 'Screen'
    end
  end
  object Brieforgs: TFDQuery
    BeforeOpen = BrieforgsBeforeOpen
    Connection = Connection
    Left = 120
    Top = 72
    object BrieforgsBrieforg: TStringField
      FieldName = 'Brieforg'
      Size = 50
    end
    object BrieforgsScreen: TBlobField
      FieldName = 'Screen'
    end
  end
  object Drivers: TFDQuery
    BeforeOpen = DriversBeforeOpen
    Connection = Connection
    Left = 168
    Top = 72
    object DriversL_CP2_PLAT: TStringField
      FieldName = 'L_CP2_PLAT'
      Size = 50
    end
    object DriversScreen: TBlobField
      FieldName = 'Screen'
    end
  end
  object Agents: TFDQuery
    BeforeOpen = AgentsBeforeOpen
    Connection = Connection
    Left = 216
    Top = 72
    object AgentsL_CP1_PLAT: TStringField
      FieldName = 'L_CP1_PLAT'
      Size = 50
    end
    object AgentsScreen: TBlobField
      FieldName = 'Screen'
    end
  end
  object VidDocs: TFDQuery
    BeforeOpen = VidDocsBeforeOpen
    Connection = Connection
    Left = 264
    Top = 72
    object VidDocsVID_DOC: TStringField
      FieldName = 'VID_DOC'
      Size = 30
    end
    object VidDocsScreen: TBlobField
      FieldName = 'Screen'
    end
  end
  object CollectorBuild: TFDQuery
    Connection = Connection
    Left = 24
    Top = 120
    object CollectorBuildCollectorUID: TIntegerField
      FieldName = 'CollectorUID'
    end
    object CollectorBuildCollector: TStringField
      FieldName = 'Collector'
      Size = 50
    end
    object CollectorBuildDocKol: TIntegerField
      FieldName = 'DocKol'
    end
    object CollectorBuildScreen: TBlobField
      FieldName = 'Screen'
    end
  end
  object CollectorOrders: TFDQuery
    Connection = Connection
    Left = 96
    Top = 120
    object CollectorOrdersUID: TIntegerField
      FieldName = 'UID'
    end
    object CollectorOrdersFolioUID: TFloatField
      FieldName = 'FolioUID'
    end
    object CollectorOrdersOrderDate: TWideMemoField
      FieldName = 'OrderDate'
      BlobType = ftWideMemo
    end
    object CollectorOrdersKeeper: TStringField
      FieldName = 'Keeper'
      Size = 50
    end
    object CollectorOrdersKeeperUID: TIntegerField
      FieldName = 'KeeperUID'
    end
    object CollectorOrdersCollector: TStringField
      FieldName = 'Collector'
      Size = 50
    end
    object CollectorOrdersCollectorUID: TIntegerField
      FieldName = 'CollectorUID'
    end
    object CollectorOrdersScreen: TBlobField
      FieldName = 'Screen'
    end
    object CollectorOrdersOrderBuildDate: TWideMemoField
      FieldName = 'OrderBuildDate'
      BlobType = ftWideMemo
    end
  end
  object OrdersMove: TFDQuery
    Connection = Connection
    Left = 96
    Top = 176
    object OrdersMoveFolioUID: TIntegerField
      FieldName = 'FolioUID'
    end
    object OrdersMoveArticle: TStringField
      FieldName = 'Article'
    end
    object OrdersMoveStrikeCode: TStringField
      FieldName = 'StrikeCode'
      Size = 30
    end
    object OrdersMoveProductName: TStringField
      FieldName = 'ProductName'
      Size = 200
    end
    object OrdersMovePackages: TFloatField
      FieldName = 'Packages'
    end
    object OrdersMoveEDIN_IZMER: TStringField
      FieldName = 'EDIN_IZMER'
    end
    object OrdersMoveEDN_V_UPAK: TFloatField
      FieldName = 'EDN_V_UPAK'
    end
    object OrdersMoveQty: TFloatField
      FieldName = 'Qty'
    end
    object OrdersMovePrice: TFloatField
      FieldName = 'Price'
    end
    object OrdersMoveSum_Predm: TFloatField
      FieldName = 'Sum_Predm'
    end
    object OrdersMoveKON_KOLCH: TFloatField
      FieldName = 'KON_KOLCH'
    end
    object OrdersMoveStatus: TIntegerField
      FieldName = 'Status'
    end
    object OrdersMoveDate_Device: TWideMemoField
      FieldName = 'Date_Device'
      BlobType = ftWideMemo
    end
    object OrdersMoveScreen: TBlobField
      FieldName = 'Screen'
    end
  end
  object OrdersHead: TFDQuery
    Connection = Connection
    Left = 24
    Top = 176
    object OrdersHeadUID: TIntegerField
      FieldName = 'UID'
    end
    object OrdersHeadJournalNo: TIntegerField
      FieldName = 'JournalNo'
    end
    object OrdersHeadOrderUID: TIntegerField
      FieldName = 'OrderUID'
    end
    object OrdersHeadFolioUID: TFloatField
      FieldName = 'FolioUID'
    end
    object OrdersHeadOrderNo: TFloatField
      FieldName = 'OrderNo'
    end
    object OrdersHeadOrderDate: TWideMemoField
      FieldName = 'OrderDate'
      BlobType = ftWideMemo
    end
    object OrdersHeadBRIEFORG: TStringField
      FieldName = 'BRIEFORG'
    end
    object OrdersHeadORGANIZNKL: TStringField
      FieldName = 'ORGANIZNKL'
      Size = 50
    end
    object OrdersHeadL_CP1_PLAT: TStringField
      FieldName = 'L_CP1_PLAT'
      Size = 30
    end
    object OrdersHeadL_CP2_PLAT: TStringField
      FieldName = 'L_CP2_PLAT'
      Size = 30
    end
    object OrdersHeadVID_DOC: TStringField
      FieldName = 'VID_DOC'
      Size = 50
    end
    object OrdersHeadSUM_ROZN: TFloatField
      FieldName = 'SUM_ROZN'
    end
    object OrdersHeadSUM_POR: TFloatField
      FieldName = 'SUM_POR'
    end
    object OrdersHeadStrikeCode: TStringField
      FieldName = 'StrikeCode'
      Size = 30
    end
    object OrdersHeadNAMEP_USER: TStringField
      FieldName = 'NAMEP_USER'
      Size = 110
    end
    object OrdersHeadADRES_USER: TStringField
      FieldName = 'ADRES_USER'
      Size = 150
    end
    object OrdersHeadProjectName: TStringField
      FieldName = 'ProjectName'
      Size = 50
    end
    object OrdersHeadColProd: TSmallintField
      FieldName = 'ColProd'
    end
    object OrdersHeadColBuildProd: TSmallintField
      FieldName = 'ColBuildProd'
    end
    object OrdersHeadScreen: TBlobField
      FieldName = 'Screen'
    end
    object OrdersHeadDate_Device: TLargeintField
      FieldName = 'Date_Device'
    end
    object OrdersHeadStatus: TIntegerField
      FieldName = 'Status'
    end
    object OrdersHeadCollectorUID: TIntegerField
      FieldName = 'CollectorUID'
    end
    object OrdersHeadCollector: TStringField
      FieldName = 'Collector'
      Size = 50
    end
    object OrdersHeadKeeperUID: TIntegerField
      FieldName = 'KeeperUID'
    end
    object OrdersHeadKeeper: TStringField
      FieldName = 'Keeper'
      Size = 50
    end
  end
  object Users: TFDQuery
    Connection = Connection
    Left = 24
    Top = 72
    object UsersID: TIntegerField
      FieldName = 'ID'
    end
    object UsersUserLogin: TStringField
      FieldName = 'UserLogin'
      Size = 10
    end
    object UsersUserName: TStringField
      FieldName = 'UserName'
      Size = 50
    end
    object UsersLastUser: TSmallintField
      FieldName = 'LastUser'
    end
    object UsersScreen: TBlobField
      FieldName = 'Screen'
    end
    object UsersLastUserScreen: TBlobField
      FieldName = 'LastUserScreen'
    end
  end
  object Collectors: TFDQuery
    BeforeOpen = CollectorsBeforeOpen
    Connection = Connection
    Left = 320
    Top = 72
    object CollectorsUID: TIntegerField
      FieldName = 'UID'
    end
    object CollectorsName: TStringField
      FieldName = 'Name'
      Size = 50
    end
    object CollectorsScreen: TBlobField
      FieldName = 'Screen'
    end
  end
end
