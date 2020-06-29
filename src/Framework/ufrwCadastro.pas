unit ufrwCadastro;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ImgList, StdCtrls, Buttons, ExtCtrls, DBClient, Mask, DBCtrls,
  ActnList, System.Actions, uBiblioteca, Data.FMTBcd, Datasnap.Provider,
  Data.SqlExpr, Data.Win.ADODB, ufrwPai, Vcl.ComCtrls, Vcl.Grids, Vcl.DBGrids;

type
  TfrwCadastro = class(TfrwPai)
    ActionList1: TActionList;
    act_Cancelar: TAction;
    act_Gravar: TAction;
    cdsPrincipal: TClientDataSet;
    dsPrincipal: TDataSource;
    dspPrincipal: TDataSetProvider;
    act_Fechar: TAction;
    pgPrincipal: TPageControl;
    tbBrowser: TTabSheet;
    tbCadastro: TTabSheet;
    DBGrid1: TDBGrid;
    gBox_Pesquisa: TGroupBox;
    lbl_PesqCodigo: TLabel;
    lbl_PesqDescricao: TLabel;
    edt_PesqCodigo: TEdit;
    edt_PesqDescricao: TEdit;
    btn_Pesquisar: TBitBtn;
    btn_limpar: TBitBtn;
    Panel1: TPanel;
    btn_Incluir: TBitBtn;
    btn_Excluir: TBitBtn;
    btn_Imprimir: TBitBtn;
    btn_Alterar: TBitBtn;
    btn_Fechar: TBitBtn;
    btn_Gravar: TBitBtn;
    btn_Cancelar: TBitBtn;
    act_Incluir: TAction;
    act_Alterar: TAction;
    act_Excluir: TAction;
    act_Imprimir: TAction;
    act_pesquisar: TAction;
    act_limpar: TAction;
    QryPrincipal: TSQLQuery;
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure act_CancelarExecute(Sender: TObject);
    procedure act_GravarExecute(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure act_FecharExecute(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure SetTamanhoForm(iAltura, iLargura : Integer); virtual;
    procedure SetTituloForm(pTitulo : String); virtual;
    procedure dsPrincipalStateChange(Sender: TObject);
    procedure act_limparExecute(Sender: TObject);
    procedure act_ExcluirExecute(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure act_IncluirExecute(Sender: TObject);
    procedure act_AlterarExecute(Sender: TObject);
    procedure act_ImprimirExecute(Sender: TObject);
    procedure pgPrincipalChange(Sender: TObject);
    procedure edt_PesqCodigoKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
    FIdentificador : Integer;
    FTituloTela : String;
    FTipoForm : TTipoForm;
    FFrmCadastro: TFormClass;
    FOrderBy: String;
    FTituloFormulario: String;
    procedure ControleCorObjeto;
    procedure SetFrmCadastro(const Value: TFormClass);
    procedure SetOrderBy(const Value: String);
    procedure SetTituloFormulario(const Value: String);
  public
    { Public declarations }
    lFiltro : String;

    Filtros: WideString;                // filtros aplicados no relatorio
    FFiltro: Boolean;                   // exibir os filtros aplicados no relatorio

    fSqlPrincipal: WideString;

    pEditCodigo : TDBEdit;
    pEditFocus  : TDBEdit;
    constructor Create(AOwner: TComponent; pTituloTela: String = ''; pTipoForm: TTipoForm = dVisualizar; pIdentificador : Integer = -1); overload;
    destructor Destroy; override;

    function CampoNulo: Boolean;

    procedure Cfg_Hints; virtual;
    procedure setCamposObrigatorios; virtual;

    function VerificarCampos(iIndice : Integer) : Boolean; virtual;

    procedure Cfg_Button;

    property TituloFormulario : String read FTituloFormulario write SetTituloFormulario;
    property OrderBy : String read FOrderBy write SetOrderBy;
    property FrmCadastro : TFormClass read FFrmCadastro write SetFrmCadastro;

    procedure setColunasGridVisivel; virtual;
    procedure setTituloCampos; virtual;
    procedure AtualizarGrid;

  end;

var
  frwCadastro: TfrwCadastro;

implementation

uses udmPrincipal, uConstante, uMensagem;

{$R *.dfm}

constructor TfrwCadastro.Create(AOwner: TComponent; pTituloTela: String; pTipoForm: TTipoForm; pIdentificador : Integer);
begin
  inherited Create( AOwner );

  FTituloTela    := pTituloTela;
  FIdentificador := pIdentificador;
  FTipoForm      := pTipoForm;

end;

procedure TfrwCadastro.DBGrid1DblClick(Sender: TObject);
begin
  inherited;
  if not(cdsPrincipal.Eof) then
  begin
    pgPrincipal.ActivePage := tbCadastro;
    Cfg_Button;
  end;
end;

destructor TfrwCadastro.Destroy;
begin
  CdsPrincipal.Close;

  inherited Destroy;
end;

procedure TfrwCadastro.dsPrincipalStateChange(Sender: TObject);
begin
  tbCadastro.Enabled := cdsPrincipal.State in [dsInsert, dsEdit];

  ControleCorObjeto;
end;

procedure TfrwCadastro.edt_PesqCodigoKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;

  if ((key in ['0'..'9'] = false) and (word(key) <> vk_back)) then
    key := #0;

end;

procedure TfrwCadastro.act_AlterarExecute(Sender: TObject);
begin
  inherited;
  { Alterar registro }

  pgPrincipal.ActivePage := tbCadastro;

  cdsPrincipal.Edit;
  Cfg_Button;

end;

procedure TfrwCadastro.act_CancelarExecute(Sender: TObject);
var
  sText : String;
begin
  if (cdsPrincipal.State in [dsInsert, dsEdit]) then
  begin
    if cdsPrincipal.State = dsEdit then
      sText := 'Deseja cancelar a Altera��o?'
    else
    if cdsPrincipal.State = dsInsert then
      sText := 'Deseja cancelar a Inser��o?';

    if SysMensagem(sText, dsConfirmacao) then
    begin
      CdsPrincipal.Cancel;
      pgPrincipal.ActivePage := tbBrowser;

      Cfg_Button;

      cdsPrincipal.Refresh;
      cdsPrincipal.First;
    end;
  end else
  begin
    pgPrincipal.ActivePage := tbBrowser;
    Cfg_Button;
  end;
end;

procedure TfrwCadastro.act_ExcluirExecute(Sender: TObject);
begin
  inherited;

  { Excluir registro }
  if (SysMensagem('Deseja realmente excluir o registro?', dsConfirmacao)) then
  begin
    CdsPrincipal.Delete;
    CdsPrincipal.ApplyUpdates(-1);

    Cfg_Button;
  end;
end;

procedure TfrwCadastro.Cfg_Button;
begin

  if (act_Incluir.Tag = 0) then
    act_Incluir.Enabled := (cdsPrincipal.State in [dsBrowse]);

  if (act_Alterar.Tag = 0) then
    act_Alterar.Enabled := (cdsPrincipal.State in [dsBrowse]) and (not cdsPrincipal.IsEmpty);

  if (act_Excluir.Tag = 0) then
    act_Excluir.Enabled := (cdsPrincipal.State in [dsBrowse]) and (not cdsPrincipal.IsEmpty);

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

procedure TfrwCadastro.act_FecharExecute(Sender: TObject);
begin
  { Fechar Tela }
  if CdsPrincipal.State in [dsInsert, dsEdit] then
  begin
    if (sysMensagem('Deseja cancelar a altera��o?', dsConfirmacao)) then
      Close;

  end
  else
    Close;
end;

procedure TfrwCadastro.act_GravarExecute(Sender: TObject);
begin

  if VerificarCampos(999) then
  begin
    if (SysMensagem('Deseja realmente salvar o registro?', dsConfirmacao)) then
    begin
      CdsPrincipal.Post;

      if (CdsPrincipal.ApplyUpdates(-1) = 0) then
      begin
        pgPrincipal.ActivePage := tbBrowser;
        Cfg_Button;

        cdsPrincipal.Refresh;
        cdsPrincipal.First;
      end;
    end;
  end;
end;

procedure TfrwCadastro.act_ImprimirExecute(Sender: TObject);
begin
  inherited;
{}
end;

procedure TfrwCadastro.act_IncluirExecute(Sender: TObject);
begin
  inherited;
  { Incluir registro }

  pgPrincipal.ActivePage := tbCadastro;

  cdsPrincipal.Insert;
  cdsPrincipal.Fields[0].Value := 999;

  Cfg_Button;
end;

procedure TfrwCadastro.act_limparExecute(Sender: TObject);
begin
  { Limpar Pesquisa }
  try
    Screen.Cursor := crHourGlass;
    QryPrincipal.SQL.Text := Self.fSqlPrincipal;

    lFiltro := EmptyStr;
    lFiltro := Self.fSqlPrincipal;

    edt_PesqCodigo.Clear;
    edt_PesqDescricao.Clear;

    QryPrincipal.SQL.Clear;
    QryPrincipal.SQL.Add( lFiltro + FOrderBy );

    CdsPrincipal.Refresh;
    cdsPrincipal.First;

    edt_PesqCodigo.SetFocus;

    Cfg_Button;
  finally
     Screen.Cursor := crDefault;
     CdsPrincipal.Open;
  end;

end;

function TfrwCadastro.CampoNulo: Boolean;
var
  lIndice: integer;
  bOk: Boolean;
begin
  bOk    := False;
  Result := True;

  for lIndice := 0 to Self.ComponentCount - 1 do
  begin
    if (Self.Components[lIndice] is TCustomEdit) then
    begin
      if ((TCustomEdit(Self.Components[lIndice]).Parent = gbox_Pesquisa) and
          (Trim(TCustomEdit(Self.Components[lIndice]).Text) <> '')) then
      begin
        if not (Caracter_Valido(Trim(TCustomEdit(Self.Components[lIndice]).Text))) then
        begin
          SysMensagem('Caracter inv�lido!', dsErro);
          TCustomEdit(Self.Components[lIndice]).Clear;
          TCustomEdit(Self.Components[lIndice]).SetFocus;
          Exit;
        end
        else
          bOk := True;
      end;
    end;
  end;

  if not bOk then
  begin
    SysMensagem('Informe um filtro para a pesquisa!', dsAviso);
    edt_PesqCodigo.SetFocus;
    Result  := True;
  end
  else
  begin
    Result  := False;
  end;
  FFiltro := True;
  Filtros := EmptyWideStr;
end;

procedure TfrwCadastro.AtualizarGrid;
begin

end;

procedure TfrwCadastro.ControleCorObjeto;
var
  i : Integer;
begin
  for i := 0 to ComponentCount -1 do
  begin
    { TDBEdit }
    if (Components[i] is TDBEdit) and (TDBEdit(Components[i]).ReadOnly)then
      TDBEdit(Components[i]).Color := clInactiveBorder
    else
    if (Components[i] is TDBEdit) and not(TDBEdit(Components[i]).ReadOnly)then
      TDBEdit(Components[i]).Color := clWindow;
  end;
end;

procedure TfrwCadastro.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
var
  sText : String;
begin
  if (cdsPrincipal.State in [dsInsert, dsEdit]) then
  begin
    if cdsPrincipal.State = dsEdit then
      sText := 'Deseja cancelar a Altera��o?'
    else
    if cdsPrincipal.State = dsInsert then
      sText := 'Deseja cancelar a Inser��o?';

    if SysMensagem(sText, dsConfirmacao) then
    begin
      CdsPrincipal.Cancel;
      pgPrincipal.ActivePage := tbBrowser;

      CanClose := True;
    end else
      CanClose := False;

  end;
end;

procedure TfrwCadastro.FormCreate(Sender: TObject);
begin

  Self.fSqlPrincipal := QryPrincipal.SQL.Text;

  QryPrincipal.SQL.Add( OrderBy );

  Cfg_Hints;
  setCamposObrigatorios;

  CdsPrincipal.Open;

  Cfg_Button;

end;

procedure TfrwCadastro.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
  begin
    if (ActiveControl is TDBEdit) then
    begin
      Key := #0;
      Perform(WM_NEXTDLGCTL, 0, 0);
    end;
  end;
end;

procedure TfrwCadastro.FormShow(Sender: TObject);
begin

  Caption := 'Manuten��o de ' + FTituloFormulario;

  pgPrincipal.Pages[0].TabVisible := false;
  pgPrincipal.Pages[1].TabVisible := false;

  pgPrincipal.ActivePage := tbBrowser;

  edt_PesqCodigo.SetFocus;

  if not(cdsPrincipal.Eof) then
    DBGrid1.Focused;

end;

procedure TfrwCadastro.pgPrincipalChange(Sender: TObject);
begin
  inherited;

  tbBrowser.Enabled := cdsPrincipal.State in[dsInsert, dsEdit];

end;

procedure TfrwCadastro.SetFrmCadastro(const Value: TFormClass);
begin
  FFrmCadastro := Value;
end;

procedure TfrwCadastro.SetOrderBy(const Value: String);
begin
  FOrderBy := 'ORDER BY ' + Value;
end;

procedure TfrwCadastro.SetTamanhoForm(iAltura, iLargura : Integer);
begin
  { Procedure Responsavel por Dimencionar tamanho do Formul�rio }
  Constraints.MinHeight := iAltura;
  Constraints.MinWidth  := iLargura;
  Constraints.MaxHeight := iAltura;
  Constraints.MaxWidth  := iLargura;
end;

procedure TfrwCadastro.setTituloCampos;
begin

end;

procedure TfrwCadastro.SetTituloForm(pTitulo: String);
begin
  FTituloTela := pTitulo;
end;

procedure TfrwCadastro.SetTituloFormulario(const Value: String);
begin
  FTituloFormulario := Value;
end;

procedure TfrwCadastro.Cfg_Hints;
begin
//C�digo deve ser adicionado na heran�a
end;

procedure TfrwCadastro.setCamposObrigatorios;
begin
//C�digo deve ser adicionado na heran�a
end;

procedure TfrwCadastro.setColunasGridVisivel;
begin

end;

function TfrwCadastro.VerificarCampos(iIndice: Integer): Boolean;
begin
//C�digo deve ser adicionado na heran�a
end;

end.
