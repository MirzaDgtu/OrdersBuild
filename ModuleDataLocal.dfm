object AppDataLocal: TAppDataLocal
  OldCreateOrder = False
  Height = 296
  Width = 365
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
end
