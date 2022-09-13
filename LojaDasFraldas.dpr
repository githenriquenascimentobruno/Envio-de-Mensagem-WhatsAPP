program LojaDasFraldas;

uses
  Vcl.Forms,
  uTInject.ConfigCEF,
  u_Principal in 'u_Principal.pas' {frmPrincipal},
  u_WhatsApp in 'u_WhatsApp.pas' {frmEnviaWhats},
  u_ImportaCsv in 'u_ImportaCsv.pas' {frmImportarCsv};

{$R *.res}

begin
  If not GlobalCEFApp.StartMainProcess then
     Exit;
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.CreateForm(TfrmEnviaWhats, frmEnviaWhats);
  Application.CreateForm(TfrmImportarCsv, frmImportarCsv);
  Application.Run;
end.
