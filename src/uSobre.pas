unit uSobre;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, jpeg, ExtCtrls, StdCtrls, Buttons, IniFiles, Vcl.ComCtrls,
  Vcl.Imaging.pngimage;

type
  TfrmSobre = class(Tform)
    lbl_LinkSite: TLabel;
    Panel2: TPanel;
    Image1: TImage;
    OpenDialog1: TOpenDialog;
    pcPrincipal: TPageControl;
    tsSobre: TTabSheet;
    tsNotasVersao: TTabSheet;
    Memo1: TMemo;
    lbl_NomeSistema: TLabel;
    lbl_DireitosReservados: TLabel;
    lbl_Direitos: TLabel;
    mmo_Registrado: TMemo;
    lbl_Memoria: TLabel;
    lbl_SistemaOperacional: TLabel;
    btn_AtivarSistema: TButton;
    btn_Cancelar: TBitBtn;
    procedure FormCreate(Sender: TObject);
    procedure lbl_LinkSiteClick(Sender: TObject);
    procedure btn_CancelarClick(Sender: TObject);
  private
    { Private declarations }
    procedure SetTamanhoForm(iAltura, iLargura : Integer);
  public
    { Public declarations }
  end;

var
  frmSobre: TfrmSobre;

implementation

uses uConstante, uMensagem, uBiblioteca;

{$R *.dfm}

{ TfrmSobre }

procedure TfrmSobre.btn_CancelarClick(Sender: TObject);
begin
  close;
end;

procedure TfrmSobre.FormCreate(Sender: TObject);
begin
  inherited;
  Caption                        := 'Sobre ' + SysVarNome_Sistema;

  lbl_NomeSistema.Caption        := SysVarNome_SistemaDetalhado + ' ' + SysVersaoAplicativo;
  lbl_DireitosReservados.Caption := SysVarNome_SoftHouse;
  lbl_SistemaOperacional.Caption := SysNomeSO +  ' - ' + SysVersaoSO + ' ' + SysBuildSO;
  lbl_Memoria.Caption            := 'Memória Dispónivel: ' + SysVerificaMemoria(3) + ' KB';
  lbl_LinkSite.Caption           := SysVarWeb_Page;
  lbl_LinkSite.Hint              := SysVarWeb_Page;

  mmo_Registrado.Lines.Add('Empresa: DEMO');
  mmo_Registrado.Lines.Add(Sistema.SysVarNomeRazaoSocial_Empresa);

  pcPrincipal.ActivePage := tsSobre;
end;

procedure TfrmSobre.lbl_LinkSiteClick(Sender: TObject);
begin
  inherited;
  SysChamaWebPage(lbl_LinkSite.Caption);
end;

procedure TfrmSobre.SetTamanhoForm(iAltura, iLargura: Integer);
begin
  iAltura  := 547;
  iLargura := 578;
  inherited;
end;

end.
