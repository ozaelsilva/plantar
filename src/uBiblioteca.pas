unit uBiblioteca;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ImgList, ActnList, ComCtrls, ExtCtrls, ToolWin, ActnMan, ActnCtrls,
  XPStyleActnCtrls, StdCtrls, Clipbrd, ShellAPI, Data.DB, Datasnap.DBClient;

type
  TTipoForm = (dVisualizar, dAlterar, dInserir);

  { Declara��o da TBiblioteca }
  function SysVersao(var reVersao: _OSVERSIONINFOA): boolean;

  function  ArquivoVersao(path: string): ShortString;
  function  MemoriaEmUso: Cardinal;

  function IfThen(Operacao : Variant; pVerdadeiro : Variant; pFalso: Variant) : Variant;

  function  EncriptografarString(StrValue : String; Chave: Word) : String;
  function  CriptografarString(mStr, mChave: string): string;
  procedure CapturarTela( frm : TForm );
  function  CapsLook : Boolean;
  function  NumLook : Boolean;

  function  SysVersaoAplicativo : String;

  function  SysVersaoSO : String;
  function  SysNomeSO   : String;
  function  SysBuildSO  : String;

  function  SysVerificaMemoria(iParam : Integer = 0) : String;

  procedure ChamaArquivoAjuda(phelp: Integer);

  procedure SysChamaWebPage(Web : String);

  function SysZeroAEsquerda( pZero: string; pQtd: integer): string;


  function SysEncriString(sText : String) : String;
  function SysDescrString(sText : String) : String;

  function AddFiltro_Aux(pFiltro, sFiltros: WideString): WideString;

  function SysContarSelecionados( pDsPrincipal : TClientDataSet) : Integer;

  function Caracter_Valido(s: string): Boolean;


Const
  cObrigatorio = ' (*)';

implementation

uses uConstante, uMensagem;


function HtmlHelp(hwndCaller: THandle; pszFile: PChar; uCommand: cardinal; dwData: longint): THandle; stdcall;
external 'hhctrl.ocx' name 'HtmlHelpA' ;

function  CriptografarString(mStr, mChave: string): string;
var
  i, TamanhoString, pos, PosLetra, TamanhoChave: Integer;
begin
  Result := mStr;
  TamanhoString := Length(mStr);
  TamanhoChave := Length(mChave);
  for i := 1 to TamanhoString do
  begin
    pos := (i mod TamanhoChave);
    if pos = 0 then
    pos := TamanhoChave;
    posLetra := ord(Result[i]) xor ord(mChave[pos]);
    if posLetra = 0 then
    posLetra := ord(Result[i]);
    Result[i] := chr(posLetra);
    end;
end;

function SysZeroAEsquerda( pZero: string; pQtd: integer): string;
var
  i, vTam: integer;
  vAux: string;

begin

  vAux := pZero;
  vTam := length( pZero );
  pZero := '';
  for i := 1 to pQtd - vTam do
    pZero := '0' + pZero;

  vAux := pZero + vAux;

  result := vAux;

end;

procedure  SysChamaWebPage(Web : String);
begin
  ShellExecute(Application.Handle, nil, PChar(Web), nil, nil, SW_SHOWNORMAL);
end;

function IfThen(Operacao : Variant; pVerdadeiro : Variant; pFalso: Variant) : Variant;
var
  Valor : Variant;
begin
  if Operacao then
    Valor := pVerdadeiro
  else
    Valor := pFalso;

  Result := Valor;
end;

function Caracter_Valido(s: string): Boolean;
var
  i: integer;
begin
  for I := 1 to Length(s) do
    Delete(s, Pos('%', s), 1);
  if (Length(s) < 1) then
    Result := False
  else
    Result := True;
end;

function AddFiltro_Aux(pFiltro, sFiltros: WideString): WideString;
var
  sSQL_Temp: string;
begin
  { Fun��o para montagem de sql's dinamicos }
  sSQL_Temp := UpperCase(pFiltro);

  if (Pos('WHERE', sSQL_Temp) = 0) then
    sFiltros := ' WHERE ' + sFiltros
  else
    sFiltros := ' AND ' + sFiltros;

  Result := pFiltro + sFiltros;
end;

function  SysDescrString(sText: String): String;
begin
  Result := sText;
end;

function  SysEncriString(sText: String): String;
begin
  Result := sText;
end;

function  EncriptografarString(StrValue : String; Chave: Word) : String;
var
  i: Integer;
  OutValue : String;
begin
  OutValue := '';
  for I := 1 to Length(StrValue) do
    OutValue := OutValue + char(Not(ord(StrValue[I])-Chave));
    Result := OutValue;
end;

procedure  CapturarTela( frm : TForm );
var Origem, Destino: TRect;
  DC: HDc;
  Canv: TCanvas;
  Bmp: TBitMap;
  Arquivo: string;
  AData: THandle;
begin
  { Capturando Tela Atual }
  Arquivo := frm.Name;
  Arquivo := Arquivo + FormatDateTime('dd_mm_yyyy_hhmm', Now ) + '.bmp';
  Bmp := TBitMap.Create;
  try
    Bmp.Height := frm.Height;
    Bmp.Width := frm.Width;
    DC := GetWindowDC( frm.Handle );
    Canv := TCanvas.Create;
    Canv.Handle := DC;
    Origem := Rect( 0, 0, frm.Width, frm.Height );
    Destino := Rect( 0, 0, frm.Width, frm.Height );
    Bmp.Canvas.CopyRect( Destino, Canv, Origem );
    Bmp.SaveToClipboardFormat(CF_PICTURE , AData, SystemPalette16 );
    Bmp.SaveToFile(ExtractFileDir(Application.ExeName) + '\Imagens\' + Arquivo);
  finally
    BMP.Free;
  end;
end;

function  CapsLook : Boolean;
begin
//  if GetKeyState(VK_NUMLOCK) = True then
//    Result := True
//  else
//    Result := False;
end;

function  NumLook : Boolean;
begin
//  if GetKeyState(VK_CAPITAL) = True then
//    Result := True
//  else
//    Result := False;
end;

procedure  ChamaArquivoAjuda(phelp: Integer);
var
  Dir : string;
begin
  { Chamar Ajuda do Sistema }
  Dir := ExtractFileDir(Application.ExeName);
  Dir := Dir + SysVarPasta_de_Ajuda + SysVarArquivo_de_Ajuda;
  if FileExists(Dir) then
    HtmlHelp(Screen.ActiveForm.Handle, PChar(Dir), $F, phelp )
  else
//    SysMensagem('Arquivo de Help n�o Encontrado!',dsErro);
end;

function  ArquivoVersao(path: string): ShortString;
var size, size2: DWord;
  pt, pt2: Pointer;
begin
  { Descobre Vers�o do Arquivo }
  Result := '';
  size := GetFileVersionInfoSize(PChar(path), size2);
  if Size > 0 then begin
    GetMem(pt, size);
    try
      GetFileVersionInfo(PChar(path), 0, size, pt);
      VerQueryValue(pt, '\', pt2, size2);
      { Retorna o resultado }
      Result := IntToStr(HiWord(TVSFixedFileInfo(pt2^).dwFileVersionMS)) + '.' +
                IntToStr(LoWord(TVSFixedFileInfo(pt2^).dwFileVersionMS)) + '.' +
                IntToStr(HiWord(TVSFixedFileInfo(pt2^).dwFileVersionLS)) + '.' +
                IntToStr(LoWord(TVSFixedFileInfo(pt2^).dwFileVersionLS))
    finally
      FreeMem(pt);
    end;
  end;
end;

function  SysVersaoAplicativo : String;
begin
  { Vers�o do Sistema }
  Result := 'Vers�o: ' + ArquivoVersao(Application.ExeName);
end;

function  MemoriaEmUso : Cardinal;
begin
//  Result := GetTotalPhysicalMemory;
end;

function  SysVersao(var reVersao: _OSVERSIONINFOA): boolean;
begin
  reVersao.dwOSVersionInfoSize := SizeOf(reVersao);
  Result := GetVersionExA(reVersao);
end;

function  SysVersaoSO : String;
var
  reVersaoAtual: _OSVERSIONINFOA;
begin
  if SysVersao(reVersaoAtual) then
    Result := IntToStr(reVersaoAtual.dwMajorVersion) + '.' +

  IntToStr(reVersaoAtual.dwMinorVersion)
  else
    Result := '';
end;

function  SysNomeSO : String;
begin
  Result := 'Windows 7';
end;

function   SysBuildSO  : String;
begin
  Result := '(Build 7600)';
end;

function SysContarSelecionados( pDsPrincipal : TClientDataSet ) : Integer;
var
  iCont : Integer;
  DataSetTemp : TClientDataSet;
begin

  iCont:= 0;

  if pDsPrincipal.State in [dsEdit] then
    pDsPrincipal.Post;

  try
    DataSetTemp := TClientDataSet.Create( nil );

    if (pDsPrincipal.Active) then
    begin
      DataSetTemp.CloneCursor(pDsPrincipal, false, false);

      DataSetTemp.First;
      while not(DataSetTemp.Eof) do
      begin
        if DataSetTemp.FieldByName('SELECIONAR').Value = 1 then
          iCont := iCont + 1;

        DataSetTemp.Next;
      end;
    end;

  finally
    FreeAndNil(DataSetTemp);
  end;

  Result := iCont;
end;

function  SysVerificaMemoria(iParam : Integer) : String;
var
  MemoryStatus: TMemoryStatus;
  sText : String;
begin
  MemoryStatus.dwLength:= sizeof(MemoryStatus);
  GlobalMemoryStatus(MemoryStatus);

  case iParam of
    0 : sText := IntToStr(MemoryStatus.dwLength);
    1 : sText := IntToStr(MemoryStatus.dwMemoryLoad);
    2 : sText := IntToStr(MemoryStatus.dwTotalPhys);
    3 : sText := IntToStr(MemoryStatus.dwAvailPhys);
    4 : sText := IntToStr(MemoryStatus.dwTotalPageFile);
    5 : sText := IntToStr(MemoryStatus.dwAvailPageFile);
    6 : sText := IntToStr(MemoryStatus.dwTotalVirtual);
    7 : sText := IntToStr(MemoryStatus.dwAvailVirtual);
  end;

  Result := sText;
end;

end.
