unit UnitPrincipal;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Objects,
  FMX.TabControl, FMX.Controls.Presentation, FMX.StdCtrls, FMX.Edit,
  FMX.ListView.Types, FMX.ListView.Appearances, FMX.ListView.Adapters.Base,
  FMX.ListView, FMX.Layouts, uFancyDialog, FMX.VirtualKeyboard, FMX.Platform;

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
    imgOpcao: TImage;
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
    ImgCalcular: TImage;
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
    LblBt1: TLabel;
    Image3: TImage;
    LblB1: TLabel;
    rect_email: TRectangle;
    LblBt3: TLabel;
    Image4: TImage;
    LblB3: TLabel;
    rect_cidade: TRectangle;
    LblBt8: TLabel;
    Image5: TImage;
    LblB8: TLabel;
    rect_endereco: TRectangle;
    LblBt4: TLabel;
    Image6: TImage;
    LblB4: TLabel;
    rect_fone: TRectangle;
    LblBt2: TLabel;
    Image7: TImage;
    LblB2: TLabel;
    TabControlRequisitos: TTabControl;
    TabBasico: TTabItem;
    TabAvançado: TTabItem;
    TabInstrutor: TTabItem;
    LblBs1: TLabel;
    LblBs2: TLabel;
    LblBs4: TLabel;
    LblBs3: TLabel;
    LblBs8: TLabel;
    Rectangle15: TRectangle;
    LblBt7: TLabel;
    Image15: TImage;
    LblB7: TLabel;
    LblBs7: TLabel;
    Rectangle16: TRectangle;
    LblBt6: TLabel;
    Image16: TImage;
    LblB6: TLabel;
    LblBs6: TLabel;
    Rectangle17: TRectangle;
    LblBt5: TLabel;
    Image17: TImage;
    LblB5: TLabel;
    LblBs5: TLabel;
    TabMovimento: TTabItem;
    VertScrollBox2: TVertScrollBox;
    Rectangle5: TRectangle;
    LblMt1: TLabel;
    Image8: TImage;
    LblM1: TLabel;
    LblMs1: TLabel;
    Rectangle9: TRectangle;
    LblMt3: TLabel;
    Image9: TImage;
    LblM3: TLabel;
    LblMs3: TLabel;
    Rectangle10: TRectangle;
    LblMt9: TLabel;
    Image10: TImage;
    LblM9: TLabel;
    LblMs9: TLabel;
    Rectangle11: TRectangle;
    LblMt4: TLabel;
    Image11: TImage;
    LblM4: TLabel;
    LblMs4: TLabel;
    Rectangle12: TRectangle;
    LblMt2: TLabel;
    Image12: TImage;
    LblM2: TLabel;
    LblMs2: TLabel;
    Rectangle13: TRectangle;
    LblMt7: TLabel;
    Image13: TImage;
    LblM7: TLabel;
    LblMs7: TLabel;
    Rectangle14: TRectangle;
    LblMt6: TLabel;
    Image14: TImage;
    LblM6: TLabel;
    LblMs6: TLabel;
    Rectangle18: TRectangle;
    LblMt5: TLabel;
    Image18: TImage;
    LblM5: TLabel;
    LblMs5: TLabel;
    Rectangle19: TRectangle;
    LblMt8: TLabel;
    Image19: TImage;
    LblM8: TLabel;
    LblMs8: TLabel;
    VertScrollBox3: TVertScrollBox;
    Rectangle20: TRectangle;
    LblAt1: TLabel;
    Image20: TImage;
    LblA1: TLabel;
    LblAs1: TLabel;
    Rectangle21: TRectangle;
    LblAt3: TLabel;
    Image21: TImage;
    LblA3: TLabel;
    LblAs3: TLabel;
    Rectangle22: TRectangle;
    LblAt8: TLabel;
    Image22: TImage;
    LblA8: TLabel;
    LblAs8: TLabel;
    Rectangle23: TRectangle;
    LblAt4: TLabel;
    Image23: TImage;
    LblA4: TLabel;
    LblAs4: TLabel;
    Rectangle24: TRectangle;
    LblAt2: TLabel;
    Image24: TImage;
    LblA2: TLabel;
    LblAs2: TLabel;
    Rectangle25: TRectangle;
    LblAt7: TLabel;
    Image25: TImage;
    LblA7: TLabel;
    LblAs7: TLabel;
    Rectangle26: TRectangle;
    LblAt6: TLabel;
    Image26: TImage;
    LblA6: TLabel;
    LblAs6: TLabel;
    Rectangle27: TRectangle;
    LblAt5: TLabel;
    Image27: TImage;
    LblA5: TLabel;
    LblAs5: TLabel;
    Rectangle28: TRectangle;
    LblAt9: TLabel;
    Image28: TImage;
    LblA9: TLabel;
    LblAs9: TLabel;
    VertScrollBox4: TVertScrollBox;
    Rectangle29: TRectangle;
    LblTt1: TLabel;
    Image29: TImage;
    LblT1: TLabel;
    LblTs1: TLabel;
    Rectangle30: TRectangle;
    LblTt3: TLabel;
    Image30: TImage;
    LblT3: TLabel;
    LblTs3: TLabel;
    Rectangle32: TRectangle;
    LblTt4: TLabel;
    Image32: TImage;
    LblT4: TLabel;
    LblTs4: TLabel;
    Rectangle33: TRectangle;
    LblTt2: TLabel;
    Image33: TImage;
    LblT2: TLabel;
    LblTs2: TLabel;
    LblNomeAvaliador: TLabel;
    ImgVoltar: TImage;
    imgAdd: TImage;
    ImgUpload: TImage;
    ImgDownload: TImage;
    TabCalcular: TTabItem;
    Rectangle31: TRectangle;
    Label4: TLabel;
    ImgRefresh: TImage;
    ImgVotar: TImage;
    Rectangle34: TRectangle;
    Rectangle35: TRectangle;
    Label6: TLabel;
    Image37: TImage;
    Image38: TImage;
    RtgFundoBasico: TRectangle;
    RtgFundoMovimento: TRectangle;
    RtgFundoAvancado: TRectangle;
    RtgFundoInstrutor: TRectangle;
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
    procedure ImgVotarClick(Sender: TObject);
    procedure ImgCalcularClick(Sender: TObject);
    procedure FormKeyUp(Sender: TObject; var Key: Word; var KeyChar: Char;
      Shift: TShiftState);
  private
    fancy : TFancyDialog;
    procedure MudarAba(Image: TImage);
    procedure LimparEdits;
    procedure ConsultarClube;
    procedure AddClube(codClube, Nome, Regiao, Diretor, Pontos: String);
    procedure ConsultarCliente(filtro: string);
    procedure AddCliente(codCliente, nome, endereco, cidade, uf: string);
    procedure AlterarStatusOS(codOS, status: string);
    procedure ClickLogout(Sender: TObject);
    { Private declarations }
  public
    { Public declarations }
    CodClube: string;
    Nome_Usuario: String;
    Status_Clube: String;
    procedure EditarCampo(objeto: TObject;
                          tipo_campo, titulo, subtitulo, textprompt, ind_obrigatorio,
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
  cod_ponto: String;
begin
    pontos:= StrToFloat(LblB1.text)+StrToFloat(LblB2.text)+StrToFloat(LblB3.text)+StrToFloat(LblB4.text)+StrToFloat(LblB5.text)+StrToFloat(LblB6.text)+StrToFloat(LblB7.text)+StrToFloat(LblB8.text)+
             StrToFloat(LblM1.text)+StrToFloat(LblM2.text)+StrToFloat(LblM3.text)+StrToFloat(LblM4.text)+StrToFloat(LblM5.text)+StrToFloat(LblM6.text)+StrToFloat(LblM7.text)+StrToFloat(LblM8.text)+StrToFloat(LblM9.text)+
             StrToFloat(LblA1.text)+StrToFloat(LblA2.text)+StrToFloat(LblA3.text)+StrToFloat(LblA4.text)+StrToFloat(LblA5.text)+StrToFloat(LblA6.text)+StrToFloat(LblA7.text)+StrToFloat(LblA8.text)+StrToFloat(LblA9.text)+
             StrToFloat(LblT1.text)+StrToFloat(LblT2.text)+StrToFloat(LblT3.text)+StrToFloat(LblT4.text);

    try
      //Grava os pontos
      dm.qryGeral.Active := false;
      dm.qryGeral.SQL.Clear;
      dm.qryGeral.SQL.Add('INSERT INTO TAB_PONTOS (COD_PONTO, COD_CLUBE,');
      dm.qryGeral.SQL.Add('PTS_B1,PTS_B2,PTS_B3,PTS_B4,PTS_B5,PTS_B6,PTS_B7,PTS_B8,');
      dm.qryGeral.SQL.Add('PTS_M1,PTS_M2,PTS_M3,PTS_M4,PTS_M5,PTS_M6,PTS_M7,PTS_M8,PTS_M9,');
      dm.qryGeral.SQL.Add('PTS_A1,PTS_A2,PTS_A3,PTS_A4,PTS_A5,PTS_A6,PTS_A7,PTS_A8,PTS_A9,');
      dm.qryGeral.SQL.Add('PTS_T1,PTS_T2,PTS_T3,PTS_T4)');
      dm.qryGeral.SQL.Add('VALUES (:COD_PONTO, :COD_CLUBE,');
      dm.qryGeral.SQL.Add(':PTS_B1,:PTS_B2,:PTS_B3,:PTS_B4,:PTS_B5,:PTS_B6,:PTS_B7,:PTS_B8,');
      dm.qryGeral.SQL.Add(':PTS_M1,:PTS_M2,:PTS_M3,:PTS_M4,:PTS_M5,:PTS_M6,:PTS_M7,:PTS_M8,:PTS_M9,');
      dm.qryGeral.SQL.Add(':PTS_A1,:PTS_A2,:PTS_A3,:PTS_A4,:PTS_A5,:PTS_A6,:PTS_A7,:PTS_A8,:PTS_A9,');
      dm.qryGeral.SQL.Add(':PTS_T1,:PTS_T2,:PTS_T3,:PTS_T4)');
      dm.qryGeral.ParamByName('COD_PONTO').Value := GeraCodPontos;
      dm.qryGeral.ParamByName('COD_CLUBE').Value := lytMenuClube.TagString;
      dm.qryGeral.ParamByName('PTS_B1').Value := LblB1.Text;
      dm.qryGeral.ParamByName('PTS_B2').Value := LblB2.Text;
      dm.qryGeral.ParamByName('PTS_B3').Value := LblB3.Text;
      dm.qryGeral.ParamByName('PTS_B4').Value := LblB4.Text;
      dm.qryGeral.ParamByName('PTS_B5').Value := LblB5.Text;
      dm.qryGeral.ParamByName('PTS_B6').Value := LblB6.Text;
      dm.qryGeral.ParamByName('PTS_B7').Value := LblB7.Text;
      dm.qryGeral.ParamByName('PTS_B8').Value := LblB8.Text;
      dm.qryGeral.ParamByName('PTS_M1').Value := LblM1.Text;
      dm.qryGeral.ParamByName('PTS_M2').Value := LblM2.Text;
      dm.qryGeral.ParamByName('PTS_M3').Value := LblM3.Text;
      dm.qryGeral.ParamByName('PTS_M4').Value := LblM4.Text;
      dm.qryGeral.ParamByName('PTS_M5').Value := LblM5.Text;
      dm.qryGeral.ParamByName('PTS_M6').Value := LblM6.Text;
      dm.qryGeral.ParamByName('PTS_M7').Value := LblM7.Text;
      dm.qryGeral.ParamByName('PTS_M8').Value := LblM8.Text;
      dm.qryGeral.ParamByName('PTS_M9').Value := LblM9.Text;
      dm.qryGeral.ParamByName('PTS_A1').Value := LblA1.Text;
      dm.qryGeral.ParamByName('PTS_A2').Value := LblA2.Text;
      dm.qryGeral.ParamByName('PTS_A3').Value := LblA3.Text;
      dm.qryGeral.ParamByName('PTS_A4').Value := LblA4.Text;
      dm.qryGeral.ParamByName('PTS_A5').Value := LblA5.Text;
      dm.qryGeral.ParamByName('PTS_A6').Value := LblA6.Text;
      dm.qryGeral.ParamByName('PTS_A7').Value := LblA7.Text;
      dm.qryGeral.ParamByName('PTS_A8').Value := LblA8.Text;
      dm.qryGeral.ParamByName('PTS_A9').Value := LblA9.Text;
      dm.qryGeral.ParamByName('PTS_T1').Value := LblT1.Text;
      dm.qryGeral.ParamByName('PTS_T2').Value := LblT2.Text;
      dm.qryGeral.ParamByName('PTS_T3').Value := LblT3.Text;
      dm.qryGeral.ParamByName('PTS_T4').Value := LblT4.Text;
      dm.qryGeral.ExecSQL;


      //Atualiza o total de pontos
      dm.qryGeral.Active := false;
      dm.qryGeral.SQL.Clear;
      dm.qryGeral.SQL.Add('UPDATE TAB_CLUBES SET PONTOS=:PONTOS');
      dm.qryGeral.SQL.Add('WHERE COD_CLUBE=:COD_CLUBE');
      dm.qryGeral.ParamByName('PONTOS').Value := FloatToStr(pontos);
      dm.qryGeral.ParamByName('COD_CLUBE').Value := lytMenuClube.TagString;
      dm.qryGeral.ExecSQL;

      ConsultarClube;
      TabControl.GotoVisibleTab(1);

    except on ex:exception do
        fancy.Show(TIconDialog.Error, '', 'Erro ao gravar avaliação!', 'OK');
    end;
end;

procedure TFrmPrincipal.ImgVotarClick(Sender: TObject);
begin
  ConsultarClube;
  TabControl.GotoVisibleTab(1);
end;

procedure TFrmPrincipal.lblMenuFecharClick(Sender: TObject);
begin
    lytMenuClube.Visible := false;
end;

procedure TFrmPrincipal.LimparEdits;
begin
    LblB1.Text:= '0,0';
    LblB2.Text:= '0,0';
    LblB3.Text:= '0,0';
    LblB4.Text:= '0,0';
    LblB5.Text:= '0,0';
    LblB6.Text:= '0,0';
    LblB7.Text:= '0,0';
    LblB8.Text:= '0,0';
    LblM1.Text:= '0,0';
    LblM2.Text:= '0,0';
    LblM3.Text:= '0,0';
    LblM4.Text:= '0,0';
    LblM5.Text:= '0,0';
    LblM6.Text:= '0,0';
    LblM7.Text:= '0,0';
    LblM8.Text:= '0,0';
    LblM9.Text:= '0,0';
    LblA1.Text:= '0,0';
    LblA2.Text:= '0,0';
    LblA3.Text:= '0,0';
    LblA4.Text:= '0,0';
    LblA5.Text:= '0,0';
    LblA6.Text:= '0,0';
    LblA7.Text:= '0,0';
    LblA8.Text:= '0,0';
    LblA9.Text:= '0,0';
    LblT1.Text:= '0,0';
    LblT2.Text:= '0,0';
    LblT3.Text:= '0,0';
    LblT4.Text:= '0,0';
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
    try
        dm.qryGeral.Active := false;
        dm.qryGeral.SQL.Clear;
        dm.qryGeral.SQL.Add('DELETE FROM TAB_CLUBES');
        dm.qryGeral.ExecSQL;

        dm.qryGeral.Active := false;
        dm.qryGeral.SQL.Clear;
        dm.qryGeral.SQL.Add('DELETE FROM TAB_PONTOS');
        dm.qryGeral.ExecSQL;

        dm.qryGeral.Active := false;
        dm.qryGeral.SQL.Clear;
        dm.qryGeral.SQL.Add('DELETE FROM TAB_RESULTADO');
        dm.qryGeral.ExecSQL;

        lytMenuClube.Visible := false;
        ConsultarClube;

    except on ex:exception do
        fancy.Show(TIconDialog.Error, '', 'Erro ao apagar avaliações!', 'OK');
    end;
end;

procedure TFrmPrincipal.lblMenuAvaliarClick(Sender: TObject);
begin
    dm.qryGeral.Active := false;
    dm.qryGeral.SQL.Clear;
    dm.qryGeral.SQL.Add('SELECT * FROM TAB_PONTOS WHERE COD_CLUBE = :COD_CLUBE');
    dm.qryGeral.ParamByName('COD_CLUBE').Value := lytMenuClube.TagString;
    dm.qryGeral.Active := true;
    if dm.qryGeral.RecordCount > 0 then
    begin
      fancy.Show(TIconDialog.Info, '', 'Avaliação encerrada para esse clube!', 'OK');
      Exit;
    end;

    LimparEdits;
    LytMenuClube.Visible:=False;
    TabControlRequisitos.GotoVisibleTab(0);
    TabControl.GotoVisibleTab(2);
    ImgSalvar.Visible:=True;
    RtgFundoBasico.Visible:=False;
    RtgFundoMovimento.Visible:=False;
    RtgFundoAvancado.Visible:=False;
    RtgFundoInstrutor.Visible:=False;
end;

procedure TFrmPrincipal.lblMenuExcluirClick(Sender: TObject);
begin
    try
        dm.qryGeral.Active := false;
        dm.qryGeral.SQL.Clear;
        dm.qryGeral.SQL.Add('DELETE FROM TAB_CLUBES WHERE COD_CLUBE=:COD_CLUBE');
        dm.qryGeral.ParamByName('COD_CLUBE').Value := lytMenuClube.TagString;
        dm.qryGeral.ExecSQL;

        dm.qryGeral.Active := false;
        dm.qryGeral.SQL.Clear;
        dm.qryGeral.SQL.Add('DELETE FROM TAB_PONTOS WHERE COD_CLUBE=:COD_CLUBE');
        dm.qryGeral.ParamByName('COD_CLUBE').Value := lytMenuClube.TagString;
        dm.qryGeral.ExecSQL;

        dm.qryGeral.Active := false;
        dm.qryGeral.SQL.Clear;
        dm.qryGeral.SQL.Add('DELETE FROM TAB_RESULTADO WHERE COD_CLUBE=:COD_CLUBE');
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
    dm.qryGeral.Active := false;
    dm.qryGeral.SQL.Clear;
    dm.qryGeral.SQL.Add('SELECT * FROM TAB_PONTOS WHERE COD_CLUBE = :COD_CLUBE');
    dm.qryGeral.ParamByName('COD_CLUBE').Value := lytMenuClube.TagString;
    dm.qryGeral.Active := true;
    if dm.qryGeral.RecordCount = 0 then
    begin
      fancy.Show(TIconDialog.Info, '', 'Clube sem avaliação!', 'OK');
      Exit;
    end;

    dm.qryGeral.Active := false;
    dm.qryGeral.SQL.Clear;
    dm.qryGeral.SQL.Add('SELECT * FROM TAB_PONTOS WHERE COD_CLUBE = :COD_CLUBE');
    dm.qryGeral.ParamByName('COD_CLUBE').Value := lytMenuClube.TagString;
    dm.qryGeral.Active := true;
    LblB1.Text:= dm.qryGeral.FieldByName('PTS_B1').Value;
    LblB2.Text:= dm.qryGeral.FieldByName('PTS_B2').Value;
    LblB3.Text:= dm.qryGeral.FieldByName('PTS_B3').Value;
    LblB4.Text:= dm.qryGeral.FieldByName('PTS_B4').Value;
    LblB5.Text:= dm.qryGeral.FieldByName('PTS_B5').Value;
    LblB6.Text:= dm.qryGeral.FieldByName('PTS_B6').Value;
    LblB7.Text:= dm.qryGeral.FieldByName('PTS_B7').Value;
    LblB8.Text:= dm.qryGeral.FieldByName('PTS_B8').Value;
    LblM1.Text:= dm.qryGeral.FieldByName('PTS_M1').Value;
    LblM2.Text:= dm.qryGeral.FieldByName('PTS_M2').Value;
    LblM3.Text:= dm.qryGeral.FieldByName('PTS_M3').Value;
    LblM4.Text:= dm.qryGeral.FieldByName('PTS_M4').Value;
    LblM5.Text:= dm.qryGeral.FieldByName('PTS_M5').Value;
    LblM6.Text:= dm.qryGeral.FieldByName('PTS_M6').Value;
    LblM7.Text:= dm.qryGeral.FieldByName('PTS_M7').Value;
    LblM8.Text:= dm.qryGeral.FieldByName('PTS_M8').Value;
    LblM9.Text:= dm.qryGeral.FieldByName('PTS_M9').Value;
    LblA1.Text:= dm.qryGeral.FieldByName('PTS_A1').Value;
    LblA2.Text:= dm.qryGeral.FieldByName('PTS_A2').Value;
    LblA3.Text:= dm.qryGeral.FieldByName('PTS_A3').Value;
    LblA4.Text:= dm.qryGeral.FieldByName('PTS_A4').Value;
    LblA5.Text:= dm.qryGeral.FieldByName('PTS_A5').Value;
    LblA6.Text:= dm.qryGeral.FieldByName('PTS_A6').Value;
    LblA7.Text:= dm.qryGeral.FieldByName('PTS_A7').Value;
    LblA8.Text:= dm.qryGeral.FieldByName('PTS_A8').Value;
    LblA9.Text:= dm.qryGeral.FieldByName('PTS_A9').Value;
    LblT1.Text:= dm.qryGeral.FieldByName('PTS_T1').Value;
    LblT2.Text:= dm.qryGeral.FieldByName('PTS_T2').Value;
    LblT3.Text:= dm.qryGeral.FieldByName('PTS_T3').Value;
    LblT4.Text:= dm.qryGeral.FieldByName('PTS_T4').Value;

    LytMenuClube.Visible:=False;
    TabControlRequisitos.GotoVisibleTab(0);
    TabControl.GotoVisibleTab(2);
    ImgSalvar.Visible:=False;
    RtgFundoBasico.Visible:=True;
    RtgFundoMovimento.Visible:=True;
    RtgFundoAvancado.Visible:=True;
    RtgFundoInstrutor.Visible:=True;
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
    FrmPrincipal.EditarCampo(LblM9, 'EDIT', LblMt9.Text, LblMs9.Text,
                             '0,0', 'N', '', 10);
    {$ENDIF}
end;

procedure TFrmPrincipal.Rectangle10Tap(Sender: TObject; const Point: TPointF);
begin
    FrmPrincipal.EditarCampo(LblM9, 'EDIT', LblMt9.Text, LblMs9.Text,
                             '0,0', 'N', '', 10);
end;

procedure TFrmPrincipal.Rectangle11Click(Sender: TObject);
begin
    {$IFDEF MSWINDOWS}
    FrmPrincipal.EditarCampo(LblM4, 'EDIT', LblMt4.Text, LblMs4.Text,
                             '0,0', 'N', '', 10);
    {$ENDIF}
end;

procedure TFrmPrincipal.Rectangle11Tap(Sender: TObject; const Point: TPointF);
begin
    FrmPrincipal.EditarCampo(LblM4, 'EDIT', LblMt4.Text, LblMs4.Text,
                             '0,0', 'N','', 10);
end;

procedure TFrmPrincipal.Rectangle12Click(Sender: TObject);
begin
    {$IFDEF MSWINDOWS}
    FrmPrincipal.EditarCampo(LblM2, 'EDIT', LblMt2.Text, LblMs2.Text,
                             '0,0', 'N', '', 10);
    {$ENDIF}
end;

procedure TFrmPrincipal.Rectangle12Tap(Sender: TObject; const Point: TPointF);
begin
    FrmPrincipal.EditarCampo(LblM2, 'EDIT', LblMt2.Text, LblMs2.Text,
                             '0,0', 'N', '', 10);
end;

procedure TFrmPrincipal.Rectangle13Click(Sender: TObject);
begin
    {$IFDEF MSWINDOWS}
    FrmPrincipal.EditarCampo(LblM7, 'EDIT', LblMt7.Text, LblMs7.Text,
                             '0,0', 'N', '', 10);
    {$ENDIF}
end;

procedure TFrmPrincipal.Rectangle13Tap(Sender: TObject; const Point: TPointF);
begin
    FrmPrincipal.EditarCampo(LblM7, 'EDIT', LblMt7.Text, LblMs7.Text,
                             '0,0', 'N', '', 10);
end;

procedure TFrmPrincipal.Rectangle14Click(Sender: TObject);
begin
    {$IFDEF MSWINDOWS}
    FrmPrincipal.EditarCampo(LblM6, 'EDIT', LblMt6.Text, LblMs6.Text,
                             '0,0', 'N', '', 10);
    {$ENDIF}
end;

procedure TFrmPrincipal.Rectangle14Tap(Sender: TObject; const Point: TPointF);
begin
    FrmPrincipal.EditarCampo(LblM6, 'EDIT', LblMt6.Text, LblMs6.Text,
                             '0,0', 'N', '', 10);
end;

procedure TFrmPrincipal.Rectangle15Click(Sender: TObject);
begin
    {$IFDEF MSWINDOWS}
    FrmPrincipal.EditarCampo(LblB7, 'EDIT', LblBt7.Text, LblBs7.Text,
                             '0,0', 'N', '', 10);
    {$ENDIF}
end;

procedure TFrmPrincipal.Rectangle15Tap(Sender: TObject; const Point: TPointF);
begin
    FrmPrincipal.EditarCampo(LblB7, 'EDIT', LblBt7.Text, LblBs7.Text,
                             '0,0', 'N', '', 10);
end;

procedure TFrmPrincipal.Rectangle16Click(Sender: TObject);
begin
    {$IFDEF MSWINDOWS}
    FrmPrincipal.EditarCampo(LblB6, 'EDIT', LblBt6.Text, LblBs6.Text,
                             '0,0', 'N', '', 10);
    {$ENDIF}
end;

procedure TFrmPrincipal.Rectangle16Tap(Sender: TObject; const Point: TPointF);
begin
    FrmPrincipal.EditarCampo(LblB6, 'EDIT', LblBt6.Text, LblBs6.Text,
                             '0,0', 'N', '', 10);
end;

procedure TFrmPrincipal.Rectangle17Click(Sender: TObject);
begin
    {$IFDEF MSWINDOWS}
    FrmPrincipal.EditarCampo(LblB5, 'EDIT', LblBt5.Text, LblBs5.Text,
                             '0,0', 'N', '', 10);
    {$ENDIF}
end;

procedure TFrmPrincipal.Rectangle17Tap(Sender: TObject; const Point: TPointF);
begin
    FrmPrincipal.EditarCampo(LblB5, 'EDIT', LblBt5.Text, LblBs5.Text,
                             '0,0', 'N', '', 10);
end;

procedure TFrmPrincipal.Rectangle18Click(Sender: TObject);
begin
    {$IFDEF MSWINDOWS}
    FrmPrincipal.EditarCampo(LblM5, 'EDIT', LblMt5.Text, LblMs5.Text,
                             '0,0', 'N', '', 10);
    {$ENDIF}
end;

procedure TFrmPrincipal.Rectangle18Tap(Sender: TObject; const Point: TPointF);
begin
    FrmPrincipal.EditarCampo(LblM5, 'EDIT', LblMt5.Text, LblMs5.Text,
                             '0,0', 'N', '', 10);
end;

procedure TFrmPrincipal.Rectangle19Click(Sender: TObject);
begin
    {$IFDEF MSWINDOWS}
    FrmPrincipal.EditarCampo(LblM8, 'EDIT', LblMt8.Text, LblMs8.Text,
                             '0,0', 'N', '', 10);
    {$ENDIF}
end;

procedure TFrmPrincipal.Rectangle19Tap(Sender: TObject; const Point: TPointF);
begin
    FrmPrincipal.EditarCampo(LblM8, 'EDIT', LblMt8.Text, LblMs8.Text,
                             '0,0', 'N', '', 10);
end;

procedure TFrmPrincipal.Rectangle20Click(Sender: TObject);
begin
    {$IFDEF MSWINDOWS}
    FrmPrincipal.EditarCampo(LblA1, 'EDIT', LblAt1.Text, LblAs1.Text,
                             '0,0', 'N', '', 10);
    {$ENDIF}
end;

procedure TFrmPrincipal.Rectangle20Tap(Sender: TObject; const Point: TPointF);
begin
    FrmPrincipal.EditarCampo(LblA1, 'EDIT', LblAt1.Text, LblAs1.Text,
                             '0,0', 'N', '', 10);
end;

procedure TFrmPrincipal.Rectangle21Click(Sender: TObject);
begin
    {$IFDEF MSWINDOWS}
    FrmPrincipal.EditarCampo(LblA3, 'EDIT', LblAt3.Text, LblAs3.Text,
                             '0,0', 'N', '', 10);
    {$ENDIF}
end;

procedure TFrmPrincipal.Rectangle21Tap(Sender: TObject; const Point: TPointF);
begin
    {$IFDEF MSWINDOWS}
    FrmPrincipal.EditarCampo(LblA3, 'EDIT', LblAt3.Text, LblAs3.Text,
                             '0,0', 'N', '', 10);
    {$ENDIF}
end;

procedure TFrmPrincipal.Rectangle22Click(Sender: TObject);
begin
    {$IFDEF MSWINDOWS}
    FrmPrincipal.EditarCampo(LblA8, 'EDIT', LblAt8.Text, LblAs8.Text,
                             '0,0', 'N', '', 10);
    {$ENDIF}
end;

procedure TFrmPrincipal.Rectangle22Tap(Sender: TObject; const Point: TPointF);
begin
    FrmPrincipal.EditarCampo(LblA8, 'EDIT', LblAt8.Text, LblAs8.Text,
                             '0,0', 'N', '', 10);
end;

procedure TFrmPrincipal.Rectangle23Click(Sender: TObject);
begin
    {$IFDEF MSWINDOWS}
    FrmPrincipal.EditarCampo(LblA4, 'EDIT', LblAt4.Text, LblAs4.Text,
                             '0,0', 'N', '', 10);
    {$ENDIF}
end;

procedure TFrmPrincipal.Rectangle23Tap(Sender: TObject; const Point: TPointF);
begin
    FrmPrincipal.EditarCampo(LblA4, 'EDIT', LblAt4.Text, LblAs4.Text,
                             '0,0', 'N', '', 10);
end;

procedure TFrmPrincipal.Rectangle24Click(Sender: TObject);
begin
    {$IFDEF MSWINDOWS}
    FrmPrincipal.EditarCampo(LblA2, 'EDIT', LblAt2.Text, LblAs2.Text,
                             '0,0', 'N', '', 10);
    {$ENDIF}
end;

procedure TFrmPrincipal.Rectangle24Tap(Sender: TObject; const Point: TPointF);
begin
    FrmPrincipal.EditarCampo(LblA2, 'EDIT', LblAt2.Text, LblAs2.Text,
                             '0,0', 'N', '', 10);
end;

procedure TFrmPrincipal.Rectangle25Click(Sender: TObject);
begin
    {$IFDEF MSWINDOWS}
    FrmPrincipal.EditarCampo(LblA7, 'EDIT', LblAt7.Text, LblAs7.Text,
                             '0,0', 'N', '', 10);
    {$ENDIF}
end;

procedure TFrmPrincipal.Rectangle25Tap(Sender: TObject; const Point: TPointF);
begin
    FrmPrincipal.EditarCampo(LblA7, 'EDIT', LblAt7.Text, LblAs7.Text,
                             '0,0', 'N', '', 10);
end;

procedure TFrmPrincipal.Rectangle26Click(Sender: TObject);
begin
    {$IFDEF MSWINDOWS}
    FrmPrincipal.EditarCampo(LblA6, 'EDIT', LblAt6.Text, LblAs6.Text,
                             '0,0', 'N', '', 10);
    {$ENDIF}
end;

procedure TFrmPrincipal.Rectangle26Tap(Sender: TObject; const Point: TPointF);
begin
    FrmPrincipal.EditarCampo(LblA6, 'EDIT', LblAt6.Text, LblAs6.Text,
                             '0,0', 'N', '', 10);
end;

procedure TFrmPrincipal.Rectangle27Click(Sender: TObject);
begin
    {$IFDEF MSWINDOWS}
    FrmPrincipal.EditarCampo(LblA5, 'EDIT', LblAt5.Text, LblAs5.Text,
                             '0,0', 'N', '', 10);
    {$ENDIF}
end;

procedure TFrmPrincipal.Rectangle27Tap(Sender: TObject; const Point: TPointF);
begin
    FrmPrincipal.EditarCampo(LblA5, 'EDIT', LblAt5.Text, LblAs5.Text,
                             '0,0', 'N', '', 10);
end;

procedure TFrmPrincipal.Rectangle28Click(Sender: TObject);
begin
    {$IFDEF MSWINDOWS}
    FrmPrincipal.EditarCampo(LblA9, 'EDIT', LblAt9.Text, LblAs9.Text,
                             '0,0', 'N', '', 10);
    {$ENDIF}
end;

procedure TFrmPrincipal.Rectangle28Tap(Sender: TObject; const Point: TPointF);
begin
    FrmPrincipal.EditarCampo(LblA9, 'EDIT', LblAt9.Text, LblAs9.Text,
                             '0,0', 'N', '', 10);
end;

procedure TFrmPrincipal.Rectangle29Click(Sender: TObject);
begin
    {$IFDEF MSWINDOWS}
    FrmPrincipal.EditarCampo(LblT1, 'EDIT', LblTt1.Text, LblTs1.Text,
                             '0,0', 'N', '', 10);
    {$ENDIF}
end;

procedure TFrmPrincipal.Rectangle29Tap(Sender: TObject; const Point: TPointF);
begin
    FrmPrincipal.EditarCampo(LblT1, 'EDIT', LblTt1.Text, LblTs1.Text,
                             '0,0', 'N', '', 10);
end;

procedure TFrmPrincipal.Rectangle30Click(Sender: TObject);
begin
    {$IFDEF MSWINDOWS}
    FrmPrincipal.EditarCampo(LblT3, 'EDIT', LblTt3.Text, LblTs3.Text,
                             '0,0', 'N', '', 10);
    {$ENDIF}
end;

procedure TFrmPrincipal.Rectangle30Tap(Sender: TObject; const Point: TPointF);
begin
    FrmPrincipal.EditarCampo(LblT3, 'EDIT', LblTt3.Text, LblTs3.Text,
                             '0,0', 'N', '', 10);
end;

procedure TFrmPrincipal.Rectangle32Click(Sender: TObject);
begin
    {$IFDEF MSWINDOWS}
    FrmPrincipal.EditarCampo(LblT4, 'EDIT', LblTt4.Text, LblTs4.Text,
                             '0,0', 'N', '', 10);
    {$ENDIF}
end;

procedure TFrmPrincipal.Rectangle32Tap(Sender: TObject; const Point: TPointF);
begin
    FrmPrincipal.EditarCampo(LblT4, 'EDIT', LblTt4.Text, LblTs4.Text,
                             '0,0', 'N', '', 10);
end;

procedure TFrmPrincipal.Rectangle33Click(Sender: TObject);
begin
    {$IFDEF MSWINDOWS}
    FrmPrincipal.EditarCampo(LblT2, 'EDIT', LblTt2.Text, LblTs2.Text,
                             '0,0', 'N', '', 10);
    {$ENDIF}
end;

procedure TFrmPrincipal.Rectangle33Tap(Sender: TObject; const Point: TPointF);
begin
    FrmPrincipal.EditarCampo(LblT2, 'EDIT', LblTt2.Text, LblTs2.Text,
                             '0,0', 'N', '', 10);
end;

procedure TFrmPrincipal.Rectangle5Click(Sender: TObject);
begin
    {$IFDEF MSWINDOWS}
    FrmPrincipal.EditarCampo(LblM1, 'EDIT', LblMt1.Text, LblMs1.Text,
                             '0,0', 'N', '', 10);
    {$ENDIF}
end;

procedure TFrmPrincipal.Rectangle5Tap(Sender: TObject; const Point: TPointF);
begin
    FrmPrincipal.EditarCampo(LblM1, 'EDIT', LblMt1.Text, LblMs1.Text,
                             '0,0', 'N', '', 10);
end;

procedure TFrmPrincipal.Rectangle9Click(Sender: TObject);
begin
    {$IFDEF MSWINDOWS}
    FrmPrincipal.EditarCampo(LblM3, 'EDIT', LblMt3.Text, LblMs3.Text,
                             '0,0', 'N', '', 10);
    {$ENDIF}
end;

procedure TFrmPrincipal.Rectangle9Tap(Sender: TObject; const Point: TPointF);
begin
    FrmPrincipal.EditarCampo(LblM3, 'EDIT', LblMt3.Text, LblMs3.Text,
                             '0,0', 'N', '', 10);
end;

procedure TFrmPrincipal.AddClube(codClube, Nome, Regiao, Diretor, Pontos: String);
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
        TListItemText(Objects.FindDrawable('txtDiretor')).Text := 'Diretor: '+Diretor;
        TListItemText(Objects.FindDrawable('txtPontos')).Text := Pontos;
        TListItemImage(Objects.FindDrawable('ImageMenu')).Bitmap := imgOpcao.Bitmap
    end;
end;

procedure TFrmPrincipal.ConsultarClube;
begin
    lvClube.Items.Clear;

    dm.qryConsOS.Active := false;
    dm.qryConsOS.SQL.Clear;
    dm.qryConsOS.SQL.Add('SELECT * FROM TAB_CLUBES');
    dm.qryConsOS.SQL.Add('ORDER BY NOME');
    dm.qryConsOS.Active := true;

    while NOT dm.qryConsOS.Eof do
    begin
        AddClube(dm.qryConsOS.FieldByName('COD_CLUBE').AsString,
              dm.qryConsOS.FieldByName('NOME').AsString,
              dm.qryConsOS.FieldByName('REGIAO').AsString,
              dm.qryConsOS.FieldByName('DIRETOR').AsString,
              dm.qryConsOS.FieldByName('PONTOS').AsString);

        dm.qryConsOS.Next;
    end;

end;

procedure TFrmPrincipal.EditarCampo(objeto: TObject; tipo_campo, titulo, subtitulo,
  textprompt, ind_obrigatorio, texto_padrao: string; tam_maximo: integer;
  ProcCallBack: TExecutaClick);
var
    dia, mes, ano : integer;
begin
    if NOT Assigned(FrmEditar) then
        Application.CreateForm(TFrmEditar, FrmEditar);

    FrmEditar.lbl_titulo.Text := titulo;
    FrmEditar.lbl_subtitulo.Text := subtitulo;
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

procedure TFrmPrincipal.FormKeyUp(Sender: TObject; var Key: Word;
  var KeyChar: Char; Shift: TShiftState);
{$IFDEF ANDROID}
var
  FService: IFMXVirtualKeyboardService;
{$ENDIF}
begin
{$IFDEF ANDROID}
  if (Key = vkHardwareBack) then
  begin
    TPlatformServices.Current.SupportsPlatformService(IFMXVirtualKeyboardService, IInterface(FService));

    if (FService <> nil) and (TVirtualKeyboardState.Visible in FService.VirtualKeyBoardState) then
    begin
      //botao back pressionado e teclado visivel
      //apenas fecha teclado
    end else
    begin
      if (TabControl.ActiveTab = TabPontuacoes) or
         (TabControl.ActiveTab = TabCalcular) then
      begin
        Key := 0;
        TabControl.GotoVisibleTab(1);
      end else
      begin
        Key := 0;
        fancy.Show(TIconDialog.Question, 'Logout', 'Deseja sair?', 'Sim', ClickLogout, 'Não');
      end;
    end;
  end;
{$ENDIF}
end;

procedure TFrmPrincipal.FormShow(Sender: TObject);
begin
    LblNomeAvaliador.Text:= 'Avaliador: '+Nome_Usuario;
    TabControl.GotoVisibleTab(1);
    ConsultarClube;
end;

procedure TFrmPrincipal.ImgCalcularClick(Sender: TObject);
begin
    TabControl.GotoVisibleTab(0);
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

procedure TFrmPrincipal.ClickLogout(Sender: TObject);
begin
  Close;
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
    FrmPrincipal.EditarCampo(LblB8, 'EDIT', LblBt8.Text, LblBs8.Text,
                             '0,0', 'N', '', 10);
    {$ENDIF}
end;

procedure TFrmPrincipal.rect_cidadeTap(Sender: TObject; const Point: TPointF);
begin
    FrmPrincipal.EditarCampo(LblB8, 'EDIT', LblBt8.Text, LblBs8.Text,
                             '0,0', 'N', '', 10);
end;

procedure TFrmPrincipal.rect_emailClick(Sender: TObject);
begin
    {$IFDEF MSWINDOWS}
    FrmPrincipal.EditarCampo(LblB3, 'EDIT', LblBt3.Text, LblBs3.Text,
                             '0,0', 'N', '', 10);
    {$ENDIF}
end;

procedure TFrmPrincipal.rect_emailTap(Sender: TObject; const Point: TPointF);
begin
    FrmPrincipal.EditarCampo(LblB3, 'EDIT', LblBt3.Text, LblBs3.Text,
                             '0,0', 'N', '', 10);
end;

procedure TFrmPrincipal.rect_enderecoClick(Sender: TObject);
begin
    {$IFDEF MSWINDOWS}
    FrmPrincipal.EditarCampo(LblB4, 'EDIT', LblBt4.Text, LblBs4.Text,
                             '0,0', 'N', '', 10);
    {$ENDIF}
end;

procedure TFrmPrincipal.rect_enderecoTap(Sender: TObject; const Point: TPointF);
begin
    FrmPrincipal.EditarCampo(LblB4, 'EDIT', LblBt4.Text, LblBs4.Text,
                             '0,0', 'N', '', 10);
end;

procedure TFrmPrincipal.rect_foneClick(Sender: TObject);
begin
    {$IFDEF MSWINDOWS}
    FrmPrincipal.EditarCampo(LblB2, 'EDIT', LblBt2.Text, LblBs2.Text,
                             '0,0', 'N', '', 10);
    {$ENDIF}
end;

procedure TFrmPrincipal.rect_foneTap(Sender: TObject; const Point: TPointF);
begin
    FrmPrincipal.EditarCampo(LblB2, 'EDIT', LblBt2.Text, LblBs2.Text,
                             '0,0', 'N', '', 10);
end;

procedure TFrmPrincipal.rect_nomeClick(Sender: TObject);
begin
    {$IFDEF MSWINDOWS}
    FrmPrincipal.EditarCampo(LblB1, 'EDIT', LblBt1.Text, LblBs1.Text,
                             '0,0', 'N', '', 10);
    {$ENDIF}
end;

procedure TFrmPrincipal.rect_nomeTap(Sender: TObject; const Point: TPointF);
begin
    FrmPrincipal.EditarCampo(LblB1, 'EDIT', LblBt1.Text, LblBs1.Text,
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
            SQL.Add('INSERT INTO TAB_CLUBES(COD_CLUBE, NOME, REGIAO, DIRETOR, PONTOS)');
            SQL.Add('VALUES(:COD_CLUBE, :NOME, :REGIAO, :DIRETOR, :PONTOS)');

            CodClube := GeraCodClube;
        end
        else
        begin
            SQL.Add('UPDATE TAB_CLUBES SET COD_CLUBE=:COD_CLUBE, NOME=:NOME, DIRETOR=:DIRETOR, PONTOS=:PONTOS');
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
