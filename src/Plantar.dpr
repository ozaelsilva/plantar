program Plantar;

uses
  Vcl.Forms,
  Windows,
  Dialogs,
  SysUtils,
  Controls,
  uBiblioteca in 'uBiblioteca.pas',
  uConstante in 'uConstante.pas',
  udmPrincipal in 'udmPrincipal.pas' {dmPrincipal: TDataModule},
  uSplash in 'uSplash.pas' {frmSplash},
  uMensagem in 'uMensagem.pas',
  uPrincipal in 'uPrincipal.pas' {frmPrincipal},
  uVariaveisGlobais in 'uVariaveisGlobais.pas',
  uSobre in 'uSobre.pas' {frmSobre},
  ufrwPesquisa in 'Framework\ufrwPesquisa.pas' {frwPesquisa},
  ufrwPai in 'Framework\ufrwPai.pas' {frwPai},
  ufrwCadastro in 'Framework\ufrwCadastro.pas' {frwCadastro},
  uProduto in 'uProduto.pas' {frmProduto},
  uProdutor in 'uProdutor.pas' {frmProdutor},
  uDistribuidor in 'uDistribuidor.pas' {frmDistribuidor},
  uNegociacao in 'uNegociacao.pas' {frmNegociacao},
  uPesqGeral in 'uPesqGeral.pas' {frmPesqGeral};

{$R *.res}

var
  MyHandle : HWND;
begin
  Application.Initialize;
  MyHandle := FindWindow (nil, SysVarNome_Sistema);
  if (MyHandle > 0) then
  begin
    SysMensagem('Aplica��o j� encontra-se em execu��o!', dsInformacao);
    Application.Terminate;
  end
  else begin
    FrmSplash:= TFrmSplash.create(application);
    Application.CreateForm(TdmPrincipal, dmPrincipal);
    Application.Title := SysVarNome_Sistema;
    FrmSplash.show;
    FrmSplash.update;
    Sleep(4000);
    FrmSplash.hide;
    FrmSplash.free;
    Application.CreateForm(TfrmPrincipal, frmPrincipal);
    Application.Run;
  end;
end.
