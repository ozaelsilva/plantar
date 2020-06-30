unit uNegociacao;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, ufrwCadastro, Data.DB, Data.FMTBcd,
  Data.SqlExpr, Datasnap.Provider, Datasnap.DBClient, System.Actions,
  Vcl.ActnList, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.Buttons, Vcl.Grids, Vcl.DBGrids,
  Vcl.ComCtrls, Vcl.Mask, Vcl.DBCtrls, frxClass, frxDBSet, System.ImageList,
  Vcl.ImgList;

type
  TPesquisa = (pProdutor, pDistribuidor, pProduto);

  TfrmNegociacao = class(TfrwCadastro)
    lbl_codigo: TLabel;
    edt_Codigo: TDBEdit;
    QryPrincipalNEGOCIACAO_ID: TIntegerField;
    QryPrincipalCODIGO: TIntegerField;
    QryPrincipalDISTRIBUIDOR_ID: TIntegerField;
    QryPrincipalPRODUTOR_ID: TIntegerField;
    QryPrincipalVLR_TOTAL: TFMTBCDField;
    QryPrincipalDATA_CADASTRO: TDateField;
    QryPrincipalDATA_APROVACAO: TDateField;
    QryPrincipalDATA_CANCELAMENTO: TDateField;
    QryPrincipalDATA_CONCLUSAO: TDateField;
    cdsPrincipalNEGOCIACAO_ID: TIntegerField;
    cdsPrincipalCODIGO: TIntegerField;
    cdsPrincipalDISTRIBUIDOR_ID: TIntegerField;
    cdsPrincipalPRODUTOR_ID: TIntegerField;
    cdsPrincipalVLR_TOTAL: TFMTBCDField;
    cdsPrincipalDATA_CADASTRO: TDateField;
    cdsPrincipalDATA_APROVACAO: TDateField;
    cdsPrincipalDATA_CANCELAMENTO: TDateField;
    cdsPrincipalDATA_CONCLUSAO: TDateField;
    edt_Datacadastro: TDBEdit;
    lbl_DataCadastro: TLabel;
    edt_DataAprovacao: TDBEdit;
    lbl_DataAprovacao: TLabel;
    edt_DataCancelamento: TDBEdit;
    lbl_DataCancelamento: TLabel;
    edt_DataConclusao: TDBEdit;
    lbl_DataConclusao: TLabel;
    cbox_Status: TDBComboBox;
    lbl_VlrTotal: TLabel;
    edt_VlrTotal: TDBEdit;
    lbl_Status: TLabel;
    QryPrincipalnome_produtor: TStringField;
    QryPrincipalnome_distribuidor: TStringField;
    QryPrincipalcod_produtor: TStringField;
    QryPrincipalcod_distribuidor: TStringField;
    cdsPrincipalcod_produtor: TStringField;
    cdsPrincipalnome_produtor: TStringField;
    cdsPrincipalcod_distribuidor: TStringField;
    cdsPrincipalnome_distribuidor: TStringField;
    Label1: TLabel;
    edt_PesqNomeDistribuidor: TEdit;
    frxReport1: TfrxReport;
    frxDBDataset1: TfrxDBDataset;
    cdsPrincipalvlr_credito_distribuidor: TFloatField;
    cdsPrincipalvlr_total_negociado: TFloatField;
    QryPrincipalSTATUS: TStringField;
    cdsPrincipalSTATUS: TStringField;
    lbl_DescDistribuidor: TLabel;
    lbl_CodDistribuidor: TLabel;
    spb_Distribuidor: TSpeedButton;
    edt_DescDistribuidor: TDBEdit;
    edt_CodDistribuidor: TDBEdit;
    lbl_DescProdutor: TLabel;
    lbl_CodProdutor: TLabel;
    spb_Produtor: TSpeedButton;
    edt_DescProdutor: TDBEdit;
    edt_CodProdutor: TDBEdit;
    gBox_NegociacaoItens: TGroupBox;
    pgNegociacaoItens: TPageControl;
    tbBrowserItens: TTabSheet;
    DBGrid2: TDBGrid;
    tbCadastroItens: TTabSheet;
    lbl_DescProduto: TLabel;
    lbl_CodProduto: TLabel;
    spb_Produto: TSpeedButton;
    lbl_VlrPrecoVenda: TLabel;
    edt_DescProduto: TDBEdit;
    edt_CodProduto: TDBEdit;
    edt_IdProduto: TDBEdit;
    edt_VlrPrecoVenda: TDBEdit;
    Panel2: TPanel;
    btnIIncluir: TSpeedButton;
    btnIAlterar: TSpeedButton;
    btnIExcluir: TSpeedButton;
    btnIGravar: TSpeedButton;
    btnICancelar: TSpeedButton;
    edt_IdProdutor: TDBEdit;
    edt_IdDistribuidor: TDBEdit;
    dsMestre: TDataSource;
    dsNegociacao_Itens: TDataSource;
    QryNegociacao_Itens: TSQLQuery;
    cdsNegociacao_Itens: TClientDataSet;
    cdsPrincipalQryNegociacao_Itens: TDataSetField;
    QryNegociacao_ItensNEGOCIACAO_ITEM_ID: TIntegerField;
    QryNegociacao_ItensNEGOCIACAO_ID: TIntegerField;
    QryNegociacao_ItensPRODUTO_ID: TIntegerField;
    QryNegociacao_Itenscod_produto: TIntegerField;
    QryNegociacao_Itensnome_produto: TStringField;
    cdsNegociacao_ItensNEGOCIACAO_ITEM_ID: TIntegerField;
    cdsNegociacao_ItensNEGOCIACAO_ID: TIntegerField;
    cdsNegociacao_ItensPRODUTO_ID: TIntegerField;
    cdsNegociacao_Itenscod_produto: TIntegerField;
    cdsNegociacao_Itensnome_produto: TStringField;
    QryNegociacao_ItensVLR_PRECO_VENDA: TFMTBCDField;
    cdsNegociacao_ItensVLR_PRECO_VENDA: TFMTBCDField;
    btn_Status: TBitBtn;
    ImageList1: TImageList;
    btn_Concluir: TBitBtn;
    cdsNegociacao_ItenssumVlrPrecoVenda: TAggregateField;
    QryNegociacao_ItensQUANTIDADE: TSingleField;
    QryNegociacao_ItensVLR_UNITARIO: TFMTBCDField;
    cdsNegociacao_ItensQUANTIDADE: TSingleField;
    cdsNegociacao_ItensVLR_UNITARIO: TFMTBCDField;
    edt_Quantidade: TDBEdit;
    edt_VlrTotalItem: TDBEdit;
    lbl_Quantidade: TLabel;
    lbl_VlrTotalItem: TLabel;
    cdsNegociacao_ItenscalcVlrTotalItem: TCurrencyField;
    procedure FormCreate(Sender: TObject);
    procedure act_pesquisarExecute(Sender: TObject);
    procedure cdsPrincipalAfterInsert(DataSet: TDataSet);
    procedure spb_ProdutorClick(Sender: TObject);
    procedure edt_CodProdutorEnter(Sender: TObject);
    procedure edt_CodProdutorExit(Sender: TObject);
    procedure edt_CodProdutorKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edt_CodDistribuidorKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure spb_DistribuidorClick(Sender: TObject);
    procedure edt_CodDistribuidorEnter(Sender: TObject);
    procedure edt_CodDistribuidorExit(Sender: TObject);
    procedure act_ImprimirExecute(Sender: TObject);
    procedure act_limparExecute(Sender: TObject);
    procedure dspPrincipalAfterUpdateRecord(Sender: TObject; SourceDS: TDataSet;
      DeltaDS: TCustomClientDataSet; UpdateKind: TUpdateKind);
    procedure dspPrincipalBeforeUpdateRecord(Sender: TObject;
      SourceDS: TDataSet; DeltaDS: TCustomClientDataSet;
      UpdateKind: TUpdateKind; var Applied: Boolean);
    procedure btnIIncluirClick(Sender: TObject);
    procedure btnIAlterarClick(Sender: TObject);
    procedure btnIExcluirClick(Sender: TObject);
    procedure btnIGravarClick(Sender: TObject);
    procedure btnICancelarClick(Sender: TObject);
    procedure act_IncluirExecute(Sender: TObject);
    procedure act_AlterarExecute(Sender: TObject);
    procedure act_GravarExecute(Sender: TObject);
    procedure act_CancelarExecute(Sender: TObject);
    procedure dsPrincipalDataChange(Sender: TObject; Field: TField);
    procedure btn_ConcluirClick(Sender: TObject);
    procedure btn_StatusClick(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure edt_CodProdutoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edt_CodProdutoEnter(Sender: TObject);
    procedure edt_CodProdutoExit(Sender: TObject);
    procedure spb_ProdutoClick(Sender: TObject);
    procedure cdsNegociacao_ItensAfterInsert(DataSet: TDataSet);
    procedure cdsPrincipalBeforeDelete(DataSet: TDataSet);
    procedure cdsNegociacao_ItensCalcFields(DataSet: TDataSet);
  private
    { Private declarations }
    ID_Mestre : integer;

    sCod_Produtor, sCod_Distribuidor, sCod_Produto : String;
    procedure Pesquisar(pPesquisa: TPesquisa; pSair : Boolean = false);
    procedure cfg_Botoes_Itens;
    function VerificaItemJaSelecionado: String;

    procedure cfg_Botoes_Status;
    function VerificarCreditoUtilizado(iprodutor_id,
                                       idistribuidor_id: integer): Double;
    function VerificarCreditoPorDistribuidor(iprodutor_id,
      idistribuidor_id: integer): Double;
    function VerificarCredito : Boolean ;

  public
    { Public declarations }
    function VerificarCampos(iIndice : Integer) : Boolean; override;
    function VerificarCamposItens(iIndice : Integer) : Boolean;
    procedure Cfg_Hints; override;
    procedure setCamposObrigatorios; override;
    procedure setTituloCampos; override;

    procedure Cfg_Button; override;
  end;

var
  frmNegociacao: TfrmNegociacao;

implementation

{$R *.dfm}

uses uMensagem, uBiblioteca, uPesqGeral, udmPrincipal;

{ TfrmNegociacao }

procedure TfrmNegociacao.act_AlterarExecute(Sender: TObject);
begin
  inherited;

  cfg_Botoes_Itens;
  cfg_Botoes_Status;
end;

procedure TfrmNegociacao.act_CancelarExecute(Sender: TObject);
begin
  if (cdsNegociacao_Itens.State in [dsInsert, dsEdit]) then
    SysMensagem('É necessário concluir o item para cancelar a negociação!', dsAviso)
  else begin

    inherited;

    pgNegociacaoItens.ActivePage := tbBrowserItens;
    cfg_Botoes_Itens;

    cfg_Botoes_Status;
  end;

end;

procedure TfrmNegociacao.act_GravarExecute(Sender: TObject);
begin
  if (cdsNegociacao_Itens.State in [dsInsert, dsEdit]) then
    SysMensagem('É necessário concluir o item para salvar a negociação!', dsAviso)
  else begin
    if not(cdsNegociacao_Itens.Eof) then
    begin
      { Verificar valor credito disponivel }

      if (VerificarCredito) then
      begin

        inherited;

        pgNegociacaoItens.ActivePage := tbBrowserItens;
        cfg_Botoes_Itens;

        cfg_Botoes_Status;

      end;

    end else
    begin
      SysMensagem('Para gravar uma negociação e necessário ' + #13 +
                  'informar itens para a mesma!', dsAviso);
    end;
  end;

end;

function TfrmNegociacao.VerificarCredito : Boolean;
var
  dValorCreditoDisponivel, dNegociacoesAprovadas : Double;
  bCreditoDisponivel : Boolean;
begin
  bCreditoDisponivel := False;

  dValorCreditoDisponivel := VerificarCreditoPorDistribuidor( cdsPrincipalPRODUTOR_ID.Value, cdsPrincipalDISTRIBUIDOR_ID.Value );
  dNegociacoesAprovadas := VerificarCreditoUtilizado( cdsPrincipalPRODUTOR_ID.Value, cdsPrincipalDISTRIBUIDOR_ID.Value );

  if (cdsPrincipalVLR_TOTAL.Value <= (dValorCreditoDisponivel - dNegociacoesAprovadas)) then
    bCreditoDisponivel := True
  else begin
    bCreditoDisponivel := False;

    SysMensagem('Valor negociação maior que o valor disponível para compra!' + #13 +
                'Valor Crédito .................................. R$. ' + FormatFloat('###,##0.00', dValorCreditoDisponivel) + #13 +
                'Valor Negociado já aprovado ....... R$. ' + FormatFloat('###,##0.00', dNegociacoesAprovadas) + #13 +
                'Valor Disponível ............................. R$. ' + FormatFloat('###,##0.00', dValorCreditoDisponivel - dNegociacoesAprovadas) + #13 +
                'Valor Negociação Atual ................. R$. ' + FormatFloat('###,##0.00', cdsPrincipalVLR_TOTAL.AsFloat), dsAviso);

  end;

  Result := bCreditoDisponivel;
end;
function TfrmNegociacao.VerificarCreditoUtilizado(iprodutor_id, idistribuidor_id : integer ) : Double;
begin
  with dmPrincipal.qryAux do
  begin
    Close;
    SQL.Clear;

    SQL.Add('SELECT SUM(VLR_TOTAL) AS TOTAL ');
    SQL.Add('FROM negociacao nego');
    SQL.Add('WHERE nego.produtor_id = :produtor_id ');
    SQL.Add('AND nego.distribuidor_id = :distribuidor_id ');
    SQL.Add('AND nego.status = ''Aprovada'' ');

    ParamByName('produtor_id').Value := iprodutor_id;
    ParamByName('distribuidor_id').Value := idistribuidor_id;

    try
      if not Prepared then
        Prepared := True;
      Open;
    finally
      if not IsEmpty then
      begin
        Result := FieldByName('TOTAL').AsFloat;
      end
      else
        Result := 0;

      Prepared := False;
      Close;
    end;
  end;
end;

function TfrmNegociacao.VerificarCreditoPorDistribuidor(iprodutor_id, idistribuidor_id : integer ) : Double;
begin
  with dmPrincipal.qryAux do
  begin
    Close;
    SQL.Clear;

    SQL.Add('SELECT VLR_CREDITO AS TOTAL ');
    SQL.Add('FROM produtor_credito prcr ');
    SQL.Add('WHERE prcr.produtor_id = :produtor_id ');
    SQL.Add('AND prcr.distribuidor_id = :distribuidor_id ');

    ParamByName('produtor_id').Value := iprodutor_id;
    ParamByName('distribuidor_id').Value := idistribuidor_id;

    try
      if not Prepared then
        Prepared := True;
      Open;
    finally
      if not IsEmpty then
      begin
        Result := FieldByName('TOTAL').AsFloat;
      end
      else
        Result := 0;

      Prepared := False;
      Close;
    end;
  end;
end;

procedure TfrmNegociacao.act_ImprimirExecute(Sender: TObject);
begin

  frxReport1.ShowReport();
  cdsPrincipal.First;

end;

procedure TfrmNegociacao.act_IncluirExecute(Sender: TObject);
begin
  inherited;

  cfg_Botoes_Itens;
  cfg_Botoes_Status;
end;

procedure TfrmNegociacao.act_limparExecute(Sender: TObject);
begin
  inherited;
  edt_PesqNomeDistribuidor.Clear;
end;

procedure TfrmNegociacao.act_pesquisarExecute(Sender: TObject);
begin
  { Pesquisar Registro }

  try
    if not CampoNulo then
    begin
      Screen.Cursor := crHourGlass;
      QryPrincipal.SQL.Text := Self.fSqlPrincipal;

      lFiltro := EmptyStr;
      lFiltro := Self.fSqlPrincipal;

      if not (edt_PesqCodigo.Text = EmptyStr) then
         lFiltro := AddFiltro_Aux(lFiltro, ' CODIGO = ' + edt_PesqCodigo.Text );

      if not (edt_PesqDescricao.Text = EmptyStr) then
         lFiltro := AddFiltro_Aux(lFiltro, ' PROD.NOME LIKE ' + QuotedStr(Trim('%' + edt_PesqDescricao.Text + '%' )));

      if not (edt_PesqNomeDistribuidor.Text = EmptyStr) then
         lFiltro := AddFiltro_Aux(lFiltro, ' DIST.NOME LIKE ' + QuotedStr(Trim('%' + edt_PesqNomeDistribuidor.Text + '%' )));

      QryPrincipal.SQL.Clear;
      QryPrincipal.SQL.Add( lFiltro + OrderBy );

      CdsPrincipal.Refresh;
      cdsPrincipal.First;

      Cfg_Button;

    end;
  finally
     Screen.Cursor := crDefault;
     CdsPrincipal.Open;
  end;


end;

procedure TfrmNegociacao.btnIAlterarClick(Sender: TObject);
begin

  { Alterar registro }
  pgNegociacaoItens.ActivePage := tbCadastroItens;

  cdsNegociacao_Itens.Edit;

  cfg_Botoes_Itens;

end;

procedure TfrmNegociacao.btnICancelarClick(Sender: TObject);
var
  sText : String;
begin

  { Cancelar Manutenção dos itens de negociacao }
  if (cdsNegociacao_Itens.State in [dsInsert, dsEdit]) then
  begin
    if cdsNegociacao_Itens.State = dsEdit then
      sText := 'Deseja cancelar a Alteração?'
    else
    if cdsNegociacao_Itens.State = dsInsert then
      sText := 'Deseja cancelar a Inserção?';

    if SysMensagem(sText, dsConfirmacao) then
    begin
      cdsNegociacao_Itens.Cancel;
      pgNegociacaoItens.ActivePage := tbBrowserItens;

      cfg_Botoes_Itens;
    end;
  end else
  begin
    pgNegociacaoItens.ActivePage := tbBrowserItens;
    cfg_Botoes_Itens;
  end;

end;

function TfrmNegociacao.VerificaItemJaSelecionado : String;
var
  cds: TClientDataSet;
  sSelecionados : String;
begin
  sSelecionados := EmptyStr;

  cds := TClientDataSet.Create( Self );
  try
    cds.CloneCursor(cdsNegociacao_Itens, False);

    if (cds.RecordCount = 0) then
      sSelecionados := '0';

    cds.First;
    while not( cds.Eof ) do
    begin
      if not(cds.FieldByName('PRODUTO_ID').AsString = EmptyStr) then
      begin
        if (sSelecionados = EmptyStr) then
          sSelecionados := cds.FieldByName('PRODUTO_ID').AsString
        else
          sSelecionados := sSelecionados + ',' + cds.FieldByName('PRODUTO_ID').AsString
      end;

      cds.Next;
    end;

    Result := sSelecionados;
  finally
    cds.Free;
  end;
end;

procedure TfrmNegociacao.cfg_Botoes_Itens;
var
  Qtde: integer;
begin
  if not(cdsPrincipal.State in [dsBrowse]) then
  begin
    Qtde := (cdsNegociacao_Itens.RecordCount);
    if (cdsNegociacao_Itens.State in [dsInsert, dsEdit]) then
    begin
      btnIIncluir.Enabled  := False;
      btnIAlterar.Enabled  := False;
      btnIExcluir.Enabled  := False;
      btnICancelar.Enabled := True;
      btnIGravar.Enabled   := True;
    end
    else
    if (Qtde = 0) then
    begin
      btnIIncluir.Enabled  := True;
      btnIAlterar.Enabled  := False;
      btnIExcluir.Enabled  := False;
      btnICancelar.Enabled := False;
      btnIGravar.Enabled   := False;
    end
    else
    begin
      btnIIncluir.Enabled  := True;
      btnIAlterar.Enabled  := True;
      btnIExcluir.Enabled  := True;
      btnICancelar.Enabled := False;
      btnIGravar.Enabled   := False;
    end;
  end else
  begin
    btnIIncluir.Enabled  := False;
    btnIAlterar.Enabled  := False;
    btnIExcluir.Enabled  := False;
    btnICancelar.Enabled := False;
    btnIGravar.Enabled   := False;
  end;
end;

procedure TfrmNegociacao.cfg_Botoes_Status;
begin

  if cdsPrincipalSTATUS.AsString = 'Pendente' then
  begin

    btn_Status.Enabled   := (cdsPrincipal.State in [dsBrowse]) and (not cdsPrincipal.IsEmpty);

    btn_Status.Caption    := 'Aprovar';
    btn_Status.ImageIndex := 0;

    btn_Concluir.Enabled  := False;

  end else
  if cdsPrincipalSTATUS.AsString = 'Aprovada' then
  begin

    btn_Status.Enabled   := (cdsPrincipal.State in [dsBrowse]) and (not cdsPrincipal.IsEmpty);

    btn_Status.Caption    := 'Cancelar';
    btn_Status.ImageIndex := 2;

    btn_Concluir.Enabled  := True;

  end else
  if cdsPrincipalSTATUS.AsString = 'Cancelada' then
  begin

    btn_Status.Caption    := 'Aprovar';
    btn_Status.ImageIndex := 0;

    btn_Status.Enabled    := False;
    btn_Concluir.Enabled  := False;

  end else
  if cdsPrincipalSTATUS.AsString = 'Concluir' then
  begin
    btn_Status.Caption    := 'Aprovar';
    btn_Status.ImageIndex := 0;

    btn_Status.Enabled    := False;
    btn_Concluir.Enabled  := False;

  end;

end;

procedure TfrmNegociacao.btnIExcluirClick(Sender: TObject);
begin

  { Excluir registro }
  if (SysMensagem('Deseja realmente excluir o registro?', dsConfirmacao)) then
  begin
    cdsNegociacao_Itens.Delete;

    if not(cdsNegociacao_ItenssumVlrPrecoVenda.IsNull) then
      cdsPrincipalVLR_TOTAL.AsFloat := cdsNegociacao_ItenssumVlrPrecoVenda.Value
    else
      cdsPrincipalVLR_TOTAL.AsFloat := 0.00;

    cfg_Botoes_Itens;
  end;

end;

procedure TfrmNegociacao.btnIGravarClick(Sender: TObject);
begin

  { Gravar Registro }
  if VerificarCamposItens(999) then
  begin
    if (SysMensagem('Deseja realmente salvar o registro?', dsConfirmacao)) then
    begin
      cdsNegociacao_Itens.Post;

      cdsPrincipalVLR_TOTAL.AsFloat := cdsNegociacao_ItenssumVlrPrecoVenda.Value;

      pgNegociacaoItens.ActivePage := tbBrowserItens;
      cfg_Botoes_Itens;
    end;
  end;

end;

procedure TfrmNegociacao.btnIIncluirClick(Sender: TObject);
begin
  inherited;
  { Incluir registro }

  pgNegociacaoItens.ActivePage := tbCadastroItens;

  cdsNegociacao_Itens.Insert;


  cfg_Botoes_Itens;

end;

procedure TfrmNegociacao.btn_ConcluirClick(Sender: TObject);
begin
  inherited;

  if SysMensagem('Deseja realmente concluir à negociação?', dsConfirmacao) then
  begin
    cdsPrincipal.Edit;
    cdsPrincipalSTATUS.Value := 'Concluir';
    cdsPrincipalDATA_CONCLUSAO.Value := dmPrincipal.DataAtual;
    cdsPrincipal.Post;

    cdsPrincipal.ApplyUpdates(-1);
  end;

end;

procedure TfrmNegociacao.btn_StatusClick(Sender: TObject);
begin
  inherited;

  if btn_Status.Caption = 'Aprovar' then
  begin

    if VerificarCredito then
    begin
      if SysMensagem('Deseja realmente aprovar à negociação?', dsConfirmacao) then
      begin
        cdsPrincipal.Edit;
        cdsPrincipalSTATUS.Value := 'Aprovada';
        cdsPrincipalDATA_APROVACAO.Value := dmPrincipal.DataAtual;
        cdsPrincipal.Post;

        cdsPrincipal.ApplyUpdates(-1);
      end;
    end;

  end else
  if btn_Status.Caption = 'Cancelar' then
  begin

    if SysMensagem('Deseja realmente cancelar à negociação?', dsConfirmacao) then
    begin
      cdsPrincipal.Edit;
      cdsPrincipalSTATUS.Value := 'Cancelada';
      cdsPrincipalDATA_CANCELAMENTO.Value := dmPrincipal.DataAtual;
      cdsPrincipal.Post;

      cdsPrincipal.ApplyUpdates(-1);
    end;

  end;

end;

procedure TfrmNegociacao.cdsNegociacao_ItensAfterInsert(DataSet: TDataSet);
begin
  inherited;

  cdsNegociacao_Itens.Fields[0].Value := cdsNegociacao_Itens.RecordCount +1;

end;

procedure TfrmNegociacao.cdsNegociacao_ItensCalcFields(DataSet: TDataSet);
begin
  inherited;
  cdsNegociacao_ItenscalcVlrTotalItem.AsFloat := ( cdsNegociacao_ItensQUANTIDADE.AsFloat * cdsNegociacao_ItensVLR_UNITARIO.AsFloat);
end;

procedure TfrmNegociacao.cdsPrincipalAfterInsert(DataSet: TDataSet);
begin
  inherited;
  cdsPrincipalNEGOCIACAO_ID.Value := 9999;
  cdsPrincipalCODIGO.Value        := 9999;
  cdsPrincipalDATA_CADASTRO.Value := dmPrincipal.DataAtual;
  cdsPrincipalVLR_TOTAL.Value     := 0.00;
  cdsPrincipalSTATUS.Value        := 'Pendente';

end;

procedure TfrmNegociacao.cdsPrincipalBeforeDelete(DataSet: TDataSet);
begin
  inherited;

  cdsNegociacao_Itens.First;
  while not cdsNegociacao_Itens.Eof do
  begin
    cdsNegociacao_Itens.Delete;
  end;

end;

procedure TfrmNegociacao.Cfg_Button;
begin

  if (act_Incluir.Tag = 0) then
    act_Incluir.Enabled := (cdsPrincipal.State in [dsBrowse]);

  if (act_Alterar.Tag = 0) then
    act_Alterar.Enabled := (cdsPrincipal.State in [dsBrowse]) and (not cdsPrincipal.IsEmpty) and (cdsPrincipalSTATUS.Value = 'Pendente');

  if (act_Excluir.Tag = 0) then
    act_Excluir.Enabled := (cdsPrincipal.State in [dsBrowse]) and (not cdsPrincipal.IsEmpty) and (cdsPrincipalSTATUS.Value = 'Pendente');

  if (act_Gravar.Tag = 0) then
    act_Gravar.Enabled := (cdsPrincipal.State in [dsInsert, dsEdit]) and (not cdsPrincipal.IsEmpty);

  if (act_Cancelar.Tag = 0) then
  begin

    if pgPrincipal.ActivePage = tbCadastro then
      act_Cancelar.Enabled := True
    else
      act_Cancelar.Enabled := (cdsPrincipal.State in [dsInsert, dsEdit]) and (not cdsPrincipal.IsEmpty)

  end;

  if (act_Imprimir.Tag = 0) then
    act_Imprimir.Enabled := (cdsPrincipal.State in [dsBrowse]) and (not cdsPrincipal.IsEmpty);


end;

procedure TfrmNegociacao.Cfg_Hints;
begin

  edt_Codigo.Hint           := 'Código';
  edt_Datacadastro.Hint     := 'Data Cadastro';
  edt_DataAprovacao.Hint    := 'Data Aprovação';
  edt_DataCancelamento.Hint := 'Data Cancelamento';
  edt_DataConclusao.Hint    := 'Data Conclusão';
  edt_CodProdutor.Hint      := 'Código Produtor';
  edt_DescProdutor.Hint     := 'Nome Produtor';
  edt_CodDistribuidor.Hint  := 'Código Distribuidor';
  edt_DescDistribuidor.Hint := 'Nome Distribuidor';
  cbox_Status.Hint          := 'Status';
  edt_VlrTotal.Hint         := 'Vlr. Total';

  { Itens }
  edt_CodProduto.Hint       := 'Código Produto';
  edt_DescProduto.Hint      := 'Nome Produto';
  edt_VlrPrecoVenda.Hint    := 'Vlr. Preço Venda';
  edt_Quantidade.Hint       := 'Quantidade';

end;

procedure TfrmNegociacao.DBGrid1DblClick(Sender: TObject);
begin
  inherited;

  cfg_Botoes_Status;
end;

procedure TfrmNegociacao.dspPrincipalAfterUpdateRecord(Sender: TObject;
  SourceDS: TDataSet; DeltaDS: TCustomClientDataSet; UpdateKind: TUpdateKind);
begin
  inherited;

  if (UpdateKind = ukInsert) then
    ID_Mestre := dmPrincipal.RecuperarIdentificador('GEN_NEGOCIACAO_ID');

end;

procedure TfrmNegociacao.dspPrincipalBeforeUpdateRecord(Sender: TObject;
  SourceDS: TDataSet; DeltaDS: TCustomClientDataSet; UpdateKind: TUpdateKind;
  var Applied: Boolean);
begin
  inherited;

  if ((UpdateKind = ukInsert) and (SourceDS.Name = QryNegociacao_Itens.Name)) then
  begin
    if not(ID_Mestre = 0) then
    begin
      DeltaDS.FieldByName('NEGOCIACAO_ID').ReadOnly := False;
      DeltaDS.FieldByName('NEGOCIACAO_ID').NewValue := ID_Mestre;
    end;
  end;

end;

procedure TfrmNegociacao.dsPrincipalDataChange(Sender: TObject; Field: TField);
begin
  inherited;

  Cfg_Button;
  cfg_Botoes_Status;

end;

procedure TfrmNegociacao.edt_CodDistribuidorEnter(Sender: TObject);
begin
  sCod_Distribuidor := edt_CodDistribuidor.Text;
end;

procedure TfrmNegociacao.edt_CodDistribuidorExit(Sender: TObject);
begin

  if TDBEdit(Sender) = edt_CodDistribuidor then


  if (Trim( edt_CodDistribuidor.Text ) = EmptyStr) then
  begin
    edt_CodDistribuidor.Clear;
    edt_DescDistribuidor.Clear;
    edt_IdDistribuidor.Clear;
    sCod_Distribuidor := EmptyStr;
  end
  else
  if (Trim( edt_CodDistribuidor.Text ) <> sCod_Distribuidor) then
    Pesquisar( pDistribuidor, True );

end;

procedure TfrmNegociacao.edt_CodDistribuidorKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin

  if (Key = VK_F2) then
    spb_DistribuidorClick(nil);

end;

procedure TfrmNegociacao.edt_CodProdutoEnter(Sender: TObject);
begin
  sCod_Produto := edt_CodProduto.Text;
end;

procedure TfrmNegociacao.edt_CodProdutoExit(Sender: TObject);
begin
  inherited;
  if TDBEdit(Sender) = edt_CodProduto then


  if (Trim( edt_CodProduto.Text ) = EmptyStr) then
  begin
    edt_CodProduto.Clear;
    edt_DescProduto.Clear;
    edt_IdProduto.Clear;
    sCod_Produto := EmptyStr;
  end
  else
  if (Trim( edt_CodProduto.Text ) <> sCod_Produto) then
    Pesquisar( pProduto, True );

end;

procedure TfrmNegociacao.edt_CodProdutoKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if (Key = VK_F2) then
    spb_ProdutorClick(nil);

end;

procedure TfrmNegociacao.edt_CodProdutorEnter(Sender: TObject);
begin
  inherited;

  sCod_Produtor := edt_CodProdutor.Text;

end;

procedure TfrmNegociacao.edt_CodProdutorExit(Sender: TObject);
begin

  if TDBEdit(Sender) = edt_CodProdutor then


  if (Trim( edt_CodProdutor.Text ) = EmptyStr) then
  begin
    edt_CodProdutor.Clear;
    edt_DescProdutor.Clear;
    edt_IdProdutor.Clear;
    sCod_Produtor := EmptyStr;

    edt_CodDistribuidor.Clear;
    edt_DescDistribuidor.Clear;
    edt_IdDistribuidor.Clear;
    sCod_Distribuidor := EmptyStr;

  end
  else
  if (Trim( edt_CodProdutor.Text ) <> sCod_Produtor) then
    Pesquisar( pProdutor, True );

end;

procedure TfrmNegociacao.edt_CodProdutorKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin

  if (Key = VK_F2) then
    spb_ProdutorClick(nil);

end;

procedure TfrmNegociacao.FormCreate(Sender: TObject);
begin

  TituloFormulario := 'Negociação';
  OrderBy := ' CODIGO';

  inherited;

  tbBrowserItens.TabVisible  := false;
  tbCadastroItens.TabVisible := false;
  pgNegociacaoItens.ActivePage := tbBrowserItens;

  cfg_Botoes_Itens;

end;

procedure TfrmNegociacao.setCamposObrigatorios;
begin

  cdsPrincipalCODIGO.Required           := true;
  lbl_codigo.Caption                    := lbl_codigo.Caption + '*';

  cdsPrincipalcod_produtor.Required     := true;
  lbl_CodProdutor.Caption               := lbl_CodProdutor.Caption + '*';

  cdsPrincipalcod_distribuidor.Required := true;
  lbl_CodDistribuidor.Caption           := lbl_CodDistribuidor.Caption + '*';

  cdsPrincipalDATA_CADASTRO.Required    := true;
  lbl_DataCadastro.Caption              := lbl_DataCadastro.Caption + '*';

  cdsPrincipalVLR_TOTAL.Required        := true;
  lbl_VlrTotal.Caption                  := lbl_VlrTotal.Caption + '*';

  cdsPrincipalSTATUS.Required             := true;
  lbl_Status.Caption                      := lbl_Status.Caption + '*';

  { Itens }
  cdsNegociacao_Itenscod_produto.Required := true;
  lbl_CodProduto.Caption                  := lbl_CodProduto.Caption + '*';

  cdsNegociacao_ItensQUANTIDADE.Required  := true;
  lbl_Quantidade.Caption                  := lbl_Quantidade.Caption + '*';

end;

procedure TfrmNegociacao.setTituloCampos;
begin

  cdsPrincipalCODIGO.DisplayLabel            := 'Código';
  cdsPrincipalDATA_CADASTRO.DisplayLabel     := 'Data Cadastro';
  cdsPrincipalDATA_APROVACAO.DisplayLabel    := 'Data Aprovação';
  cdsPrincipalDATA_CANCELAMENTO.DisplayLabel := 'Data Cancelamento';
  cdsPrincipalDATA_CONCLUSAO.DisplayLabel    := 'Data Conclusão';
  cdsPrincipalcod_produtor.DisplayLabel      := 'Código Produtor';
  cdsPrincipalnome_distribuidor.DisplayLabel := 'Nome Produtor';
  cdsPrincipalcod_distribuidor.DisplayLabel  := 'Código Distribuidor';
  cdsPrincipalnome_distribuidor.DisplayLabel := 'Nome Distribuidor';
  cdsPrincipalSTATUS.DisplayLabel            := 'Status';
  cdsPrincipalVLR_TOTAL.DisplayLabel         := 'Vlr. Total';

  { Itens }
  cdsNegociacao_Itenscod_produto.DisplayLabel     := 'Código Produto';
  cdsNegociacao_Itensnome_produto.DisplayLabel    := 'Nome Produto';
  cdsNegociacao_ItensVLR_PRECO_VENDA.DisplayLabel := 'Vlr. Preço Venda';
  cdsNegociacao_ItensQUANTIDADE.DisplayLabel      := 'Quantidade';

end;

procedure TfrmNegociacao.Pesquisar(pPesquisa: TPesquisa; pSair: Boolean);
var
  frmPesquisa : TfrmPesqGeral;

  sSQL, sOrderBy, sOpcaoJoin : String;
begin
  frmPesquisa := nil;

  try

    if (pPesquisa = pProdutor) then
    begin
      sSQL := 'SELECT prod.produtor_id id, prod.cpf_cnpj "CPF / CNPJ", prod.nome "Nome Produtor" ' +
              'FROM produtor prod ';

      sOrderBy := 'ORDER BY prod.nome';

      frmPesquisa := TfrmPesqGeral.Create( Self, 'EMPRESA', 'prod.cpf_cnpj', 'Pesquisando produtor', ['prod.cpf_cnpj', 'prod.nome'],
                     edt_CodProdutor, edt_DescProdutor, edt_IdProdutor, sSQL, SOrderBy, sOpcaoJoin, pSair);
    end else

    if (pPesquisa = pDistribuidor) then
    begin
      sSQL := 'SELECT dist.distribuidor_id id, dist.cnpj "Código", dist.nome "Nome", proc.vlr_credito "Vlr. Crédito" ' +
              'FROM produtor_credito proc ' +
              'INNER JOIN distribuidor dist ON (dist.distribuidor_id = proc.distribuidor_id)' +
              'WHERE proc.produtor_id = ' + edt_IdProdutor.Text;

      sOrderBy := 'ORDER BY dist.nome';

      frmPesquisa := TfrmPesqGeral.Create( Self, 'PRODUTOR_CREDITO', 'dist.cnpj', 'Pesquisando Distribuidor', ['dist.cnpj', 'dist.cnpj', 'dist.nome'],
                     edt_CodDistribuidor, edt_DescDistribuidor, edt_IdDistribuidor, sSQL, SOrderBy, sOpcaoJoin, pSair);
    end else

    if (pPesquisa = pProduto) then
    begin
      sSQL := 'SELECT prod.produto_id id, prod.codigo "Código", prod.nome "Nome Produto", prod.vlr_preco_venda "Vlr. Preço Venda" ' +
              'FROM produto prod ' +

              'WHERE prod.codigo NOT IN ('  + VerificaItemJaSelecionado + ')';

      sOrderBy := 'ORDER BY prod.codigo';

      frmPesquisa := TfrmPesqGeral.Create( Self, 'PRODUTO', 'prod.codigo', 'Pesquisando Produto', ['prod.codigo', 'prod.codigo', 'prod.nome'],
                     edt_CodProduto, edt_DescProduto, edt_IdProduto, sSQL, SOrderBy, sOpcaoJoin, pSair);
    end;

    if pPesquisa in [ pProdutor, pDistribuidor, pProduto ] then
    begin
      if ((not pSair and(frmPesquisa.ShowModal = mrOk)) or pSair) then
      begin
        if (pPesquisa = pProdutor) then
        begin
          cdsPrincipalPRODUTOR_ID.Text := frmPesquisa.cdsPesquisa.FieldByName('id').AsString;
          cdsPrincipalcod_produtor.Text := frmPesquisa.cdsPesquisa.FieldByName('CPF / CNPJ').AsString;
          cdsPrincipalnome_produtor.Text := frmPesquisa.cdsPesquisa.FieldByName('Nome Produtor').AsString;

          sCod_Produtor := frmPesquisa.cdsPesquisa.FieldByName('CPF / CNPJ').AsString;
        end else
        if (pPesquisa = pDistribuidor) then
        begin
          cdsPrincipalDISTRIBUIDOR_ID.AsInteger  := frmPesquisa.cdsPesquisa.FieldByName('id').AsInteger;
          cdsPrincipalcod_distribuidor.AsString  := frmPesquisa.cdsPesquisa.FieldByName('Código').AsString;
          cdsPrincipalnome_distribuidor.AsString := frmPesquisa.cdsPesquisa.FieldByName('Nome').AsString;

          cdsPrincipalvlr_credito_distribuidor.Value := frmPesquisa.cdsPesquisa.FieldByName('Vlr. Crédito').Value;
          cdsPrincipalvlr_total_negociado.Value      := frmPesquisa.cdsPesquisa.FieldByName('Vlr. Crédito').Value;

          sCod_Distribuidor := frmPesquisa.cdsPesquisa.FieldByName('Código').AsString;
        end else
        if (pPesquisa = pProduto) then
        begin
          cdsNegociacao_ItensPRODUTO_ID.Value      := frmPesquisa.cdsPesquisa.FieldByName('id').Value;
          cdsNegociacao_Itenscod_produto.Value     := frmPesquisa.cdsPesquisa.FieldByName('Código').Value;
          cdsNegociacao_Itensnome_produto.Value    := frmPesquisa.cdsPesquisa.FieldByName('Nome Produto').Value;

          cdsNegociacao_ItensVLR_UNITARIO.AsFloat  := frmPesquisa.cdsPesquisa.FieldByName('Vlr. Preço Venda').Value;


          sCod_Produto := frmPesquisa.cdsPesquisa.FieldByName('Código').Value;
        end;
      end;
    end;

  finally
    frmPesquisa.Free;
  end;

end;

procedure TfrmNegociacao.spb_DistribuidorClick(Sender: TObject);
begin

  Pesquisar( pDistribuidor );

  if (Trim( edt_CodDistribuidor.Text ) <> sCod_Distribuidor) then
  begin

    edt_CodDistribuidor.Clear;
    edt_DescDistribuidor.Clear;
    edt_IdDistribuidor.Clear;
    sCod_Distribuidor := EmptyStr;

  end;

  edt_CodDistribuidor.SetFocus;
end;

procedure TfrmNegociacao.spb_ProdutoClick(Sender: TObject);
begin
  inherited;
  Pesquisar( pProduto );

  if (Trim( edt_CodProduto.Text ) <> sCod_Produto) then
  begin

    edt_CodProduto.Clear;
    edt_DescProduto.Clear;
    edt_IdProduto.Clear;
    sCod_Produto := EmptyStr;
  end;

  edt_CodProduto.SetFocus;
end;

procedure TfrmNegociacao.spb_ProdutorClick(Sender: TObject);
begin

  Pesquisar( pProdutor );

  if (Trim( edt_CodProdutor.Text ) <> sCod_Produtor) then
  begin

    edt_CodProdutor.Clear;
    edt_DescProdutor.Clear;
    edt_IdProdutor.Clear;
    sCod_Produtor := EmptyStr;

    edt_CodDistribuidor.Clear;
    edt_DescDistribuidor.Clear;
    edt_IdDistribuidor.Clear;
    sCod_Distribuidor := EmptyStr;

  end;

  edt_CodProdutor.SetFocus;

end;

function TfrmNegociacao.VerificarCampos(iIndice: Integer): Boolean;
var
  bAchou : Boolean;
begin
  inherited;

  bAchou := True;

  if ((iIndice = 1) or (iIndice = 999)) and (edt_CodProdutor.Text = EmptyStr) then
  begin
    SysMensagem('Campo Código Produtor é obrigatório!', dsAviso);

    bAchou := False;
    edt_CodProdutor.SetFocus;
  end else
  if ((iIndice = 2) or (iIndice = 999)) and (edt_CodDistribuidor.Text = EmptyStr) then
  begin
    SysMensagem('Campo Código Distribuidor é obrigatório!', dsAviso);

    bAchou := False;
    edt_CodDistribuidor.SetFocus;
  end;

  Result := bAchou;

end;

function TfrmNegociacao.VerificarCamposItens(iIndice: Integer): Boolean;
var
  bAchou : Boolean;
begin
  inherited;

  bAchou := True;

  if ((iIndice = 1) or (iIndice = 999)) and (edt_CodProduto.Text = EmptyStr) then
  begin
    SysMensagem('Campo Código Produto é obrigatório!', dsAviso);

    bAchou := False;
    edt_CodProduto.SetFocus;
  end else
  if ((iIndice = 2) or (iIndice = 999)) and (edt_Quantidade.Text = EmptyStr) then
  begin
    SysMensagem('Campo Quantidade Produto é obrigatório!', dsAviso);

    bAchou := False;
    edt_Quantidade.SetFocus;
  end;


  Result := bAchou;

end;

end.
