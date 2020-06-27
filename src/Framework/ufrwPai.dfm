object frwPai: TfrwPai
  Left = 0
  Top = 0
  Caption = 'frwPai'
  ClientHeight = 290
  ClientWidth = 524
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object stb_Principal: TStatusBar
    Left = 0
    Top = 271
    Width = 524
    Height = 19
    Panels = <
      item
        Width = 250
      end
      item
        Width = 50
      end>
    ExplicitTop = 337
    ExplicitWidth = 618
  end
  object Timer1: TTimer
    Interval = 10
    OnTimer = Timer1Timer
    Left = 320
    Top = 104
  end
end
