unit Principal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons,
  Vcl.Mask, RzEdit, RzSpnEdt, Vcl.ExtCtrls, UtilesTemp, RzBorder,
  System.ImageList, Vcl.ImgList, Vcl.Menus;

type
  TFPrinc = class(TForm)
    GBTexto: TGroupBox;
    MmMensaje: TMemo;
    SBIniciar: TSpeedButton;
    GBTiempo: TGroupBox;
    SpEdHoras: TRzSpinEdit;
    SpEdMinutos: TRzSpinEdit;
    SpEdSegundos: TRzSpinEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    SBReiniciar: TSpeedButton;
    TrayIcon: TTrayIcon;
    Timer: TTimer;
    SBPausar: TSpeedButton;
    LEDDisplay: TRzLEDDisplay;
    SBSalir: TSpeedButton;
    ImageList: TImageList;
    PpMenu: TPopupMenu;
    Salir1: TMenuItem;
    Mostrarventana1: TMenuItem;
    N1: TMenuItem;
    SBAcerca: TSpeedButton;
    AcercadeTemporizador1: TMenuItem;
    N2: TMenuItem;
    procedure SBPausarClick(Sender: TObject);
    procedure SBIniciarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure SpEdHorasChange(Sender: TObject);
    procedure SBReiniciarClick(Sender: TObject);
    procedure TimerTimer(Sender: TObject);
    procedure SBSalirClick(Sender: TObject);
    procedure MmMensajeChange(Sender: TObject);
    procedure Mostrarventana1Click(Sender: TObject);
    procedure SBAcercaClick(Sender: TObject);
    procedure TrayIconAnimate(Sender: TObject);
  private
    procedure ValInicio;
    procedure VentanaActiva(Opcion: boolean);
  public
    { Public declarations }
  end;

var
  FPrinc: TFPrinc;

implementation

{$R *.dfm}

uses PantAviso,Acerca;

procedure TFPrinc.ValInicio;
begin
  Alarma.Horas:=0;
  Alarma.Minutos:=0;
  Alarma.Segundos:=0;
  Alarma.TiempoSeg:=0;
  Alarma.Mensaje:='';
  //componentes:
  SpEdHoras.Value:=0;
  SpEdMinutos.Value:=0;
  SpEdSegundos.Value:=0;
  LEDDisplay.Caption:='00:00:00';
  TrayIcon.Hint:='00:00:00';
  Timer.Enabled:=false;
  SBIniciar.Enabled:=false;
  SBPausar.Enabled:=false;
  GBTiempo.Enabled:=true;
  GBTexto.Enabled:=true;
  MmMensaje.Clear;
  MmMensaje.SetFocus;
end;

procedure TFPrinc.VentanaActiva(Opcion: boolean);
begin
  AlphaBlend:=not Opcion;
  if Opcion then WindowState:=wsNormal
            else WindowState:=wsMinimized;
end;

procedure TFPrinc.FormShow(Sender: TObject);
begin
  ValInicio;
end;

procedure TFPrinc.MmMensajeChange(Sender: TObject);
begin
  SBIniciar.Enabled:=(Trim(MmMensaje.Text)<>'') and
    ((Alarma.Horas>0) or (Alarma.Minutos>0) or (Alarma.Segundos>0));
end;

procedure TFPrinc.Mostrarventana1Click(Sender: TObject);
begin
  VentanaActiva(true);
end;

procedure TFPrinc.SBIniciarClick(Sender: TObject);
begin
  Alarma.Mensaje:=MmMensaje.Text;
  Alarma.TiempoSeg:=Trunc((SpEdHoras.Value*3600)+(SpEdMinutos.Value*60)+
                          (SpEdSegundos.Value));
  GBTexto.Enabled:=false;
  SBIniciar.Enabled:=false;
  SBPausar.Enabled:=true;
  GBTiempo.Enabled:=false;
  Timer.Enabled:=true;
  TrayIcon.Animate:=true;
  Sleep(2000);
  VentanaActiva(false);
end;

procedure TFPrinc.SBPausarClick(Sender: TObject);
begin
  Timer.Enabled:=not Timer.Enabled;
  if Timer.Enabled then SBPausar.Caption:='Pausar'
                   else SBPausar.Caption:='Reanudar'
end;

procedure TFPrinc.SBReiniciarClick(Sender: TObject);
begin
  ValInicio;
end;

procedure TFPrinc.SBAcercaClick(Sender: TObject);
begin
  MostrarVentana(TFAcerca,bsSingle);
end;

procedure TFPrinc.SBSalirClick(Sender: TObject);
begin
  Application.Terminate;
end;

procedure TFPrinc.SpEdHorasChange(Sender: TObject);
begin
  Alarma.Horas:=Trunc(SpEdHoras.Value);
  Alarma.Minutos:=Trunc(SpEdMinutos.Value);
  Alarma.Segundos:=Trunc(SpEdSegundos.Value);
  LEDDisplay.Caption:=CadCrono(Alarma.Horas,Alarma.Minutos,Alarma.Segundos);
  MmMensajeChange(Self);
end;

procedure TFPrinc.TimerTimer(Sender: TObject);
begin
  Alarma.TiempoSeg:=Alarma.TiempoSeg-1;
  LEDDisplay.Caption:=SegundosAFormatoHora(Alarma.TiempoSeg);
  if Alarma.TiempoSeg=0 then
  begin
    Timer.Enabled:=false;
    TrayIcon.Animate:=false;
    ShowHint:=false;
    SBPausar.Enabled:=false;
    SBIniciar.Enabled:=true;
    GBTexto.Enabled:=true;
    MostrarVentana(TFPntAviso,bsNone);
    VentanaActiva(true);
  end;
end;

procedure TFPrinc.TrayIconAnimate(Sender: TObject);
begin
  TrayIcon.Hint:=LEDDisplay.Caption;
end;

end.
