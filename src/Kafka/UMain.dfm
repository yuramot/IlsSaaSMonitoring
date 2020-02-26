object Form3: TForm3
  Left = 0
  Top = 0
  Caption = 'Form3'
  ClientHeight = 637
  ClientWidth = 1081
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 1081
    Height = 137
    Align = alTop
    TabOrder = 0
    object Label1: TLabel
      Left = 8
      Top = 59
      Width = 73
      Height = 13
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'Start offset'
    end
    object Label2: TLabel
      Left = 8
      Top = 86
      Width = 73
      Height = 13
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'Count'
    end
    object Label4: TLabel
      Left = 8
      Top = 6
      Width = 73
      Height = 13
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'bootstrap'
    end
    object Label5: TLabel
      Left = 343
      Top = 6
      Width = 73
      Height = 13
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'topic'
    end
    object edtStartOffset: TEdit
      Left = 87
      Top = 56
      Width = 121
      Height = 21
      TabOrder = 0
      Text = '0'
    end
    object edtCount: TEdit
      Left = 87
      Top = 83
      Width = 121
      Height = 21
      TabOrder = 1
      Text = '1000000'
    end
    object Button1: TButton
      Left = 232
      Top = 30
      Width = 75
      Height = 25
      Caption = 'Get'
      TabOrder = 2
      OnClick = Button1Click
    end
    object edtBootstrap: TEdit
      Left = 87
      Top = 5
      Width = 266
      Height = 21
      TabOrder = 3
      Text = '95.163.77.84:9092'
    end
    object edtTopic: TEdit
      Left = 422
      Top = 3
      Width = 121
      Height = 21
      TabOrder = 4
      Text = 'device-pool'
    end
  end
  object Memo1: TMemo
    Left = 0
    Top = 137
    Width = 1081
    Height = 483
    Align = alClient
    ScrollBars = ssBoth
    TabOrder = 1
  end
  object ProgressBar1: TProgressBar
    Left = 0
    Top = 620
    Width = 1081
    Height = 17
    Align = alBottom
    TabOrder = 2
  end
end
