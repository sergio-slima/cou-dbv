unit UnitInicial;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.TabControl,
  FMX.Layouts, FMX.Objects, FMX.Controls.Presentation, FMX.StdCtrls,
  System.Actions, FMX.ActnList;

type
  TFrmInicial = class(TForm)
    TabControl: TTabControl;
    TabItem1: TTabItem;
    TabItem2: TTabItem;
    TabItem3: TTabItem;
    TabItem4: TTabItem;
    layout_proximo: TLayout;
    Layout2: TLayout;
    Label1: TLabel;
    Label2: TLabel;
    Layout3: TLayout;
    Label3: TLabel;
    Label4: TLabel;
    Layout4: TLayout;
    Label5: TLabel;
    Label6: TLabel;
    Layout5: TLayout;
    Label7: TLabel;
    StyleBook1: TStyleBook;
    btn_voltar: TSpeedButton;
    btn_proximo: TSpeedButton;
    ActionList1: TActionList;
    ActTab1: TChangeTabAction;
    ActTab2: TChangeTabAction;
    ActTab3: TChangeTabAction;
    ActTab4: TChangeTabAction;
    layout_botoes: TLayout;
    btn_login: TSpeedButton;
    Timer_Load: TTimer;
    Label8: TLabel;
    Image4: TImage;
    Image1: TImage;
    Image2: TImage;
    Image3: TImage;
    procedure FormCreate(Sender: TObject);
    procedure btn_proximoClick(Sender: TObject);
    procedure NavegacaoAba(cont : integer);
    procedure btn_voltarClick(Sender: TObject);
    procedure btn_loginClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure Timer_LoadTimer(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmInicial: TFrmInicial;

implementation

{$R *.fmx}

uses UnitLogin, UnitDM, UnitPrincipal, UnitFunctions;


procedure TFrmInicial.btn_loginClick(Sender: TObject);
begin

    with DM.qryConsCliente do
    begin
      Close;
      SQL.Clear;
      SQL.Add('INSERT INTO TAB_CONFIG (COD_CONFIG, TELA_INICIAL)');
      SQL.Add('VALUES (:COD_CONFIG, :TELA_INICIAL)');
      ParamByName('COD_CONFIG').AsString:=GeraCodUsuario;
      ParamByName('TELA_INICIAL').AsString:='S';
      Execute;
    end;

    if NOT Assigned(FrmLogin) then
        Application.CreateForm(TFrmLogin, FrmLogin);

    Application.MainForm := FrmLogin;
    FrmLogin.Show;
    FrmInicial.Close;
end;

procedure TFrmInicial.btn_proximoClick(Sender: TObject);
begin
    NavegacaoAba(1);
end;

procedure TFrmInicial.btn_voltarClick(Sender: TObject);
begin
    NavegacaoAba(-1);
end;

procedure TFrmInicial.FormClose(Sender: TObject; var Action: TCloseAction);
begin
    Action := TCloseAction.caFree;
    FrmInicial := nil;
end;

procedure TFrmInicial.FormCreate(Sender: TObject);
begin
    {$IFDEF IOS}
    Timer_Load.Interval := 1;
    {$ENDIF}

    TabControl.TabPosition := TTabPosition.None;
    TabControl.ActiveTab := TabItem1;
    layout_proximo.Visible := false;
    layout_botoes.Visible := false;
    NavegacaoAba(-1);

    TabControl.Visible := false;
end;

procedure TFrmInicial.FormShow(Sender: TObject);
begin
    Timer_Load.Enabled := true;
end;

procedure TFrmInicial.NavegacaoAba(cont: integer);
begin
    // Proximo...
    if cont > 0 then
    begin
        case TabControl.TabIndex of
            0: ActTab2.Execute;
            1: ActTab3.Execute;
            2: ActTab4.Execute;
        end;
    end
    else
    // Voltar...
    begin
        case TabControl.TabIndex of
            3: ActTab3.Execute;
            2: ActTab2.Execute;
            1: ActTab1.Execute;
        end;
    end;

    // Tratamento dos botoes...
    btn_voltar.Visible := true;
    btn_proximo.Visible := true;

    if TabControl.TabIndex = 0 then
        btn_voltar.Visible := false
    else if TabControl.TabIndex = 3 then
    begin
        layout_proximo.Visible := false;
        layout_botoes.Visible := true;
    end;

end;

procedure TFrmInicial.Timer_LoadTimer(Sender: TObject);
var
    erro : string;
begin
    Timer_Load.Enabled := false;

    try
        dm.qryGeral.Active := false;
        dm.qryGeral.SQL.Clear;
        dm.qryGeral.SQL.Add('SELECT * FROM TAB_CONFIG');
        dm.qryGeral.Active := True;
        if dm.qryGeral.RecordCount = 0 then
        begin
            TabControl.ActiveTab := TabItem2;
            NavegacaoAba(-1);
            TabControl.Visible := true;
            layout_proximo.Visible := true;
            exit;
        end;

        if NOT Assigned(FrmLogin) then
            Application.CreateForm(TFrmLogin, FrmLogin);

        Application.MainForm := FrmLogin;
        FrmLogin.Show;
        FrmInicial.Close;

    finally

    end;

end;

end.
