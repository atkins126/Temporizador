object FPntAviso: TFPntAviso
  Left = 0
  Top = 0
  AlphaBlend = True
  AlphaBlendValue = 0
  BorderIcons = []
  BorderStyle = bsNone
  ClientHeight = 501
  ClientWidth = 827
  Color = clYellow
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  FormStyle = fsStayOnTop
  OldCreateOrder = False
  Position = poScreenCenter
  StyleElements = []
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 827
    Height = 501
    Align = alClient
    TabOrder = 0
    object ScrlMarquee: TEsScrollingMarquee
      Left = 1
      Top = 1
      Width = 825
      Height = 81
      Align = alTop
      Alignment = taCenter
      Appearance = apFlying
      Behavior = bhBounce
      Caption = 'Atenci'#243'n !!'
      Color = clYellow
      ColorScheme = csCustom
      CustomSettings.HighlightColor = clBlack
      CustomSettings.HighlightDirection = sdDownRight
      CustomSettings.ShadowDepth = 5
      Font.Charset = ANSI_CHARSET
      Font.Color = clRed
      Font.Height = -64
      Font.Name = 'Stencil'
      Font.Style = []
      ParentColor = False
      ParentFont = False
      ScrollSpeed = 5
      ExplicitLeft = 2
      ExplicitTop = -3
    end
    object Button1: TButton
      Left = 369
      Top = 449
      Width = 89
      Height = 35
      Cancel = True
      Caption = 'Aceptar'
      TabOrder = 0
      OnClick = Button1Click
    end
    object GBMensaje: TGroupBox
      Left = 17
      Top = 88
      Width = 793
      Height = 345
      Enabled = False
      TabOrder = 1
      object RchEMensaje: TRzRichEdit
        Left = 20
        Top = 20
        Width = 753
        Height = 305
        Alignment = taCenter
        Color = clInfoBk
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -59
        Font.Name = 'Lucida Sans'
        Font.Style = [fsBold]
        ParentFont = False
        ReadOnly = True
        TabOrder = 0
        Zoom = 100
        DisabledColor = clInfoBk
      end
    end
  end
  object Timer: TTimer
    Interval = 1
    OnTimer = TimerTimer
    Left = 424
    Top = 16
  end
  object TimerSnd: TTimer
    Enabled = False
    Interval = 300
    OnTimer = TimerSndTimer
    Left = 568
    Top = 16
  end
end
