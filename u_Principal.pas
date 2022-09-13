unit u_Principal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Menus;

type
  TfrmPrincipal = class(TForm)
    MainMenu1: TMainMenu;
    Principal1: TMenuItem;
    Principal2: TMenuItem;
    N1: TMenuItem;
    N2: TMenuItem;
    WhatsApp1: TMenuItem;
    Processamento1: TMenuItem;
    Converses1: TMenuItem;
    ImportarParaPlanilha1: TMenuItem;
    procedure WhatsApp1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ImportarParaPlanilha1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

{$R *.dfm}

uses u_WhatsApp, u_ImportaCsv;

procedure TfrmPrincipal.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TfrmPrincipal.ImportarParaPlanilha1Click(Sender: TObject);
begin
    begin
        Application.CreateForm(TfrmImportarCsv, frmImportarCsv);
    end;
        frmImportarCsv.Show;
end;

procedure TfrmPrincipal.WhatsApp1Click(Sender: TObject);
begin
    begin
        Application.CreateForm(TfrmEnviaWhats, frmEnviaWhats);
    end;
        frmEnviaWhats.Show;
end;

end.
