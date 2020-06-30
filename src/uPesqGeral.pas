unit uPesqGeral;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, ufrwPesquisa, Data.DB, Data.FMTBcd,
  Datasnap.DBClient, Datasnap.Provider, Data.SqlExpr, Vcl.Grids, Vcl.DBGrids,
  Vcl.ComCtrls, Vcl.StdCtrls, Vcl.ExtCtrls;

type
  TfrmPesqGeral = class(TfrwPesquisa)
  private
    { Private declarations }
  public
    { Public declarations }
    procedure setTamanhoColunas_Grid; override;
    procedure setFormataColunas_Grid; override;
  end;

var
  frmPesqGeral: TfrmPesqGeral;

implementation

{$R *.dfm}

uses udmPrincipal;

{ TfrmPesqGeral }

procedure TfrmPesqGeral.setFormataColunas_Grid;
begin

  if FTabela = 'PRODUTOR_CREDITO' then
    TNumericField(cdsPesquisa.Fields[3]).DisplayFormat := '###,##0.00'
  else
  if FTabela = 'PRODUTO' then
    TNumericField(cdsPesquisa.Fields[3]).DisplayFormat := '###,##0.00';

end;

procedure TfrmPesqGeral.setTamanhoColunas_Grid;
begin

  if FTabela = 'PRODUTOR_CREDITO' then
  begin
    DBGrid2.Columns[0].Width := 90;
    DBGrid2.Columns[1].Width := 230;
    DBGrid2.Columns[2].Width := 120;
  end else
  if FTabela = 'PRODUTO' then
  begin
    DBGrid2.Columns[0].Width := 90;
    DBGrid2.Columns[1].Width := 230;
    DBGrid2.Columns[2].Width := 120;
  end;

end;

end.
