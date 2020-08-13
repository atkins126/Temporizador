program Temporizador;

uses
  Vcl.Forms,
  Principal in 'Principal.pas' {FPrinc},
  PantAviso in 'PantAviso.pas' {FPntAviso},
  UtilesTemp in 'UtilesTemp.pas',
  Acerca in 'Acerca.pas' {FAcerca},
  Vcl.Themes,
  Vcl.Styles;

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  TStyleManager.TrySetStyle('Glossy');
  Application.Title := 'Temporizador 1.0';
  Application.CreateForm(TFPrinc, FPrinc);
  Application.Run;
end.
