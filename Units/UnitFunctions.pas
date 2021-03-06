unit UnitFunctions;

interface

uses
  FMX.ListView.Appearances, FMX.ListView, FMX.ListView.Types,
  FireDAC.Comp.Client, System.SysUtils, FMX.Graphics, Data.DB,
  System.Classes;

procedure LoadBitmapFromBlob(Bitmap: TBitmap; Blob: TBlobField);
function GeraCodPontos: String;
function GeraCodUsuario: String;
function GeraCodConfig: String;
function GeraCodClube: String;
function GeraCodResultado: String;
function FormataData(dt: string): string;

implementation

procedure LoadBitmapFromBlob(Bitmap: TBitmap; Blob: TBlobField);
var
  ms: TMemoryStream;
begin
  ms := TMemoryStream.Create;
  try
    Blob.SaveToStream(ms);
    ms.Position := 0;
    Bitmap.LoadFromStream(ms);
  finally
    ms.Free;
  end;
end;

function GeraCodPontos: String;
begin
    Result := FormatDateTime('yymmddHHnnsszzz', now);
end;

function GeraCodUsuario: String;
begin
    Result := FormatDateTime('yymmddHHnnsszzz', now);
end;

function GeraCodConfig: String;
begin
    Result := FormatDateTime('yymmddHHnnsszzz', now);
end;

function GeraCodClube: String;
begin
    Result := FormatDateTime('yymmddHHnnsszzz', now);
end;

function GeraCodResultado: String;
begin
    Result := FormatDateTime('yymmddHHnnsszzz', now);
end;

// Entrada: dd/mm/yyyy hh:nn
// Saida: yyyy-mm-dd hh:nn
function FormataData(dt: string): string;
begin
    Result := Copy(dt, 7, 4) + '-' + Copy(dt, 4, 2) + '-' + Copy(dt, 1, 2) + ' ' +
              Copy(dt, 12, 5) + ':00';
end;


end.
