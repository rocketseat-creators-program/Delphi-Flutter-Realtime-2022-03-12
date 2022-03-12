object DMPrincipal: TDMPrincipal
  OldCreateOrder = False
  Height = 265
  Width = 488
  object FDConnection1: TFDConnection
    Params.Strings = (
      
        'Database=D:\Experts Club\fechamento-caixa\PDV\Database\PRINCIPAL' +
        '.FDB'
      'User_Name=SYSDBA'
      'Password=masterkey'
      'DriverID=FB')
    Connected = True
    LoginPrompt = False
    Left = 56
    Top = 24
  end
  object FDQRMovimentacoes: TFDQuery
    CachedUpdates = True
    Connection = FDConnection1
    Transaction = FDTransaction1
    SQL.Strings = (
      'SELECT * FROM MOVIMENTACOES'
      'ORDER BY MOV_DATAHORA')
    Left = 280
    Top = 32
    object FDQRMovimentacoesMOV_CODIGO: TIntegerField
      FieldName = 'MOV_CODIGO'
      Origin = 'MOV_CODIGO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object FDQRMovimentacoesMOV_CREDITO: TCurrencyField
      FieldName = 'MOV_CREDITO'
      Origin = 'MOV_CREDITO'
    end
    object FDQRMovimentacoesMOV_DEBITO: TCurrencyField
      FieldName = 'MOV_DEBITO'
      Origin = 'MOV_DEBITO'
    end
    object FDQRMovimentacoesMOV_DESCRICAO: TStringField
      FieldName = 'MOV_DESCRICAO'
      Origin = 'MOV_DESCRICAO'
      Size = 30
    end
    object FDQRMovimentacoesMOV_SALDOANT: TCurrencyField
      FieldName = 'MOV_SALDOANT'
      Origin = 'MOV_SALDOANT'
    end
    object FDQRMovimentacoesMOV_CON: TSmallintField
      FieldName = 'MOV_CON'
      Origin = 'MOV_CON'
    end
    object FDQRMovimentacoesMOV_DATAHORA: TSQLTimeStampField
      FieldName = 'MOV_DATAHORA'
      Origin = 'MOV_DATAHORA'
    end
    object FDQRMovimentacoesMOV_NOME: TStringField
      FieldName = 'MOV_NOME'
      Origin = 'MOV_NOME'
      Size = 30
    end
  end
  object FDPhysFBDriverLink1: TFDPhysFBDriverLink
    VendorHome = 'C:\bin'
    VendorLib = 'fbclient.dll'
    Left = 56
    Top = 88
  end
  object FDTransaction1: TFDTransaction
    Connection = FDConnection1
    Left = 136
    Top = 24
  end
end
