object AppDataRemote: TAppDataRemote
  OldCreateOrder = False
  Height = 361
  Width = 310
  object SQLServerProvider: TSQLServerUniProvider
    Left = 96
    Top = 16
  end
  object Connection: TUniConnection
    AutoCommit = False
    ProviderName = 'SQL Server'
    Port = 1433
    Database = 'DELIVERY'
    Username = 'pmp'
    Server = '192.168.0.7\F2012SQL'
    LoginPrompt = False
    Left = 16
    Top = 16
    EncryptedPassword = '8FFF92FF8FFFCEFFCDFFCDFFC9FF'
  end
  object Command: TUniQuery
    Connection = Connection
    Left = 168
    Top = 16
  end
  object Users: TUniQuery
    SQLInsert.Strings = (
      'INSERT INTO dbo.A_EMPLOYEES'
      
        '  (UID, ProjectUID, CategoryUID, EmployeeName, JobPhone, HomePho' +
        'ne, Address, Available, fName, pName, sName, Document, RegionUID' +
        ', EssieiUID)'
      'VALUES'
      
        '  (:UID, :ProjectUID, :CategoryUID, :EmployeeName, :JobPhone, :H' +
        'omePhone, :Address, :Available, :fName, :pName, :sName, :Documen' +
        't, :RegionUID, :EssieiUID)')
    SQLDelete.Strings = (
      'DELETE FROM dbo.A_EMPLOYEES'
      'WHERE'
      '  UID = :Old_UID')
    SQLUpdate.Strings = (
      'UPDATE dbo.A_EMPLOYEES'
      'SET'
      
        '  UID = :UID, ProjectUID = :ProjectUID, CategoryUID = :CategoryU' +
        'ID, EmployeeName = :EmployeeName, JobPhone = :JobPhone, HomePhon' +
        'e = :HomePhone, Address = :Address, Available = :Available, fNam' +
        'e = :fName, pName = :pName, sName = :sName, Document = :Document' +
        ', RegionUID = :RegionUID, EssieiUID = :EssieiUID'
      'WHERE'
      '  UID = :Old_UID')
    SQLLock.Strings = (
      'SELECT * FROM dbo.A_EMPLOYEES'
      'WITH (UPDLOCK, ROWLOCK, HOLDLOCK)'
      'WHERE'
      '  UID = :Old_UID')
    SQLRefresh.Strings = (
      
        'SELECT UID, ProjectUID, CategoryUID, EmployeeName, JobPhone, Hom' +
        'ePhone, Address, Available, fName, pName, sName, Document, Regio' +
        'nUID, EssieiUID FROM dbo.A_EMPLOYEES'
      'WHERE'
      '  UID = :UID')
    SQLRecCount.Strings = (
      'SET :PCOUNT = (SELECT COUNT(*) FROM dbo.A_EMPLOYEES'
      ')')
    Connection = Connection
    SQL.Strings = (
      #9#9)
    Left = 16
    Top = 72
    object UsersUID: TIntegerField
      FieldName = 'UID'
    end
    object UsersProjectUID: TIntegerField
      FieldName = 'ProjectUID'
    end
    object UsersCategoryUID: TIntegerField
      FieldName = 'CategoryUID'
    end
    object UsersEmployeeName: TStringField
      FieldName = 'EmployeeName'
      Size = 50
    end
    object UsersJobPhone: TStringField
      FieldName = 'JobPhone'
    end
    object UsersHomePhone: TStringField
      FieldName = 'HomePhone'
    end
    object UsersAddress: TStringField
      FieldName = 'Address'
      Size = 50
    end
    object UsersAvailable: TBooleanField
      FieldName = 'Available'
    end
    object UsersfName: TStringField
      FieldName = 'fName'
    end
    object UserspName: TStringField
      FieldName = 'pName'
    end
    object UserssName: TStringField
      FieldName = 'sName'
      Size = 10
    end
    object UsersDocument: TStringField
      FieldName = 'Document'
      Size = 100
    end
    object UsersRegionUID: TIntegerField
      FieldName = 'RegionUID'
    end
    object UsersEssieiUID: TIntegerField
      FieldName = 'EssieiUID'
    end
  end
  object OrdersHeader: TUniQuery
    Connection = Connection
    Left = 164
    Top = 72
    object fldUID: TIntegerField
      FieldName = 'UID'
    end
    object fldJournalNo: TIntegerField
      FieldName = 'JournalNo'
    end
    object fldOrderUID: TIntegerField
      FieldName = 'OrderUID'
    end
    object fldFolioUID: TFloatField
      FieldName = 'FolioUID'
    end
    object fldOrderNo: TFloatField
      FieldName = 'OrderNo'
    end
    object fldOrderDate: TDateField
      FieldName = 'OrderDate'
    end
    object fldStatus: TIntegerField
      FieldName = 'Status'
    end
    object fldDone: TBooleanField
      FieldName = 'Done'
    end
    object fldPrintCount: TIntegerField
      FieldName = 'PrintCount'
    end
    object fldClientCode: TStringField
      FieldName = 'BRIEFORG'
      Size = 8
    end
    object fldClientName: TStringField
      FieldName = 'ORGANIZNKL'
      Size = 50
    end
    object fldAgent: TStringField
      FieldName = 'L_CP1_PLAT'
      Size = 30
    end
    object fldDriver: TStringField
      FieldName = 'L_CP2_PLAT'
      Size = 30
    end
    object fldMarker: TStringField
      FieldName = 'VID_DOC'
    end
    object OrdersHeaderSUM_ROZN: TFloatField
      FieldName = 'SUM_ROZN'
    end
    object OrdersHeaderSUM_POR: TFloatField
      FieldName = 'SUM_POR'
    end
    object OrdersHeaderStrikeCode: TStringField
      FieldName = 'StrikeCode'
      Size = 30
    end
    object OrdersHeaderNAMEP_USER: TStringField
      FieldName = 'NAMEP_USER'
      Size = 110
    end
    object OrdersHeaderReestrName: TStringField
      FieldName = 'ReestrName'
      Size = 30
    end
    object OrdersHeaderProjectName: TStringField
      FieldName = 'ProjectName'
      Size = 50
    end
    object OrdersHeaderCodeSborPos: TStringField
      FieldName = 'CodeSborPos'
      Size = 10
    end
    object OrdersHeaderADRES_USER: TStringField
      FieldName = 'ADRES_USER'
      Size = 150
    end
    object OrdersHeaderAuditStatus: TIntegerField
      FieldName = 'AuditStatus'
    end
    object OrdersHeaderDATE_DEVICE: TStringField
      FieldName = 'DATE_DEVICE'
    end
  end
  object OrdersMove: TUniQuery
    Connection = Connection
    Left = 163
    Top = 120
    object OrdersMoveRecNo: TFloatField
      FieldName = 'RecNo'
    end
    object OrdersMoveArticle: TStringField
      FieldName = 'Article'
    end
    object OrdersMoveProductName: TStringField
      FieldName = 'ProductName'
      Size = 200
    end
    object OrdersMoveCODE_EDIN_IZMER: TStringField
      FieldName = 'CODE_EDIN_IZMER'
      Size = 5
    end
    object OrdersMoveEDIN_IZMER: TStringField
      FieldName = 'EDIN_IZMER'
      Size = 10
    end
    object OrdersMoveEDN_V_UPAK: TFloatField
      FieldName = 'EDN_V_UPAK'
    end
    object OrdersMovePackages: TFloatField
      FieldName = 'Packages'
    end
    object OrdersMoveQty: TFloatField
      FieldName = 'Qty'
    end
    object OrdersMoveSUM_PREDM: TFloatField
      FieldName = 'SUM_PREDM'
    end
    object OrdersMoveSUM_ROZN: TFloatField
      FieldName = 'SUM_ROZN'
    end
    object OrdersMoveNALOGMONEY: TFloatField
      FieldName = 'NALOGMONEY'
    end
    object OrdersMoveNoTaxSum: TFloatField
      FieldName = 'NoTaxSum'
    end
    object OrdersMoveTax10: TFloatField
      FieldName = 'Tax10'
    end
    object OrdersMoveTax18: TFloatField
      FieldName = 'Tax18'
    end
    object OrdersMoveNDS: TFloatField
      FieldName = 'NDS'
    end
    object OrdersMovePrice: TFloatField
      FieldName = 'Price'
    end
    object OrdersMoveFactPrice: TFloatField
      FieldName = 'FactPrice'
    end
    object OrdersMoveNoTaxPrice: TFloatField
      FieldName = 'NoTaxPrice'
    end
    object OrdersMoveCODE_COUNTRY: TStringField
      FieldName = 'CODE_COUNTRY'
      Size = 5
    end
    object OrdersMoveCOUNTRY: TStringField
      FieldName = 'COUNTRY'
      Size = 50
    end
    object OrdersMoveS100: TStringField
      FieldName = 'S100'
      Size = 100
    end
    object OrdersMoveS200: TStringField
      FieldName = 'S200'
      Size = 200
    end
    object OrdersMoveS250: TStringField
      FieldName = 'S250'
      Size = 250
    end
    object OrdersMoveS255: TStringField
      FieldName = 'S255'
      Size = 250
    end
    object OrdersMoveNACENKA: TFloatField
      FieldName = 'NACENKA'
    end
    object OrdersMoveWeight: TFloatField
      FieldName = 'Weight'
    end
    object OrdersMoveStrikeCode: TStringField
      FieldName = 'StrikeCode'
    end
    object OrdersMoveDATE2: TDateField
      FieldName = 'DATE2'
    end
    object OrdersMoveDATE1: TDateField
      FieldName = 'DATE1'
    end
    object OrdersMoveStartDate: TDateField
      FieldName = 'StartDate'
    end
    object OrdersMoveFinalDate: TDateField
      FieldName = 'FinalDate'
    end
    object OrdersMoveKON_KOLCH: TFloatField
      FieldName = 'KON_KOLCH'
    end
    object OrdersMoveAuditStatus: TIntegerField
      FieldName = 'AuditStatus'
    end
  end
  object Reestrs: TUniQuery
    Connection = Connection
    Left = 16
    Top = 120
    object ReestrsUID: TIntegerField
      FieldName = 'UID'
    end
    object ReestrsProjectName: TStringField
      FieldName = 'ProjectName'
      Size = 50
    end
  end
  object Collectors: TUniQuery
    Connection = Connection
    Left = 64
    Top = 72
    object CollectorsUID: TIntegerField
      FieldName = 'UID'
    end
    object CollectorsEmployeeName: TStringField
      FieldName = 'EmployeeName'
      Size = 50
    end
  end
end
