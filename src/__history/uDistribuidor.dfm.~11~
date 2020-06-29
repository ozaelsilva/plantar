inherited frmDistribuidor: TfrmDistribuidor
  Caption = 'frmDistribuidor'
  PixelsPerInch = 96
  TextHeight = 13
  inherited pgPrincipal: TPageControl
    inherited tbBrowser: TTabSheet
      inherited DBGrid1: TDBGrid
        Columns = <
          item
            Expanded = False
            FieldName = 'CNPJ'
            Width = 129
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NOME'
            Title.Caption = 'Nome'
            Width = 454
            Visible = True
          end>
      end
    end
    inherited tbCadastro: TTabSheet
      object lbl_cnpj: TLabel
        Left = 9
        Top = 10
        Width = 33
        Height = 13
        Caption = 'C'#243'digo'
      end
      object lbl_Nome: TLabel
        Left = 9
        Top = 58
        Width = 27
        Height = 13
        Caption = 'Nome'
      end
      object edt_Nome: TDBEdit
        Left = 9
        Top = 77
        Width = 664
        Height = 21
        CharCase = ecUpperCase
        DataField = 'NOME'
        DataSource = dsPrincipal
        TabOrder = 1
      end
      object edt_Cnpj: TDBEdit
        Left = 9
        Top = 29
        Width = 121
        Height = 21
        CharCase = ecUpperCase
        DataField = 'CNPJ'
        DataSource = dsPrincipal
        TabOrder = 0
      end
    end
  end
  inherited ActionList1: TActionList
    inherited act_pesquisar: TAction
      OnExecute = act_pesquisarExecute
    end
  end
  inherited cdsPrincipal: TClientDataSet
    AfterInsert = cdsPrincipalAfterInsert
    object cdsPrincipalDISTRIBUIDOR_ID: TIntegerField
      FieldName = 'DISTRIBUIDOR_ID'
      Required = True
    end
    object cdsPrincipalCNPJ: TStringField
      FieldName = 'CNPJ'
      Required = True
      EditMask = '99.999.999/9999-99;0;_'
      Size = 16
    end
    object cdsPrincipalNOME: TStringField
      FieldName = 'NOME'
      Required = True
      Size = 100
    end
  end
  inherited QryPrincipal: TSQLQuery
    SQL.Strings = (
      'SELECT * FROM distribuidor')
    object QryPrincipalDISTRIBUIDOR_ID: TIntegerField
      FieldName = 'DISTRIBUIDOR_ID'
      Required = True
    end
    object QryPrincipalCNPJ: TStringField
      FieldName = 'CNPJ'
      Required = True
      Size = 16
    end
    object QryPrincipalNOME: TStringField
      FieldName = 'NOME'
      Required = True
      Size = 100
    end
  end
end
