inherited frmPesquisaGeral: TfrmPesquisaGeral
  Caption = 'frmPesquisaGeral'
  PixelsPerInch = 96
  TextHeight = 13
  inherited qryPesquisa: TSQLQuery
    MaxBlobSize = -1
    SQLConnection = dmPrincipal.SQLConnection1
  end
end
