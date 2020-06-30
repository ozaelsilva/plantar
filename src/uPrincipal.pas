unit uPrincipal;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, Grids, DBGrids, ExtCtrls, ToolWin, ImgList, StdCtrls,
  WideStrings, FMTBcd, Provider, DB, DBClient, SqlExpr, Spin, Buttons, ActnList,
  System.Actions, System.ImageList, Vcl.Menus, Math, WiniNet, DateUtils,
  Vcl.Imaging.pngimage;

type
  TfrmPrincipal = class(TForm)
    CoolBar1: TCoolBar;
    ToolBar2: TToolBar;
    ToolButton6: TToolButton;
    StatusBar1: TStatusBar;
    ImageList1: TImageList;
    ToolButton2: TToolButton;
    Timer1: TTimer;
    ActionList1: TActionList;
    act_Sair: TAction;
    act_Sobre: TAction;
    MainMenu1: TMainMenu;
    Cadastros1: TMenuItem;
    Negociaes1: TMenuItem;
    Produtor1: TMenuItem;
    Produto1: TMenuItem;
    Distribuidor1: TMenuItem;
    N1: TMenuItem;
    Sair1: TMenuItem;
    GerarNegociao1: TMenuItem;
    Ajuda1: TMenuItem;
    Sobre1: TMenuItem;
    act_Produtor: TAction;
    act_Produto: TAction;
    aco_distribuidor: TAction;
    act_negociacao: TAction;
    Image1: TImage;
    procedure Timer1Timer(Sender: TObject);
    procedure ToolButton6Click(Sender: TObject);
    procedure act_SairExecute(Sender: TObject);
    procedure act_SobreExecute(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure act_ProdutoExecute(Sender: TObject);
    procedure act_ProdutorExecute(Sender: TObject);
    procedure aco_distribuidorExecute(Sender: TObject);
    procedure act_negociacaoExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

uses uMensagem, udmPrincipal, uConstante, uBiblioteca, uVariaveisGlobais, uPesquisaGeral,
  uSobre, uProduto, uProdutor, uDistribuidor, uNegociacao;

{$R *.dfm}

procedure TfrmPrincipal.act_SobreExecute(Sender: TObject);
var
  frmSobre: TfrmSobre;
begin

  frmSobre := TfrmSobre.Create( Self );
  try
    frmSobre.ShowModal;

  finally
    frmSobre.Free;
  end;
end;

procedure TfrmPrincipal.aco_distribuidorExecute(Sender: TObject);
var
  frmDistribuidor: TfrmDistribuidor;
begin

  frmDistribuidor := TfrmDistribuidor.Create( Self );
  try
    frmDistribuidor.ShowModal;

  finally
    frmDistribuidor.Free;
  end;
end;

procedure TfrmPrincipal.act_SairExecute(Sender: TObject);
begin
  Close;
end;

procedure TfrmPrincipal.act_negociacaoExecute(Sender: TObject);
var
  frmNegociacao: TfrmNegociacao;
begin

  frmNegociacao := TfrmNegociacao.Create( Self );
  try
    frmNegociacao.ShowModal;

  finally
    frmNegociacao.Free;
  end;

end;

procedure TfrmPrincipal.act_ProdutoExecute(Sender: TObject);
var
  frmProduto: TfrmProduto;
begin

  frmProduto := TfrmProduto.Create( Self );
  try
    frmProduto.ShowModal;

  finally
    frmProduto.Free;
  end;

end;

procedure TfrmPrincipal.act_ProdutorExecute(Sender: TObject);
var
  frmProdutor: TfrmProdutor;
begin

  frmProdutor := TfrmProdutor.Create( Self );
  try
    frmProdutor.ShowModal;

  finally
    frmProdutor.Free;
  end;

end;

procedure TfrmPrincipal.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin

  if not(SysMensagem('Você tem certeza de que quer sair?', dsConfirmacao)) then
    Canclose := False;

end;

procedure TfrmPrincipal.FormCreate(Sender: TObject);
begin
  Caption := SysVarNome_SistemaDetalhado;
end;

procedure TfrmPrincipal.Timer1Timer(Sender: TObject);
begin
  StatusBar1.Panels[0].Text := 'Database: ' + Sistema.SysVarBanco_de_dados;
  StatusBar1.Panels[1].Text := Application.Hint;
end;

procedure TfrmPrincipal.ToolButton6Click(Sender: TObject);
begin
  Close;
end;

end.
