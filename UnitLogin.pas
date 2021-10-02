unit UnitLogin;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Objects,
  FMX.Layouts, FMX.Controls.Presentation, FMX.StdCtrls, FMX.Edit, uFancyDialog;

type
  TFrmLogin = class(TForm)
    Layout1: TLayout;
    rectAcessar: TRectangle;
    Label1: TLabel;
    Image1: TImage;
    Label2: TLabel;
    ImgLogo: TImage;
    EdtUsuario: TEdit;
    procedure rectAcessarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    fancy : TFancyDialog;
  public
    { Public declarations }
  end;

var
  FrmLogin: TFrmLogin;

implementation

{$R *.fmx}

uses UnitPrincipal, UnitDM, UnitFunctions;

procedure TFrmLogin.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  fancy.DisposeOf;
end;

procedure TFrmLogin.FormCreate(Sender: TObject);
begin
  fancy := TFancyDialog.Create(FrmLogin);
end;

procedure TFrmLogin.rectAcessarClick(Sender: TObject);
begin
  if EdtUsuario.Text = '' then
  begin
    fancy.Show(TIconDialog.Info, '', 'Informe seu nome!', 'OK');
    Exit;
  end;

  with DM.qryConsCliente do
  begin
    Close;
    SQL.Clear;
    SQL.Add('INSERT INTO TAB_USUARIO (COD_USUARIO, NOME_USUARIO)');
    SQL.Add('VALUES (:COD_USUARIO, :NOME_USUARIO)');
    ParamByName('COD_USUARIO').AsString:=GeraCodUsuario;
    ParamByName('NOME_USUARIO').AsString:=EdtUsuario.Text;
    Execute;
  end;

  if Assigned(FrmPrincipal) then
      Application.CreateForm(TFrmPrincipal, FrmPrincipal);

  Application.MainForm := FrmPrincipal;
  FrmPrincipal.Nome_Usuario:= EdtUsuario.Text;
  FrmPrincipal.Show;
  FrmLogin.Close;
end;

end.
