unit uNegociacao;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, ufrwCadastro, Data.DB, Data.FMTBcd,
  Data.SqlExpr, Datasnap.Provider, Datasnap.DBClient, System.Actions,
  Vcl.ActnList, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.Buttons, Vcl.Grids, Vcl.DBGrids,
  Vcl.ComCtrls, Vcl.Mask, Vcl.DBCtrls, frxClass, frxDBSet;

type
  TPesquisa = (pProdutor, pDistribuidor, pProduto);

  TfrmNegociacao = class(TfrwCadastro)
    lbl_codigo: TLabel;
    lbl_vlr_negociado: TLabel;
    edt_vlr_credito: TDBEdit;
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
    gBox_Produtor: TGroupBox;
    lbl_DescProdutor: TLabel;
    lbl_CodProdutor: TLabel;
    spb_Produtor: TSpeedButton;
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
    edt_CodProdutor: TDBEdit;
    edt_IDProdutor: TDBEdit;
    edt_DescProdutor: TDBEdit;
    cdsPrincipalcod_produtor: TStringField;
    cdsPrincipalnome_produtor: TStringField;
    cdsPrincipalcod_distribuidor: TStringField;
    cdsPrincipalnome_distribuidor: TStringField;
    gBox_Distribuidor: TGroupBox;
    lbl_DescDistribuidor: TLabel;
    lbl_CodDistribuidor: TLabel;
    spb_Distribuidor: TSpeedButton;
    edt_DescDistribuidor: TDBEdit;
    edt_CodDistribuidor: TDBEdit;
    edt_IdDistribuidor: TDBEdit;
    Label1: TLabel;
    edt_PesqNomeDistribuidor: TEdit;
    frxReport1: TfrxReport;
    frxDBDataset1: TfrxDBDataset;
    lbl_vlr_credito: TLabel;
    edt_vlr_negociado: TDBEdit;
    cdsPrincipalvlr_credito_distribuidor: TFloatField;
    cdsPrincipalvlr_total_negociado: TFloatField;
    QryPrincipalSTATUS: TStringField;
    cdsPrincipalSTATUS: TStringField;
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
  private
    { Private declarations }
    sCod_Produtor, sCod_Distribuidor : String;
    procedure Pesquisar(pPesquisa: TPesquisa; pSair : Boolean = false);

  public
    { Public declarations }
    function VerificarCampos(iIndice : Integer) : Boolean; override;
    procedure Cfg_Hints; override;
    procedure setCamposObrigatorios; override;
    procedure setTituloCampos; override;

  end;

var
  frmNegociacao: TfrmNegociacao;

implementation

{$R *.dfm}

uses uMensagem, uBiblioteca, uPesqGeral, udmPrincipal;

{ TfrmNegociacao }

procedure TfrmNegociacao.act_ImprimirExecute(Sender: TObject);
begin

  frxReport1.ShowReport();
  cdsPrincipal.First;

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

procedure TfrmNegociacao.cdsPrincipalAfterInsert(DataSet: TDataSet);
begin
  inherited;
  cdsPrincipalNEGOCIACAO_ID.Value := 9999;
  cdsPrincipalCODIGO.Value        := 9999;
  cdsPrincipalDATA_CADASTRO.Value := dmPrincipal.DataAtual;
  cdsPrincipalVLR_TOTAL.Value     := 0.00;
  cdsPrincipalSTATUS.Value        := 'Pendente';

end;

procedure TfrmNegociacao.Cfg_Hints;
begin

  edt_Codigo.Hint           := 'C�digo';
  edt_Datacadastro.Hint     := 'Data Cadastro';
  edt_DataAprovacao.Hint    := 'Data Aprova��o';
  edt_DataCancelamento.Hint := 'Data Cancelamento';
  edt_DataConclusao.Hint    := 'Data Conclus�o';
  edt_CodProdutor.Hint      := 'C�digo Produtor';
  edt_DescProdutor.Hint     := 'Nome Produtor';
  edt_CodDistribuidor.Hint  := 'C�digo Distribuidor';
  edt_DescDistribuidor.Hint := 'Nome Distribuidor';
  cbox_Status.Hint          := 'Status';
  edt_VlrTotal.Hint         := 'Vlr. Total';

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

  TituloFormulario := 'Negocia��o';
  OrderBy := ' CODIGO';

  inherited;

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

  cdsPrincipalSTATUS.Required           := true;
  lbl_Status.Caption                    := lbl_Status.Caption + '*';

end;

procedure TfrmNegociacao.setTituloCampos;
begin

  cdsPrincipalCODIGO.DisplayLabel            := 'C�digo';
  cdsPrincipalDATA_CADASTRO.DisplayLabel     := 'Data Cadastro';
  cdsPrincipalDATA_APROVACAO.DisplayLabel    := 'Data Aprova��o';
  cdsPrincipalDATA_CANCELAMENTO.DisplayLabel := 'Data Cancelamento';
  cdsPrincipalDATA_CONCLUSAO.DisplayLabel    := 'Data Conclus�o';
  cdsPrincipalcod_produtor.DisplayLabel      := 'C�digo Produtor';
  cdsPrincipalnome_distribuidor.DisplayLabel := 'Nome Produtor';
  cdsPrincipalcod_distribuidor.DisplayLabel  := 'C�digo Distribuidor';
  cdsPrincipalnome_distribuidor.DisplayLabel := 'Nome Distribuidor';
  cdsPrincipalSTATUS.DisplayLabel            := 'Status';
  cdsPrincipalVLR_TOTAL.DisplayLabel         := 'Vlr. Total';

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
      sSQL := 'SELECT dist.distribuidor_id id, dist.cnpj "C�digo", dist.nome "Nome", proc.vlr_credito "Vlr. Cr�dito" ' +
              'FROM produtor_credito proc ' +
              'INNER JOIN distribuidor dist ON (dist.distribuidor_id = proc.distribuidor_id)' +
              'WHERE proc.produtor_id = ' + edt_IdProdutor.Text;

      sOrderBy := 'ORDER BY dist.nome';

      frmPesquisa := TfrmPesqGeral.Create( Self, 'PRODUTOR_CREDITO', 'dist.cnpj', 'Pesquisando Distribuidor', ['dist.cnpj', 'dist.cnpj', 'dist.nome'],
                     edt_CodDistribuidor, edt_DescDistribuidor, edt_IdDistribuidor, sSQL, SOrderBy, sOpcaoJoin, pSair);
    end else

    if (pPesquisa = pProduto) then
    begin
//      sSQL := 'SELECT alun.alcodg_aluno id, alun.alcodg_aluno "C�digo", alun.alnome_aluno "Nome Aluno" ' +
//              'FROM aluno alun ' +
//              'INNER JOIN matricula matr ON (matr.MACODG_ALUNO = alun.alCODG_ALUNO AND matr.MAANO_LETIVO = ' + spe_AnoCompetencia.Text + ' AND matr.MACODG_EMPRESA = alun.ALCODG_EMPRESA AND matr.MACODG_UNIDADE = alun.ALCODG_UNIDADE)' +
//
//              'WHERE alun.alcodg_empresa = '  + IfThen(not(edt_IdEmpresa.Text = EmptyStr), edt_IdEmpresa.Text, '0') +
//              'AND   alun.alcodg_unidade = '  + IfThen(not(edt_IdUnidade.Text = EmptyStr), edt_IdUnidade.Text, '0');
//
//      sOrderBy := 'ORDER BY alun.alcodg_aluno';
//
//      frmPesquisa := TfrmPesqGeral.Create( Self, 'ALUNO', 'alun.alcodg_aluno', 'Pesquisando aluno', ['alun.alcodg_aluno', 'alun.alcodg_aluno', 'alun.alnome_aluno'],
//                     edt_CodAluno, edt_DescAluno, edt_IdAluno, sSQL, SOrderBy, sOpcaoJoin, pSair);
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
          cdsPrincipalcod_distribuidor.AsString  := frmPesquisa.cdsPesquisa.FieldByName('C�digo').AsString;
          cdsPrincipalnome_distribuidor.AsString := frmPesquisa.cdsPesquisa.FieldByName('Nome').AsString;

          cdsPrincipalvlr_credito_distribuidor.Value := frmPesquisa.cdsPesquisa.FieldByName('Vlr. Cr�dito').Value;
          cdsPrincipalvlr_total_negociado.Value      := frmPesquisa.cdsPesquisa.FieldByName('Vlr. Cr�dito').Value;

          sCod_Distribuidor := frmPesquisa.cdsPesquisa.FieldByName('C�digo').AsString;
        end else
        if (pPesquisa = pProduto) then
        begin
//          edt_IdAluno.Text := frmPesquisa.cdsPesquisa.FieldByName('id').AsString;
//          edt_CodAluno.Text := frmPesquisa.cdsPesquisa.FieldByName('C�digo').AsString;
//          edt_DescAluno.Text := frmPesquisa.cdsPesquisa.FieldByName('Nome Aluno').AsString;
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
    SysMensagem('Campo C�digo Produtor � obrigat�rio!', dsAviso);

    bAchou := False;
    edt_CodProdutor.SetFocus;
  end else
  if ((iIndice = 2) or (iIndice = 999)) and (edt_CodDistribuidor.Text = EmptyStr) then
  begin
    SysMensagem('Campo C�digo Distribuidor � obrigat�rio!', dsAviso);

    bAchou := False;
    edt_CodDistribuidor.SetFocus;
  end;

  Result := bAchou;

end;

end.
