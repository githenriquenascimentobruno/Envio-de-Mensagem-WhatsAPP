object frmPrincipal: TfrmPrincipal
  Left = 0
  Top = 0
  Caption = 'Loja das Fraldas'
  ClientHeight = 616
  ClientWidth = 899
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Menu = MainMenu1
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object MainMenu1: TMainMenu
    Left = 312
    Top = 160
    object Principal1: TMenuItem
      Caption = 'Principal'
      object Principal2: TMenuItem
        Caption = 'Manuten'#231#227'o de Cadastros'
      end
      object N1: TMenuItem
        Caption = '-'
      end
      object N2: TMenuItem
        Caption = 'Marketing'
        object WhatsApp1: TMenuItem
          Caption = 'WhatsApp'
          OnClick = WhatsApp1Click
        end
      end
    end
    object Processamento1: TMenuItem
      Caption = 'Processamento'
      object Converses1: TMenuItem
        Caption = 'Csv'
        object ImportarParaPlanilha1: TMenuItem
          Caption = 'Importar Para Planilha'
          OnClick = ImportarParaPlanilha1Click
        end
      end
    end
  end
end
