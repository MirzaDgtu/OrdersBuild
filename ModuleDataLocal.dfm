object AppDataLocal: TAppDataLocal
  OldCreateOrder = False
  Height = 424
  Width = 428
  object Connection: TFDConnection
    Params.Strings = (
      'Database=D:\Projects\OrdersBuild\SqlLiteBase.db'
      'DriverID=SQLite')
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
end
