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

    // Cria tabela de Pontuação...
    conn.ExecSQL('DROP TABLE IF EXISTS TAB_CLUBE');

    // Cria tabela de Clubes...
    conn.ExecSQL('CREATE TABLE IF NOT EXISTS TAB_CLUBES(' +
                 'COD_CLUBE VARCHAR(20) PRIMARY KEY,' +
                 'NOME VARCHAR(50),' +
                 'DISTRITO VARCHAR(20),' +
                 'REGIAO VARCHAR(20),' +
                 'ASSOCIACAO VARCHAR(20),' +
                 'DIRETOR VARCHAR(50),' +
                 'PONTOS VARCHAR(10),' +
                 'TOTAL VARCHAR(10)' +
                 ')');

    // Cria tabela de Tab Resultado...
    conn.ExecSQL('CREATE TABLE IF NOT EXISTS TAB_RESULTADO(' +
                 'COD_RESULTADO VARCHAR(20) PRIMARY KEY,' +
                 'COD_CLUBE VARCHAR(20),' +
                 'AVALIADOR VARCHAR(50),' +
                 'OBSERVACAO VARCHAR(100),' +
                 'PONTOS VARCHAR(10)' +
                 ')');

    // Cria tabela de Pontuação...
    conn.ExecSQL('DROP TABLE IF EXISTS TAB_PONTUACAO');

    // Cria tabela de Avaliação...
    conn.ExecSQL('DROP TABLE IF EXISTS TAB_AVAL' );

    // Cria tabela de Pontos...
    conn.ExecSQL('CREATE TABLE IF NOT EXISTS TAB_PONTOS(' +
                 'COD_PONTO VARCHAR(20) PRIMARY KEY,' +
                 'COD_CLUBE VARCHAR(20),' +
                 'PTS_B1 VARCHAR(10),' +
                 'PTS_B2 VARCHAR(10),' +
                 'PTS_B3 VARCHAR(10),' +
                 'PTS_B4 VARCHAR(10),' +
                 'PTS_B5 VARCHAR(10),' +
                 'PTS_B6 VARCHAR(10),' +
                 'PTS_B7 VARCHAR(10),' +
                 'PTS_B8 VARCHAR(10),' +
                 'PTS_M1 VARCHAR(10),' +
                 'PTS_M2 VARCHAR(10),' +
                 'PTS_M3 VARCHAR(10),' +
                 'PTS_M4 VARCHAR(10),' +
                 'PTS_M5 VARCHAR(10),' +
                 'PTS_M6 VARCHAR(10),' +
                 'PTS_M7 VARCHAR(10),' +
                 'PTS_M8 VARCHAR(10),' +
                 'PTS_M9 VARCHAR(10),' +
                 'PTS_A1 VARCHAR(10),' +
                 'PTS_A2 VARCHAR(10),' +
                 'PTS_A3 VARCHAR(10),' +
                 'PTS_A4 VARCHAR(10),' +
                 'PTS_A5 VARCHAR(10),' +
                 'PTS_A6 VARCHAR(10),' +
                 'PTS_A7 VARCHAR(10),' +
                 'PTS_A8 VARCHAR(10),' +
                 'PTS_A9 VARCHAR(10),' +
                 'PTS_A10 VARCHAR(10),' +
                 'PTS_T1 VARCHAR(10),' +
                 'PTS_T2 VARCHAR(10),' +
                 'PTS_T3 VARCHAR(10),' +
                 'PTS_T4 VARCHAR(10),' +
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
