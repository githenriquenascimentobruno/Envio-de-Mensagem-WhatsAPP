object frmImportarCsv: TfrmImportarCsv
  Left = 0
  Top = 0
  Caption = 'Importar Csv'
  ClientHeight = 522
  ClientWidth = 862
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  WindowState = wsMaximized
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 862
    Height = 41
    Align = alTop
    TabOrder = 2
    object Button2: TButton
      Left = 568
      Top = 10
      Width = 75
      Height = 25
      Caption = 'Button2'
      TabOrder = 0
    end
  end
  object Button1: TButton
    Left = 400
    Top = 10
    Width = 75
    Height = 25
    Caption = 'Button1'
    TabOrder = 0
    OnClick = Button1Click
  end
  object DBGrid1: TDBGrid
    Left = 0
    Top = 41
    Width = 862
    Height = 481
    Align = alClient
    DataSource = DataSource1
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgMultiSelect, dgTitleClick, dgTitleHotTrack]
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    OnDrawColumnCell = DBGrid1DrawColumnCell
    OnDblClick = DBGrid1DblClick
  end
  object ClientDataSet1: TClientDataSet
    PersistDataPacket.Data = {
      380000009619E0BD010000001800000001000000000003000000380009444553
      43524943414F01004900000001000557494454480200020064000000}
    Active = True
    Aggregates = <>
    Params = <>
    Left = 128
    Top = 144
    object ClientDataSet1SELECAO: TIntegerField
      FieldKind = fkCalculated
      FieldName = 'SELECAO'
      Calculated = True
    end
    object ClientDataSet1DESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 100
    end
    object ClientDataSet1MARCADO: TStringField
      FieldKind = fkCalculated
      FieldName = 'MARCADO'
      Calculated = True
    end
  end
  object DataSource1: TDataSource
    DataSet = ClientDataSet1
    Left = 224
    Top = 152
  end
end
