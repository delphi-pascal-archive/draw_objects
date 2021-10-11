object ObjInspectForm: TObjInspectForm
  Left = 555
  Top = 182
  BorderIcons = [biSystemMenu]
  BorderStyle = bsToolWindow
  Caption = 'Object Inspector'
  ClientHeight = 705
  ClientWidth = 363
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -15
  Font.Name = 'Arial'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnDeactivate = FormDeactivate
  PixelsPerInch = 120
  TextHeight = 17
  object pnlTop: TPanel
    Left = 0
    Top = 0
    Width = 363
    Height = 41
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 1
    object eComponentInfo: TEdit
      Left = 9
      Top = 7
      Width = 264
      Height = 23
      TabStop = False
      ReadOnly = True
      TabOrder = 0
    end
    object btnClose: TButton
      Left = 283
      Top = 7
      Width = 68
      Height = 26
      Caption = '&Close'
      TabOrder = 1
      OnClick = btnCloseClick
    end
  end
  object vle: TValueListEditor
    Left = 0
    Top = 41
    Width = 363
    Height = 656
    Align = alClient
    Color = clBtnFace
    DefaultColWidth = 160
    DefaultRowHeight = 19
    DisplayOptions = [doAutoColResize, doKeyColFixed]
    FixedCols = 1
    TabOrder = 0
    OnEditButtonClick = vleEditButtonClick
    OnKeyPress = vleKeyPress
    OnSetEditText = vleSetEditText
    OnValidate = vleValidate
    ColWidths = (
      160
      154)
  end
  object pnlBottom: TPanel
    Left = 0
    Top = 697
    Width = 363
    Height = 8
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 2
  end
  object FontDialog1: TFontDialog
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    Left = 24
    Top = 80
  end
  object ColorDialog1: TColorDialog
    Left = 24
    Top = 112
  end
end
