unit ufrwPai;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.ComCtrls;

type
  TfrwPai = class(TForm)
    Timer1: TTimer;
    stb_Principal: TStatusBar;
    procedure Timer1Timer(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frwPai: TfrwPai;

implementation

{$R *.dfm}

procedure TfrwPai.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TfrwPai.Timer1Timer(Sender: TObject);
begin
  stb_Principal.Panels[0].Text := Self.Name;
  stb_Principal.Panels[1].Text := Application.Hint;
end;

end.
