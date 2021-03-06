unit uMensagem;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ImgList, ActnList, ComCtrls, ExtCtrls, ToolWin, ActnMan, ActnCtrls,
  XPStyleActnCtrls, StdCtrls, IniFiles;

type
  TipoMensagem = (dsConfirmacao, dsAviso, dsPergunta, dsInformacao, dsErro, dsImpressao);

  { Declara��o da TMensagem }
  function IdiomaMensagem(pTexto : String) : String;
  function SysMensagem(vrTexto: String; vrTipoMensagem : TipoMensagem) : Boolean;

implementation

uses uConstante, uBiblioteca;

function IdiomaMensagem(pTexto : String) : String;
var
  ArqIni : tIniFile;
  Dir : string;
  pString : String;
begin
  { Chamar Arquivo de Idiomado Sistema }

  Dir := ExtractFileDir(Application.ExeName);
  Dir := Dir + SysVarPasta_de_Arquivos + SysVarArquivo_de_Idioma;

  if FileExists(Dir) then
  begin
    ArqIni := tIniFile.Create(Dir);
    try
      pString := ArqIni.ReadString('strings', pTexto, pString);
    finally
      ArqIni.Free;
      Result := pString;
    end;
  end
  else
    SysMensagem('Arquivo de Idioma n�o Encontrado!',dsErro);
end;

function SysMensagem(vrTexto: String; vrTipoMensagem : TipoMensagem) : Boolean;
begin
  { Fun��o Para Controlar Mensagens }
  Result := false;
  case vrTipoMensagem of
    dsConfirmacao: begin
      if MessageBox(Application.Handle, Pchar (vrTexto), 'Confirma��o', MB_OKCANCEL + MB_ICONQUESTION) = ID_OK then
        Result := true;
    end;
    dsAviso       : begin
      if MessageBox(Application.Handle, Pchar (vrTexto), 'Aviso', MB_OK + MB_ICONWARNING) = ID_OK then
        Result := true;
    end;
    dsPergunta    : begin
      if MessageBox(Application.Handle, Pchar (vrTexto), 'Pergunta', MB_OKCANCEL + MB_ICONQUESTION) = ID_OK then
        Result := true;
    end;
    dsInformacao  : begin
      if MessageBox(Application.Handle, Pchar (vrTexto), 'Informa��o', MB_OK + MB_ICONINFORMATION) = ID_OK then
        Result := true;
    end;
    dsErro        : begin
      if MessageBox(Application.Handle, Pchar (vrTexto), 'Erro', MB_OK + MB_ICONERROR) = ID_OK then
        Result := true;
    end;
  end;
end;

end.
