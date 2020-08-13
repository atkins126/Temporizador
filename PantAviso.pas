unit PantAviso;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls,
  EsLabel, EsMarque, RzBorder, Vcl.ExtCtrls, UtilesTemp, Vcl.ComCtrls,
  RzEdit;

type
  TFPntAviso = class(TForm)
    Panel1: TPanel;
    Button1: TButton;
    ScrlMarquee: TEsScrollingMarquee;
    Timer: TTimer;
    GBMensaje: TGroupBox;
    RchEMensaje: TRzRichEdit;
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure TimerTimer(Sender: TObject);
  private
    { Private declarations }
    procedure RectRndForm;
  public
    { Public declarations }
  end;

var
  FPntAviso: TFPntAviso;

implementation

{$R *.dfm}

procedure TFPntAviso.RectRndForm;
var
  Reg: HRgn;
begin
  Reg:=Winapi.Windows.CreateRoundRectRgn(0,0,ClientWidth,ClientHeight,50,50);
  SetWindowRgn(Handle, Reg, True);
end;

procedure TFPntAviso.TimerTimer(Sender: TObject);
begin
  AlphaBlendValue:=AlphaBlendValue+1;
  Timer.Enabled:=AlphaBlendValue<255;
end;

procedure TFPntAviso.Button1Click(Sender: TObject);
begin
  Close;
end;

procedure TFPntAviso.FormCreate(Sender: TObject);
begin
  ScrlMarquee.Caption:='¡¡ ATENCIÓN !!';
  ScrlMarquee.Active:=true;
  RchEMensaje.Text:=Alarma.Mensaje;
end;

procedure TFPntAviso.FormShow(Sender: TObject);
begin
  RectRndForm;
end;

end.
