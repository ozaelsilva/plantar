inherited frmNegociacao: TfrmNegociacao
  Caption = 'frmNegociacao'
  ClientHeight = 440
  ClientWidth = 706
  ExplicitWidth = 712
  ExplicitHeight = 469
  PixelsPerInch = 96
  TextHeight = 13
  inherited stb_Principal: TStatusBar
    Top = 421
    Width = 706
  end
  inherited pgPrincipal: TPageControl
    Width = 706
    Height = 371
    ActivePage = tbCadastro
    inherited tbBrowser: TTabSheet
      ExplicitLeft = 4
      ExplicitTop = 24
      ExplicitWidth = 686
      ExplicitHeight = 291
      inherited DBGrid1: TDBGrid
        Top = 129
        Width = 698
        Height = 214
        Columns = <
          item
            Expanded = False
            FieldName = 'CODIGO'
            Title.Caption = 'C'#243'digo'
            Width = 80
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'nome_produtor'
            Title.Caption = 'Nome Produtor'
            Width = 214
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'nome_distribuidor'
            Title.Caption = 'Nome Distribuidor'
            Width = 189
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'VLR_TOTAL'
            Title.Caption = 'Vlr. Total'
            Width = 92
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'STATUS'
            Title.Caption = 'Status'
            Visible = True
          end>
      end
      inherited gBox_Pesquisa: TGroupBox
        Width = 698
        Height = 129
        ExplicitHeight = 129
        inherited lbl_PesqCodigo: TLabel
          Left = 57
          ExplicitLeft = 57
        end
        inherited lbl_PesqDescricao: TLabel
          Left = 18
          Width = 72
          Alignment = taRightJustify
          Caption = 'Nome Produtor'
          ExplicitLeft = 18
          ExplicitWidth = 72
        end
        object Label1: TLabel [2]
          Left = 6
          Top = 86
          Width = 84
          Height = 13
          Caption = 'Nome Distribuidor'
        end
        inherited edt_PesqCodigo: TEdit
          Left = 96
          ExplicitLeft = 96
        end
        inherited edt_PesqDescricao: TEdit
          Left = 96
          ExplicitLeft = 96
        end
        object edt_PesqNomeDistribuidor: TEdit
          Left = 96
          Top = 83
          Width = 225
          Height = 21
          CharCase = ecUpperCase
          TabOrder = 4
        end
      end
    end
    inherited tbCadastro: TTabSheet
      ExplicitLeft = 4
      ExplicitTop = 24
      ExplicitWidth = 686
      ExplicitHeight = 291
      object lbl_codigo: TLabel
        Left = 9
        Top = 10
        Width = 33
        Height = 13
        Caption = 'C'#243'digo'
      end
      object lbl_SaldoProdutor: TLabel
        Left = 144
        Top = 235
        Width = 71
        Height = 13
        Caption = 'Saldo Produtor'
      end
      object lbl_DataCadastro: TLabel
        Left = 9
        Top = 187
        Width = 70
        Height = 13
        Caption = 'Data Cadastro'
      end
      object lbl_DataAprovacao: TLabel
        Left = 144
        Top = 187
        Width = 78
        Height = 13
        Caption = 'Data Aprova'#231#227'o'
      end
      object lbl_DataCancelamento: TLabel
        Left = 280
        Top = 187
        Width = 94
        Height = 13
        Caption = 'Data Cancelamento'
      end
      object lbl_DataConclusao: TLabel
        Left = 416
        Top = 187
        Width = 75
        Height = 13
        Caption = 'Data Conclus'#227'o'
      end
      object lbl_VlrTotal: TLabel
        Left = 9
        Top = 235
        Width = 43
        Height = 13
        Caption = 'Vlr. Total'
      end
      object lbl_Status: TLabel
        Left = 280
        Top = 235
        Width = 31
        Height = 13
        Caption = 'Status'
      end
      object edt_vlr_sado: TDBEdit
        Left = 144
        Top = 254
        Width = 121
        Height = 21
        CharCase = ecUpperCase
        DataField = 'VlrSaldoProdutor'
        DataSource = dsPrincipal
        ReadOnly = True
        TabOrder = 0
      end
      object edt_Codigo: TDBEdit
        Left = 9
        Top = 29
        Width = 121
        Height = 21
        CharCase = ecUpperCase
        DataField = 'CODIGO'
        DataSource = dsPrincipal
        Enabled = False
        TabOrder = 1
      end
      object gBox_Produtor: TGroupBox
        Left = 9
        Top = 56
        Width = 528
        Height = 60
        Hint = 'Por Compet'#234'ncia'
        Caption = 'Produtor '
        TabOrder = 2
        object lbl_DescProdutor: TLabel
          Left = 171
          Top = 13
          Width = 72
          Height = 13
          Caption = 'Nome Produtor'
        end
        object lbl_CodProdutor: TLabel
          Left = 12
          Top = 13
          Width = 51
          Height = 13
          Caption = 'CPF/ CNPJ'
        end
        object spb_Produtor: TSpeedButton
          Left = 144
          Top = 26
          Width = 23
          Height = 22
          Glyph.Data = {
            36030000424D3603000000000000360000002800000010000000100000000100
            18000000000000030000120B0000120B00000000000000000000FF00FF4A667C
            BE9596FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
            FFFF00FFFF00FFFF00FF6B9CC31E89E84B7AA3C89693FF00FFFF00FFFF00FFFF
            00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF4BB4FE51B5FF
            2089E94B7AA2C69592FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
            FFFF00FFFF00FFFF00FFFF00FF51B7FE51B3FF1D87E64E7AA0CA9792FF00FFFF
            00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
            51B7FE4EB2FF1F89E64E7BA2B99497FF00FFFF00FFFF00FFFF00FFFF00FFFF00
            FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF52B8FE4BB1FF2787D95F6A76FF
            00FFB0857FC09F94C09F96BC988EFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
            FF00FFFF00FF55BDFFB5D6EDBF9D92BB9B8CE7DAC2FFFFE3FFFFE5FDFADAD8C3
            B3B58D85FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFCEA795FD
            EEBEFFFFD8FFFFDAFFFFDBFFFFE6FFFFFBEADDDCAE837FFF00FFFF00FFFF00FF
            FF00FFFF00FFFF00FFFF00FFC1A091FBDCA8FEF7D0FFFFDBFFFFE3FFFFF8FFFF
            FDFFFFFDC6A99CFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFC1A091FEE3ACF1
            C491FCF2CAFFFFDDFFFFE4FFFFF7FFFFF7FFFFE9EEE5CBB9948CFF00FFFF00FF
            FF00FFFF00FFFF00FFC2A191FFE6AEEEB581F7DCAEFEFDD8FFFFDFFFFFE3FFFF
            E4FFFFE0F3ECD2BB968EFF00FFFF00FFFF00FFFF00FFFF00FFBC978CFBE7B7F4
            C791F2C994F8E5B9FEFCD8FFFFDDFFFFDCFFFFE0E2D2BAB68E86FF00FFFF00FF
            FF00FFFF00FFFF00FFFF00FFD9C3A9FFFEE5F7DCB8F2C994F5D4A5FAE8BDFDF4
            C9FDFBD6B69089FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFB58D85E8
            DEDDFFFEF2F9D8A3F4C48CF9D49FFDEAB8D0B49FB89086FF00FFFF00FFFF00FF
            FF00FFFF00FFFF00FFFF00FFFF00FFAD827FC9AA9EEFE0B7EFDFB2E7CEACB890
            86B89086FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
            00FFFF00FFBA968ABB988CB79188FF00FFFF00FFFF00FFFF00FF}
          OnClick = spb_ProdutorClick
        end
        object edt_DescProdutor: TDBEdit
          Left = 171
          Top = 27
          Width = 347
          Height = 21
          Color = clBtnFace
          DataField = 'nome_produtor'
          DataSource = dsPrincipal
          Enabled = False
          TabOrder = 2
        end
        object edt_CodProdutor: TDBEdit
          Left = 12
          Top = 27
          Width = 126
          Height = 21
          DataField = 'cod_produtor'
          DataSource = dsPrincipal
          TabOrder = 0
          OnEnter = edt_CodProdutorEnter
          OnExit = edt_CodProdutorExit
          OnKeyDown = edt_CodProdutorKeyDown
        end
        object edt_IDProdutor: TDBEdit
          Left = 469
          Top = 27
          Width = 49
          Height = 21
          Color = clBtnFace
          DataField = 'PRODUTOR_ID'
          DataSource = dsPrincipal
          Enabled = False
          TabOrder = 1
          Visible = False
        end
      end
      object edt_Datacadastro: TDBEdit
        Left = 9
        Top = 206
        Width = 121
        Height = 21
        CharCase = ecUpperCase
        DataField = 'DATA_CADASTRO'
        DataSource = dsPrincipal
        ReadOnly = True
        TabOrder = 3
      end
      object edt_DataAprovacao: TDBEdit
        Left = 144
        Top = 206
        Width = 121
        Height = 21
        CharCase = ecUpperCase
        DataField = 'DATA_APROVACAO'
        DataSource = dsPrincipal
        ReadOnly = True
        TabOrder = 4
      end
      object edt_DataCancelamento: TDBEdit
        Left = 280
        Top = 206
        Width = 121
        Height = 21
        CharCase = ecUpperCase
        DataField = 'DATA_CANCELAMENTO'
        DataSource = dsPrincipal
        ReadOnly = True
        TabOrder = 5
      end
      object edt_DataConclusao: TDBEdit
        Left = 416
        Top = 206
        Width = 121
        Height = 21
        CharCase = ecUpperCase
        DataField = 'DATA_CONCLUSAO'
        DataSource = dsPrincipal
        TabOrder = 6
      end
      object cbox_Status: TDBComboBox
        Left = 280
        Top = 254
        Width = 257
        Height = 21
        Style = csDropDownList
        DataField = 'STATUS'
        DataSource = dsPrincipal
        Items.Strings = (
          'Pendente'
          'Aprovada'
          'Concluir'
          'Cancelada')
        TabOrder = 7
      end
      object edt_VlrTotal: TDBEdit
        Left = 9
        Top = 254
        Width = 121
        Height = 21
        CharCase = ecUpperCase
        DataField = 'VLR_TOTAL'
        DataSource = dsPrincipal
        ReadOnly = True
        TabOrder = 8
      end
      object GroupBox1: TGroupBox
        Left = 9
        Top = 121
        Width = 528
        Height = 60
        Hint = 'Por Compet'#234'ncia'
        Caption = 'Distribuidor '
        TabOrder = 9
        object lbl_DescDistribuidor: TLabel
          Left = 171
          Top = 13
          Width = 84
          Height = 13
          Caption = 'Nome Distribuidor'
        end
        object lbl_CodDistribuidor: TLabel
          Left = 12
          Top = 13
          Width = 25
          Height = 13
          Caption = 'CNPJ'
        end
        object spb_Distribuidor: TSpeedButton
          Left = 144
          Top = 26
          Width = 23
          Height = 22
          Glyph.Data = {
            36030000424D3603000000000000360000002800000010000000100000000100
            18000000000000030000120B0000120B00000000000000000000FF00FF4A667C
            BE9596FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
            FFFF00FFFF00FFFF00FF6B9CC31E89E84B7AA3C89693FF00FFFF00FFFF00FFFF
            00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF4BB4FE51B5FF
            2089E94B7AA2C69592FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
            FFFF00FFFF00FFFF00FFFF00FF51B7FE51B3FF1D87E64E7AA0CA9792FF00FFFF
            00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
            51B7FE4EB2FF1F89E64E7BA2B99497FF00FFFF00FFFF00FFFF00FFFF00FFFF00
            FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF52B8FE4BB1FF2787D95F6A76FF
            00FFB0857FC09F94C09F96BC988EFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
            FF00FFFF00FF55BDFFB5D6EDBF9D92BB9B8CE7DAC2FFFFE3FFFFE5FDFADAD8C3
            B3B58D85FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFCEA795FD
            EEBEFFFFD8FFFFDAFFFFDBFFFFE6FFFFFBEADDDCAE837FFF00FFFF00FFFF00FF
            FF00FFFF00FFFF00FFFF00FFC1A091FBDCA8FEF7D0FFFFDBFFFFE3FFFFF8FFFF
            FDFFFFFDC6A99CFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFC1A091FEE3ACF1
            C491FCF2CAFFFFDDFFFFE4FFFFF7FFFFF7FFFFE9EEE5CBB9948CFF00FFFF00FF
            FF00FFFF00FFFF00FFC2A191FFE6AEEEB581F7DCAEFEFDD8FFFFDFFFFFE3FFFF
            E4FFFFE0F3ECD2BB968EFF00FFFF00FFFF00FFFF00FFFF00FFBC978CFBE7B7F4
            C791F2C994F8E5B9FEFCD8FFFFDDFFFFDCFFFFE0E2D2BAB68E86FF00FFFF00FF
            FF00FFFF00FFFF00FFFF00FFD9C3A9FFFEE5F7DCB8F2C994F5D4A5FAE8BDFDF4
            C9FDFBD6B69089FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFB58D85E8
            DEDDFFFEF2F9D8A3F4C48CF9D49FFDEAB8D0B49FB89086FF00FFFF00FFFF00FF
            FF00FFFF00FFFF00FFFF00FFFF00FFAD827FC9AA9EEFE0B7EFDFB2E7CEACB890
            86B89086FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
            00FFFF00FFBA968ABB988CB79188FF00FFFF00FFFF00FFFF00FF}
          OnClick = spb_DistribuidorClick
        end
        object edt_DescDistribuidor: TDBEdit
          Left = 171
          Top = 27
          Width = 347
          Height = 21
          Color = clBtnFace
          DataField = 'nome_distribuidor'
          DataSource = dsPrincipal
          Enabled = False
          TabOrder = 2
        end
        object edt_CodDistribuidor: TDBEdit
          Left = 12
          Top = 27
          Width = 126
          Height = 21
          DataField = 'cod_distribuidor'
          DataSource = dsPrincipal
          TabOrder = 0
          OnEnter = edt_CodDistribuidorEnter
          OnExit = edt_CodDistribuidorExit
          OnKeyDown = edt_CodDistribuidorKeyDown
        end
        object edt_IdDistribuidor: TDBEdit
          Left = 469
          Top = 27
          Width = 49
          Height = 21
          Color = clBtnFace
          DataField = 'DISTRIBUIDOR_ID'
          DataSource = dsPrincipal
          Enabled = False
          TabOrder = 1
          Visible = False
        end
      end
    end
  end
  inherited Panel1: TPanel
    Top = 371
    Width = 706
  end
  inherited Timer1: TTimer
    Left = 288
    Top = 24
  end
  inherited ActionList1: TActionList
    Left = 232
    Top = 24
    inherited act_pesquisar: TAction
      OnExecute = act_pesquisarExecute
    end
  end
  inherited cdsPrincipal: TClientDataSet
    AfterInsert = cdsPrincipalAfterInsert
    object cdsPrincipalNEGOCIACAO_ID: TIntegerField
      FieldName = 'NEGOCIACAO_ID'
      Required = True
    end
    object cdsPrincipalCODIGO: TIntegerField
      FieldName = 'CODIGO'
      Required = True
    end
    object cdsPrincipalDISTRIBUIDOR_ID: TIntegerField
      FieldName = 'DISTRIBUIDOR_ID'
      Required = True
    end
    object cdsPrincipalPRODUTOR_ID: TIntegerField
      FieldName = 'PRODUTOR_ID'
      Required = True
    end
    object cdsPrincipalVLR_TOTAL: TFMTBCDField
      FieldName = 'VLR_TOTAL'
      Required = True
      DisplayFormat = '#0.00'
      Precision = 18
      Size = 2
    end
    object cdsPrincipalDATA_CADASTRO: TDateField
      FieldName = 'DATA_CADASTRO'
      Required = True
      DisplayFormat = 'dd/mm/yyyy'
      EditMask = '!99/99/0000;1;_'
    end
    object cdsPrincipalDATA_APROVACAO: TDateField
      FieldName = 'DATA_APROVACAO'
      DisplayFormat = 'dd/mm/yyyy'
      EditMask = '!99/99/0000;1;_'
    end
    object cdsPrincipalDATA_CANCELAMENTO: TDateField
      FieldName = 'DATA_CANCELAMENTO'
      DisplayFormat = 'dd/mm/yyyy'
      EditMask = '!99/99/0000;1;_'
    end
    object cdsPrincipalDATA_CONCLUSAO: TDateField
      FieldName = 'DATA_CONCLUSAO'
      Required = True
      DisplayFormat = 'dd/mm/yyyy'
      EditMask = '!99/99/0000;1;_'
    end
    object cdsPrincipalSTATUS: TIntegerField
      FieldName = 'STATUS'
      Required = True
    end
    object cdsPrincipalcod_produtor: TStringField
      FieldName = 'cod_produtor'
      Required = True
      Size = 14
    end
    object cdsPrincipalnome_produtor: TStringField
      FieldName = 'nome_produtor'
      Required = True
      Size = 100
    end
    object cdsPrincipalcod_distribuidor: TStringField
      FieldName = 'cod_distribuidor'
      Required = True
      Size = 16
    end
    object cdsPrincipalnome_distribuidor: TStringField
      FieldName = 'nome_distribuidor'
      Required = True
      Size = 100
    end
    object cdsPrincipalVlrSaldoProdutor: TFloatField
      FieldKind = fkInternalCalc
      FieldName = 'VlrSaldoProdutor'
      DisplayFormat = '#0.00'
    end
  end
  inherited QryPrincipal: TSQLQuery
    SQL.Strings = (
      'SELECT nego.*,'
      '             prod.nome "nome_produtor",'
      '             prod.cpf_cnpj "cod_produtor",'
      '             dist.nome "nome_distribuidor",'
      '             dist.cnpj "cod_distribuidor"'
      'FROM negociacao nego'
      
        'INNER JOIN produtor     prod ON (prod.produtor_id = nego.produto' +
        'r_id) '
      
        'INNER JOIN distribuidor dist ON (dist.distribuidor_id = nego.dis' +
        'tribuidor_id) '
      '')
    object QryPrincipalNEGOCIACAO_ID: TIntegerField
      FieldName = 'NEGOCIACAO_ID'
      Required = True
    end
    object QryPrincipalCODIGO: TIntegerField
      FieldName = 'CODIGO'
      Required = True
    end
    object QryPrincipalDISTRIBUIDOR_ID: TIntegerField
      FieldName = 'DISTRIBUIDOR_ID'
      Required = True
    end
    object QryPrincipalPRODUTOR_ID: TIntegerField
      FieldName = 'PRODUTOR_ID'
      Required = True
    end
    object QryPrincipalVLR_TOTAL: TFMTBCDField
      FieldName = 'VLR_TOTAL'
      Required = True
      Precision = 18
      Size = 2
    end
    object QryPrincipalDATA_CADASTRO: TDateField
      FieldName = 'DATA_CADASTRO'
      Required = True
    end
    object QryPrincipalDATA_APROVACAO: TDateField
      FieldName = 'DATA_APROVACAO'
    end
    object QryPrincipalDATA_CANCELAMENTO: TDateField
      FieldName = 'DATA_CANCELAMENTO'
    end
    object QryPrincipalDATA_CONCLUSAO: TDateField
      FieldName = 'DATA_CONCLUSAO'
      Required = True
    end
    object QryPrincipalSTATUS: TIntegerField
      FieldName = 'STATUS'
      Required = True
    end
    object QryPrincipalcod_produtor: TStringField
      FieldName = 'cod_produtor'
      Required = True
      Size = 14
    end
    object QryPrincipalnome_produtor: TStringField
      FieldName = 'nome_produtor'
      Required = True
      Size = 100
    end
    object QryPrincipalcod_distribuidor: TStringField
      FieldName = 'cod_distribuidor'
      Required = True
      Size = 16
    end
    object QryPrincipalnome_distribuidor: TStringField
      FieldName = 'nome_distribuidor'
      Required = True
      Size = 100
    end
  end
end
