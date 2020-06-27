unit uSplash;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, ExtCtrls, jpeg, Vcl.Imaging.pngimage;

type
  TfrmSplash = class(TForm)
    Panel2: TPanel;
    Panel3: TPanel;
    lblNomeSoftwareHouse: TLabel;
    lblSistema: TLabel;
    lblWebPage: TLabel;
    imgLogotipo: TImage;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmSplash: TfrmSplash;

implementation

uses uConstante, uMensagem, uBiblioteca;

{$R *.dfm}

procedure TfrmSplash.FormCreate(Sender: TObject);
begin
  { Carrega variaveis de Sistema }
  lblNomeSoftwareHouse.Caption := SysVarNome_SoftHouse;
  lblSistema.Caption           := SysVarNome_SistemaComercial;
  lblWebPage.Caption           := SysVarWeb_Page;
end;

end.
