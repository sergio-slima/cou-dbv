unit UnitPrincipal;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Objects,
  FMX.TabControl, FMX.Controls.Presentation, FMX.StdCtrls, FMX.Edit,
  FMX.ListView.Types, FMX.ListView.Appearances, FMX.ListView.Adapters.Base,
  FMX.ListView, FMX.Layouts, uFancyDialog;

type
  TExecutaClick = procedure(Sender: TObject) of Object;

  TFrmPrincipal = class(TForm)
    TabControl: TTabControl;
    TabPontuacoes: TTabItem;
    TabClubes: TTabItem;
    rectOSToolbar: TRectangle;
    Label1: TLabel;
    rectOSBusca: TRectangle;
    Rectangle1: TRectangle;
    Label3: TLabel;
    Rectangle2: TRectangle;
    rectBuscaCliente: TRectangle;
    lvClube: TListView;
    imgData: TImage;
    imgHora: TImage;
    imgOpcao: TImage;
    imgAberta: TImage;
    imgFechada: TImage;
    lytMenuClube: TLayout;
    rectFundoMenu: TRectangle;
    rectMenuFechar: TRectangle;
    lblMenuFechar: TLabel;
    rectMenu: TRectangle;
    lblMenuAvaliar: TLabel;
    lblMenuExcluir: TLabel;
    lblMenuApagar: TLabel;
    lblMenuAlterar: TLabel;
    lblTitulo: TLabel;
    imgAdd: TImage;
    Image1: TImage;
    Image2: TImage;
    Rectangle3: TRectangle;
    LblNome_Clube_Pontos: TLabel;
    ImgSalvar: TImage;
    lytCadClube: TLayout;
    RtgCadClubes: TRectangle;
    RtgSalvarClube: TRectangle;
    Label2: TLabel;
    Rectangle6: TRectangle;
    Rectangle7: TRectangle;
    EdtNome: TEdit;
    Rectangle4: TRectangle;
    EdtRegiao: TEdit;
    Rectangle8: TRectangle;
    EdtDiretor: TEdit;
    VertScrollBox1: TVertScrollBox;
    rect_nome: TRectangle;
    Label4: TLabel;
    Image3: TImage;
    LblB1: TLabel;
    rect_email: TRectangle;
    Label5: TLabel;
    Image4: TImage;
    LblB3: TLabel;
    rect_cidade: TRectangle;
    Label6: TLabel;
    Image5: TImage;
    LblB8: TLabel;
    rect_endereco: TRectangle;
    Label10: TLabel;
    Image6: TImage;
    LblB4: TLabel;
    rect_fone: TRectangle;
    Label12: TLabel;
    Image7: TImage;
    LblB2: TLabel;
    TabControlRequisitos: TTabControl;
    TabBasico: TTabItem;
    TabAvançado: TTabItem;
    TabInstrutor: TTabItem;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label11: TLabel;
    Label13: TLabel;
    Rectangle15: TRectangle;
    Label35: TLabel;
    Image15: TImage;
    LblB7: TLabel;
    Label37: TLabel;
    Rectangle16: TRectangle;
    Label38: TLabel;
    Image16: TImage;
    LblB6: TLabel;
    Label40: TLabel;
    Rectangle17: TRectangle;
    Label41: TLabel;
    Image17: TImage;
    LblB5: TLabel;
    Label43: TLabel;
    TabMovimento: TTabItem;
    VertScrollBox2: TVertScrollBox;
    Rectangle5: TRectangle;
    Label14: TLabel;
    Image8: TImage;
    LblM1: TLabel;
    Label16: TLabel;
    Rectangle9: TRectangle;
    Label17: TLabel;
    Image9: TImage;
    LblM3: TLabel;
    Label19: TLabel;
    Rectangle10: TRectangle;
    Label20: TLabel;
    Image10: TImage;
    LblM9: TLabel;
    Label22: TLabel;
    Rectangle11: TRectangle;
    Label23: TLabel;
    Image11: TImage;
    LblM4: TLabel;
    Label25: TLabel;
    Rectangle12: TRectangle;
    Label26: TLabel;
    Image12: TImage;
    LblM2: TLabel;
    Label28: TLabel;
    Rectangle13: TRectangle;
    Label29: TLabel;
    Image13: TImage;
    LblM7: TLabel;
    Label31: TLabel;
    Rectangle14: TRectangle;
    Label32: TLabel;
    Image14: TImage;
    LblM6: TLabel;
    Label34: TLabel;
    Rectangle18: TRectangle;
    Label44: TLabel;
    Image18: TImage;
    LblM5: TLabel;
    Label46: TLabel;
    Rectangle19: TRectangle;
    Label47: TLabel;
    Image19: TImage;
    LblM8: TLabel;
    Label49: TLabel;
    VertScrollBox3: TVertScrollBox;
    Rectangle20: TRectangle;
    Label50: TLabel;
    Image20: TImage;
    LblA1: TLabel;
    Label52: TLabel;
    Rectangle21: TRectangle;
    Label53: TLabel;
    Image21: TImage;
    LblA3: TLabel;
    Label55: TLabel;
    Rectangle22: TRectangle;
    Label56: TLabel;
    Image22: TImage;
    LblA8: TLabel;
    Label58: TLabel;
    Rectangle23: TRectangle;
    Label59: TLabel;
    Image23: TImage;
    LblA4: TLabel;
    Label61: TLabel;
    Rectangle24: TRectangle;
    Label62: TLabel;
    Image24: TImage;
    LblA2: TLabel;
    Label64: TLabel;
    Rectangle25: TRectangle;
    Label65: TLabel;
    Image25: TImage;
    LblA7: TLabel;
    Label67: TLabel;
    Rectangle26: TRectangle;
    Label68: TLabel;
    Image26: TImage;
    LblA6: TLabel;
    Label70: TLabel;
    Rectangle27: TRectangle;
    Label71: TLabel;
    Image27: TImage;
    LblA5: TLabel;
    Label73: TLabel;
    Rectangle28: TRectangle;
    Label74: TLabel;
    Image28: TImage;
    LblA9: TLabel;
    Label76: TLabel;
    VertScrollBox4: TVertScrollBox;
    Rectangle29: TRectangle;
    Label77: TLabel;
    Image29: TImage;
    LblT1: TLabel;
    Label79: TLabel;
    Rectangle30: TRectangle;
    Label80: TLabel;
    Image30: TImage;
    LblT3: TLabel;
    Label82: TLabel;
    Rectangle32: TRectangle;
    Label86: TLabel;
    Image32: TImage;
    LblT4: TLabel;
    Label88: TLabel;
    Rectangle33: TRectangle;
    Label89: TLabel;
    Image33: TImage;
    LblT2: TLabel;
    Label91: TLabel;
    procedure imgAbaOSClick(Sender: TObject);
    procedure lblMenuFecharClick(Sender: TObject);
    procedure lblMenuAlterarClick(Sender: TObject);
    procedure lblMenuAvaliarClick(Sender: TObject);
    procedure lblMenuExcluirClick(Sender: TObject);
    procedure lblMenuApagarClick(Sender: TObject);
    procedure imgAddClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure RtgSalvarClubeClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure lvClubeItemClickEx(const Sender: TObject; ItemIndex: Integer;
      const LocalClickPos: TPointF; const ItemObject: TListItemDrawable);
    procedure RtgCadClubesClick(Sender: TObject);
    procedure rect_nomeClick(Sender: TObject);
    procedure rect_nomeTap(Sender: TObject; const Point: TPointF);
    procedure rect_foneClick(Sender: TObject);
    procedure rect_foneTap(Sender: TObject; const Point: TPointF);
    procedure rect_emailClick(Sender: TObject);
    procedure rect_emailTap(Sender: TObject; const Point: TPointF);
    procedure rect_enderecoClick(Sender: TObject);
    procedure rect_enderecoTap(Sender: TObject; const Point: TPointF);
    procedure Rectangle17Click(Sender: TObject);
    procedure Rectangle17Tap(Sender: TObject; const Point: TPointF);
    procedure Rectangle16Click(Sender: TObject);
    procedure Rectangle16Tap(Sender: TObject; const Point: TPointF);
    procedure Rectangle15Click(Sender: TObject);
    procedure Rectangle15Tap(Sender: TObject; const Point: TPointF);
    procedure rect_cidadeClick(Sender: TObject);
    procedure rect_cidadeTap(Sender: TObject; const Point: TPointF);
    procedure Rectangle12Click(Sender: TObject);
    procedure Rectangle12Tap(Sender: TObject; const Point: TPointF);
    procedure Rectangle9Click(Sender: TObject);
    procedure Rectangle9Tap(Sender: TObject; const Point: TPointF);
    procedure Rectangle11Click(Sender: TObject);
    procedure Rectangle11Tap(Sender: TObject; const Point: TPointF);
    procedure Rectangle5Click(Sender: TObject);
    procedure Rectangle5Tap(Sender: TObject; const Point: TPointF);
    procedure Rectangle18Click(Sender: TObject);
    procedure Rectangle18Tap(Sender: TObject; const Point: TPointF);
    procedure Rectangle14Click(Sender: TObject);
    procedure Rectangle14Tap(Sender: TObject; const Point: TPointF);
    procedure Rectangle13Click(Sender: TObject);
    procedure Rectangle13Tap(Sender: TObject; const Point: TPointF);
    procedure Rectangle19Click(Sender: TObject);
    procedure Rectangle19Tap(Sender: TObject; const Point: TPointF);
    procedure Rectangle10Click(Sender: TObject);
    procedure Rectangle10Tap(Sender: TObject; const Point: TPointF);
    procedure Rectangle24Click(Sender: TObject);
    procedure Rectangle24Tap(Sender: TObject; const Point: TPointF);
    procedure Rectangle20Click(Sender: TObject);
    procedure Rectangle20Tap(Sender: TObject; const Point: TPointF);
    procedure Rectangle21Click(Sender: TObject);
    procedure Rectangle21Tap(Sender: TObject; const Point: TPointF);
    procedure Rectangle23Click(Sender: TObject);
    procedure Rectangle23Tap(Sender: TObject; const Point: TPointF);
    procedure Rectangle27Click(Sender: TObject);
    procedure Rectangle27Tap(Sender: TObject; const Point: TPointF);
    procedure Rectangle26Click(Sender: TObject);
    procedure Rectangle26Tap(Sender: TObject; const Point: TPointF);
    procedure Rectangle25Click(Sender: TObject);
    procedure Rectangle25Tap(Sender: TObject; const Point: TPointF);
    procedure Rectangle22Click(Sender: TObject);
    procedure Rectangle22Tap(Sender: TObject; const Point: TPointF);
    procedure Rectangle28Click(Sender: TObject);
    procedure Rectangle28Tap(Sender: TObject; const Point: TPointF);
    procedure Rectangle29Click(Sender: TObject);
    procedure Rectangle29Tap(Sender: TObject; const Point: TPointF);
    procedure Rectangle33Click(Sender: TObject);
    procedure Rectangle33Tap(Sender: TObject; const Point: TPointF);
    procedure Rectangle30Click(Sender: TObject);
    procedure Rectangle30Tap(Sender: TObject; const Point: TPointF);
    procedure Rectangle32Click(Sender: TObject);
    procedure Rectangle32Tap(Sender: TObject; const Point: TPointF);
    procedure ImgSalvarClick(Sender: TObject);
  private
    fancy : TFancyDialog;
    procedure MudarAba(Image: TImage);
    procedure ConsultarClube;
    procedure AddClube(codClube, Nome, Regiao, Pontos: String);
    procedure ConsultarCliente(filtro: string);
    procedure AddCliente(codCliente, nome, endereco, cidade, uf: string);
    procedure AlterarStatusOS(codOS, status: string);
    { Private declarations }
  public
    { Public declarations }
    CodClube: string;
    Nome_Usuario: String;
    Status_Clube: String;
    procedure EditarCampo(objeto: TObject;
                          tipo_campo, titulo, textprompt, ind_obrigatorio,
                          texto_padrao: string; tam_maximo: integer;
                          ProcCallBack : TExecutaClick = nil);
  end;

var
  FrmPrincipal: TFrmPrincipal;

implementation

{$R *.fmx}

uses UnitDM, UnitEditar, UnitFunctions;

procedure TFrmPrincipal.imgAbaOSClick(Sender: TObject);
begin
    MudarAba(TImage(Sender));
end;

procedure TFrmPrincipal.imgAddClick(Sender: TObject);
begin
    EdtNome.Text:='';
    EdtRegiao.Text:='';
    EdtDiretor.Text:='';
    Status_Clube:='N';
    lytCadClube.Visible:=True;
end;

procedure TFrmPrincipal.ImgSalvarClick(Sender: TObject);
var
  pontos: double;
begin
    pontos:= StrToFloat(LblB1.text)+StrToFloat(LblB2.text)+StrToFloat(LblB3.text)+StrToFloat(LblB4.text)+StrToFloat(LblB5.text)+StrToFloat(LblB6.text)+StrToFloat(LblB7.text)+StrToFloat(LblB8.text)+
             StrToFloat(LblM1.text)+StrToFloat(LblM2.text)+StrToFloat(LblM3.text)+StrToFloat(LblM4.text)+StrToFloat(LblM5.text)+StrToFloat(LblM6.text)+StrToFloat(LblM7.text)+StrToFloat(LblM8.text)+StrToFloat(LblM9.text)+
             StrToFloat(LblA1.text)+StrToFloat(LblA2.text)+StrToFloat(LblA3.text)+StrToFloat(LblA4.text)+StrToFloat(LblA5.text)+StrToFloat(LblA6.text)+StrToFloat(LblA7.text)+StrToFloat(LblA8.text)+StrToFloat(LblA9.text)+
             StrToFloat(LblT1.text)+StrToFloat(LblT2.text)+StrToFloat(LblT3.text)+StrToFloat(LblT4.text);

    try
        dm.qryGeral.Active := false;
        dm.qryGeral.SQL.Clear;
        dm.qryGeral.SQL.Add('UPDATE TAB_CLUBE SET PONTOS=:PONTOS');
        dm.qryGeral.SQL.Add('WHERE COD_CLUBE=:COD_CLUBE');
        dm.qryGeral.ParamByName('PONTOS').Value := FloatToStr(pontos);
        dm.qryGeral.ParamByName('COD_CLUBE').Value := lytMenuClube.TagString;
        dm.qryGeral.ExecSQL;

        ConsultarClube;
        TabControl.GotoVisibleTab(0);

    except on ex:exception do
        fancy.Show(TIconDialog.Error, '', 'Erro ao gravar avaliação!', 'OK');
    end;
end;

procedure TFrmPrincipal.lblMenuFecharClick(Sender: TObject);
begin
    lytMenuClube.Visible := false;
end;

procedure TFrmPrincipal.AlterarStatusOS(codOS, status: string);
begin
//    try
//        dm.qryGeral.Active := false;
//        dm.qryGeral.SQL.Clear;
//        dm.qryGeral.SQL.Add('UPDATE TAB_OS SET STATUS=:STATUS');
//        dm.qryGeral.SQL.Add('WHERE COD_OS=:COD_OS');
//        dm.qryGeral.ParamByName('STATUS').Value := status;
//        dm.qryGeral.ParamByName('COD_OS').Value := codOS;
//        dm.qryGeral.ExecSQL;
//
//        lytMenuOS.Visible := false;
//        ConsultarOS(edtBuscaOS.Text);
//
//    except on ex:exception do
//        showmessage('Erro alterar status da OS: ' + ex.Message);
//    end;
end;

procedure TFrmPrincipal.lblMenuApagarClick(Sender: TObject);
begin
//    if NOT Assigned(FrmAssinatura) then
//        Application.CreateForm(TFrmAssinatura, FrmAssinatura);
//
//    FrmAssinatura.codOS := lytMenuOS.TagString;
//    FrmAssinatura.Show;
//
//    lytMenuOS.Visible := false;
end;

procedure TFrmPrincipal.lblMenuAvaliarClick(Sender: TObject);
begin
    LytMenuClube.Visible:=False;
    TabControlRequisitos.GotoVisibleTab(0);
    TabControl.GotoVisibleTab(1);
end;

procedure TFrmPrincipal.lblMenuExcluirClick(Sender: TObject);
begin
    try
        dm.qryGeral.Active := false;
        dm.qryGeral.SQL.Clear;
        dm.qryGeral.SQL.Add('DELETE FROM TAB_CLUBE WHERE COD_CLUBE=:COD_CLUBE');
        dm.qryGeral.ParamByName('COD_CLUBE').Value := lytMenuClube.TagString;
        dm.qryGeral.ExecSQL;

        lytMenuClube.Visible := false;
        ConsultarClube;

    except on ex:exception do
        fancy.Show(TIconDialog.Error, '', 'Erro ao excluir clube!', 'OK');
    end;
end;

procedure TFrmPrincipal.lblMenuAlterarClick(Sender: TObject);
begin
//    AlterarStatusOS(lytMenuOS.TagString, 'A');
end;

procedure TFrmPrincipal.lvClubeItemClickEx(const Sender: TObject;
  ItemIndex: Integer; const LocalClickPos: TPointF;
  const ItemObject: TListItemDrawable);
var
  nomeClube: String;
begin
    codClube := lvClube.Items[ItemIndex].TagString;
    nomeClube := lvClube.Items[ItemIndex].detail;

    if Assigned(ItemObject) then
        if ItemObject.Name = 'ImageMenu' then
        begin
            lytMenuClube.TagString := codClube;
            LblNome_Clube_Pontos.TExt:='Clube: '+nomeClube;
            lytMenuClube.Visible := true;
            exit;
        end;
end;

procedure TFrmPrincipal.MudarAba(Image: TImage);
begin
//    imgAbaOS.Opacity := 0.4;
//    imgAbaCliente.Opacity := 0.4;
//
//    Image.Opacity := 1;
//    TabControl.GotoVisibleTab(Image.Tag);
end;

procedure TFrmPrincipal.Rectangle10Click(Sender: TObject);
begin
    {$IFDEF MSWINDOWS}
    FrmPrincipal.EditarCampo(LblM9, 'EDIT', 'Pontuação',
                             '0,0', 'N', '', 10);
    {$ENDIF}
end;

procedure TFrmPrincipal.Rectangle10Tap(Sender: TObject; const Point: TPointF);
begin
    FrmPrincipal.EditarCampo(LblM9, 'EDIT', 'Pontuação',
                             '0,0', 'N', '', 10);
end;

procedure TFrmPrincipal.Rectangle11Click(Sender: TObject);
begin
    {$IFDEF MSWINDOWS}
    FrmPrincipal.EditarCampo(LblM4, 'EDIT', 'Pontuação',
                             '0,0', 'N', '', 10);
    {$ENDIF}
end;

procedure TFrmPrincipal.Rectangle11Tap(Sender: TObject; const Point: TPointF);
begin
    FrmPrincipal.EditarCampo(LblM4, 'EDIT', 'Pontuação',
                             '0,0', 'N','', 10);
end;

procedure TFrmPrincipal.Rectangle12Click(Sender: TObject);
begin
    {$IFDEF MSWINDOWS}
    FrmPrincipal.EditarCampo(LblM2, 'EDIT', 'Pontuação',
                             '0,0', 'N', '', 10);
    {$ENDIF}
end;

procedure TFrmPrincipal.Rectangle12Tap(Sender: TObject; const Point: TPointF);
begin
    FrmPrincipal.EditarCampo(LblM2, 'EDIT', 'Pontuação',
                             '0,0', 'N', '', 10);
end;

procedure TFrmPrincipal.Rectangle13Click(Sender: TObject);
begin
    {$IFDEF MSWINDOWS}
    FrmPrincipal.EditarCampo(LblM7, 'EDIT', 'Pontuação',
                             '0,0', 'N', '', 10);
    {$ENDIF}
end;

procedure TFrmPrincipal.Rectangle13Tap(Sender: TObject; const Point: TPointF);
begin
    FrmPrincipal.EditarCampo(LblM7, 'EDIT', 'Pontuação',
                             '0,0', 'N', '', 10);
end;

procedure TFrmPrincipal.Rectangle14Click(Sender: TObject);
begin
    {$IFDEF MSWINDOWS}
    FrmPrincipal.EditarCampo(LblM6, 'EDIT', 'Pontuação',
                             '0,0', 'N', '', 10);
    {$ENDIF}
end;

procedure TFrmPrincipal.Rectangle14Tap(Sender: TObject; const Point: TPointF);
begin
    FrmPrincipal.EditarCampo(LblM6, 'EDIT', 'Pontuação',
                             '0,0', 'N', '', 10);
end;

procedure TFrmPrincipal.Rectangle15Click(Sender: TObject);
begin
    {$IFDEF MSWINDOWS}
    FrmPrincipal.EditarCampo(LblB7, 'EDIT', 'Pontuação',
                             '0,0', 'N', '', 10);
    {$ENDIF}
end;

procedure TFrmPrincipal.Rectangle15Tap(Sender: TObject; const Point: TPointF);
begin
    FrmPrincipal.EditarCampo(LblB7, 'EDIT', 'Pontuação',
                             '0,0', 'N', '', 10);
end;

procedure TFrmPrincipal.Rectangle16Click(Sender: TObject);
begin
    {$IFDEF MSWINDOWS}
    FrmPrincipal.EditarCampo(LblB6, 'EDIT', 'Pontuação',
                             '0,0', 'N', '', 10);
    {$ENDIF}
end;

procedure TFrmPrincipal.Rectangle16Tap(Sender: TObject; const Point: TPointF);
begin
    FrmPrincipal.EditarCampo(LblB6, 'EDIT', 'Pontuação',
                             '0,0', 'N', '', 10);
end;

procedure TFrmPrincipal.Rectangle17Click(Sender: TObject);
begin
    {$IFDEF MSWINDOWS}
    FrmPrincipal.EditarCampo(LblB5, 'EDIT', 'Pontuação',
                             '0,0', 'N', '', 10);
    {$ENDIF}
end;

procedure TFrmPrincipal.Rectangle17Tap(Sender: TObject; const Point: TPointF);
begin
    FrmPrincipal.EditarCampo(LblB5, 'EDIT', 'Pontuação',
                             '0,0', 'N', '', 10);
end;

procedure TFrmPrincipal.Rectangle18Click(Sender: TObject);
begin
    {$IFDEF MSWINDOWS}
    FrmPrincipal.EditarCampo(LblM5, 'EDIT', 'Pontuação',
                             '0,0', 'N', '', 10);
    {$ENDIF}
end;

procedure TFrmPrincipal.Rectangle18Tap(Sender: TObject; const Point: TPointF);
begin
    FrmPrincipal.EditarCampo(LblM5, 'EDIT', 'Pontuação',
                             '0,0', 'N', '', 10);
end;

procedure TFrmPrincipal.Rectangle19Click(Sender: TObject);
begin
    {$IFDEF MSWINDOWS}
    FrmPrincipal.EditarCampo(LblM8, 'EDIT', 'Pontuação',
                             '0,0', 'N', '', 10);
    {$ENDIF}
end;

procedure TFrmPrincipal.Rectangle19Tap(Sender: TObject; const Point: TPointF);
begin
    FrmPrincipal.EditarCampo(LblM8, 'EDIT', 'Pontuação',
                             '0,0', 'N', '', 10);
end;

procedure TFrmPrincipal.Rectangle20Click(Sender: TObject);
begin
    {$IFDEF MSWINDOWS}
    FrmPrincipal.EditarCampo(LblA1, 'EDIT', 'Pontuação',
                             '0,0', 'N', '', 10);
    {$ENDIF}
end;

procedure TFrmPrincipal.Rectangle20Tap(Sender: TObject; const Point: TPointF);
begin
    FrmPrincipal.EditarCampo(LblA1, 'EDIT', 'Pontuação',
                             '0,0', 'N', '', 10);
end;

procedure TFrmPrincipal.Rectangle21Click(Sender: TObject);
begin
    {$IFDEF MSWINDOWS}
    FrmPrincipal.EditarCampo(LblA3, 'EDIT', 'Pontuação',
                             '0,0', 'N', '', 10);
    {$ENDIF}
end;

procedure TFrmPrincipal.Rectangle21Tap(Sender: TObject; const Point: TPointF);
begin
    {$IFDEF MSWINDOWS}
    FrmPrincipal.EditarCampo(LblA3, 'EDIT', 'Pontuação',
                             '0,0', 'N', '', 10);
    {$ENDIF}
end;

procedure TFrmPrincipal.Rectangle22Click(Sender: TObject);
begin
    {$IFDEF MSWINDOWS}
    FrmPrincipal.EditarCampo(LblA8, 'EDIT', 'Pontuação',
                             '0,0', 'N', '', 10);
    {$ENDIF}
end;

procedure TFrmPrincipal.Rectangle22Tap(Sender: TObject; const Point: TPointF);
begin
    FrmPrincipal.EditarCampo(LblA8, 'EDIT', 'Pontuação',
                             '0,0', 'N', '', 10);
end;

procedure TFrmPrincipal.Rectangle23Click(Sender: TObject);
begin
    {$IFDEF MSWINDOWS}
    FrmPrincipal.EditarCampo(LblA4, 'EDIT', 'Pontuação',
                             '0,0', 'N', '', 10);
    {$ENDIF}
end;

procedure TFrmPrincipal.Rectangle23Tap(Sender: TObject; const Point: TPointF);
begin
    FrmPrincipal.EditarCampo(LblA4, 'EDIT', 'Pontuação',
                             '0,0', 'N', '', 10);
end;

procedure TFrmPrincipal.Rectangle24Click(Sender: TObject);
begin
    {$IFDEF MSWINDOWS}
    FrmPrincipal.EditarCampo(LblA2, 'EDIT', 'Pontuação',
                             '0,0', 'N', '', 10);
    {$ENDIF}
end;

procedure TFrmPrincipal.Rectangle24Tap(Sender: TObject; const Point: TPointF);
begin
    FrmPrincipal.EditarCampo(LblA2, 'EDIT', 'Pontuação',
                             '0,0', 'N', '', 10);
end;

procedure TFrmPrincipal.Rectangle25Click(Sender: TObject);
begin
    {$IFDEF MSWINDOWS}
    FrmPrincipal.EditarCampo(LblA7, 'EDIT', 'Pontuação',
                             '0,0', 'N', '', 10);
    {$ENDIF}
end;

procedure TFrmPrincipal.Rectangle25Tap(Sender: TObject; const Point: TPointF);
begin
    FrmPrincipal.EditarCampo(LblA7, 'EDIT', 'Pontuação',
                             '0,0', 'N', '', 10);
end;

procedure TFrmPrincipal.Rectangle26Click(Sender: TObject);
begin
    {$IFDEF MSWINDOWS}
    FrmPrincipal.EditarCampo(LblA6, 'EDIT', 'Pontuação',
                             '0,0', 'N', '', 10);
    {$ENDIF}
end;

procedure TFrmPrincipal.Rectangle26Tap(Sender: TObject; const Point: TPointF);
begin
    FrmPrincipal.EditarCampo(LblA6, 'EDIT', 'Pontuação',
                             '0,0', 'N', '', 10);
end;

procedure TFrmPrincipal.Rectangle27Click(Sender: TObject);
begin
    {$IFDEF MSWINDOWS}
    FrmPrincipal.EditarCampo(LblA5, 'EDIT', 'Pontuação',
                             '0,0', 'N', '', 10);
    {$ENDIF}
end;

procedure TFrmPrincipal.Rectangle27Tap(Sender: TObject; const Point: TPointF);
begin
    FrmPrincipal.EditarCampo(LblA5, 'EDIT', 'Pontuação',
                             '0,0', 'N', '', 10);
end;

procedure TFrmPrincipal.Rectangle28Click(Sender: TObject);
begin
    {$IFDEF MSWINDOWS}
    FrmPrincipal.EditarCampo(LblA9, 'EDIT', 'Pontuação',
                             '0,0', 'N', '', 10);
    {$ENDIF}
end;

procedure TFrmPrincipal.Rectangle28Tap(Sender: TObject; const Point: TPointF);
begin
    FrmPrincipal.EditarCampo(LblA9, 'EDIT', 'Pontuação',
                             '0,0', 'N', '', 10);
end;

procedure TFrmPrincipal.Rectangle29Click(Sender: TObject);
begin
    {$IFDEF MSWINDOWS}
    FrmPrincipal.EditarCampo(LblT1, 'EDIT', 'Pontuação',
                             '0,0', 'N', '', 10);
    {$ENDIF}
end;

procedure TFrmPrincipal.Rectangle29Tap(Sender: TObject; const Point: TPointF);
begin
    FrmPrincipal.EditarCampo(LblT1, 'EDIT', 'Pontuação',
                             '0,0', 'N', '', 10);
end;

procedure TFrmPrincipal.Rectangle30Click(Sender: TObject);
begin
    {$IFDEF MSWINDOWS}
    FrmPrincipal.EditarCampo(LblT3, 'EDIT', 'Pontuação',
                             '0,0', 'N', '', 10);
    {$ENDIF}
end;

procedure TFrmPrincipal.Rectangle30Tap(Sender: TObject; const Point: TPointF);
begin
    FrmPrincipal.EditarCampo(LblT3, 'EDIT', 'Pontuação',
                             '0,0', 'N', '', 10);
end;

procedure TFrmPrincipal.Rectangle32Click(Sender: TObject);
begin
    {$IFDEF MSWINDOWS}
    FrmPrincipal.EditarCampo(LblT4, 'EDIT', 'Pontuação',
                             '0,0', 'N', '', 10);
    {$ENDIF}
end;

procedure TFrmPrincipal.Rectangle32Tap(Sender: TObject; const Point: TPointF);
begin
    FrmPrincipal.EditarCampo(LblT4, 'EDIT', 'Pontuação',
                             '0,0', 'N', '', 10);
end;

procedure TFrmPrincipal.Rectangle33Click(Sender: TObject);
begin
    {$IFDEF MSWINDOWS}
    FrmPrincipal.EditarCampo(LblT2, 'EDIT', 'Pontuação',
                             '0,0', 'N', '', 10);
    {$ENDIF}
end;

procedure TFrmPrincipal.Rectangle33Tap(Sender: TObject; const Point: TPointF);
begin
    FrmPrincipal.EditarCampo(LblT2, 'EDIT', 'Pontuação',
                             '0,0', 'N', '', 10);
end;

procedure TFrmPrincipal.Rectangle5Click(Sender: TObject);
begin
    {$IFDEF MSWINDOWS}
    FrmPrincipal.EditarCampo(LblM1, 'EDIT', 'Pontuação',
                             '0,0', 'N', '', 10);
    {$ENDIF}
end;

procedure TFrmPrincipal.Rectangle5Tap(Sender: TObject; const Point: TPointF);
begin
    FrmPrincipal.EditarCampo(LblM1, 'EDIT', 'Pontuação',
                             '0,0', 'N', '', 10);
end;

procedure TFrmPrincipal.Rectangle9Click(Sender: TObject);
begin
    {$IFDEF MSWINDOWS}
    FrmPrincipal.EditarCampo(LblM3, 'EDIT', 'Pontuação',
                             '0,0', 'N', '', 10);
    {$ENDIF}
end;

procedure TFrmPrincipal.Rectangle9Tap(Sender: TObject; const Point: TPointF);
begin
    FrmPrincipal.EditarCampo(LblM3, 'EDIT', 'Pontuação',
                             '0,0', 'N', '', 10);
end;

procedure TFrmPrincipal.AddClube(codClube, Nome, Regiao, Pontos: String);
var
    item : TListViewItem;
begin
    item := lvClube.Items.Add;

    with item do
    begin
        Height := 50;
        TagString := codClube;
        Detail := Nome;

        TListItemText(Objects.FindDrawable('txtNome')).Text := Nome;
        TListItemText(Objects.FindDrawable('txtRegiao')).Text := Regiao+' Região';
        TListItemText(Objects.FindDrawable('txtPontos')).Text := Pontos;
        TListItemImage(Objects.FindDrawable('ImageMenu')).Bitmap := imgOpcao.Bitmap
    end;
end;

procedure TFrmPrincipal.ConsultarClube;
begin
    lvClube.Items.Clear;

    dm.qryConsOS.Active := false;
    dm.qryConsOS.SQL.Clear;
    dm.qryConsOS.SQL.Add('SELECT * FROM TAB_CLUBE');
    dm.qryConsOS.SQL.Add('ORDER BY NOME');
    dm.qryConsOS.Active := true;

    while NOT dm.qryConsOS.Eof do
    begin
        AddClube(dm.qryConsOS.FieldByName('COD_CLUBE').AsString,
              dm.qryConsOS.FieldByName('NOME').AsString,
              dm.qryConsOS.FieldByName('REGIAO').AsString,
              dm.qryConsOS.FieldByName('PONTOS').AsString);

        dm.qryConsOS.Next;
    end;

end;

procedure TFrmPrincipal.EditarCampo(objeto: TObject; tipo_campo, titulo,
  textprompt, ind_obrigatorio, texto_padrao: string; tam_maximo: integer;
  ProcCallBack: TExecutaClick);
var
    dia, mes, ano : integer;
begin
    if NOT Assigned(FrmEditar) then
        Application.CreateForm(TFrmEditar, FrmEditar);

    FrmEditar.lbl_titulo.Text := titulo;
    FrmEditar.tipo := tipo_campo;
    FrmEditar.ind_campo_obrigatorio := ind_obrigatorio;
    FrmEditar.obj := objeto;

    if tipo_campo = 'EDIT' then
    begin
        FrmEditar.edt_texto.TextPrompt := textprompt;
        FrmEditar.edt_texto.MaxLength := tam_maximo;
        FrmEditar.edt_texto.Text := texto_padrao;
    end;

    if tipo_campo = 'DATA' then
    begin
        if texto_padrao <> '' then  // dd/mm/yyyy
        begin
            dia := Copy(texto_padrao, 1, 2).ToInteger;
            mes := Copy(texto_padrao, 4, 2).ToInteger;
            ano := Copy(texto_padrao, 7, 4).ToInteger;

            FrmEditar.dt_data.Date := EncodeDate(ano, mes, dia);
        end
        else
            FrmEditar.dt_data.Date := Date;
    end;

    if tipo_campo = 'SENHA' then
    begin
        FrmEditar.edt_senha.TextPrompt := textprompt;
        FrmEditar.edt_senha.MaxLength := tam_maximo;
    end;

    if tipo_campo = 'MEMO' then
    begin
        FrmEditar.m_memo.MaxLength := tam_maximo;
        FrmEditar.m_memo.Lines.Text := texto_padrao;
    end;


    if tipo_campo = 'VALOR' then
        FrmEditar.lbl_valor.Text := texto_padrao;


    FrmEditar.ShowModal(procedure(ModalResult : TModalResult)
                        begin
                            if Assigned(ProcCallBack) then
                                ProcCallBack(objeto);

                            FrmEditar.obj := nil;
                        end);

end;

procedure TFrmPrincipal.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  fancy.DisposeOf;
end;

procedure TFrmPrincipal.FormCreate(Sender: TObject);
begin
  fancy := TFancyDialog.Create(FrmPrincipal);
end;

procedure TFrmPrincipal.FormShow(Sender: TObject);
begin
    TabControl.GotoVisibleTab(0);
    ConsultarClube;
end;

procedure TFrmPrincipal.AddCliente(codCliente, nome, endereco, cidade, uf: string);
var
    item : TListViewItem;
begin
//    item := lvCliente.Items.Add;
//
//    with item do
//    begin
//        Height := 70;
//        TagString := codCliente;
//
//        TListItemText(Objects.FindDrawable('txtNome')).Text := nome;
//        TListItemText(Objects.FindDrawable('txtEndereco')).Text := endereco;
//        TListItemText(Objects.FindDrawable('txtCidade')).Text := cidade + ' - ' + uf;
//    end;
end;

procedure TFrmPrincipal.ConsultarCliente(filtro: string);
begin
//    lvCliente.Items.Clear;
//
//    dm.qryConsCliente.Active := false;
//    dm.qryConsCliente.SQL.Clear;
//    dm.qryConsCliente.SQL.Add('SELECT C.*');
//    dm.qryConsCliente.SQL.Add('FROM TAB_CLIENTE C');
//
//    if filtro <> '' then
//    begin
//        dm.qryConsCliente.SQL.Add('WHERE C.NOME LIKE :NOME');
//        dm.qryConsCliente.ParamByName('NOME').Value := '%' + filtro + '%';
//    end;
//
//    dm.qryConsCliente.SQL.Add('ORDER BY C.NOME');
//    dm.qryConsCliente.Active := true;
//
//    while NOT dm.qryConsCliente.Eof do
//    begin
//        AddCliente(dm.qryConsCliente.FieldByName('COD_CLIENTE').AsString,
//                   dm.qryConsCliente.FieldByName('NOME').AsString,
//                   dm.qryConsCliente.FieldByName('ENDERECO').AsString,
//                   dm.qryConsCliente.FieldByName('CIDADE').AsString,
//                   dm.qryConsCliente.FieldByName('UF').AsString);
//
//        dm.qryConsCliente.Next;
//    end;

end;

procedure TFrmPrincipal.rect_cidadeClick(Sender: TObject);
begin
    {$IFDEF MSWINDOWS}
    FrmPrincipal.EditarCampo(LblB8, 'EDIT', 'Pontuação',
                             '0,0', 'N', '', 10);
    {$ENDIF}
end;

procedure TFrmPrincipal.rect_cidadeTap(Sender: TObject; const Point: TPointF);
begin
    FrmPrincipal.EditarCampo(LblB8, 'EDIT', 'Pontuação',
                             '0,0', 'N', '', 10);
end;

procedure TFrmPrincipal.rect_emailClick(Sender: TObject);
begin
    {$IFDEF MSWINDOWS}
    FrmPrincipal.EditarCampo(LblB3, 'EDIT', 'Pontuação',
                             '0,0', 'N', '', 10);
    {$ENDIF}
end;

procedure TFrmPrincipal.rect_emailTap(Sender: TObject; const Point: TPointF);
begin
    FrmPrincipal.EditarCampo(LblB3, 'EDIT', 'Pontuação',
                             '0,0', 'N', '', 10);
end;

procedure TFrmPrincipal.rect_enderecoClick(Sender: TObject);
begin
    {$IFDEF MSWINDOWS}
    FrmPrincipal.EditarCampo(LblB4, 'EDIT', 'Pontuação',
                             '0,0', 'N', '', 10);
    {$ENDIF}
end;

procedure TFrmPrincipal.rect_enderecoTap(Sender: TObject; const Point: TPointF);
begin
    FrmPrincipal.EditarCampo(LblB4, 'EDIT', 'Pontuação',
                             '0,0', 'N', '', 10);
end;

procedure TFrmPrincipal.rect_foneClick(Sender: TObject);
begin
    {$IFDEF MSWINDOWS}
    FrmPrincipal.EditarCampo(LblB2, 'EDIT', 'Pontuação',
                             '0,0', 'N', '', 10);
    {$ENDIF}
end;

procedure TFrmPrincipal.rect_foneTap(Sender: TObject; const Point: TPointF);
begin
    FrmPrincipal.EditarCampo(LblB2, 'EDIT', 'Pontuação',
                             '0,0', 'N', '', 10);
end;

procedure TFrmPrincipal.rect_nomeClick(Sender: TObject);
begin
    {$IFDEF MSWINDOWS}
    FrmPrincipal.EditarCampo(LblB1, 'EDIT', 'Pontuação',
                             '0,0', 'N', '', 10);
    {$ENDIF}
end;

procedure TFrmPrincipal.rect_nomeTap(Sender: TObject; const Point: TPointF);
begin
    FrmPrincipal.EditarCampo(LblB1, 'EDIT', 'Pontuação',
                             '0,0', 'N', '', 10);
end;

procedure TFrmPrincipal.RtgCadClubesClick(Sender: TObject);
begin
    lytCadClube.Visible:=False;
end;

procedure TFrmPrincipal.RtgSalvarClubeClick(Sender: TObject);
begin
    if EdtNome.Text = '' then
    begin
      fancy.Show(TIconDialog.Info, '', 'Digite o nome do clube!', 'OK');
      Exit;
    end;

    with dm.qryGeral do
    begin
        // Salvar Clube...
        Active := false;
        SQL.Clear;

        if Status_Clube = 'N' then
        begin
            SQL.Add('INSERT INTO TAB_CLUBE(COD_CLUBE, NOME, REGIAO, DIRETOR, PONTOS)');
            SQL.Add('VALUES(:COD_CLUBE, :NOME, :REGIAO, :DIRETOR, :PONTOS)');

            CodClube := GeraCodClube;
        end
        else
        begin
            SQL.Add('UPDATE TAB_CLUBE SET COD_CLUBE=:COD_CLUBE, NOME=:NOME, DIRETOR=:DIRETOR, PONTOS=:PONTOS');
        end;

        ParamByName('COD_CLUBE').Value := CodClube;
        ParamByName('NOME').Value := EdtNome.Text;
        ParamByName('REGIAO').Value := EdtRegiao.Text;
        ParamByName('DIRETOR').Value := EdtDiretor.Text;
        ParamByName('PONTOS').Value := '0,0';

        ExecSQL;
    end;

    ConsultarClube;
    lytCadClube.Visible:=False;
end;

end.
