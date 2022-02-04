unit UnitLogin;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Objects,
  FMX.Layouts, FMX.Controls.Presentation, FMX.StdCtrls, FMX.Edit, uFancyDialog,
  FMX.Ani,
  System.JSON,
  Firebase.Auth,
  Firebase.Interfaces,
  Firebase.Request,
  Firebase.Response;

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
    rectCriarConta: TRectangle;
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
    procedure rectCriarContaClick(Sender: TObject);
  private
    { Private declarations }
    fancy : TFancyDialog;
    foco: TControl;
    function CriarConta(email, senha: String; out idUsuario,
      erro: String): Boolean;
    function ErrorMessages(erro: string): string;
    function AcessarConta(email, senha: String; out idUsuario,
      erro: String): Boolean;
  public
    { Public declarations }
  end;

var
  FrmLogin: TFrmLogin;

const
  api_firebase = 'AIzaSyDxBw4DRgQExvdlyoeA9MwfPMrCaaTyDVI';

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

function TFrmLogin.ErrorMessages(erro: string): string;
begin
  erro := erro.Replace('EMAIL_NOT_FOUND', 'Email n�o encontrado');
  erro := erro.Replace('INVALID_PASSWORD', 'Senha inv�lida');
  erro := erro.Replace('INVALID_EMAIL', 'Email inv�lido');
  erro := erro.Replace('MISSING_PASSWORD', 'Informe a senha');
  erro := erro.Replace('MISSING_EMAIL', 'Informe o email');
  erro := erro.Replace('WEAK_PASSWORD', 'Senha fraca');
  erro := erro.Replace('EMAIL_EXISTS', 'Email j� existe');

  Result:=erro;
end;

function TFrmLogin.AcessarConta(email, senha: String; out idUsuario, erro: String):Boolean;
var
  fbAuth: IFirebaseAuth;
  resp: IFirebaseResponse;
  json, jsonRet: TJSONObject;
  jsonValue: TJSONValue;
begin
  try
    erro:='';
    fbAuth:= TFirebaseAuth.Create;
    fbAuth.SetApiKey(api_firebase);

    resp := fbAuth.SignInWithEmailAndPassword(email, senha);

    try
      json := TJSONObject.ParseJSONValue(TEncoding.UTF8.GetBytes(resp.ContentAsString),0) as TJSONObject;

      if not Assigned(json) then
      begin
        Result:=False;
        erro:= 'N�o foi possivel verificar o servidor';
        Exit;
      end;
    except on ex:exception do
      begin
        Result:=False;
        erro:= ex.Message;
        Exit;
      end;
    end;
    if json.TryGetValue('error', jsonRet) then
    begin
      erro:= jsonRet.Values['message'].Value;
      Result:=False;
    end else
    if json.TryGetValue('localId', jsonValue) then
    begin
      idUsuario:= jsonValue.Value;
      Result:=True;
    end else
    begin
      erro:= 'Retorno Desconhecido';
      Result:=False;
    end;
    erro := ErrorMessages(erro);
  finally
    if Assigned(json) then
      json.DisposeOf;
  end;
end;

function TFrmLogin.CriarConta(email, senha: String; out idUsuario, erro: String):Boolean;
var
  fbAuth: IFirebaseAuth;
  resp: IFirebaseResponse;
  json, jsonRet: TJSONObject;
  jsonValue: TJSONValue;
begin
  try
    erro:='';
    fbAuth:= TFirebaseAuth.Create;
    fbAuth.SetApiKey(api_firebase);

    resp := fbAuth.CreateUserWithEmailAndPassword(email, senha);

    try
      json := TJSONObject.ParseJSONValue(TEncoding.UTF8.GetBytes(resp.ContentAsString),0) as TJSONObject;

      if not Assigned(json) then
      begin
        Result:=False;
        erro:= 'N�o foi possivel verificar o servidor';
        Exit;
      end;
    except on ex:exception do
      begin
        Result:=False;
        erro:= ex.Message;
        Exit;
      end;
    end;
    if json.TryGetValue('error', jsonRet) then
    begin
      erro:= jsonRet.Values['message'].Value;
      Result:=False;
    end else
    if json.TryGetValue('localId', jsonValue) then
    begin
      idUsuario:= jsonValue.Value;
      Result:=True;
    end else
    begin
      erro:= 'Retorno Desconhecido';
      Result:=False;
    end;
    erro := ErrorMessages(erro);
  finally
    if Assigned(json) then
      json.DisposeOf;
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
  avaliar, idUsuario, erro: String;
begin
  if EdtUsuario.Text = '' then
  begin
    fancy.Show(TIconDialog.Info, '', 'Informe seu nome de avaliador!', 'OK');
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
  if imgBasico.Tag = 1 then avaliar := 'B�sico';
  if imgMovimento.Tag = 1 then avaliar := 'Movimento';
  if imgAvancado.Tag = 1 then avaliar := 'Avan�ado';
  if imgInstrutor.Tag = 1 then avaliar := 'Instrutor';

  if not AcessarConta(EdtEmail.Text,EdtSenha.Text,idUsuario,erro) then
  begin
    fancy.Show(TIconDialog.Error, '', erro, 'OK');
    Exit;
  end else
    fancy.Show(TIconDialog.Success, '', 'Login OK! Id: '+idUsuario, 'OK');

  if not Assigned(FrmPrincipal) then
      Application.CreateForm(TFrmPrincipal, FrmPrincipal);

  Application.MainForm := FrmPrincipal;
  FrmPrincipal.Nome_Usuario:= EdtUsuario.Text;
  FrmPrincipal.Item_Avaliar:= avaliar;
  FrmPrincipal.Show;
  FrmLogin.Close;
end;

procedure TFrmLogin.rectCriarContaClick(Sender: TObject);
var
  idUsuario, erro: String;
begin
  if EdtUsuario.Text = '' then
  begin
    fancy.Show(TIconDialog.Info, '', 'Informe seu nome de avaliador!', 'OK');
    Exit;
  end;

  if not CriarConta(EdtEmail.Text,EdtSenha.Text,idUsuario,erro) then
    fancy.Show(TIconDialog.Error, '', erro, 'OK')
  else
    fancy.Show(TIconDialog.Success, '', 'Conta criada com sucesso! Id: '+idUsuario, 'OK');

end;

end.
