unit UnitLogin;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Objects,
  FMX.Layouts, FMX.Controls.Presentation, FMX.StdCtrls, FMX.Edit, uFancyDialog,
  FMX.Ani,
  DateUtils,
  System.JSON,
  System.JSON.Writers,
  System.JSON.Types,
  Firebase.Auth,
  Firebase.Interfaces,
  Firebase.Request,
  Firebase.Database,
  Firebase.Response, FMX.TabControl;

type
  TFrmLogin = class(TForm)
    Layout1: TLayout;
    rectAcessarOnline: TRectangle;
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
    rectAcessarLocal: TRectangle;
    Label8: TLabel;
    TabControl: TTabControl;
    TabMenu: TTabItem;
    TabLocal: TTabItem;
    TabOnline: TTabItem;
    VertScrollBox1: TVertScrollBox;
    Layout7: TLayout;
    Layout8: TLayout;
    Image2: TImage;
    Label11: TLabel;
    Layout10: TLayout;
    Layout11: TLayout;
    rectAcessar: TRectangle;
    Label18: TLabel;
    FloatAnimation3: TFloatAnimation;
    rectCriarConta: TRectangle;
    Label19: TLabel;
    Label20: TLabel;
    Layout15: TLayout;
    EdtEmail: TEdit;
    Layout16: TLayout;
    EdtSenha: TEdit;
    LblRecuperarSenha: TLabel;
    Image8: TImage;
    FloatAnimation4: TFloatAnimation;
    FloatAnimation5: TFloatAnimation;
    VertScrollBox2: TVertScrollBox;
    Layout17: TLayout;
    Layout18: TLayout;
    Image9: TImage;
    Label22: TLabel;
    lytCod_Server: TLayout;
    Layout20: TLayout;
    Layout23: TLayout;
    EdtCod_Server: TEdit;
    rectCriarAvaliacao: TRectangle;
    Label29: TLabel;
    FloatAnimation6: TFloatAnimation;
    rectUsarCodigo: TRectangle;
    Label30: TLabel;
    Image15: TImage;
    FloatAnimation7: TFloatAnimation;
    FloatAnimation8: TFloatAnimation;
    rectLogin: TRectangle;
    Label10: TLabel;
    Layout5: TLayout;
    Label12: TLabel;
    Rectangle1: TRectangle;
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
    procedure LblRecuperarSenhaClick(Sender: TObject);
    procedure rectAcessarOnlineClick(Sender: TObject);
    procedure rectAcessarLocalClick(Sender: TObject);
    procedure rectLoginClick(Sender: TObject);
    procedure rectCriarAvaliacaoClick(Sender: TObject);
    procedure rectUsarCodigoClick(Sender: TObject);
  private
    { Private declarations }
    fancy : TFancyDialog;
    foco: TControl;
    token_firebase: String;
    nome_usuario: String;
    nome_server: String;
    status: String;
    local: Boolean;
    apagar_avaliacoes: Boolean;
    function CriarConta(email, senha: String; out idUsuario,
      erro: String): Boolean;
    function ErrorMessages(erro: string): string;
    function AcessarConta(email, senha: String; out idUsuario,
      erro: String): Boolean;
    function RecuperarSenha(email: String; out erro: String): Boolean;
    procedure ValidarNomeUsuario(Sender: TObject);
    procedure ValidarEmailSenha;
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

function TFrmLogin.ErrorMessages(erro: string): string;
begin
  erro := erro.Replace('EMAIL_NOT_FOUND', 'Email não encontrado');
  erro := erro.Replace('INVALID_PASSWORD', 'Senha inválida');
  erro := erro.Replace('INVALID_EMAIL', 'Email inválido');
  erro := erro.Replace('MISSING_PASSWORD', 'Informe a senha');
  erro := erro.Replace('MISSING_EMAIL', 'Informe o email');
  erro := erro.Replace('WEAK_PASSWORD', 'Senha fraca');
  erro := erro.Replace('EMAIL_EXISTS', 'Email já existe');

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
    fbAuth.SetApiKey(key_firebase);

    resp := fbAuth.SignInWithEmailAndPassword(email, senha);

    try
      json := TJSONObject.ParseJSONValue(TEncoding.UTF8.GetBytes(resp.ContentAsString),0) as TJSONObject;

      if not Assigned(json) then
      begin
        Result:=False;
        erro:= 'Não foi possivel verificar o servidor';
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
    fbAuth.SetApiKey(key_firebase);

    resp := fbAuth.CreateUserWithEmailAndPassword(email, senha);

    try
      json := TJSONObject.ParseJSONValue(TEncoding.UTF8.GetBytes(resp.ContentAsString),0) as TJSONObject;

      if not Assigned(json) then
      begin
        Result:=False;
        erro:= 'Não foi possivel verificar o servidor';
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

function TFrmLogin.RecuperarSenha(email: String; out erro: String):Boolean;
var
  fbAuth: IFirebaseAuth;
  resp: IFirebaseResponse;
  json, jsonRet: TJSONObject;
  jsonValue: TJSONValue;
begin
  try
    erro:='';
    fbAuth:= TFirebaseAuth.Create;
    fbAuth.SetApiKey(key_firebase);

    resp := fbAuth.SendResetPassword(email);

    try
      json := TJSONObject.ParseJSONValue(TEncoding.UTF8.GetBytes(resp.ContentAsString),0) as TJSONObject;

      if not Assigned(json) then
      begin
        Result:=False;
        erro:= 'Não foi possivel verificar o servidor';
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
    if json.TryGetValue('email', jsonValue) then
      Result:=True
    else
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

procedure TFrmLogin.ValidarEmailSenha;
begin
  with DM.qryConsCliente do
  begin
    Close;
    SQL.Clear;
    SQL.Add('UPDATE TAB_USUARIO SET EMAIL=:EMAIL, SENHA=:SENHA');
    SQL.Add('WHERE NOME_USUARIO=:NOME_USUARIO');
    ParamByName('EMAIL').Value := EdtEmail.Text;
    ParamByName('SENHA').Value := EdtSenha.Text;
    ParamByName('NOME_USUARIO').Value := EdtUsuario.Text;
    Execute;
  end;
end;

procedure TFrmLogin.ValidarNomeUsuario(Sender: TObject);
var
  avaliar: String;
begin
  // Validar Usuario
  begin
    with DM.qryConsCliente do
    begin
      if apagar_avaliacoes then
      begin
        Close;
        SQL.Clear;
        SQL.Add('DELETE FROM TAB_CLUBES');
        ExecSQL;

        Close;
        SQL.Clear;
        SQL.Add('DELETE FROM TAB_PONTOS');
        ExecSQL;

        Close;
        SQL.Clear;
        SQL.Add('DELETE FROM TAB_RESULTADO');
        ExecSQL;
      end;

      Close;
      SQL.Clear;
      SQL.Add('DELETE FROM TAB_USUARIO');
      Execute;

      // DELETAR REGISTRO FIREBASE

      Close;
      SQL.Clear;
      SQL.Add('INSERT INTO TAB_USUARIO (COD_USUARIO, NOME_USUARIO, NOME_SERVER)');
      SQL.Add('VALUES (:COD_USUARIO, :NOME_USUARIO, :NOME_SERVER)');
      ParamByName('COD_USUARIO').AsString:=GeraCodUsuario;
      ParamByName('NOME_USUARIO').AsString:=EdtUsuario.Text;
      ParamByName('NOME_SERVER').AsString:=nome_server;
      Execute;
    end;

    if not local then
      TabControl.GotoVisibleTab(1)
    else
    begin
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
      FrmPrincipal.Cod_Server:= 'Local';
      FrmPrincipal.Show;
      FrmLogin.Close;
    end;
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
  TabControl.GotoVisibleTab(0);
  nome_server:='';

  with DM.qryConsCliente do
  begin
    Close;
    SQL.Clear;
    SQL.Add('SELECT * FROM TAB_USUARIO');
    Open;
    if RowsAffected > 0 then
    begin
      nome_usuario:= FieldByName('NOME_USUARIO').AsString;
      nome_server:= FieldByName('NOME_SERVER').AsString;
      EdtEmail.Text:= FieldByName('EMAIL').AsString;
    end;

    EdtUsuario.Text:=nome_usuario;
  end;
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

procedure TFrmLogin.LblRecuperarSenhaClick(Sender: TObject);
var
  erro: String;
begin
  if not RecuperarSenha(EdtEmail.Text, erro) then
    fancy.Show(TIconDialog.Error, '', erro, 'OK')
  else
    fancy.Show(TIconDialog.Success, '', 'Link para recuperação de senha enviado para seu email.', 'OK');
end;

procedure TFrmLogin.rectAcessarClick(Sender: TObject);
var
  avaliar, idUsuario, erro: String;
begin
  if not AcessarConta(EdtEmail.Text,EdtSenha.Text,idUsuario,erro) then
  begin
    fancy.Show(TIconDialog.Error, '', erro, 'OK');
    Exit;
  end else
  begin
    ValidarEmailSenha;
    lytCod_Server.Visible:= False;
    TabControl.GotoVisibleTab(2);//fancy.Show(TIconDialog.Success, '', 'Login OK! Id: '+idUsuario, 'OK');
  end;

end;

procedure TFrmLogin.rectAcessarLocalClick(Sender: TObject);
begin
  if EdtUsuario.Text = '' then
  begin
    fancy.Show(TIconDialog.Info, '', 'Informe seu nome de avaliador!', 'OK');
    Exit;
  end;

  local:=True;
  apagar_avaliacoes:=False;
  if (nome_usuario <> EdtUsuario.Text) and (nome_usuario <> '') then
  begin
    nome_server:= Copy(EdtUsuario.Text,1,3) + IntToStr(HourOf(Now))+IntToStr(MinuteOf(Now));
    apagar_avaliacoes:= True;
    fancy.Show(TIconDialog.Question, nome_usuario+'<->'+EdtUsuario.Text, 'Deseja mudar o avaliador? Isso irá apagar as avaliações existentes.', 'Sim', ValidarNomeUsuario, 'Não');
  end else
    ValidarNomeUsuario(Sender);

end;

procedure TFrmLogin.rectAcessarOnlineClick(Sender: TObject);
begin
  if EdtUsuario.Text = '' then
  begin
    fancy.Show(TIconDialog.Info, '', 'Informe seu nome de avaliador!', 'OK');
    Exit;
  end;

  local:=False;
  apagar_avaliacoes:=False;

  if (nome_server = '') or (nome_usuario <> EdtUsuario.Text) then
    nome_server:= Copy(EdtUsuario.Text,1,3) + IntToStr(HourOf(Now))+IntToStr(MinuteOf(Now));

  if (nome_usuario <> EdtUsuario.Text) and (nome_usuario <> '') then
  begin
    apagar_avaliacoes:= True;
    EdtEmail.Text:= '';
    fancy.Show(TIconDialog.Question, nome_usuario+'<->'+EdtUsuario.Text, 'Deseja mudar o avaliador? Isso irá apagar as avaliações existentes.', 'Sim', ValidarNomeUsuario, 'Não');
  end else
    ValidarNomeUsuario(Sender);

end;

procedure TFrmLogin.rectCriarAvaliacaoClick(Sender: TObject);
begin
  EdtCod_Server.Text:= nome_server;
  EdtCod_Server.ReadOnly:= True;
  LytCod_Server.Visible:= True;
  status:='ON';
end;

procedure TFrmLogin.rectCriarContaClick(Sender: TObject);
var
  idUsuario, erro: String;
begin
  if not CriarConta(EdtEmail.Text,EdtSenha.Text,idUsuario,erro) then
    fancy.Show(TIconDialog.Error, '', erro, 'OK')
  else
    fancy.Show(TIconDialog.Success, '', 'Conta criada com sucesso! Id: '+idUsuario, 'OK');

end;

procedure TFrmLogin.rectLoginClick(Sender: TObject);
var
  avaliar: String;
begin

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
  FrmPrincipal.Status_App:= status;
  FrmPrincipal.Cod_Server:= EdtCod_Server.Text;
  FrmPrincipal.Show;
  FrmLogin.Close;

end;

procedure TFrmLogin.rectUsarCodigoClick(Sender: TObject);
begin
  EdtCod_Server.Text:= '';
  EdtCod_Server.ReadOnly:= False;
  LytCod_Server.Visible:= True;
  status:='OFF';
end;

end.
