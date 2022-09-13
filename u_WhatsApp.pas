unit u_WhatsApp;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms,  Vcl.ExtCtrls,

  //############ ATENCAO AQUI ####################
  //units adicionais obrigatorias
   uTInject.ConfigCEF, uTInject,            uTInject.Constant,      uTInject.JS,     uInjectDecryptFile,
   uTInject.Console,   uTInject.Diversos,   uTInject.AdjustNumber,  uTInject.Config, uTInject.Classes,

  //units Opcionais (dependendo do que ira fazer)
   System.NetEncoding, System.TypInfo,  WinInet,

  Vcl.StdCtrls, System.ImageList, Vcl.ImgList, Vcl.AppEvnts, Vcl.ComCtrls,
  Vcl.Imaging.pngimage, Vcl.Buttons, Vcl.Mask, Data.DB, Vcl.DBCtrls, Vcl.Grids,
  Vcl.DBGrids, Vcl.Dialogs, IdBaseComponent, IdComponent, IdTCPConnection,
  IdTCPClient, Vcl.OleCtrls, SHDocVw, IdHTTP, IdIOHandler,
  IdIOHandlerSocket, IdIOHandlerStack, IdSSL, IdSSLOpenSSL, Vcl.Imaging.jpeg,
  Data.FMTBcd, Datasnap.DBClient, Datasnap.Provider, Data.SqlExpr,
  Data.DBXFirebird, IdURI;

type
  TfrmEnviaWhats = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    Rdb_FormaConexao: TRadioGroup;
    RadioGroup2: TRadioGroup;
    btnAbrirWhats: TBitBtn;
    btnFecharWhats: TBitBtn;
    OpenDialog1: TOpenDialog;
    Label1: TLabel;
    edtCaminhoImagem: TEdit;
    Label2: TLabel;
    edtNumeroWhats: TEdit;
    btnInserirImagens: TBitBtn;
    btnEnviarMensagens: TBitBtn;
    DBGrid1: TDBGrid;
    conexao: TSQLConnection;
    sdsEnviaWhats: TSQLDataSet;
    dspEnviaWhats: TDataSetProvider;
    cdsEnviaWhats: TClientDataSet;
    dsEnviaWhats: TDataSource;
    DBNavigator1: TDBNavigator;
    edtPesquisarWhats: TEdit;
    Label3: TLabel;
    Inject1: TInject;
    Edit1: TEdit;
    btnTesteEnvioMemo1: TButton;
    Memo1: TMemo;
    Memo2: TMemo;
    edtSleepRandom: TEdit;
    btnSleepRandom: TButton;
    btnTesteEnvioMemo2: TButton;
    Button1: TButton;
    Label4: TLabel;
    edtCaminhoImagem2: TEdit;
    btnInserirImagens2: TBitBtn;
    btnEnviarSomenteMensagens: TBitBtn;
    btnTesteMensagemMemo1: TBitBtn;
    btnTesteMensagemMemo2: TBitBtn;
    procedure edtPesquisarWhatsChange(Sender: TObject);
    procedure btnTesteEnvioMemo1Click(Sender: TObject);
    procedure btnAbrirWhatsClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure btnEnviarMensagensClick(Sender: TObject);
    procedure btnInserirImagensClick(Sender: TObject);
    procedure btnSleepRandomClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnTesteEnvioMemo2Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnInserirImagens2Click(Sender: TObject);
    procedure btnEnviarSomenteMensagensClick(Sender: TObject);
    procedure btnTesteMensagemMemo1Click(Sender: TObject);
    procedure btnTesteMensagemMemo2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmEnviaWhats: TfrmEnviaWhats;

implementation

{$R *.dfm}

Function ParouImpar(num : integer): string;
begin
If Num mod 2 = 0 then
result:= 'Par'
else
Result:= '�mpar';
end;

procedure TfrmEnviaWhats.btnAbrirWhatsClick(Sender: TObject);
begin
  if not Inject1.Auth(false) then
  begin
    Inject1.FormQrCodeType := TFormQrCodeType(Rdb_FormaConexao.ItemIndex);
    Inject1.FormQrCodeStart;
  end;

  if not Inject1.FormQrCodeShowing then
     Inject1.FormQrCodeShowing := True;

end;

procedure TfrmEnviaWhats.btnEnviarMensagensClick(Sender: TObject);
begin

  cdsEnviaWhats.First;
    while not cdsEnviaWhats.Eof do
      if (cdsEnviaWhats.FieldByName('VF_RECPUBLICIDADE').AsString = 'N') then
         begin
            cdsEnviaWhats.Next;
         end
      else
        begin
          if ((cdsEnviaWhats.FieldByName('VF_ID').AsInteger mod 2) = 0) then
              begin
                  //btnSleepRandom.Click;
                  //btnAbrirWhatsClick(sender);
                  //Sleep(StrToInt(edtSleepRandom.Text));
                  Inject1.SendFile(cdsEnviaWhats.FieldByName('VF_WHATS').AsString, edtCaminhoImagem.Text, Memo1.Text);

              end
              else
              begin
                  //btnSleepRandom.Click;
                  //btnAbrirWhatsClick(sender);
                  //Sleep(StrToInt(edtSleepRandom.Text));
                  Inject1.SendFile(cdsEnviaWhats.FieldByName('VF_WHATS').AsString, edtCaminhoImagem2.Text, Memo2.Text);

              end;
      Sleep(1000);
      btnSleepRandom.Click;
      Sleep(StrToInt(edtSleepRandom.Text));
      cdsEnviaWhats.Edit;
      cdsEnviaWhats.FieldByName('VF_ENVIADO').AsString := 'S';
      cdsEnviaWhats.Post;
      cdsEnviaWhats.ApplyUpdates(0);

      cdsEnviaWhats.Next;
      Application.ProcessMessages;
end;
end;





procedure TfrmEnviaWhats.btnEnviarSomenteMensagensClick(Sender: TObject);
begin

  cdsEnviaWhats.First;
    while not cdsEnviaWhats.Eof do
      if (cdsEnviaWhats.FieldByName('VF_RECPUBLICIDADE').AsString = 'N') then
         begin
            cdsEnviaWhats.Next;
         end
      else
        begin
          if ((cdsEnviaWhats.FieldByName('VF_ID').AsInteger mod 2) = 0) then
              begin
                  //btnSleepRandom.Click;
                  //btnAbrirWhatsClick(sender);
                  //Sleep(StrToInt(edtSleepRandom.Text));
                  Inject1.Send(cdsEnviaWhats.FieldByName('VF_WHATS').AsString, Memo1.Text);

              end
              else
              begin
                  //btnSleepRandom.Click;
                  //btnAbrirWhatsClick(sender);
                  //Sleep(StrToInt(edtSleepRandom.Text));
                  Inject1.Send(cdsEnviaWhats.FieldByName('VF_WHATS').AsString, Memo2.Text);

              end;
      Sleep(1000);
      btnSleepRandom.Click;
      Sleep(StrToInt(edtSleepRandom.Text));
      cdsEnviaWhats.Edit;
      cdsEnviaWhats.FieldByName('VF_ENVIADO').AsString := 'S';
      cdsEnviaWhats.Post;
      cdsEnviaWhats.ApplyUpdates(0);

      cdsEnviaWhats.Next;
      Application.ProcessMessages;
end;
end;

procedure TfrmEnviaWhats.btnInserirImagens2Click(Sender: TObject);
begin
if OpenDialog1.Execute then
  begin
    edtCaminhoImagem2.Text := OpenDialog1.FileName;
  end;
end;

procedure TfrmEnviaWhats.btnInserirImagensClick(Sender: TObject);
begin
if OpenDialog1.Execute then
  begin
    edtCaminhoImagem.Text := OpenDialog1.FileName;
  end;
end;

procedure TfrmEnviaWhats.btnTesteEnvioMemo1Click(Sender: TObject);
begin
Inject1.SendFile(edtNumeroWhats.Text, edtCaminhoImagem.Text, Memo1.Text);
//btnSleepRandom.Click;
//ShowMessage (ParouImpar(strtoint(edit1.text)));
end;

procedure TfrmEnviaWhats.btnTesteEnvioMemo2Click(Sender: TObject);
begin
Inject1.SendFile(edtNumeroWhats.Text, edtCaminhoImagem2.Text, Memo2.Text);
end;

procedure TfrmEnviaWhats.btnTesteMensagemMemo1Click(Sender: TObject);
begin
Inject1.Send(edtNumeroWhats.Text, Memo1.Text);
end;

procedure TfrmEnviaWhats.btnTesteMensagemMemo2Click(Sender: TObject);
begin
Inject1.Send(edtNumeroWhats.Text, Memo2.Text);
end;

procedure TfrmEnviaWhats.Button1Click(Sender: TObject);
begin
  cdsEnviaWhats.First;
  while not cdsEnviaWhats.Eof do
    begin
      btnSleepRandom.Click;
      Sleep(2000);
      cdsEnviaWhats.Next;
      Application.ProcessMessages;
    end;

end;

procedure TfrmEnviaWhats.btnSleepRandomClick(Sender: TObject);
var temp:string;
    cont:integer;
begin
  temp:='';
  for cont:=1 to 4 do begin
    temp:=temp+IntToStr(random(9));
    while temp[1]='0' do temp:=IntToStr(random(9));
  end;
  edtSleepRandom.Text:=temp;
end;

procedure TfrmEnviaWhats.edtPesquisarWhatsChange(Sender: TObject);
begin
  sdsEnviaWhats.Close;
    with cdsEnviaWhats do
       begin
          Close;
          CommandText := 'SELECT * FROM VENDASFONE WHERE VF_WHATS = ' + QuotedStr(edtPesquisarWhats.Text);
          Open;
      end;
  sdsEnviaWhats.Open;


end;

procedure TfrmEnviaWhats.FormClose(Sender: TObject; var Action: TCloseAction);
begin
Action := caFree;
end;

procedure TfrmEnviaWhats.FormCreate(Sender: TObject);
var
  I: Integer;

begin
  ReportMemoryLeaksOnShutdown  := false;
  GlobalCEFApp.LogConsoleActive := true;
end;

procedure TfrmEnviaWhats.FormDestroy(Sender: TObject);
begin
  frmEnviaWhats := nil;
  FrmConsole := nil;
end;

procedure TfrmEnviaWhats.FormShow(Sender: TObject);
begin
  btnSleepRandom.Click;
end;

end.
