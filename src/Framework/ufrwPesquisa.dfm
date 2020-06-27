object frwPesquisa: TfrwPesquisa
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  Caption = 'frwPesquisa'
  ClientHeight = 300
  ClientWidth = 484
  Color = clBtnFace
  Constraints.MaxHeight = 500
  Constraints.MaxWidth = 600
  Constraints.MinHeight = 300
  Constraints.MinWidth = 500
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 484
    Height = 41
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 0
    object edt_Pesquisa: TEdit
      Left = 110
      Top = 10
      Width = 264
      Height = 21
      CharCase = ecUpperCase
      TabOrder = 0
      OnKeyPress = edt_PesquisaKeyPress
    end
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 281
    Width = 484
    Height = 19
    Panels = <
      item
        Width = 150
      end
      item
        Text = 'Clique 2 vezes no grid ou tecle <enter> para selecionar'
        Width = 50
      end>
  end
  object DBGrid2: TDBGrid
    Left = 0
    Top = 41
    Width = 484
    Height = 240
    Align = alClient
    Color = clMoneyGreen
    DataSource = dsPesquisa
    GradientStartColor = clSkyBlue
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
    TabOrder = 2
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    OnDblClick = DBGrid2DblClick
    OnKeyPress = DBGrid2KeyPress
  end
  object qryPesquisa: TSQLQuery
    Params = <>
    Left = 104
    Top = 208
  end
  object dspPesquisa: TDataSetProvider
    DataSet = qryPesquisa
    Left = 160
    Top = 208
  end
  object cdsPesquisa: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspPesquisa'
    Left = 232
    Top = 208
  end
  object dsPesquisa: TDataSource
    AutoEdit = False
    DataSet = cdsPesquisa
    Left = 304
    Top = 208
  end
end
