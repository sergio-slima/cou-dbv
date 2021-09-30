unit UnitDM;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.SQLite,
  FireDAC.Phys.SQLiteDef, FireDAC.Stan.ExprFuncs, FireDAC.FMXUI.Wait, Data.DB,
  FireDAC.Comp.Client, System.IOUtils, FireDAC.Stan.Param, FireDAC.DatS,
  FireDAC.DApt.Intf, FireDAC.DApt, FireDAC.Comp.DataSet;

type
  Tdm = class(TDataModule)
    conn: TFDConnection;
    qryConsOS: TFDQuery;
    qryConsCliente: TFDQuery;
    qryGeral: TFDQuery;
    qryFoto: TFDQuery;
    procedure connBeforeConnect(Sender: TObject);
    procedure DataModuleCreate(Sender: TObject);
    procedure connAfterConnect(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dm: Tdm;

implementation

{%CLASSGROUP 'FMX.Controls.TControl'}

{$R *.dfm}

procedure Tdm.connAfterConnect(Sender: TObject);
begin
    // Cria tabela de Usuario...
    conn.ExecSQL('CREATE TABLE IF NOT EXISTS TAB_USUARIO(' +
                 'COD_USUARIO VARCHAR(20) PRIMARY KEY,' +
                 'NOME_USUARIO VARCHAR(50)' +
                 ')' );

    // Cria tabela de Clubes...
    conn.ExecSQL('CREATE TABLE IF NOT EXISTS TAB_CLUBE(' +
                 'COD_CLUBE VARCHAR(20) PRIMARY KEY,' +
                 'NOME VARCHAR(50),' +
                 'DISTRITO VARCHAR(20),' +
                 'REGIAO VARCHAR(20),' +
                 'ASSOCIACAO VARCHAR(20),' +
                 'DIRETOR VARCHAR(50),' +
                 'COR INTEGER' +
                 ')');

    // Cria tabela de Pontuação...
    conn.ExecSQL('CREATE TABLE IF NOT EXISTS TAB_PONTUACAO(' +
                 'COD_PONTUACAO VARCHAR(20) PRIMARY KEY,' +
                 'DESCRICAO VARCHAR(100),' +
                 'PONTO_MAX INTEGER' +
                 ')' );

    // Cria tabela de Avaliação...
    conn.ExecSQL('CREATE TABLE IF NOT EXISTS TAB_AVAL(' +
                 'COD_AVAL VARCHAR(20) PRIMARY KEY,' +
                 'COD_CLUBE VARCHAR(20),' +
                 'COD_PONTUACAO VARCHAR(20),' +
                 'PONTOS INTEGER,' +
                 'DT_AVAL DATETIME,' +
                 'ASSUNTO VARCHAR(100),' +
                 'STATUS CHAR(1)' +
                 ')' );

end;

procedure Tdm.connBeforeConnect(Sender: TObject);
begin
    conn.DriverName := 'SQLite';

    {$IFDEF MSWINDOWS}
    conn.Params.Values['Database'] := System.SysUtils.GetCurrentDir + '\ACOUDBV.db';
    {$ELSE}
    conn.Params.Values['Database'] := TPath.Combine(TPath.GetDocumentsPath, 'ACOUDBV.db');
    {$ENDIF}
end;

procedure Tdm.DataModuleCreate(Sender: TObject);
begin
    conn.Connected := true;
end;

end.
