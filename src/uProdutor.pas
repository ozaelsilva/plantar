unit uProdutor;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, ufrwCadastro, Data.DB, Data.FMTBcd,
  Data.SqlExpr, Datasnap.Provider, Datasnap.DBClient, System.Actions,
  Vcl.ActnList, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.Buttons, Vcl.Grids, Vcl.DBGrids,
  Vcl.ComCtrls, Vcl.Mask, Vcl.DBCtrls, frxClass, frxDBSet;

type
  TPesquisa = (pDistribuidor);

  TfrmProdutor = class(TfrwCadastro)
    cdsPrincipalPRODUTOR_ID: TIntegerField;
    cdsPrincipalCPF_CNPJ: TStringField;
    cdsPrincipalNOME: TStringField;
    QryPrincipalPRODUTOR_ID: TIntegerField;
    QryPrincipalCPF_CNPJ: TStringField;
    QryPrincipalNOME: TStringField;
    lbl_cpfcnpj: TLabel;
    lbl_Nome: TLabel;
    edt_Nome: TDBEdit;
    edt_CpfCnpj: TDBEdit;
    gBox_LimiteProdutor: TGroupBox;
    pgLimiteCredito: TPageControl;
    tbBrowserItens: TTabSheet;
    tbCadastroItens: TTabSheet;
    Panel2: TPanel;
    btnIIncluir: TSpeedButton;
    DBGrid2: TDBGrid;
    btnIAlterar: TSpeedButton;
    btnIExcluir: TSpeedButton;
    btnIGravar: TSpeedButton;
    btnICancelar: TSpeedButton;
    lbl_DescDistribuidor: TLabel;
    lbl_CodDistribuidor: TLabel;
    spb_Distribuidor: TSpeedButton;
    edt_DescDistribuidor: TDBEdit;
    edt_CodDistribuidor: TDBEdit;
    edt_IdDistribuidor: TDBEdit;
    dsMestre: TDataSource;
    dsLimiteDistribuidor: TDataSource;
    cdsLimiteDistribuidor: TClientDataSet;
    QryLimiteDistribuidor: TSQLQuery;
    QryLimiteDistribuidorPRODUTOR_CREDITO_ID: TIntegerField;
    QryLimiteDistribuidorPRODUTOR_ID: TIntegerField;
    QryLimiteDistribuidorDISTRIBUIDOR_ID: TIntegerField;
    QryLimiteDistribuidorVLR_CREDITO: TFMTBCDField;
    cdsPrincipalQryLimiteDistribuidor: TDataSetField;
    cdsLimiteDistribuidorPRODUTOR_CREDITO_ID: TIntegerField;
    cdsLimiteDistribuidorPRODUTOR_ID: TIntegerField;
    cdsLimiteDistribuidorDISTRIBUIDOR_ID: TIntegerField;
    cdsLimiteDistribuidorVLR_CREDITO: TFMTBCDField;
    QryLimiteDistribuidorcod_distribuidor: TStringField;
    QryLimiteDistribuidornome_distribuidor: TStringField;
    cdsLimiteDistribuidorcod_distribuidor: TStringField;
    cdsLimiteDistribuidornome_distribuidor: TStringField;
    lbl_VlrCredito: TLabel;
    edt_VlrCredito: TDBEdit;
    frxReport1: TfrxReport;
    frxDBDataset1: TfrxDBDataset;
    procedure FormCreate(Sender: TObject);
    procedure act_pesquisarExecute(Sender: TObject);
    procedure cdsPrincipalAfterInsert(DataSet: TDataSet);
    procedure spb_DistribuidorClick(Sender: TObject);
    procedure edt_CodDistribuidorEnter(Sender: TObject);
    procedure edt_CodDistribuidorExit(Sender: TObject);

    procedure act_IncluirExecute(Sender: TObject);
    procedure act_AlterarExecute(Sender: TObject);
    procedure act_GravarExecute(Sender: TObject);
    procedure act_CancelarExecute(Sender: TObject);
    procedure btnIIncluirClick(Sender: TObject);
    procedure btnIGravarClick(Sender: TObject);
    procedure btnICancelarClick(Sender: TObject);
    procedure btnIExcluirClick(Sender: TObject);
    procedure btnIAlterarClick(Sender: TObject);
    procedure cdsLimiteDistribuidorAfterInsert(DataSet: TDataSet);
    procedure dspPrincipalBeforeUpdateRecord(Sender: TObject;
      SourceDS: TDataSet; DeltaDS: TCustomClientDataSet;
      UpdateKind: TUpdateKind; var Applied: Boolean);
    procedure dspPrincipalAfterUpdateRecord(Sender: TObject; SourceDS: TDataSet;
      DeltaDS: TCustomClientDataSet; UpdateKind: TUpdateKind);
    procedure cdsPrincipalBeforeDelete(DataSet: TDataSet);
    procedure act_ImprimirExecute(Sender: TObject);

  private
    { Private declarations }
    ID_Mestre : integer;
    bRegistroDetalheAlterado : Boolean;

    sCod_Distribuidor : String;
    procedure Pesquisar(pPesquisa: TPesquisa; pSair : Boolean = false);
    procedure cfg_Botoes_Itens;
    function VerificaItemJaSelecionado: String;
  public
    { Public declarations }
    function VerificarCampos(iIndice : Integer) : Boolean; override;
    function VerificarCamposItens(iIndice : Integer) : Boolean;
    procedure Cfg_Hints; override;
    procedure setCamposObrigatorios; override;
    procedure setTituloCampos; override;
  end;

var
  frmProdutor: TfrmProdutor;

implementation

{$R *.dfm}

uses uMensagem, uBiblioteca, uPesqGeral, udmPrincipal;

{ TfrmProdutor }

procedure TfrmProdutor.act_AlterarExecute(Sender: TObject);
begin
  inherited;

  cfg_Botoes_Itens;
end;

procedure TfrmProdutor.act_CancelarExecute(Sender: TObject);
begin
  if bRegistroDetalheAlterado then
    cdsLimiteDistribuidor.Cancel;

  inherited;

  cfg_Botoes_Itens;
end;

procedure TfrmProdutor.act_GravarExecute(Sender: TObject);
begin
  inherited;

  cfg_Botoes_Itens;
end;

procedure TfrmProdutor.act_ImprimirExecute(Sender: TObject);
begin
  inherited;

  frxReport1.ShowReport();
end;

procedure TfrmProdutor.act_IncluirExecute(Sender: TObject);
begin
  inherited;

  cfg_Botoes_Itens;
end;

procedure TfrmProdutor.act_pesquisarExecute(Sender: TObject);
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
         lFiltro := AddFiltro_Aux(lFiltro, ' CPF_CNPJ = ' + edt_PesqCodigo.Text );

      if not (edt_PesqDescricao.Text = EmptyStr) then
         lFiltro := AddFiltro_Aux(lFiltro, ' NOME LIKE ' + QuotedStr(Trim('%' + edt_PesqDescricao.Text + '%' )));

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
procedure TfrmProdutor.btnIAlterarClick(Sender: TObject);
begin

  { Alterar registro }
  pgLimiteCredito.ActivePage := tbCadastroItens;

  cdsLimiteDistribuidor.Edit;
  bRegistroDetalheAlterado := True;

  cfg_Botoes_Itens;

end;

procedure TfrmProdutor.btnICancelarClick(Sender: TObject);
var
  sText : String;
begin

  if (cdsLimiteDistribuidor.State in [dsInsert, dsEdit]) then
  begin
    if cdsLimiteDistribuidor.State = dsEdit then
      sText := 'Deseja cancelar a Altera��o?'
    else
    if cdsLimiteDistribuidor.State = dsInsert then
      sText := 'Deseja cancelar a Inser��o?';

    if SysMensagem(sText, dsConfirmacao) then
    begin
      cdsLimiteDistribuidor.Cancel;
      pgLimiteCredito.ActivePage := tbBrowserItens;

      cfg_Botoes_Itens;
    end;
  end else
  begin
    pgLimiteCredito.ActivePage := tbBrowserItens;
    cfg_Botoes_Itens;
  end;

end;

procedure TfrmProdutor.btnIExcluirClick(Sender: TObject);
begin

  { Excluir registro }
  if (SysMensagem('Deseja realmente excluir o registro?', dsConfirmacao)) then
  begin
    cdsLimiteDistribuidor.Delete;
    bRegistroDetalheAlterado := True;


    cfg_Botoes_Itens;
  end;

end;

procedure TfrmProdutor.btnIGravarClick(Sender: TObject);
begin

  if VerificarCamposItens(999) then
  begin
    if (SysMensagem('Deseja realmente salvar o registro?', dsConfirmacao)) then
    begin
      cdsLimiteDistribuidor.Post;

      pgLimiteCredito.ActivePage := tbBrowserItens;
      cfg_Botoes_Itens;
    end;
  end;

end;

procedure TfrmProdutor.btnIIncluirClick(Sender: TObject);
begin
  inherited;
  { Incluir registro }

  pgLimiteCredito.ActivePage := tbCadastroItens;

  cdsLimiteDistribuidor.Insert;
  bRegistroDetalheAlterado := True;


  cfg_Botoes_Itens;
end;

procedure TfrmProdutor.cdsLimiteDistribuidorAfterInsert(DataSet: TDataSet);
begin
  inherited;

  cdsLimiteDistribuidor.Fields[0].Value := cdsLimiteDistribuidor.RecordCount +1;
end;

procedure TfrmProdutor.cdsPrincipalAfterInsert(DataSet: TDataSet);
begin
  inherited;
  cdsPrincipalPRODUTOR_ID.Value := 9999;
end;

procedure TfrmProdutor.cdsPrincipalBeforeDelete(DataSet: TDataSet);
begin
  inherited;

  cdsLimiteDistribuidor.First;
  while not cdsLimiteDistribuidor.Eof do
  begin
    cdsLimiteDistribuidor.Delete;
  end;

end;

procedure TfrmProdutor.Cfg_Hints;
begin

  edt_CpfCnpj.Hint := 'CPF / CNPJ';
  edt_NOME.Hint    := 'Nome';

end;

procedure TfrmProdutor.dspPrincipalAfterUpdateRecord(Sender: TObject;
  SourceDS: TDataSet; DeltaDS: TCustomClientDataSet; UpdateKind: TUpdateKind);
begin
  inherited;

  if (UpdateKind = ukInsert) then
    ID_Mestre := dmPrincipal.RecuperarIdentificador('GEN_PRODUTOR_ID');

end;

procedure TfrmProdutor.dspPrincipalBeforeUpdateRecord(Sender: TObject;
  SourceDS: TDataSet; DeltaDS: TCustomClientDataSet; UpdateKind: TUpdateKind;
  var Applied: Boolean);
begin
  inherited;

  if ((UpdateKind = ukInsert) and (SourceDS.Name = QryLimiteDistribuidor.Name)) then
  begin
    if not(ID_Mestre = 0) then
    begin
      DeltaDS.FieldByName('PRODUTOR_ID').ReadOnly := False;
      DeltaDS.FieldByName('PRODUTOR_ID').NewValue := ID_Mestre;
    end;
  end;

end;

procedure TfrmProdutor.edt_CodDistribuidorEnter(Sender: TObject);
begin
  sCod_Distribuidor := cdsLimiteDistribuidorcod_distribuidor.AsString;
end;

procedure TfrmProdutor.edt_CodDistribuidorExit(Sender: TObject);
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

procedure TfrmProdutor.cfg_Botoes_Itens;
var
  Qtde: integer;
begin
  if not(cdsPrincipal.State in [dsBrowse]) then
  begin
    Qtde := (cdsLimiteDistribuidor.RecordCount);
    if (cdsLimiteDistribuidor.State in [dsInsert, dsEdit]) then
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

procedure TfrmProdutor.Pesquisar(pPesquisa: TPesquisa; pSair: Boolean);
var
  frmPesquisa : TfrmPesqGeral;

  sSQL, sOrderBy, sOpcaoJoin : String;
begin
  frmPesquisa := nil;

  try

    if (pPesquisa = pDistribuidor) then
    begin
      sSQL := 'SELECT dist.distribuidor_id id, dist.cnpj "C�digo", dist.nome "Nome" ' +
              'FROM distribuidor dist ' +
              'WHERE dist.distribuidor_id NOT IN (' + VerificaItemJaSelecionado + ')';

      sOrderBy := 'ORDER BY dist.nome';

      frmPesquisa := TfrmPesqGeral.Create( Self, 'DISTRIBUIDOR', 'dist.cnpj', 'Pesquisando Distribuidor', ['dist.cnpj', 'dist.cnpj', 'dist.nome'],
                     edt_CodDistribuidor, edt_DescDistribuidor, edt_IdDistribuidor, sSQL, SOrderBy, sOpcaoJoin, pSair);
    end;

    if pPesquisa in [ pDistribuidor ] then
    begin
      if ((not pSair and(frmPesquisa.ShowModal = mrOk)) or pSair) then
      begin
        if (pPesquisa = pDistribuidor) then
        begin
          cdsLimiteDistribuidorDISTRIBUIDOR_ID.AsInteger  := frmPesquisa.cdsPesquisa.FieldByName('id').AsInteger;
          cdsLimiteDistribuidorcod_distribuidor.AsString  := frmPesquisa.cdsPesquisa.FieldByName('C�digo').AsString;
          cdsLimiteDistribuidornome_distribuidor.AsString := frmPesquisa.cdsPesquisa.FieldByName('Nome').AsString;

          sCod_Distribuidor := frmPesquisa.cdsPesquisa.FieldByName('C�digo').AsString;

        end;
      end;
    end;

  finally
    frmPesquisa.Free;
  end;

end;

procedure TfrmProdutor.FormCreate(Sender: TObject);
begin

  TituloFormulario := 'Produtor';
  OrderBy := ' NOME';

  bRegistroDetalheAlterado := False;

  inherited;

  tbBrowserItens.TabVisible  := false;
  tbCadastroItens.TabVisible := false;
  pgLimiteCredito.ActivePage := tbBrowserItens;

  cfg_Botoes_Itens;
end;

procedure TfrmProdutor.setCamposObrigatorios;
begin

  cdsPrincipalCPF_CNPJ.Required := true;
  lbl_cpfcnpj.Caption           := lbl_cpfcnpj.Caption + '*';

  cdsPrincipalNOME.Required     := true;
  lbl_Nome.Caption              := lbl_Nome.Caption + '*';

end;

procedure TfrmProdutor.setTituloCampos;
begin

  cdsPrincipalCPF_CNPJ.DisplayLabel := 'CPF / CNPJ';
  cdsPrincipalNOME.DisplayLabel     := 'Nome';

end;

procedure TfrmProdutor.spb_DistribuidorClick(Sender: TObject);
begin

  Pesquisar( pDistribuidor );

  if (Trim( edt_CodDistribuidor.Text ) <> sCod_Distribuidor) then
  begin

    edt_CodDistribuidor.Clear;
    edt_DescDistribuidor.Clear;
    edt_IdDistribuidor.Clear;
    sCod_Distribuidor := EmptyStr;

  end;

  edt_VlrCredito.SetFocus;

end;

function TfrmProdutor.VerificaItemJaSelecionado : String;
var
  cds: TClientDataSet;
  sSelecionados : String;
begin
  sSelecionados := EmptyStr;

  cds := TClientDataSet.Create( Self );
  try
    cds.CloneCursor(cdsLimiteDistribuidor, False);

    if (cds.RecordCount = 0) then
      sSelecionados := '0';

    cds.First;
    while not( cds.Eof ) do
    begin
      if not(cds.FieldByName('DISTRIBUIDOR_ID').AsString = EmptyStr) then
      begin
        if (sSelecionados = EmptyStr) then
          sSelecionados := cds.FieldByName('DISTRIBUIDOR_ID').AsString
        else
          sSelecionados := sSelecionados + ',' + cds.FieldByName('DISTRIBUIDOR_ID').AsString
      end;

      cds.Next;
    end;

    Result := sSelecionados;
  finally
    cds.Free;
  end;
end;

function TfrmProdutor.VerificarCampos(iIndice: Integer): Boolean;
var
  bAchou : Boolean;
begin
  inherited;

  bAchou := True;

  if ((iIndice = 1) or (iIndice = 999)) and (edt_CpfCnpj.Text = EmptyStr) then
  begin
    SysMensagem('Campo CPF / CNPJ � obrigat�rio!', dsAviso);

    bAchou := False;
    edt_CpfCnpj.SetFocus;
  end else
  if ((iIndice = 2) or (iIndice = 999)) and (edt_Nome.Text = EmptyStr) then
  begin
    SysMensagem('Valor Nome � obrigat�rio!', dsAviso);

    bAchou := False;
    edt_Nome.SetFocus;
  end;

  Result := bAchou;

end;

function TfrmProdutor.VerificarCamposItens(iIndice: Integer): Boolean;
var
  bAchou : Boolean;
begin
  inherited;

  bAchou := True;

  if ((iIndice = 1) or (iIndice = 999)) and (edt_CodDistribuidor.Text = EmptyStr) then
  begin
    SysMensagem('Campo C�digo Distribuidor � obrigat�rio!', dsAviso);

    bAchou := False;
    edt_CodDistribuidor.SetFocus;
  end else
  if ((iIndice = 2) or (iIndice = 999)) and (edt_VlrCredito.Text = EmptyStr) then
  begin
    SysMensagem('Valor Vlr. Cr�dito � obrigat�rio!', dsAviso);

    bAchou := False;
    edt_VlrCredito.SetFocus;
  end;

  Result := bAchou;

end;

end.
