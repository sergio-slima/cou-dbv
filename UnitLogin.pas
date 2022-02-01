unit UnitLogin;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Objects,
  FMX.Layouts, FMX.Controls.Presentation, FMX.StdCtrls, FMX.Edit, uFancyDialog,
  FMX.Ani;

type
  TFrmLogin = class(TForm)
    Layout1: TLayout;
    rectAcessar: TRectangle;
    Label1: TLabel;
    Label2: TLabel;
    ImgLogo: TImage;
    EdtUsuario: TEdit;
    VScroll: TVertScrollBox;
    lytAvaliador: TLayout;
    Layout2: TLayout;
    Layout9: TLayout;
    cloSelecao: TCircle;
    imgBasico: TImage;
    imgTodas: TImage;
    imgMovimento: TImage;
    Label9: TLabel;
    imgAvancado: TImage;
    imgInstrutor: TImage;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Layout3: TLayout;
    lytLogin: TLayout;
    AnimaLogin: TFloatAnimation;
    Layout4: TLayout;
    ImgLogin: TImage;
    FloatAnimation1: TFloatAnimation;
    FloatAnimation2: TFloatAnimation;
    Image1: TImage;
    Rectangle1: TRectangle;
    Label8: TLabel;
    Label10: TLabel;
    Layout5: TLayout;
    EdtEmail: TEdit;
    Layout6: TLayout;
    EdtSenha: TEdit;
    procedure rectAcessarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure EdtUsuarioEnter(Sender: TObject);
    procedure FormVirtualKeyboardHidden(Sender: TObject;
      KeyboardVisible: Boolean; const Bounds: TRect);
    procedure imgTodasClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure AnimaLoginFinish(Sender: TObject);
  private
    { Private declarations }
    fancy : TFancyDialog;
    foco: TControl;
  public
    { Public declarations }
  end;

var
  FrmLogin: TFrmLogin;

implementation

{$R *.fmx}

uses UnitPrincipal, UnitDM, UnitFunctions, Unitinicial;

procedure Ajustar_Scroll();
var
  x: Integer;
begin
  with FrmLogin do
  begin
    VScroll.Margins.Bottom := 250;
    VScroll.ViewportPosition := PointF(VScroll.ViewportPosition.X,
                                TControl(foco).Position.Y - 90);
  end;
end;

procedure SelecionaIcone(Sender: TObject);
begin
  with FrmLogin do
  begin
    imgTodas.Tag := 0;
    imgBasico.Tag := 0;
    imgMovimento.Tag := 0;
    imgAvancado.Tag := 0;
    imgInstrutor.Tag := 0;

    TImage(Sender).Tag := 1;

    cloSelecao.AnimateFloat('Position.X', TImage(Sender).Position.X + 20, 0.2);
  end;

end;

procedure TFrmLogin.AnimaLoginFinish(Sender: TObject);
begin
  lytLogin.Visible:=False;
  ImgLogin.Visible:= True;
  FloatAnimation1.Start;
  FloatAnimation2.Start;
end;

procedure TFrmLogin.EdtUsuarioEnter(Sender: TObject);
begin
    foco := TControl(TEdit(sender).Parent);
    Ajustar_Scroll();
end;

procedure TFrmLogin.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  fancy.DisposeOf;
end;

procedure TFrmLogin.FormCreate(Sender: TObject);
begin
  fancy := TFancyDialog.Create(FrmLogin);

end;

procedure TFrmLogin.FormShow(Sender: TObject);
begin
   imgTodas.Tag := 1;
end;

procedure TFrmLogin.FormVirtualKeyboardHidden(Sender: TObject;
  KeyboardVisible: Boolean; const Bounds: TRect);
begin
    VScroll.Margins.Bottom := 0;
end;

procedure TFrmLogin.imgTodasClick(Sender: TObject);
begin
    SelecionaIcone(Sender);
end;

procedure TFrmLogin.rectAcessarClick(Sender: TObject);
var
  avaliar: String;
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

  // Icone selecionado
  if imgTodas.Tag = 1 then avaliar := 'Todas';
  if imgBasico.Tag = 1 then avaliar := 'Básico';
  if imgMovimento.Tag = 1 then avaliar := 'Movimento';
  if imgAvancado.Tag = 1 then avaliar := 'Avançado';
  if imgInstrutor.Tag = 1 then avaliar := 'Instrutor';

  if not Assigned(FrmPrincipal) then
      Application.CreateForm(TFrmPrincipal, FrmPrincipal);

  Application.MainForm := FrmPrincipal;
  FrmPrincipal.Nome_Usuario:= EdtUsuario.Text;
  FrmPrincipal.Item_Avaliar:= avaliar;
  FrmPrincipal.Show;
  FrmLogin.Close;
end;

end.
