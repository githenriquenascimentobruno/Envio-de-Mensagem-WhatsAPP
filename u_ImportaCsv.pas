unit u_ImportaCsv;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Data.DB, Datasnap.DBClient,
  Vcl.Grids, Vcl.DBGrids, Vcl.ExtCtrls, Math;

type
  TfrmImportarCsv = class(TForm)
    Button1: TButton;
    ClientDataSet1: TClientDataSet;
    ClientDataSet1DESCRICAO: TStringField;
    DBGrid1: TDBGrid;
    DataSource1: TDataSource;
    Panel1: TPanel;
    ClientDataSet1MARCADO: TStringField;
    Button2: TButton;
    ClientDataSet1SELECAO: TIntegerField;
    procedure Button1Click(Sender: TObject);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure DBGrid1DblClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmImportarCsv: TfrmImportarCsv;

implementation

{$R *.dfm}

procedure TfrmImportarCsv.Button1Click(Sender: TObject);
var
  Linhas, Colunas:TStringList;
  i,j:integer;
begin
  Linhas := TStringList.Create;
  Colunas := TStringList.Create;
  try
    Linhas.LoadFromFile('C:\Desenvolvimento\LojaDasFraldas\csv\csv.csv'); //Carregando arquivo
    for i := 0 to Pred(Linhas.Count) do
    begin
      {Transformando os dados das colunas em Linhas}
      Colunas.text := StringReplace(Linhas.Strings[i],';',#13,[rfReplaceAll]);
      for j := 0 to Pred(Colunas.Count) do
      begin
        { Aqui você faz alguma coisa como colocar num Edit
         No Meu caso aqui para exemplificar vou apenas mostrar num ShowMessage}
        {ShowMessage('Valor "'+Colunas.Strings[j] + '" da Linha '+IntTostr(i+1) +
          ' Coluna '+IntToStr(j+1));}
        ClientDataSet1.Insert;
        ClientDataSet1.FieldByName('DESCRICAO').AsString := Colunas.Strings[j];
        ClientDataSet1.Post;
      end;
    end;
  finally
    Linhas.Free;
    Colunas.Free;
  end;

end;

procedure TfrmImportarCsv.DBGrid1DblClick(Sender: TObject);
begin
  if ((Sender as TDBGrid).DataSource.Dataset.IsEmpty) then
    Exit;

  (Sender as TDBGrid).DataSource.Dataset.Edit;

  (Sender as TDBGrid).DataSource.Dataset.FieldByName('SELECAO').AsInteger :=
    Ifthen((Sender as TDBGrid).DataSource.Dataset.FieldByName('SELECAO').AsInteger = 1, 0, 1);

  (Sender as TDBGrid).DataSource.Dataset.Post;
end;

procedure TfrmImportarCsv.DBGrid1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
var
  Check: Integer;
  R: TRect;
begin
  inherited;

  if ((Sender as TDBGrid).DataSource.Dataset.IsEmpty) then
    Exit;

  // Desenha um checkbox no dbgrid
  if Column.FieldName = 'SELECAO' then
  begin
    TDBGrid(Sender).Canvas.FillRect(Rect);

    if ((Sender as TDBGrid).DataSource.Dataset.FieldByName('SELECAO').AsInteger = 1) then
      Check := DFCS_CHECKED
    else
      Check := 0;

    R := Rect;
    InflateRect(R, -2, -2); { Diminue o tamanho do CheckBox }
    DrawFrameControl(TDBGrid(Sender).Canvas.Handle, R, DFC_BUTTON,
      DFCS_BUTTONCHECK or Check);
  end;
  {begin
TDbGrid(Sender).Canvas.font.Color:= clBlack; //aqui é definida a cor da fonte
if gdSelected in State then
with (Sender as TDBGrid).Canvas do
begin
  Brush.Color:=clRed; //aqui é definida a cor do fundo
  FillRect(Rect);
end;

TDbGrid(Sender).DefaultDrawDataCell(Rect, TDbGrid(Sender).columns[datacol].field, State);}
end;




end.
