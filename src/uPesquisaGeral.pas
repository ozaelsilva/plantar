unit uPesquisaGeral;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, ufrwPesquisa, Data.DB, Data.FMTBcd,
  Datasnap.DBClient, Datasnap.Provider, Data.SqlExpr, Vcl.Grids, Vcl.DBGrids,
  Vcl.ComCtrls, Vcl.StdCtrls, Vcl.ExtCtrls;

type
  TPesquisa = (pEmpresa, pUnidade, pTurma1, pTurma2, pAluno);

  TfrmPesquisaGeral = class(TfrwPesquisa)
  private
    { Private declarations }
  public
    { Public declarations }
    procedure setCamposVisiveis_Grid; override;
  end;

var
  frmPesquisaGeral: TfrmPesquisaGeral;

implementation

{$R *.dfm}

uses udmPrincipal;

{ TfrmPesquisaGeral }

procedure TfrmPesquisaGeral.setCamposVisiveis_Grid;
begin
  inherited;

  if FTabela = 'UNIDADE' then
  begin
    cdsPesquisa.Fields[3].Visible := False;
    cdsPesquisa.Fields[4].Visible := False;
  end;

end;

end.
