unit UnitPrincipal;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Objects,
  FMX.TabControl, FMX.Controls.Presentation, FMX.StdCtrls, FMX.Edit,
  FMX.ListView.Types, FMX.ListView.Appearances, FMX.ListView.Adapters.Base,
  FMX.ListView, FMX.Layouts,

  {$IFDEF ANDROID}
  UnitPdfPrint,
  {$ENDIF}

  uFancyDialog, FMX.VirtualKeyboard, FMX.Platform, System.Permissions,
  System.Actions, FMX.ActnList, FMX.StdActns, FMX.MediaLibrary.Actions,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client, FMX.Advertising;

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
    ImgCompartilhar: TImage;
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
    Rectangle8: TRectangle;
    EdtInstrutor: TEdit;
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
    TabAvancado: TTabItem;
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
    ImgSorteio: TImage;
    TabCalcular: TTabItem;
    Rectangle31: TRectangle;
    Label4: TLabel;
    ImgRefresh: TImage;
    ImgVotar: TImage;
    RtgFundoBasico: TRectangle;
    RtgFundoMovimento: TRectangle;
    RtgFundoAvancado: TRectangle;
    RtgFundoInstrutor: TRectangle;
    lvResultado: TListView;
    Rectangle34: TRectangle;
    edtBuscaCliente: TEdit;
    Rectangle35: TRectangle;
    ImgBuscar: TImage;
    imgTrofeu1: TImage;
    imgTrofeu2: TImage;
    imgTrofeu3: TImage;
    imgMedalha: TImage;
    imgSomar: TImage;
    lytAddAvaliadores: TLayout;
    RtgAddAvaliador: TRectangle;
    RtgResultadoAdd: TRectangle;
    Label5: TLabel;
    Rectangle38: TRectangle;
    Rectangle39: TRectangle;
    edtResultadoAvaliador: TEdit;
    Rectangle40: TRectangle;
    edtResultadoPontos: TEdit;
    ActionList1: TActionList;
    actPhotoLibrary: TTakePhotoFromLibraryAction;
    TabResultado: TFDMemTable;
    TabResultadoCod_Clube: TStringField;
    TabResultadoNom_Clube: TStringField;
    Rectangle36: TRectangle;
    LblAt10: TLabel;
    Image1: TImage;
    LblA10: TLabel;
    LblAs10: TLabel;
    TabResultadoTotal: TFloatField;
    AniIndicator1: TAniIndicator;
    lytShared: TLayout;
    Rectangle4: TRectangle;
    Rectangle37: TRectangle;
    Label6: TLabel;
    Rectangle41: TRectangle;
    Label7: TLabel;
    Label8: TLabel;
    Label10: TLabel;
    ImgPdf: TImage;
    ImgExport: TImage;
    ImgImport: TImage;
    Layout1: TLayout;
    Rectangle42: TRectangle;
    EdtOrdem: TEdit;
    BannerAd1: TBannerAd;
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
    procedure ImgVoltarClick(Sender: TObject);
    procedure ImgRefreshClick(Sender: TObject);
    procedure RtgResultadoAddClick(Sender: TObject);
    procedure ImgCompartilharClick(Sender: TObject);
    procedure lvResultadoItemClickEx(const Sender: TObject; ItemIndex: Integer;
      const LocalClickPos: TPointF; const ItemObject: TListItemDrawable);
    procedure RtgAddAvaliadorClick(Sender: TObject);
    procedure Rectangle36Click(Sender: TObject);
    procedure Rectangle36Tap(Sender: TObject; const Point: TPointF);
    procedure ImgSorteioClick(Sender: TObject);
    procedure Rectangle4Click(Sender: TObject);
    procedure Rectangle37Click(Sender: TObject);
  private
    fancy : TFancyDialog;
    posicao_final: Integer;

    {$IFDEF ANDROID}
    PermissaoReadStorage, PermissaoWriteStorage : string;
    procedure LibraryPermissionRequestResult(
        Sender: TObject; const APermissions: TArray<string>;
        const AGrantResults: TArray<TPermissionStatus>);
    procedure DisplayMessageLibrary(Sender: TObject;
                const APermissions: TArray<string>;
                const APostProc: TProc);
    {$ENDIF}

    procedure MudarAba(Image: TImage);
    procedure LimparEdits;
    procedure ConsultarClube;
    procedure ConsultarResultado;
    procedure ConsultarResultadoFinal;
    procedure AddClube(codClube, Nome, Regiao, Diretor, Pontos: String);
    procedure AddResultado(codClube, Nome, Pontos: String);
    procedure AddResultadoFinal(codClube, Nome, Pontos: String);
    procedure ClickLogout(Sender: TObject);
    procedure ClickApagar(Sender: TObject);
    procedure ClickExcluir(Sender: TObject);
    procedure ClickSorteio(Sender: TObject);
    procedure Imprimir;
    procedure AjustarTabRequisitos;
    procedure ThreadFim(Sender: TObject);
    function ValidaClubesPonto: Boolean;
    { Private declarations }
  public
    { Public declarations }
    CodClube: string;
    Nome_Usuario: String;
    Item_Avaliar: String;
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

uses UnitDM, UnitEditar, UnitFunctions, FMX.DialogService
{$IFDEF ANDROID}
,Androidapi.Helpers, Androidapi.JNI.JavaTypes, Androidapi.JNI.Os
{$ENDIF}
;

{$IFDEF ANDROID}
procedure TFrmPrincipal.LibraryPermissionRequestResult(
        Sender: TObject; const APermissions: TArray<string>;
        const AGrantResults: TArray<TPermissionStatus>);
begin
        // 2 Permissoes: READ_EXTERNAL_STORAGE e WRITE_EXTERNAL_STORAGE

        if (Length(AGrantResults) = 2) and
           (AGrantResults[0] = TPermissionStatus.Granted) and
           (AGrantResults[1] = TPermissionStatus.Granted) then
                Imprimir
        else
                TDialogService.ShowMessage('Voc� n�o tem permiss�o para acessar a library');
end;

procedure TFrmPrincipal.DisplayMessageLibrary(Sender: TObject;
                const APermissions: TArray<string>;
                const APostProc: TProc);
begin
        TDialogService.ShowMessage('O app precisa acessar a library do seu dispositivo',
                procedure(const AResult: TModalResult)
                begin
                        APostProc;
                end);
end;
{$ENDIF}

procedure TFrmPrincipal.imgAbaOSClick(Sender: TObject);
begin
    MudarAba(TImage(Sender));
end;

procedure TFrmPrincipal.imgAddClick(Sender: TObject);
begin
    EdtNome.Text:='';
    EdtInstrutor.Text:='';
    EdtOrdem.Text:='';
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
             StrToFloat(LblA1.text)+StrToFloat(LblA2.text)+StrToFloat(LblA3.text)+StrToFloat(LblA4.text)+StrToFloat(LblA5.text)+StrToFloat(LblA6.text)+StrToFloat(LblA7.text)+StrToFloat(LblA8.text)+StrToFloat(LblA9.text)+StrToFloat(LblA10.text)+
             StrToFloat(LblT1.text)+StrToFloat(LblT2.text)+StrToFloat(LblT3.text)+StrToFloat(LblT4.text);

    try
      //Grava os pontos
      dm.qryGeral.Active := false;
      dm.qryGeral.SQL.Clear;
      dm.qryGeral.SQL.Add('INSERT INTO TAB_PONTOS (COD_PONTO, COD_CLUBE,');
      dm.qryGeral.SQL.Add('PTS_B1,PTS_B2,PTS_B3,PTS_B4,PTS_B5,PTS_B6,PTS_B7,PTS_B8,');
      dm.qryGeral.SQL.Add('PTS_M1,PTS_M2,PTS_M3,PTS_M4,PTS_M5,PTS_M6,PTS_M7,PTS_M8,PTS_M9,');
      dm.qryGeral.SQL.Add('PTS_A1,PTS_A2,PTS_A3,PTS_A4,PTS_A5,PTS_A6,PTS_A7,PTS_A8,PTS_A9,PTS_A10,');
      dm.qryGeral.SQL.Add('PTS_T1,PTS_T2,PTS_T3,PTS_T4)');
      dm.qryGeral.SQL.Add('VALUES (:COD_PONTO, :COD_CLUBE,');
      dm.qryGeral.SQL.Add(':PTS_B1,:PTS_B2,:PTS_B3,:PTS_B4,:PTS_B5,:PTS_B6,:PTS_B7,:PTS_B8,');
      dm.qryGeral.SQL.Add(':PTS_M1,:PTS_M2,:PTS_M3,:PTS_M4,:PTS_M5,:PTS_M6,:PTS_M7,:PTS_M8,:PTS_M9,');
      dm.qryGeral.SQL.Add(':PTS_A1,:PTS_A2,:PTS_A3,:PTS_A4,:PTS_A5,:PTS_A6,:PTS_A7,:PTS_A8,:PTS_A9,:PTS_A10,');
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
      dm.qryGeral.ParamByName('PTS_A10').Value := LblA10.Text;
      dm.qryGeral.ParamByName('PTS_T1').Value := LblT1.Text;
      dm.qryGeral.ParamByName('PTS_T2').Value := LblT2.Text;
      dm.qryGeral.ParamByName('PTS_T3').Value := LblT3.Text;
      dm.qryGeral.ParamByName('PTS_T4').Value := LblT4.Text;
      dm.qryGeral.ExecSQL;


      //Atualiza o total de pontos
      dm.qryGeral.Active := false;
      dm.qryGeral.SQL.Clear;
      dm.qryGeral.SQL.Add('UPDATE TAB_CLUBES SET PONTOS=:PONTOS, TOTAL=:TOTAL');
      dm.qryGeral.SQL.Add('WHERE COD_CLUBE=:COD_CLUBE');
      dm.qryGeral.ParamByName('PONTOS').Value := FloatToStr(pontos);
      dm.qryGeral.ParamByName('TOTAL').Value := pontos;
      dm.qryGeral.ParamByName('COD_CLUBE').Value := lytMenuClube.TagString;
      dm.qryGeral.ExecSQL;

      //Resultado parcial
      dm.qryGeral.Active := false;
      dm.qryGeral.SQL.Clear;
      dm.qryGeral.SQL.Add('INSERT INTO TAB_RESULTADO (COD_RESULTADO, COD_CLUBE, AVALIADOR, PONTOS)');
      dm.qryGeral.SQL.Add('VALUES (:COD_RESULTADO, :COD_CLUBE, :AVALIADOR, :PONTOS)');
      dm.qryGeral.ParamByName('COD_RESULTADO').Value := GeraCodResultado;
      dm.qryGeral.ParamByName('COD_CLUBE').Value := lytMenuClube.TagString;
      dm.qryGeral.ParamByName('AVALIADOR').Value := Nome_Usuario;
      dm.qryGeral.ParamByName('PONTOS').Value := FloatToStr(pontos);
      dm.qryGeral.ExecSQL;

      ConsultarClube;
      TabControl.GotoVisibleTab(1);

    except on ex:exception do
        fancy.Show(TIconDialog.Error, '', 'Erro ao gravar avalia��o!', 'OK');
    end;
end;

procedure TFrmPrincipal.ImgSorteioClick(Sender: TObject);
begin
  if lvClube.Items.Count = 0 then
  begin
    fancy.Show(TIconDialog.Info, '', 'No momento nada para sortear!', 'OK');
    Exit;
  end;

  fancy.Show(TIconDialog.Question, 'Aten��o', 'Deseja realizar o sorteio?', 'Sim', ClickSorteio, 'N�o');
end;

procedure TFrmPrincipal.ImgVoltarClick(Sender: TObject);
begin
  ConsultarClube;
  TabControl.GotoVisibleTab(1);
end;

procedure TFrmPrincipal.ImgVotarClick(Sender: TObject);
begin
  ConsultarClube;
  TabControl.GotoVisibleTab(1);
end;

procedure TFrmPrincipal.Imprimir;
{$IFDEF ANDROID}
var
  lPdf: tPdfPrint;
  linha: Integer;
{$ENDIF}
begin
{$IFDEF ANDROID}
  if not ValidaClubesPonto then
  begin
    fancy.Show(TIconDialog.Info, '', 'Clube sem pontua��o. Avalie ou Exclua!', 'OK');
    Exit;
  end;

  linha:=20;
  lPdf:= tPdfPrint.Create('OrdemUnida-'+Nome_Usuario);
  try
    lPdf.Abrir;
    lPdf.FonteName:='Arial';
    lPdf.ImpL( 5, 40, 'CONCURSO DE ORDEM UNIDA', Normal, $FF000000, 16);
    lPdf.ImpL( 10, 50, '(Resultado Parcial)', Normal, $FF000000, 14);
    lPdf.ImpL( 20, 1, 'Avaliador: '+Nome_Usuario, Normal, $FF000000, 14);
    lPdf.ImpL( 20, 60, 'Avalia��o: '+Item_Avaliar, Normal, $FF000000, 14);

//    ConsultarResultadoFinal;

    dm.qryConsOS.Active := false;
    dm.qryConsOS.SQL.Clear;
    dm.qryConsOS.SQL.Add('SELECT COD_CLUBE, NOME, TOTAL FROM TAB_CLUBES');
    dm.qryConsOS.SQL.Add('ORDER BY NOME');
    dm.qryConsOS.Active := true;
    while NOT dm.qryConsOS.Eof do
    begin
        linha:=linha+5;
        lPdf.ImpLinhaH(linha, 1, 120, $FF000000);
        linha:=linha+5;
        lPdf.ImpL(linha, 1, 'Clube: ', Normal, $FF000000, 14);
        lPdf.ImpL(linha, 15, dm.qryConsOS.FieldByName('NOME').AsString, Normal, $FF000000, 14);
        lPdf.ImpL(linha, 70, 'Total: ', Normal, $FF000000, 14);
        lPdf.ImpL(linha, 85, dm.qryConsOS.FieldByName('TOTAL').Value, Normal, $FF000000, 14);
        linha:=linha+4;
        lPdf.ImpLinhaH(linha, 1, 120, $FF000000);

        dm.qryGeral.Active := false;
        dm.qryGeral.SQL.Clear;
        dm.qryGeral.SQL.Add('SELECT PTS_B1,PTS_B2,PTS_B3,PTS_B4,PTS_B5,PTS_B6,PTS_B7,PTS_B8,');
        dm.qryGeral.SQL.Add('PTS_M1,PTS_M2,PTS_M3,PTS_M4,PTS_M5,PTS_M6,PTS_M7,PTS_M8,PTS_M9,');
        DM.qryGeral.SQL.Add('PTS_A1,PTS_A2,PTS_A3,PTS_A4,PTS_A5,PTS_A6,PTS_A7,PTS_A8,PTS_A9,PTS_A10,');
        DM.qryGeral.SQL.Add('PTS_T1,PTS_T2,PTS_T3,PTS_T4 FROM TAB_PONTOS');
        dm.qryGeral.SQL.Add('WHERE COD_CLUBE = :COD_CLUBE');
        dm.qryGeral.ParamByName('COD_CLUBE').AsString:=dm.qryConsOS.FieldByName('COD_CLUBE').AsString;
        dm.qryGeral.Active := true;

        if (Item_Avaliar = 'B�sico') or (Item_Avaliar = 'Todas') then
        begin
          linha:=linha+4;
          lPdf.ImpL(linha, 1, '# B�sico #', Normal, $FF000000, 14);
          linha:=linha+3;
          lPdf.ImpL(linha, 1, 'Descansar     = '+dm.qryGeral.FieldByName('PTS_B1').AsString, Normal, $FF000000, 12);
          lPdf.ImpL(linha, 40, 'Sentido       = '+dm.qryGeral.FieldByName('PTS_B2').AsString, Normal, $FF000000, 12);
          lPdf.ImpL(linha, 80, 'Cobrir        = '+dm.qryGeral.FieldByName('PTS_B3').AsString, Normal, $FF000000, 12);
          linha:=linha+3;
          lPdf.ImpL(linha, 1, 'Firme         = '+dm.qryGeral.FieldByName('PTS_B4').AsString, Normal, $FF000000, 12);
          lPdf.ImpL(linha, 40, 'Dir/Esq/MeiaVolta= '+dm.qryGeral.FieldByName('PTS_B5').AsString, Normal, $FF000000, 12);
          lPdf.ImpL(linha, 80, 'Oitava Direita= '+dm.qryGeral.FieldByName('PTS_B6').AsString, Normal, $FF000000, 12);
          linha:=linha+3;
          lPdf.ImpL(linha, 1, 'Oitava Esquerd= '+dm.qryGeral.FieldByName('PTS_B7').AsString, Normal, $FF000000, 12);
          lPdf.ImpL(linha, 40, 'Frente Ret/Dir/Esq= '+dm.qryGeral.FieldByName('PTS_B8').AsString, Normal, $FF000000, 12);
        end;
        if (Item_Avaliar = 'Movimento') or (Item_Avaliar = 'Todas') then
        begin
          linha:=linha+4;
          lPdf.ImpL(linha, 1, '# Movimento #', Normal, $FF000000, 14);
          linha:=linha+3;
          lPdf.ImpL(linha, 1, 'Ord. Marche   = '+dm.qryGeral.FieldByName('PTS_M1').AsString, Normal, $FF000000, 12);
          lPdf.ImpL(linha,40, 'Marcar Passo  = '+dm.qryGeral.FieldByName('PTS_M2').AsString, Normal, $FF000000, 12);
          lPdf.ImpL(linha,80, 'Direita Volver= '+dm.qryGeral.FieldByName('PTS_M3').AsString, Normal, $FF000000, 12);
          linha:=linha+3;
          lPdf.ImpL(linha, 1, 'Esquerda Volver= '+dm.qryGeral.FieldByName('PTS_M4').AsString, Normal, $FF000000, 12);
          lPdf.ImpL(linha,40, 'MeiaVolta Volver= '+dm.qryGeral.FieldByName('PTS_M5').AsString, Normal, $FF000000, 12);
          lPdf.ImpL(linha,80, 'Olhar Dir/Esq = '+dm.qryGeral.FieldByName('PTS_M6').AsString, Normal, $FF000000, 12);
          linha:=linha+3;
          lPdf.ImpL(linha, 1, 'Alto          = '+dm.qryGeral.FieldByName('PTS_M7').AsString, Normal, $FF000000, 12);
          lPdf.ImpL(linha,40, 'Convers.Centro= '+dm.qryGeral.FieldByName('PTS_M8').AsString, Normal, $FF000000, 12);
          lPdf.ImpL(linha,80, 'Dir/Esq/Meia  = '+dm.qryGeral.FieldByName('PTS_M9').AsString, Normal, $FF000000, 12);
        end;
        if (Item_Avaliar = 'Avan�ado') or (Item_Avaliar = 'Todas') then
        begin
          linha:=linha+4;
          lPdf.ImpL(linha, 1, '# Avan�ado #', Normal, $FF000000, 14);
          linha:=linha+3;
          lPdf.ImpL(linha, 1, 'Alinhamento   = '+dm.qryGeral.FieldByName('PTS_A1').AsString, Normal, $FF000000, 12);
          lPdf.ImpL(linha,40, 'Cobertura     = '+dm.qryGeral.FieldByName('PTS_A2').AsString, Normal, $FF000000, 12);
          lPdf.ImpL(linha,80, 'Conjunto      = '+dm.qryGeral.FieldByName('PTS_A3').AsString, Normal, $FF000000, 12);
          linha:=linha+3;
          lPdf.ImpL(linha, 1, 'Energia Movim.= '+dm.qryGeral.FieldByName('PTS_A4').AsString, Normal, $FF000000, 12);
          lPdf.ImpL(linha,40, 'Dific Evolu��o= '+dm.qryGeral.FieldByName('PTS_A5').AsString, Normal, $FF000000, 12);
          lPdf.ImpL(linha,80, 'Padroniza��o  = '+dm.qryGeral.FieldByName('PTS_A6').AsString, Normal, $FF000000, 12);
          linha:=linha+3;
          lPdf.ImpL(linha, 1, 'Posi��o       = '+dm.qryGeral.FieldByName('PTS_A7').AsString, Normal, $FF000000, 12);
          lPdf.ImpL(linha,40, 'Postura       = '+dm.qryGeral.FieldByName('PTS_A8').AsString, Normal, $FF000000, 12);
          lPdf.ImpL(linha,80, 'Garra         = '+dm.qryGeral.FieldByName('PTS_A9').AsString, Normal, $FF000000, 12);
          lPdf.ImpL(linha,110, 'Evolu��o Tema = '+dm.qryGeral.FieldByName('PTS_A10').AsString, Normal, $FF000000, 12);
        end;
        if (Item_Avaliar = 'Instrutor') or (Item_Avaliar = 'Todas') then
        begin
          linha:=linha+4;
          lPdf.ImpL(linha, 1, '# Instrutor #', Normal, $FF000000, 14);
          linha:=linha+3;
          lPdf.ImpL(linha, 1, 'Altura Voz    = '+dm.qryGeral.FieldByName('PTS_T1').AsString, Normal, $FF000000, 12);
          lPdf.ImpL(linha,40, 'Voz Comanda   = '+dm.qryGeral.FieldByName('PTS_T2').AsString, Normal, $FF000000, 12);
          lPdf.ImpL(linha,80, 'Postura Instr = '+dm.qryGeral.FieldByName('PTS_T3').AsString, Normal, $FF000000, 12);
          lPdf.ImpL(linha,120, 'Tempo = '+dm.qryGeral.FieldByName('PTS_T4').AsString, Normal, $FF000000, 12);
        end;
        linha:=linha+3;

        dm.qryConsOS.Next;
    end;

    //lPdf.NovaPagina;

    lPdf.Fechar;

    //lPdf.VisualizarPDF;
    lPdf.CompartilharPDF;
  finally
    lPdf.Free;
  end;
{$ENDIF}
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
    LblA10.Text:= '0,0';
    LblT1.Text:= '0,0';
    LblT2.Text:= '0,0';
    LblT3.Text:= '0,0';
    LblT4.Text:= '0,0';
end;

procedure TFrmPrincipal.lblMenuApagarClick(Sender: TObject);
begin
    fancy.Show(TIconDialog.Question, 'Aten��o', 'Deseja apagar todas as avalia��es?', 'Sim', ClickApagar, 'N�o');

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
      fancy.Show(TIconDialog.Info, '', 'Avalia��o encerrada para esse clube!', 'OK');
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
  fancy.Show(TIconDialog.Question, 'Aten��o', 'Deseja excluir o clube?', 'Sim', ClickExcluir, 'N�o');

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
      fancy.Show(TIconDialog.Info, '', 'Clube sem avalia��o!', 'OK');
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
    LblA10.Text:= dm.qryGeral.FieldByName('PTS_A10').Value;
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

procedure TFrmPrincipal.lvResultadoItemClickEx(const Sender: TObject;
  ItemIndex: Integer; const LocalClickPos: TPointF;
  const ItemObject: TListItemDrawable);
var
  nomeClube: String;
begin
    codClube := lvResultado.Items[ItemIndex].TagString;
    nomeClube := lvResultado.Items[ItemIndex].detail;

    if Assigned(ItemObject) then
        if ItemObject.Name = 'ImageAdd' then
        begin
            lytAddAvaliadores.TagString := codClube;
            edtResultadoPontos.Text:='';
            lytAddAvaliadores.Visible := true;
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
    FrmPrincipal.EditarCampo(LblA3, 'EDIT', LblAt3.Text, LblAs3.Text,
                             '0,0', 'N', '', 10);
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

procedure TFrmPrincipal.Rectangle36Click(Sender: TObject);
begin
    {$IFDEF MSWINDOWS}
    FrmPrincipal.EditarCampo(LblA10, 'EDIT', LblAt10.Text, LblAs10.Text,
                             '0,0', 'N', '', 10);
    {$ENDIF}
end;

procedure TFrmPrincipal.Rectangle36Tap(Sender: TObject; const Point: TPointF);
begin
    FrmPrincipal.EditarCampo(LblA10, 'EDIT', LblAt10.Text, LblAs10.Text,
                             '0,0', 'N', '', 10);
end;

procedure TFrmPrincipal.Rectangle37Click(Sender: TObject);
begin
  lytShared.Visible:=False;
end;

procedure TFrmPrincipal.Rectangle4Click(Sender: TObject);
begin
  lytShared.Visible := false;
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
        TListItemText(Objects.FindDrawable('txtRegiao')).Text := Regiao+'� apresentar';
        TListItemText(Objects.FindDrawable('txtDiretor')).Text := 'Instrutor: '+Diretor;
        TListItemText(Objects.FindDrawable('txtPontos')).Text := Pontos;
        TListItemImage(Objects.FindDrawable('ImageMenu')).Bitmap := imgOpcao.Bitmap
    end;
end;

procedure TFrmPrincipal.AddResultado(codClube, Nome, Pontos: String);
var
    item : TListViewItem;
begin
    item := lvResultado.Items.Add;

    with item do
    begin
        Height := 50;
        TagString := codClube;
        Detail := Nome;

        TListItemText(Objects.FindDrawable('txtNome')).Text := Nome;
        TListItemText(Objects.FindDrawable('txtPosicao')).Text := '0';
        TListItemText(Objects.FindDrawable('txtTitulo')).Text := 'Clube:';
        TListItemText(Objects.FindDrawable('txtPontos')).Text := Pontos;
        TListItemImage(Objects.FindDrawable('ImageAdd')).Bitmap := imgSomar.Bitmap;
        TListItemImage(Objects.FindDrawable('ImageIcone')).Bitmap := imgMedalha.Bitmap ;
    end;
end;

procedure TFrmPrincipal.AddResultadoFinal(codClube, Nome, Pontos: String);
var
    item : TListViewItem;
begin
    item := lvResultado.Items.Add;
    posicao_final:= posicao_final + 1;

    with item do
    begin
        Height := 50;
        TagString := codClube;
        Detail := Nome;

        TListItemText(Objects.FindDrawable('txtNome')).Text := Nome;
        TListItemText(Objects.FindDrawable('txtPosicao')).Text := IntToStr(posicao_final)+'�';
        TListItemText(Objects.FindDrawable('txtTitulo')).Text := 'Clube:';
        TListItemText(Objects.FindDrawable('txtPontos')).Text := Pontos;
        TListItemImage(Objects.FindDrawable('ImageAdd')).Bitmap := imgSomar.Bitmap;
        if posicao_final = 1 then
          TListItemImage(Objects.FindDrawable('ImageIcone')).Bitmap := imgTrofeu1.Bitmap
        else if posicao_final = 2 then
          TListItemImage(Objects.FindDrawable('ImageIcone')).Bitmap := imgTrofeu2.Bitmap
        else if posicao_final = 3 then
          TListItemImage(Objects.FindDrawable('ImageIcone')).Bitmap := imgTrofeu3.Bitmap
        else
          TListItemImage(Objects.FindDrawable('ImageIcone')).Bitmap := imgMedalha.Bitmap;
    end;
end;

procedure TFrmPrincipal.AjustarTabRequisitos;
begin
  if Item_Avaliar = 'B�sico' then
  begin
     TabBasico.Visible:= True;
     TabMovimento.Visible:= False;
     TabAvancado.Visible:= False;
     TabInstrutor.Visible:= False;
     TabControlRequisitos.GotoVisibleTab(0);
  end else if Item_Avaliar = 'Movimento' then
  begin
     TabBasico.Visible:= False;
     TabMovimento.Visible:= True;
     TabAvancado.Visible:= False;
     TabInstrutor.Visible:= False;
     TabControlRequisitos.GotoVisibleTab(1);
  end else if Item_Avaliar = 'Avan�ado' then
  begin
     TabBasico.Visible:= False;
     TabMovimento.Visible:= False;
     TabAvancado.Visible:= True;
     TabInstrutor.Visible:= False;
     TabControlRequisitos.GotoVisibleTab(2);
  end else if Item_Avaliar = 'Instrutor' then
  begin
     TabBasico.Visible:= False;
     TabMovimento.Visible:= False;
     TabAvancado.Visible:= False;
     TabInstrutor.Visible:= True;
     TabControlRequisitos.GotoVisibleTab(3);
  end else
  begin
     TabBasico.Visible:= True;
     TabMovimento.Visible:= True;
     TabAvancado.Visible:= True;
     TabInstrutor.Visible:= True;
     TabControlRequisitos.GotoVisibleTab(0);
  end;
end;

procedure TFrmPrincipal.ConsultarClube;
begin
    lvClube.Items.Clear;

    dm.qryConsOS.Active := false;
    dm.qryConsOS.SQL.Clear;
    dm.qryConsOS.SQL.Add('SELECT * FROM TAB_CLUBES');
    dm.qryConsOS.SQL.Add('ORDER BY SEQUENCIA, NOME');
    dm.qryConsOS.Active := true;
    dm.qryConsOS.First;

    while NOT dm.qryConsOS.Eof do
    begin
        AddClube(dm.qryConsOS.FieldByName('COD_CLUBE').AsString,
              dm.qryConsOS.FieldByName('NOME').AsString,
              IntToStr(dm.qryConsOS.FieldByName('SEQUENCIA').AsInteger),
              dm.qryConsOS.FieldByName('DIRETOR').AsString,
              dm.qryConsOS.FieldByName('PONTOS').AsString);

        dm.qryConsOS.Next;
    end;

end;

procedure TFrmPrincipal.ConsultarResultado;
begin
    lvResultado.Items.Clear;

    dm.qryConsOS.Active := false;
    dm.qryConsOS.SQL.Clear;
    dm.qryConsOS.SQL.Add('SELECT COD_CLUBE, NOME, TOTAL FROM TAB_CLUBES');
    dm.qryConsOS.SQL.Add('ORDER BY NOME');
    dm.qryConsOS.Active := true;

    while NOT dm.qryConsOS.Eof do
    begin
        AddResultado(dm.qryConsOS.FieldByName('COD_CLUBE').AsString,
                     dm.qryConsOS.FieldByName('NOME').AsString,
                     dm.qryConsOS.FieldByName('TOTAL').Value);

        dm.qryConsOS.Next;
    end;
end;

procedure TFrmPrincipal.ConsultarResultadoFinal;
begin
    lvResultado.Items.Clear;
    posicao_final:= 0;

    dm.qryConsOS.Active := false;
    dm.qryConsOS.SQL.Clear;
    dm.qryConsOS.SQL.Add('SELECT COD_CLUBE, NOME, TOTAL FROM TAB_CLUBES');
    dm.qryConsOS.SQL.Add('ORDER BY TOTAL DESC');
    dm.qryConsOS.Active := true;
    dm.qryConsOS.First;

    while NOT dm.qryConsOS.Eof do
    begin
        AddResultadoFinal(dm.qryConsOS.FieldByName('COD_CLUBE').AsString,
                          dm.qryConsOS.FieldByName('NOME').AsString,
                          FloatToStr(dm.qryConsOS.FieldByName('TOTAL').Value));

        dm.qryConsOS.Next;
    end;

//    TabResultado.IndexFieldNames := 'TOTAL:D';
//    while NOT TabResultado.Eof do
//    begin
//        AddResultadoFinal(TabResultadoCod_Clube.AsString,
//                          TabResultadoNom_Clube.AsString,
//                          FloatToStr(TabResultadoTotal.AsFloat));
//
//        TabResultado.Next;
//    end;
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
  TabResultado.CreateDataSet;

  {$IFDEF ANDROID}
  PermissaoReadStorage := JStringToString(TJManifest_permission.JavaClass.READ_EXTERNAL_STORAGE);
  PermissaoWriteStorage := JStringToString(TJManifest_permission.JavaClass.WRITE_EXTERNAL_STORAGE);
  {$ENDIF}
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
        fancy.Show(TIconDialog.Question, 'Logout', 'Deseja sair?', 'Sim', ClickLogout, 'N�o');
      end;
    end;
  end;
{$ENDIF}
end;

procedure TFrmPrincipal.FormShow(Sender: TObject);
begin
    LblNomeAvaliador.Text:= 'Avaliador: '+Nome_Usuario;
    TabControl.GotoVisibleTab(1);
    AjustarTabRequisitos;
    ConsultarClube;
end;

procedure TFrmPrincipal.ImgCompartilharClick(Sender: TObject);
begin
  {$IFDEF ANDROID}
    PermissionsService.RequestPermissions([PermissaoReadStorage,
                                           PermissaoWriteStorage],
                                           LibraryPermissionRequestResult,
                                           DisplayMessageLibrary
                                           );
  {$ENDIF}

  //lytShared.Visible:=True;

end;

procedure TFrmPrincipal.ImgCalcularClick(Sender: TObject);
begin
    if lvClube.Items.Count = 0 then
    begin
      fancy.Show(TIconDialog.Info, '', 'No momento nada para calcular!', 'OK');
      Exit;
    end;

    if not ValidaClubesPonto then
    begin
      fancy.Show(TIconDialog.Info, '', 'Clube sem pontua��o. Avalie ou Exclua!', 'OK');
      Exit;
    end;

    ConsultarResultado;
    TabControl.GotoVisibleTab(0);
end;

procedure TFrmPrincipal.ImgRefreshClick(Sender: TObject);
begin
    ConsultarResultadoFinal;
end;

procedure TFrmPrincipal.ClickApagar(Sender: TObject);
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
        fancy.Show(TIconDialog.Error, '', 'Erro ao apagar avalia��es!', 'OK');
    end;
end;

procedure TFrmPrincipal.ClickExcluir(Sender: TObject);
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

procedure TFrmPrincipal.ClickLogout(Sender: TObject);
begin
  Close;
end;

procedure TFrmPrincipal.ClickSorteio(Sender: TObject);
var
  j, i, num: integer;
  Sorteado: array of integer;
  t: TThread;

  function JaSorteado(numero: integer): Boolean;
  var
    i: integer;
  begin
    Result:=False;
    for i := 0 to High(Sorteado) do
      if Sorteado[i] = numero then
      begin
        Result:= True;
        Break;
      end;
  end;
begin
  lvClube.Items.Clear;

  dm.qryConsCliente.Active := false;
  dm.qryConsCliente.SQL.Clear;
  dm.qryConsCliente.SQL.Add('SELECT * FROM TAB_CLUBES');
  dm.qryConsCliente.Prepare;
  dm.qryConsCliente.Active := true;

  if dm.qryConsCliente.RecordCount > 0 then
  begin
    i:= dm.qryConsCliente.RecordCount;
    dm.qryConsCliente.First;
    Randomize;
    while not dm.qryConsCliente.eof do
    begin
      repeat
        num:= Random(i)+1;
      until not JaSorteado(num);
      SetLength(Sorteado,Length(Sorteado)+1);
      Sorteado[High(Sorteado)]:= num;

      dm.qryGeral.Close;
      dm.qryGeral.SQL.Clear;
      dm.qryGeral.SQL.Add('UPDATE TAB_CLUBES SET SEQUENCIA=:SEQUENCIA');
      dm.qryGeral.SQL.Add('WHERE COD_CLUBE=:COD_CLUBE');
      dm.qryGeral.ParamByName('COD_CLUBE').Value := dm.qryConsCliente.FieldByName('COD_CLUBE').AsString;
      dm.qryGeral.ParamByName('SEQUENCIA').Value := num;
      dm.qryGeral.ExecSQL;

      dm.qryConsCliente.next;
    end;
  end;

  AniIndicator1.Enabled := true;
  lvClube.BeginUpdate;

  t := TThread.CreateAnonymousThread(
  procedure
  begin
    dm.qryConsOS.Active := false;
    dm.qryConsOS.SQL.Clear;
    dm.qryConsOS.SQL.Add('SELECT * FROM TAB_CLUBES');
    dm.qryConsOS.SQL.Add('ORDER BY SEQUENCIA, NOME');
    dm.qryConsOS.Active := true;
    dm.qryConsOS.First;
    sleep(3000);

    dm.qryConsOS.First;
    while not dm.qryConsOS.Eof do
    begin
      sleep(2000);

      TThread.Synchronize(nil, procedure
      begin
        AddClube(dm.qryConsOS.FieldByName('COD_CLUBE').AsString,
              dm.qryConsOS.FieldByName('NOME').AsString,
              IntToStr(dm.qryConsOS.FieldByName('SEQUENCIA').AsInteger),
              dm.qryConsOS.FieldByName('DIRETOR').AsString,
              dm.qryConsOS.FieldByName('PONTOS').AsString);
      end);
      dm.qryConsOS.Next;
    end;
  end);

  t.OnTerminate := ThreadFim;
  t.Start;
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

procedure TFrmPrincipal.RtgAddAvaliadorClick(Sender: TObject);
begin
  lytAddAvaliadores.Visible:=False;
end;

procedure TFrmPrincipal.RtgCadClubesClick(Sender: TObject);
begin
    lytCadClube.Visible:=False;
end;

procedure TFrmPrincipal.RtgResultadoAddClick(Sender: TObject);
var
  Pontos1, Pontos2, Total_Pontos: double;
  Avaliador: String;
begin
    Total_Pontos:= 0;
    Pontos1:= 0;
    Pontos2:= 0;
    Avaliador:= '';

    edtResultadoPontos.Text:= StringReplace(edtResultadoPontos.Text, '.', ',', []);

    if EdtResultadoAvaliador.Text = '' then
    begin
      fancy.Show(TIconDialog.Info, '', 'Digite o nome do avaliador!', 'OK');
      Exit;
    end;

    if EdtResultadoPontos.Text = '' then
    begin
      fancy.Show(TIconDialog.Info, '', 'Digite os pontos!', 'OK');
      Exit;
    end;

    dm.qryGeral.Active := false;
    dm.qryGeral.SQL.Clear;
    dm.qryGeral.SQL.Add('SELECT TOTAL FROM TAB_CLUBES WHERE COD_CLUBE=:COD_CLUBE');
    dm.qryGeral.ParamByName('COD_CLUBE').Value := lytAddAvaliadores.TagString;
    dm.qryGeral.Active := True;
    if dm.qryGeral.RecordCount > 0 then
      Pontos1:= dm.qryGeral.FieldByName('TOTAL').Value;

    Pontos2:= StrToFloat(edtResultadoPontos.Text);
    Total_Pontos:=Pontos1 + Pontos2;

    dm.qryGeral.Active := false;
    dm.qryGeral.SQL.Clear;
    dm.qryGeral.SQL.Add('UPDATE TAB_CLUBES SET TOTAL=:TOTAL');
    dm.qryGeral.SQL.Add('WHERE COD_CLUBE=:COD_CLUBE');
    dm.qryGeral.ParamByName('TOTAL').Value := Total_Pontos;
    dm.qryGeral.ParamByName('COD_CLUBE').Value := lytAddAvaliadores.TagString;
    dm.qryGeral.ExecSQL;

    //Resultado parcial
    dm.qryGeral.Active := false;
    dm.qryGeral.SQL.Clear;
    dm.qryGeral.SQL.Add('INSERT INTO TAB_RESULTADO (COD_RESULTADO, COD_CLUBE, AVALIADOR, PONTOS)');
    dm.qryGeral.SQL.Add('VALUES (:COD_RESULTADO, :COD_CLUBE, :AVALIADOR, :PONTOS)');
    dm.qryGeral.ParamByName('COD_RESULTADO').Value := GeraCodResultado;
    dm.qryGeral.ParamByName('COD_CLUBE').Value := lytAddAvaliadores.TagString;
    dm.qryGeral.ParamByName('AVALIADOR').Value := edtResultadoAvaliador.Text;
    dm.qryGeral.ParamByName('PONTOS').Value := FloatToStr(Pontos2);
    dm.qryGeral.ExecSQL;

    ConsultarResultado;
    lytAddAvaliadores.Visible:=False;
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
            SQL.Add('INSERT INTO TAB_CLUBES(COD_CLUBE, NOME, SEQUENCIA, DIRETOR, PONTOS)');
            SQL.Add('VALUES(:COD_CLUBE, :NOME, :SEQUENCIA, :DIRETOR, :PONTOS)');

            CodClube := GeraCodClube;
        end
        else
        begin
            SQL.Add('UPDATE TAB_CLUBES SET COD_CLUBE=:COD_CLUBE, NOME=:NOME, DIRETOR=:DIRETOR, PONTOS=:PONTOS');
        end;

        ParamByName('COD_CLUBE').Value := CodClube;
        ParamByName('NOME').Value := EdtNome.Text;
        if EdtOrdem.Text<>'' then
          ParamByName('SEQUENCIA').Value := StrToInt(EdtOrdem.Text)
        else
          ParamByName('SEQUENCIA').Value := 0;
        ParamByName('DIRETOR').Value := EdtInstrutor.Text;
        ParamByName('PONTOS').Value := '0,0';

        ExecSQL;
    end;

    ConsultarClube;
    lytCadClube.Visible:=False;
end;

procedure TFrmPrincipal.ThreadFim(Sender: TObject);
begin
    AniIndicator1.Enabled := false;
    lvClube.EndUpdate;

    if Assigned(TThread(Sender).FatalException) then
        showmessage(Exception(TThread(Sender).FatalException).Message);
end;

function TFrmPrincipal.ValidaClubesPonto: Boolean;
begin
    Result:=True;

    dm.qryConsOS.Active := false;
    dm.qryConsOS.SQL.Clear;
    dm.qryConsOS.SQL.Add('SELECT COD_CLUBE, NOME, TOTAL FROM TAB_CLUBES');
    dm.qryConsOS.SQL.Add('ORDER BY NOME');
    dm.qryConsOS.Active := true;

    while NOT dm.qryConsOS.Eof do
    begin
      if dm.qryConsOS.FieldByName('TOTAL').IsNull then
        Result:= False;

      dm.qryConsOS.Next;
    end;
end;

end.
