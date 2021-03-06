unit ufrwPesquisa;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls, Vcl.ExtCtrls, Data.DB,
  Data.FMTBcd, Datasnap.DBClient, Datasnap.Provider, Data.SqlExpr, Vcl.StdCtrls,
  Vcl.Grids, Vcl.DBGrids, MidasLib, ufrwPai;

type
  TfrwPesquisa = class(TfrwPai)
    Panel1: TPanel;
    StatusBar1: TStatusBar;
    DBGrid2: TDBGrid;
    edt_Pesquisa: TEdit;
    qryPesquisa: TSQLQuery;
    dspPesquisa: TDataSetProvider;
    cdsPesquisa: TClientDataSet;
    dsPesquisa: TDataSource;
    procedure FormShow(Sender: TObject);
    procedure DBGrid2DblClick(Sender: TObject);
    procedure DBGrid2KeyPress(Sender: TObject; var Key: Char);
    procedure edt_PesquisaKeyPress(Sender: TObject; var Key: Char);
  private
    FSQL_Principal, FOrderBy, FTitulo, FCampoPesquisa : String;
    FCodigo, FDescricao : TCustomEdit;
    FOpcaoFiltro : array of string;

    function Executar_Pesquisa : Boolean;
    function WhereAND( sSQL : String ) : String;
    { Private declarations }
  public
    { Public declarations }
    FTabela : String;
    constructor Create(AOwner: TComponent;
                       pTabela: String;
                       pCampoPesquisa : String;
                       pTitulo: String;
                       pOpcaoFiltro: Array of string;
                       pCodigo: TCustomEdit = nil;
                       pDescricao: TCustomEdit = nil;
                       pIdentificador: TCustomEdit = nil;
                       pSQL: String = '';
                       pOrderBy: String = '';
                       pOpcaoJoin: String = '';
                       exitControl : boolean = False); overload;

    destructor Destroy; override;

    procedure setCamposVisiveis_Grid; virtual;
    procedure setTamanhoColunas_Grid; virtual;
    procedure setFormataColunas_Grid; virtual;
  end;

var
  frwPesquisa: TfrwPesquisa;

implementation

{$R *.dfm}

uses uMensagem;

{ TfrwPesquisa }

constructor TfrwPesquisa.Create(AOwner: TComponent;  pTabela, pCampoPesquisa, pTitulo: String; pOpcaoFiltro: Array of string; pCodigo, pDescricao,
  pIdentificador: TCustomEdit; pSQL, pOrderBy : String; pOpcaoJoin : String;
  exitControl: boolean);
var
  i : Integer;
begin
  inherited Create( AOwner );

  FTabela        := pTabela;
  FCampoPesquisa := pCampoPesquisa;
  FTitulo        := pTitulo;

  FSQL_Principal := pSQL;

  FCodigo        := pCodigo;
  FDescricao     := pDescricao;

  FOrderBy       := pOrderBy;

  SetLength(FOpcaoFiltro, Length(pOpcaoFiltro));

  for I := 0 to Length(pOpcaoFiltro) -1 do
    FOpcaoFiltro[i] := pOpcaoFiltro[i];

  if exitControl then
  begin
    QryPesquisa.SQL.Clear;
    QryPesquisa.SQL.Add( FSQL_Principal );
    QryPesquisa.SQL.Add( WhereAND(qryPesquisa.SQL.Text) + (FCampoPesquisa + '  = ' + QuotedStr(FCodigo.Text)));

    if not(Executar_Pesquisa) then
    begin
      SysMensagem('Registro n�o encontrado!',  dsAviso);
      pCodigo.Clear;
      pCodigo.SetFocus;
    end;
  end;

  Position     := poScreenCenter;



end;

function TfrwPesquisa.Executar_Pesquisa : Boolean;
var
  bEncontrou : Boolean;
begin

  if not qryPesquisa.Prepared then
    qryPesquisa.Prepared := true;


  try

  if cdsPesquisa.Active then
    cdsPesquisa.Refresh
  else
    cdsPesquisa.Open;

  except on E: Exception do
    SysMensagem(E.Message, dsErro);
  end;


  bEncontrou := not cdsPesquisa.IsEmpty;

  if not( cdsPesquisa.IsEmpty ) then
  begin
    if (Self.Visible = true) then
    begin
      DBGrid2.SelectedIndex := 0;
      DBGrid2.SetFocus;
    end;
  end;

  Result := bEncontrou;
end;

procedure TfrwPesquisa.FormShow(Sender: TObject);
begin
  edt_Pesquisa.SetFocus;

  Caption := FTitulo;

  QryPesquisa.Close;

  QryPesquisa.SQL.Clear;
  QryPesquisa.SQL.Add( FSQL_Principal + ' ' + FOrderBy);

  Executar_Pesquisa;

  setCamposVisiveis_Grid;
  setTamanhoColunas_Grid;
  setFormataColunas_Grid;

  StatusBar1.Panels[0].Text := 'Qtde. Registros: ' + IntToStr(cdsPesquisa.RecordCount);
  StatusBar1.Panels[1].Text := 'Clique 2 vezes no grid ou tecle <enter> para selecionar';
end;

procedure TfrwPesquisa.setCamposVisiveis_Grid;
begin
  if (cdsPesquisa.FieldCount > 0) then
    cdsPesquisa.Fields[0].Visible := False;

end;

procedure TfrwPesquisa.setFormataColunas_Grid;
begin

end;

procedure TfrwPesquisa.setTamanhoColunas_Grid;
begin

end;

procedure TfrwPesquisa.DBGrid2DblClick(Sender: TObject);
begin
  { Selecionar registro }
  if not dsPesquisa.DataSet.IsEmpty then
    ModalResult := mrOk;

end;

procedure TfrwPesquisa.DBGrid2KeyPress(Sender: TObject; var Key: Char);
begin
  if (key = #13) then
    DBGrid2DblClick(nil);

end;

destructor TfrwPesquisa.Destroy;
begin
//  fFiltro.Free;
  qryPesquisa.Close;

  if qryPesquisa.Prepared then
    qryPesquisa.Prepared := False;

  inherited Destroy;
end;

function TfrwPesquisa.WhereAND( sSQL : String ) : String;
var
  sRetornar : String;
begin

  if Pos('WHERE', sSQL) = 0 then
    sRetornar := ' WHERE '
  else
    sRetornar := ' AND ';

  Result := sRetornar;

end;

procedure TfrwPesquisa.edt_PesquisaKeyPress(Sender: TObject; var Key: Char);
var
  i : Integer;
  sSQLFiltros : String;
begin
  sSQLFiltros := EmptyStr;

  if (key = #13) then
  begin
    qryPesquisa.Close;
    qryPesquisa.SQL.Clear;
    qryPesquisa.SQL.Add( FSQL_Principal );

    for I := 0 to Length(FOpcaoFiltro)-1 do
    begin
      if sSQLFiltros = EmptyStr then
        sSQLFiltros := WhereAND(qryPesquisa.SQL.Text) + (FOpcaoFiltro[i] + '  LIKE ' + QuotedStr('%' + edt_Pesquisa.Text + '%'))
      else
        sSQLFiltros := sSQLFiltros + ' OR ' + (FOpcaoFiltro[i] + '  LIKE ' + QuotedStr('%' + edt_Pesquisa.Text + '%'))

    end;

    qryPesquisa.SQL.Add( sSQLFiltros );
    qryPesquisa.SQL.Add( FOrderBy );

    Executar_Pesquisa;
  end;

end;

end.
