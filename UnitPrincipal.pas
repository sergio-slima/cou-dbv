unit UnitPrincipal;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Objects,
  FMX.TabControl, FMX.Controls.Presentation, FMX.StdCtrls, FMX.Edit,
  FMX.ListView.Types, FMX.ListView.Appearances, FMX.ListView.Adapters.Base,
  FMX.ListView, FMX.Layouts, FMX.BitmapHelper,

  {$IFDEF ANDROID}
  UnitPdfPrint,
  Androidapi.JNI.GraphicsContentViewText,
  Androidapi.JNI.JavaTypes,
  Androidapi.Helpers,
  Androidapi.JNI.Net,
  FMX.Surfaces,
  System.IOUtils,
  FMX.Helpers.Android,
  {$ENDIF}

  uFancyDialog, FMX.VirtualKeyboard, FMX.Platform, System.Permissions,
  System.Actions, FMX.ActnList, FMX.StdActns, FMX.MediaLibrary.Actions,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client, FMX.Advertising, FMX.Ani,

  System.JSON,
  System.JSON.Writers,
  System.JSON.Types,
  System.Net.HttpClient,
  System.Generics.Collections,
  Firebase.Auth,
  Firebase.Interfaces,
  Firebase.Request,
  Firebase.Database,
  Firebase.Response;

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
    ActShare: TShowShareSheetAction;
    ImgImprimir_Resultado: TImage;
    TabResultadoPosicao: TIntegerField;
    lblMenuCompartilhar: TLabel;
    AnimaCadClube: TFloatAnimation;
    AnimaMenuClube: TFloatAnimation;
    AnimaAddAvaliadores: TFloatAnimation;
    img_no_clube: TImage;
    Label9: TLabel;
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
    procedure ImgImprimir_ResultadoClick(Sender: TObject);
    procedure lblMenuCompartilharClick(Sender: TObject);
    procedure AnimaCadClubeFinish(Sender: TObject);
    procedure AnimaMenuClubeFinish(Sender: TObject);
    procedure rectMenuFecharClick(Sender: TObject);
    procedure AnimaAddAvaliadoresFinish(Sender: TObject);
    procedure Label9Click(Sender: TObject);
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
    procedure ClickSalvar(Sender: TObject);
    procedure ClickVoltar(Sender: TObject);
    procedure Imprimir;
    procedure AjustarTabRequisitos;
    procedure ThreadFim(Sender: TObject);
    function ValidaClubesPonto: Boolean;
    function CMToPixel(const Acentimeter: Double): Double;
    procedure EscondeMenuClube;
    procedure CadastrarClube;
    procedure SalvarClube(nome_clube, ordem_clube, instrutor_clube: String);

    procedure SalvarClubeFirebase;
    procedure ExcluirClubeFirebase(clube: String; tipo: integer);
    procedure BuscarClubeFirebase(clube: String);
    { Private declarations }
  public
    { Public declarations }
    CodClube: string;
    token_firebase: String;
    Cod_Server: String;
    Nome_Usuario: String;
    Item_Avaliar: String;
    Status_Clube: String;
    Tela_Imprimir: String;
    Status_App: String;
    Node_Clube: String;
    procedure EditarCampo(objeto: TObject;
                          tipo_campo, titulo, subtitulo, textprompt, ind_obrigatorio,
                          texto_padrao: string; tam_maximo: integer;
                          ProcCallBack : TExecutaClick = nil);
  end;

var
  FrmPrincipal: TFrmPrincipal;

const
  key_firebase = 'AIzaSyDxBw4DRgQExvdlyoeA9MwfPMrCaaTyDVI';
  domain_firebase = 'https://acoudbv-default-rtdb.firebaseio.com/';

implementation

{$R *.fmx}

uses UnitDM, UnitEditar, UnitFunctions, FMX.DialogService
{$IFDEF ANDROID}
, Androidapi.JNI.Os
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
                TDialogService.ShowMessage('Você não tem permissão para acessar a library');
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
<<<<<<< HEAD
    if Cod_Server = 'Local' then
      CadastrarClube
    else
    begin
      if Status_App = 'ON' then
        CadastrarClube
      else
        BuscarClubeFirebase(lytMenuClube.TagString);
    end;
=======
    EdtNome.Text:='';
    EdtInstrutor.Text:='';
    EdtOrdem.Text:='';
    Status_Clube:='N';

    // Posicionar Layout na parte de baixo da tela
    lytCadClube.Position.Y := FrmPrincipal.Height + 20;
    lytCadClube.Visible := True;

    // Animação do menu - deslizar para cima
    AnimaCadClube.Inverse := False;
    AnimaCadClube.StartValue := FrmPrincipal.Height +20;
    AnimaCadClube.StopValue := 0;
    AnimaCadClube.Start;

    // Animacao rotacao botao
    imgAdd.RotationAngle:= 0;
    imgAdd.AnimateFloat('RotationAngle', 180, 0.5, TAnimationType.InOut, TInterpolationType.Circular);
>>>>>>> ae48c0802971a8c55c6915d33c856339221b3751
end;

procedure TFrmPrincipal.ImgSalvarClick(Sender: TObject);
begin
    fancy.Show(TIconDialog.Question, 'Atenção', 'Deseja finalizar avaliação?', 'Sim', ClickSalvar, 'Não');

end;

procedure TFrmPrincipal.ImgSorteioClick(Sender: TObject);
begin
  if lvClube.Items.Count = 0 then
  begin
    fancy.Show(TIconDialog.Info, '', 'No momento nada para sortear!', 'OK');
    Exit;
  end;

  fancy.Show(TIconDialog.Question, 'Atenção', 'Deseja realizar o sorteio?', 'Sim', ClickSorteio, 'Não');
end;

procedure TFrmPrincipal.ImgVoltarClick(Sender: TObject);
begin
  if RtgFundoBasico.Visible or
     RtgFundoMovimento.Visible or
     RtgFundoAvancado.Visible or
     RtgFundoInstrutor.Visible then
  begin
      ConsultarClube;
      TabControl.GotoVisibleTab(1);
  end else
      fancy.Show(TIconDialog.Question, 'Ops!', 'Deseja sair da avaliação?', 'Sim', ClickVoltar, 'Não');
end;

procedure TFrmPrincipal.ImgVotarClick(Sender: TObject);
begin
  ConsultarClube;
  TabControl.GotoVisibleTab(1);
end;

procedure TFrmPrincipal.Imprimir;
//{$IFDEF ANDROID}
var
  relatorio: String;
  i: Integer;
//  lPdf: tPdfPrint;
//  linha: Integer;
//{$ENDIF}
begin
//{$IFDEF ANDROID}

  if Tela_Imprimir = 'AVALIACAO' then
  begin
    dm.qryConsOS.Active := false;
    dm.qryConsOS.SQL.Clear;
    dm.qryConsOS.SQL.Add('SELECT COD_CLUBE, NOME, TOTAL FROM TAB_CLUBES WHERE COD_CLUBE = :COD_CLUBE');
    dm.qryConsOS.SQL.Add('ORDER BY NOME');
    dm.qryConsOS.ParamByName('COD_CLUBE').Value := lytMenuClube.TagString;
    dm.qryConsOS.Active := true;
    if dm.qryConsOS.RecordCount > 0 then
    begin
        relatorio := '';
        relatorio :=             'CONCURSO DE ORDEM UNIDA' + sLineBreak;
        relatorio := relatorio + '(Resultado Detalhado Individual)' + sLineBreak;
        relatorio := relatorio + 'Avaliador: ' + Nome_Usuario + sLineBreak;
        relatorio := relatorio + 'Avaliação: ' + Item_Avaliar + sLineBreak;
        relatorio := relatorio + '--------------------------------------' + sLineBreak;

        relatorio := relatorio + 'Clube: ' + dm.qryConsOS.FieldByName('NOME').AsString + sLineBreak;
        relatorio := relatorio + 'Total: ' + FloatToStr(dm.qryConsOS.FieldByName('TOTAL').Value) + sLineBreak;

        dm.qryGeral.Active := false;
        dm.qryGeral.SQL.Clear;
        dm.qryGeral.SQL.Add('SELECT PTS_B1,PTS_B2,PTS_B3,PTS_B4,PTS_B5,PTS_B6,PTS_B7,PTS_B8,');
        dm.qryGeral.SQL.Add('PTS_M1,PTS_M2,PTS_M3,PTS_M4,PTS_M5,PTS_M6,PTS_M7,PTS_M8,PTS_M9,');
        DM.qryGeral.SQL.Add('PTS_A1,PTS_A2,PTS_A3,PTS_A4,PTS_A5,PTS_A6,PTS_A7,PTS_A8,PTS_A9,PTS_A10,');
        DM.qryGeral.SQL.Add('PTS_T1,PTS_T2,PTS_T3,PTS_T4 FROM TAB_PONTOS');
        dm.qryGeral.SQL.Add('WHERE COD_CLUBE = :COD_CLUBE');
        dm.qryGeral.ParamByName('COD_CLUBE').AsString:=dm.qryConsOS.FieldByName('COD_CLUBE').AsString;
        dm.qryGeral.Active := true;

        if (Item_Avaliar = 'Básico') or (Item_Avaliar = 'Todas') then
        begin
          relatorio := relatorio + sLineBreak;
          relatorio := relatorio + '## Básico ##' + sLineBreak;
          relatorio := relatorio + 'Descansar = ' + dm.qryGeral.FieldByName('PTS_B1').AsString;
          relatorio := relatorio + ' |  Sentido = ' + dm.qryGeral.FieldByName('PTS_B2').AsString + sLineBreak;
          relatorio := relatorio + 'Cobrir = ' + dm.qryGeral.FieldByName('PTS_B3').AsString;
          relatorio := relatorio + '       |  Firme = ' + dm.qryGeral.FieldByName('PTS_B4').AsString + sLineBreak;

          relatorio := relatorio + 'Oitava Dir = ' + dm.qryGeral.FieldByName('PTS_B6').AsString;
          relatorio := relatorio + '  |  Oitava Esq = ' + dm.qryGeral.FieldByName('PTS_B7').AsString + sLineBreak;
          relatorio := relatorio + 'Dir/Esq/MeiaVolta = ' + dm.qryGeral.FieldByName('PTS_B5').AsString + sLineBreak;
          relatorio := relatorio + 'Frente Ret/Dir/Esq = ' + dm.qryGeral.FieldByName('PTS_B8').AsString + sLineBreak;
        end;
        if (Item_Avaliar = 'Movimento') or (Item_Avaliar = 'Todas') then
        begin
          relatorio := relatorio + sLineBreak;
          relatorio := relatorio + '## Movimento ##' + sLineBreak;
          relatorio := relatorio + 'Ord. Marche = ' + dm.qryGeral.FieldByName('PTS_M1').AsString;
          relatorio := relatorio + '   | MarcarPasso = ' + dm.qryGeral.FieldByName('PTS_M2').AsString + sLineBreak;
          relatorio := relatorio + 'Direita Volver = ' + dm.qryGeral.FieldByName('PTS_M3').AsString;
          relatorio := relatorio + '  | EsquerdVolver= ' + dm.qryGeral.FieldByName('PTS_M4').AsString + sLineBreak;

          relatorio := relatorio + 'Dir/Esq/Meia = ' + dm.qryGeral.FieldByName('PTS_M9').AsString;
          relatorio := relatorio + ' | Alto = ' + dm.qryGeral.FieldByName('PTS_M7').AsString + sLineBreak;
          relatorio := relatorio + 'Olhar Dir/Esq = ' + dm.qryGeral.FieldByName('PTS_M6').AsString;
          relatorio := relatorio + ' | Convers.Centro= ' + dm.qryGeral.FieldByName('PTS_M8').AsString + sLineBreak;
          relatorio := relatorio + 'MeiaVoltaVolver = ' + dm.qryGeral.FieldByName('PTS_M5').AsString + sLineBreak;
        end;
        if (Item_Avaliar = 'Avançado') or (Item_Avaliar = 'Todas') then
        begin
          relatorio := relatorio + sLineBreak;
          relatorio := relatorio + '## Avançado ##' + sLineBreak;
          relatorio := relatorio + 'Alinhamento=' + dm.qryGeral.FieldByName('PTS_A1').AsString;
          relatorio := relatorio + ' | Cobertura = ' + dm.qryGeral.FieldByName('PTS_A2').AsString+ sLineBreak;
          relatorio := relatorio + 'Conjunto = ' + dm.qryGeral.FieldByName('PTS_A3').AsString;
          relatorio := relatorio + '     | EnergiaMovim. = ' + dm.qryGeral.FieldByName('PTS_A4').AsString + sLineBreak;
          relatorio := relatorio + 'DificEvolução=' + dm.qryGeral.FieldByName('PTS_A5').AsString;
          relatorio := relatorio + ' | Padronização = ' + dm.qryGeral.FieldByName('PTS_A6').AsString + sLineBreak;
          relatorio := relatorio + 'Posição = ' + dm.qryGeral.FieldByName('PTS_A7').AsString;
          relatorio := relatorio + '        | Postura = ' + dm.qryGeral.FieldByName('PTS_A8').AsString + sLineBreak;
          relatorio := relatorio + 'Garra = ' + dm.qryGeral.FieldByName('PTS_A9').AsString;
          relatorio := relatorio + '            | EvolucTema=' + dm.qryGeral.FieldByName('PTS_A10').AsString + sLineBreak;
        end;
        if (Item_Avaliar = 'Instrutor') or (Item_Avaliar = 'Todas') then
        begin
          relatorio := relatorio + sLineBreak;
          relatorio := relatorio + '## Instrutor ##' + sLineBreak;
          relatorio := relatorio + 'Altura Voz = '+dm.qryGeral.FieldByName('PTS_T1').AsString;
          relatorio := relatorio + '    | Voz Comanda = '+dm.qryGeral.FieldByName('PTS_T2').AsString + sLineBreak;
          relatorio := relatorio + 'PosturaInstr= '+dm.qryGeral.FieldByName('PTS_T3').AsString;
          relatorio := relatorio + '  | Tempo = '+dm.qryGeral.FieldByName('PTS_T4').AsString + sLineBreak;
        end;
        relatorio := relatorio + '--------------------------------------' + sLineBreak;
    end else
    begin
      fancy.Show(TIconDialog.Info, '', 'Clube sem pontuação. Avalie ou Exclua!', 'OK');
      Exit;
    end;

    ActShare.Bitmap := nil;
    ActShare.TextMessage := relatorio;
    ActShare.Execute;
  end
  else if Tela_Imprimir = 'RESULTADO' then
  begin
    if posicao_final = 0 then
    begin
      fancy.Show(TIconDialog.Info, '', 'Atualize a lista de classificação!', 'OK');
      Exit;
    end;

    relatorio := '';
    relatorio :=             'CONCURSO DE ORDEM UNIDA' + sLineBreak;
    relatorio := relatorio + '(Resultado Final)' + sLineBreak;
    relatorio := relatorio + '--------------------------------------' + sLineBreak;

    TabResultado.Open;
    TabResultado.First;
    while NOT TabResultado.Eof do
    begin
        relatorio := relatorio + IntToStr(TabResultadoPosicao.Value) + 'º Lugar' + sLineBreak;
        relatorio := relatorio + 'Clube: ' + TabResultadoNom_Clube.AsString + sLineBreak;
        relatorio := relatorio + 'Total: ' + FloatToStr(TabResultadoTotal.Value) + sLineBreak;
        relatorio := relatorio + '--------------------------------------' + sLineBreak;

        TabResultado.Next;
    end;

    ActShare.Bitmap := nil;
    ActShare.TextMessage := relatorio;
    ActShare.Execute;

  end
  else if Tela_Imprimir = 'RESUMO' then
  begin
    if not ValidaClubesPonto then
    begin
      fancy.Show(TIconDialog.Info, '', 'Existe clube sem pontuação.'+sLineBreak+'Avalie ou Exclua!', 'OK');
      Exit;
    end;

    relatorio := '';
    relatorio :=             'CONCURSO DE ORDEM UNIDA' + sLineBreak;
    relatorio := relatorio + '(Resultado Parcial)' + sLineBreak;
    relatorio := relatorio + 'Avaliador: ' + Nome_Usuario + sLineBreak;
    relatorio := relatorio + 'Avaliação: ' + Item_Avaliar + sLineBreak;
    relatorio := relatorio + '==============================' + sLineBreak;

    dm.qryConsOS.Active := false;
    dm.qryConsOS.SQL.Clear;
    dm.qryConsOS.SQL.Add('SELECT COD_CLUBE, NOME, TOTAL FROM TAB_CLUBES');
    dm.qryConsOS.SQL.Add('ORDER BY NOME');
    dm.qryConsOS.Active := true;

    while NOT dm.qryConsOS.Eof do
    begin
        relatorio := relatorio + 'Clube: ' + dm.qryConsOS.FieldByName('NOME').AsString + sLineBreak;
        relatorio := relatorio + 'Total: ' + FloatToStr(dm.qryConsOS.FieldByName('TOTAL').Value) + sLineBreak;
        relatorio := relatorio + '--------------------------------------' + sLineBreak;

        dm.qryGeral.Active := false;
        dm.qryGeral.SQL.Clear;
        dm.qryGeral.SQL.Add('SELECT PTS_B1,PTS_B2,PTS_B3,PTS_B4,PTS_B5,PTS_B6,PTS_B7,PTS_B8,');
        dm.qryGeral.SQL.Add('PTS_M1,PTS_M2,PTS_M3,PTS_M4,PTS_M5,PTS_M6,PTS_M7,PTS_M8,PTS_M9,');
        DM.qryGeral.SQL.Add('PTS_A1,PTS_A2,PTS_A3,PTS_A4,PTS_A5,PTS_A6,PTS_A7,PTS_A8,PTS_A9,PTS_A10,');
        DM.qryGeral.SQL.Add('PTS_T1,PTS_T2,PTS_T3,PTS_T4 FROM TAB_PONTOS');
        dm.qryGeral.SQL.Add('WHERE COD_CLUBE = :COD_CLUBE');
        dm.qryGeral.ParamByName('COD_CLUBE').AsString:=dm.qryConsOS.FieldByName('COD_CLUBE').AsString;
        dm.qryGeral.Active := true;

        if (Item_Avaliar = 'Básico') or (Item_Avaliar = 'Todas') then
            relatorio := relatorio + 'Total Básico: ' + FloatToStr(StrToFloat(dm.qryGeral.FieldByName('PTS_B1').Value) +
                                                     StrToFloat(dm.qryGeral.FieldByName('PTS_B2').Value) +
                                                     StrToFloat(dm.qryGeral.FieldByName('PTS_B3').Value) +
                                                     StrToFloat(dm.qryGeral.FieldByName('PTS_B4').Value) +
                                                     StrToFloat(dm.qryGeral.FieldByName('PTS_B5').Value) +
                                                     StrToFloat(dm.qryGeral.FieldByName('PTS_B6').Value) +
                                                     StrToFloat(dm.qryGeral.FieldByName('PTS_B7').Value) +
                                                     StrToFloat(dm.qryGeral.FieldByName('PTS_B8').Value)) + sLineBreak;
        if (Item_Avaliar = 'Movimento') or (Item_Avaliar = 'Todas') then
            relatorio := relatorio + 'Total Movimento: ' + FloatToStr(StrToFloat(dm.qryGeral.FieldByName('PTS_M1').Value) +
                                                        StrToFloat(dm.qryGeral.FieldByName('PTS_M2').Value) +
                                                        StrToFloat(dm.qryGeral.FieldByName('PTS_M3').Value) +
                                                        StrToFloat(dm.qryGeral.FieldByName('PTS_M4').Value) +
                                                        StrToFloat(dm.qryGeral.FieldByName('PTS_M5').Value) +
                                                        StrToFloat(dm.qryGeral.FieldByName('PTS_M6').Value) +
                                                        StrToFloat(dm.qryGeral.FieldByName('PTS_M7').Value) +
                                                        StrToFloat(dm.qryGeral.FieldByName('PTS_M8').Value) +
                                                        StrToFloat(dm.qryGeral.FieldByName('PTS_M9').Value)) + sLineBreak;
        if (Item_Avaliar = 'Avançado') or (Item_Avaliar = 'Todas') then
            relatorio := relatorio + 'Total Avançado: ' +  FloatToStr(StrToFloat(dm.qryGeral.FieldByName('PTS_A1').Value) +
                                                        StrToFloat(dm.qryGeral.FieldByName('PTS_A2').Value) +
                                                        StrToFloat(dm.qryGeral.FieldByName('PTS_A3').Value) +
                                                        StrToFloat(dm.qryGeral.FieldByName('PTS_A4').Value) +
                                                        StrToFloat(dm.qryGeral.FieldByName('PTS_A5').Value) +
                                                        StrToFloat(dm.qryGeral.FieldByName('PTS_A6').Value) +
                                                        StrToFloat(dm.qryGeral.FieldByName('PTS_A7').Value) +
                                                        StrToFloat(dm.qryGeral.FieldByName('PTS_A8').Value) +
                                                        StrToFloat(dm.qryGeral.FieldByName('PTS_A9').Value) +
                                                        StrToFloat(dm.qryGeral.FieldByName('PTS_A10').Value)) + sLineBreak;
        if (Item_Avaliar = 'Instrutor') or (Item_Avaliar = 'Todas') then
            relatorio := relatorio + 'Total Instrutor: ' + FloatToStr(StrToFloat(dm.qryGeral.FieldByName('PTS_T1').Value) +
                                                        StrToFloat(dm.qryGeral.FieldByName('PTS_T2').Value) +
                                                        StrToFloat(dm.qryGeral.FieldByName('PTS_T3').Value) +
                                                        StrToFloat(dm.qryGeral.FieldByName('PTS_T4').Value)) + sLineBreak;

        relatorio := relatorio + '==============================' + sLineBreak;

        dm.qryConsOS.Next;
    end;

    ActShare.Bitmap := nil;
    ActShare.TextMessage := relatorio;
    ActShare.Execute;
  end;
<<<<<<< HEAD
=======

//  if not ValidaClubesPonto then
//  begin
//    fancy.Show(TIconDialog.Info, '', 'Clube sem pontuação. Avalie ou Exclua!', 'OK');
//    Exit;
//  end;
//
//  linha:=20;
//  lPdf:= tPdfPrint.Create('OrdemUnida-'+Nome_Usuario);
//  try
//    lPdf.Abrir;
//    lPdf.FonteName:='Arial';
//    lPdf.ImpL( 5, 40, 'CONCURSO DE ORDEM UNIDA', Normal, $FF000000, 16);
//    lPdf.ImpL( 10, 50, '(Resultado Parcial)', Normal, $FF000000, 14);
//    lPdf.ImpL( 20, 1, 'Avaliador: '+Nome_Usuario, Normal, $FF000000, 14);
//    lPdf.ImpL( 20, 60, 'Avaliação: '+Item_Avaliar, Normal, $FF000000, 14);
//
////    ConsultarResultadoFinal;
//
//    dm.qryConsOS.Active := false;
//    dm.qryConsOS.SQL.Clear;
//    dm.qryConsOS.SQL.Add('SELECT COD_CLUBE, NOME, TOTAL FROM TAB_CLUBES');
//    dm.qryConsOS.SQL.Add('ORDER BY NOME');
//    dm.qryConsOS.Active := true;
//    while NOT dm.qryConsOS.Eof do
//    begin
//        linha:=linha+5;
//        lPdf.ImpLinhaH(linha, 1, 120, $FF000000);
//        linha:=linha+5;
//        lPdf.ImpL(linha, 1, 'Clube: ', Normal, $FF000000, 14);
//        lPdf.ImpL(linha, 15, dm.qryConsOS.FieldByName('NOME').AsString, Normal, $FF000000, 14);
//        lPdf.ImpL(linha, 70, 'Total: ', Normal, $FF000000, 14);
//        lPdf.ImpL(linha, 85, dm.qryConsOS.FieldByName('TOTAL').Value, Normal, $FF000000, 14);
//        linha:=linha+4;
//        lPdf.ImpLinhaH(linha, 1, 120, $FF000000);
//
//        dm.qryGeral.Active := false;
//        dm.qryGeral.SQL.Clear;
//        dm.qryGeral.SQL.Add('SELECT PTS_B1,PTS_B2,PTS_B3,PTS_B4,PTS_B5,PTS_B6,PTS_B7,PTS_B8,');
//        dm.qryGeral.SQL.Add('PTS_M1,PTS_M2,PTS_M3,PTS_M4,PTS_M5,PTS_M6,PTS_M7,PTS_M8,PTS_M9,');
//        DM.qryGeral.SQL.Add('PTS_A1,PTS_A2,PTS_A3,PTS_A4,PTS_A5,PTS_A6,PTS_A7,PTS_A8,PTS_A9,PTS_A10,');
//        DM.qryGeral.SQL.Add('PTS_T1,PTS_T2,PTS_T3,PTS_T4 FROM TAB_PONTOS');
//        dm.qryGeral.SQL.Add('WHERE COD_CLUBE = :COD_CLUBE');
//        dm.qryGeral.ParamByName('COD_CLUBE').AsString:=dm.qryConsOS.FieldByName('COD_CLUBE').AsString;
//        dm.qryGeral.Active := true;
//
//        if (Item_Avaliar = 'Básico') or (Item_Avaliar = 'Todas') then
//        begin
//          linha:=linha+4;
//          lPdf.ImpL(linha, 1, '# Básico #', Normal, $FF000000, 14);
//          linha:=linha+3;
//          lPdf.ImpL(linha, 1, 'Descansar     = '+dm.qryGeral.FieldByName('PTS_B1').AsString, Normal, $FF000000, 12);
//          lPdf.ImpL(linha, 40, 'Sentido       = '+dm.qryGeral.FieldByName('PTS_B2').AsString, Normal, $FF000000, 12);
//          lPdf.ImpL(linha, 80, 'Cobrir        = '+dm.qryGeral.FieldByName('PTS_B3').AsString, Normal, $FF000000, 12);
//          linha:=linha+3;
//          lPdf.ImpL(linha, 1, 'Firme         = '+dm.qryGeral.FieldByName('PTS_B4').AsString, Normal, $FF000000, 12);
//          lPdf.ImpL(linha, 40, 'Dir/Esq/MeiaVolta= '+dm.qryGeral.FieldByName('PTS_B5').AsString, Normal, $FF000000, 12);
//          lPdf.ImpL(linha, 80, 'Oitava Direita= '+dm.qryGeral.FieldByName('PTS_B6').AsString, Normal, $FF000000, 12);
//          linha:=linha+3;
//          lPdf.ImpL(linha, 1, 'Oitava Esquerd= '+dm.qryGeral.FieldByName('PTS_B7').AsString, Normal, $FF000000, 12);
//          lPdf.ImpL(linha, 40, 'Frente Ret/Dir/Esq= '+dm.qryGeral.FieldByName('PTS_B8').AsString, Normal, $FF000000, 12);
//        end;
//        if (Item_Avaliar = 'Movimento') or (Item_Avaliar = 'Todas') then
//        begin
//          linha:=linha+4;
//          lPdf.ImpL(linha, 1, '# Movimento #', Normal, $FF000000, 14);
//          linha:=linha+3;
//          lPdf.ImpL(linha, 1, 'Ord. Marche   = '+dm.qryGeral.FieldByName('PTS_M1').AsString, Normal, $FF000000, 12);
//          lPdf.ImpL(linha,40, 'Marcar Passo  = '+dm.qryGeral.FieldByName('PTS_M2').AsString, Normal, $FF000000, 12);
//          lPdf.ImpL(linha,80, 'Direita Volver= '+dm.qryGeral.FieldByName('PTS_M3').AsString, Normal, $FF000000, 12);
//          linha:=linha+3;
//          lPdf.ImpL(linha, 1, 'Esquerda Volver= '+dm.qryGeral.FieldByName('PTS_M4').AsString, Normal, $FF000000, 12);
//          lPdf.ImpL(linha,40, 'MeiaVolta Volver= '+dm.qryGeral.FieldByName('PTS_M5').AsString, Normal, $FF000000, 12);
//          lPdf.ImpL(linha,80, 'Olhar Dir/Esq = '+dm.qryGeral.FieldByName('PTS_M6').AsString, Normal, $FF000000, 12);
//          linha:=linha+3;
//          lPdf.ImpL(linha, 1, 'Alto          = '+dm.qryGeral.FieldByName('PTS_M7').AsString, Normal, $FF000000, 12);
//          lPdf.ImpL(linha,40, 'Convers.Centro= '+dm.qryGeral.FieldByName('PTS_M8').AsString, Normal, $FF000000, 12);
//          lPdf.ImpL(linha,80, 'Dir/Esq/Meia  = '+dm.qryGeral.FieldByName('PTS_M9').AsString, Normal, $FF000000, 12);
//        end;
//        if (Item_Avaliar = 'Avançado') or (Item_Avaliar = 'Todas') then
//        begin
//          linha:=linha+4;
//          lPdf.ImpL(linha, 1, '# Avançado #', Normal, $FF000000, 14);
//          linha:=linha+3;
//          lPdf.ImpL(linha, 1, 'Alinhamento   = '+dm.qryGeral.FieldByName('PTS_A1').AsString, Normal, $FF000000, 12);
//          lPdf.ImpL(linha,40, 'Cobertura     = '+dm.qryGeral.FieldByName('PTS_A2').AsString, Normal, $FF000000, 12);
//          lPdf.ImpL(linha,80, 'Conjunto      = '+dm.qryGeral.FieldByName('PTS_A3').AsString, Normal, $FF000000, 12);
//          linha:=linha+3;
//          lPdf.ImpL(linha, 1, 'Energia Movim.= '+dm.qryGeral.FieldByName('PTS_A4').AsString, Normal, $FF000000, 12);
//          lPdf.ImpL(linha,40, 'Dific Evolução= '+dm.qryGeral.FieldByName('PTS_A5').AsString, Normal, $FF000000, 12);
//          lPdf.ImpL(linha,80, 'Padronização  = '+dm.qryGeral.FieldByName('PTS_A6').AsString, Normal, $FF000000, 12);
//          linha:=linha+3;
//          lPdf.ImpL(linha, 1, 'Posição       = '+dm.qryGeral.FieldByName('PTS_A7').AsString, Normal, $FF000000, 12);
//          lPdf.ImpL(linha,40, 'Postura       = '+dm.qryGeral.FieldByName('PTS_A8').AsString, Normal, $FF000000, 12);
//          lPdf.ImpL(linha,80, 'Garra         = '+dm.qryGeral.FieldByName('PTS_A9').AsString, Normal, $FF000000, 12);
//          lPdf.ImpL(linha,110, 'Evolução Tema = '+dm.qryGeral.FieldByName('PTS_A10').AsString, Normal, $FF000000, 12);
//        end;
//        if (Item_Avaliar = 'Instrutor') or (Item_Avaliar = 'Todas') then
//        begin
//          linha:=linha+4;
//          lPdf.ImpL(linha, 1, '# Instrutor #', Normal, $FF000000, 14);
//          linha:=linha+3;
//          lPdf.ImpL(linha, 1, 'Altura Voz    = '+dm.qryGeral.FieldByName('PTS_T1').AsString, Normal, $FF000000, 12);
//          lPdf.ImpL(linha,40, 'Voz Comanda   = '+dm.qryGeral.FieldByName('PTS_T2').AsString, Normal, $FF000000, 12);
//          lPdf.ImpL(linha,80, 'Postura Instr = '+dm.qryGeral.FieldByName('PTS_T3').AsString, Normal, $FF000000, 12);
//          lPdf.ImpL(linha,120, 'Tempo = '+dm.qryGeral.FieldByName('PTS_T4').AsString, Normal, $FF000000, 12);
//        end;
//        linha:=linha+3;
//
//        dm.qryConsOS.Next;
//    end;
//
//    //lPdf.NovaPagina;
//
//    lPdf.Fechar;
//
////    lPdf.VisualizarPDF;
//    lPdf.CompartilharPDF;
//  finally
//    lPdf.Free;
//  end;
//{$ENDIF}
>>>>>>> ae48c0802971a8c55c6915d33c856339221b3751
end;

procedure TFrmPrincipal.Label9Click(Sender: TObject);
begin
  EdtResultadoAvaliador.Text:='';
end;

procedure TFrmPrincipal.lblMenuFecharClick(Sender: TObject);
begin
  EscondeMenuClube;

//    lytMenuClube.Visible := false;
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
    fancy.Show(TIconDialog.Question, 'Atenção', 'Deseja apagar todas as avaliações?', 'Sim', ClickApagar, 'Não');

end;

procedure TFrmPrincipal.lblMenuAvaliarClick(Sender: TObject);
begin
    EscondeMenuClube;

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
    TabControlRequisitos.GotoVisibleTab(0);
    TabControl.GotoVisibleTab(2);
    ImgSalvar.Visible:=True;
    RtgFundoBasico.Visible:=False;
    RtgFundoMovimento.Visible:=False;
    RtgFundoAvancado.Visible:=False;
    RtgFundoInstrutor.Visible:=False;

end;

procedure TFrmPrincipal.lblMenuCompartilharClick(Sender: TObject);
begin
  EscondeMenuClube;

  tela_imprimir := 'AVALIACAO';

  {$IFDEF ANDROID}
    PermissionsService.RequestPermissions([PermissaoReadStorage,
                                           PermissaoWriteStorage],
                                           LibraryPermissionRequestResult,
                                           DisplayMessageLibrary
                                           );
  {$ENDIF}

end;

procedure TFrmPrincipal.lblMenuExcluirClick(Sender: TObject);
begin
  fancy.Show(TIconDialog.Question, 'Atenção', 'Deseja excluir o clube?', 'Sim', ClickExcluir, 'Não');

end;

procedure TFrmPrincipal.lblMenuAlterarClick(Sender: TObject);
begin
    EscondeMenuClube;

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
    LblA10.Text:= dm.qryGeral.FieldByName('PTS_A10').Value;
    LblT1.Text:= dm.qryGeral.FieldByName('PTS_T1').Value;
    LblT2.Text:= dm.qryGeral.FieldByName('PTS_T2').Value;
    LblT3.Text:= dm.qryGeral.FieldByName('PTS_T3').Value;
    LblT4.Text:= dm.qryGeral.FieldByName('PTS_T4').Value;

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

            // Posicionar Layout na parte de baixo da tela
            lytMenuClube.Position.Y := FrmPrincipal.Height + 20;
            lytMenuClube.Visible := true;

            // Animação do menu - deslizar para cima
            AnimaMenuClube.Inverse := False;
            AnimaMenuClube.StartValue := FrmPrincipal.Height +20;
            AnimaMenuClube.StopValue := 0;
            AnimaMenuClube.Start;

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
            posicao_final:= 0;

            // Posicionar Layout na parte de baixo da tela
            lytAddAvaliadores.Position.Y := FrmPrincipal.Height + 20;
            lytAddAvaliadores.Visible := true;

            // Animação do menu - deslizar para cima
            AnimaAddAvaliadores.Inverse := False;
            AnimaAddAvaliadores.StartValue := FrmPrincipal.Height +20;
            AnimaAddAvaliadores.StopValue := 0;
            AnimaAddAvaliadores.Start;

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
        TListItemText(Objects.FindDrawable('txtRegiao')).Text := Regiao+'º apresentar';
        TListItemText(Objects.FindDrawable('txtDiretor')).Text := 'Instrutor: '+Diretor;
        TListItemText(Objects.FindDrawable('txtPontos')).Text := Pontos;
        TListItemImage(Objects.FindDrawable('ImageMenu')).Bitmap := imgOpcao.Bitmap
    end;
end;

procedure TFrmPrincipal.CadastrarClube;
begin
  EdtNome.Text:='';
  EdtInstrutor.Text:='';
  EdtOrdem.Text:='';
  Status_Clube:='N';

  // Posicionar Layout na parte de baixo da tela
  lytCadClube.Position.Y := FrmPrincipal.Height + 20;
  lytCadClube.Visible := True;

  // Anima��o do menu - deslizar para cima
  AnimaCadClube.Inverse := False;
  AnimaCadClube.StartValue := FrmPrincipal.Height +20;
  AnimaCadClube.StopValue := 0;
  AnimaCadClube.Start;

  // Animacao rotacao botao
  imgAdd.RotationAngle:= 0;
  imgAdd.AnimateFloat('RotationAngle', 180, 0.5, TAnimationType.InOut, TInterpolationType.Circular);
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
        TListItemText(Objects.FindDrawable('txtPosicao')).Text := IntToStr(posicao_final)+'º';
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

    TabResultado.Append;
    TabResultadoPosicao.AsInteger := posicao_final;
    TabResultadoCod_Clube.AsString := codClube;
    TabResultadoNom_Clube.AsString := Nome;
    TabResultadoTotal.Value := StrToFloat(Pontos);
    TabResultado.Post;
end;

procedure TFrmPrincipal.AjustarTabRequisitos;
begin
  if Item_Avaliar = 'Básico' then
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
  end else if Item_Avaliar = 'Avançado' then
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

procedure TFrmPrincipal.AnimaAddAvaliadoresFinish(Sender: TObject);
begin
  if AnimaAddAvaliadores.Inverse = True then
      lytAddAvaliadores.Visible:= False;
end;

procedure TFrmPrincipal.AnimaCadClubeFinish(Sender: TObject);
begin
  if AnimaCadClube.Inverse = True then
    lytCadClube.Visible:= False;
end;

procedure TFrmPrincipal.AnimaMenuClubeFinish(Sender: TObject);
begin
  if AnimaMenuClube.Inverse = True then
    lytMenuClube.Visible:= False;
end;

procedure TFrmPrincipal.BuscarClubeFirebase(clube: String);
var
  Auth: IFirebaseAuth;
  ADatabase: TFirebaseDatabase;
  AResponse: IFirebaseResponse;
  AParams: TDictionary<string, string>;
  Obj: TJSONObject;
  JSONResp: TJSONValue;
  JsonClube: TJSONObject;
  json: String;
  sEmail, sSenha: String;
  sClube, sOrdem: String;
  x: Integer;
begin
  with DM.qryConsCliente do
  begin
    Close;
    SQL.Clear;
    SQL.Add('SELECT * FROM TAB_USUARIO');
    Open;
    if RowsAffected > 0 then
    begin
      sEmail:= FieldByName('EMAIL').AsString;
      sSenha:= FieldByName('SENHA').AsString;
    end;
  end;

  //Gerar Token de Autentica��o
  Auth := TFirebaseAuth.Create;
  Auth.SetApiKey(key_firebase);
  AResponse := Auth.SignInWithEmailAndPassword(sEmail, sSenha);
  JSONResp := TJSONObject.ParseJSONValue(AResponse.ContentAsString);
  if (not Assigned(JSONResp)) or (not(JSONResp is TJSONObject)) then
  begin
    if Assigned(JSONResp) then
    begin
      JSONResp.Free;
    end;
    Exit;
  end;
  Obj := JSONResp as TJSONObject;
  Obj.Values['idToken'].Value;
  token_firebase := Obj.Values['idToken'].Value;
  ///////////////////////////////
  /// Buscar Dados
  ADatabase := TFirebaseDatabase.Create;
  ADatabase.SetBaseURI(domain_firebase);
  ADatabase.SetToken(token_firebase);
  AParams := TDictionary<string, string>.Create;
  try
    //AParams.Add('orderBy', '"$key"');
    //AParams.Add('orderBy', '"cod"');
    //AParams.Add('limitToLast', '2');
    //AParams.Add('equalTo', '2');
    //AParams.Add('startAt', '"2"');
    //AParams.Add('endAt', '"4"');
    AResponse := ADatabase.Get([Node_Clube +'/'+ clube + '.json'], AParams);
    JSONResp := TJSONObject.ParseJSONValue(AResponse.ContentAsString);

    json:=AResponse.ContentAsString;
    JsonClube := TJSONObject.ParseJSONValue(TEncoding.UTF8.GetBytes(json),0) as TJSONObject;
    for x := 0 to JsonClube.Size - 1 do
    begin
      ShowMessage(JsonClube.Get(x).ToString);
    end;
    JsonClube.DisposeOf;
    //SalvarClube();

    if (not Assigned(JSONResp)) or (not(JSONResp is TJSONObject)) then
    begin
      if Assigned(JSONResp) then
      begin
        JSONResp.Free;
      end;
      Exit;
    end;
  finally
    AParams.Free;
    ADatabase.Free;
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

    img_no_clube.Visible := lvClube.Items.Count = 0;
end;

procedure TFrmPrincipal.ConsultarResultado;
begin
    lvResultado.Items.Clear;

    dm.qryConsOS.Active := false;
    dm.qryConsOS.SQL.Clear;
    dm.qryConsOS.SQL.Add('SELECT COD_CLUBE, NOME, TOTAL FROM TAB_CLUBES');
    dm.qryConsOS.SQL.Add('ORDER BY SEQUENCIA, NOME');
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
    TabResultado.EmptyDataSet;
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

procedure TFrmPrincipal.EscondeMenuClube;
begin
  // Esconde menu
  AnimaMenuClube.Inverse := True;
  AnimaMenuClube.Start;
end;

procedure TFrmPrincipal.ExcluirClubeFirebase(clube: String; tipo: integer);
var
  Auth: IFirebaseAuth;
  AResponse: IFirebaseResponse;
  JSONReq: TJSONObject;
  JSONResp: TJSONValue;
  Obj: TJSONObject;
  ADatabase: TFirebaseDatabase;
  Writer: TJsonTextWriter;
  StringWriter: TStringWriter;
  sEmail, sSenha: String;
begin
  with DM.qryConsCliente do
  begin
    Close;
    SQL.Clear;
    SQL.Add('SELECT * FROM TAB_USUARIO');
    Open;
    if RowsAffected > 0 then
    begin
      sEmail:= FieldByName('EMAIL').AsString;
      sSenha:= FieldByName('SENHA').AsString;
    end;
  end;

  //Gerar Token de Autenticação
  Auth := TFirebaseAuth.Create;
  Auth.SetApiKey(key_firebase);
  AResponse := Auth.SignInWithEmailAndPassword(sEmail, sSenha);
  JSONResp := TJSONObject.ParseJSONValue(AResponse.ContentAsString);
  if (not Assigned(JSONResp)) or (not(JSONResp is TJSONObject)) then
  begin
    if Assigned(JSONResp) then
    begin
      JSONResp.Free;
    end;
    Exit;
  end;
  Obj := JSONResp as TJSONObject;
  Obj.Values['idToken'].Value;
  token_firebase := Obj.Values['idToken'].Value;

  ////////
  //Enviar Dados para Firebase
  StringWriter := TStringWriter.Create();
  Writer := TJsonTextWriter.Create(StringWriter);
  Writer.Formatting := TJsonFormatting.None;

  JSONReq := TJSONObject.ParseJSONValue(StringWriter.ToString) as TJSONObject;

  ADatabase := TFirebaseDatabase.Create;
  ADatabase.SetBaseURI(domain_firebase);
  ADatabase.SetToken(token_firebase);
  try
    if tipo = 1 then
      AResponse := ADatabase.Delete([Node_Clube +'/'+ clube + '.json'])
    else
      AResponse := ADatabase.Delete([Node_Clube + '.json']);

    JSONResp := TJSONObject.ParseJSONValue(AResponse.ContentAsString);
    if (not Assigned(JSONResp)) or (not(JSONResp is TJSONObject)) then
    begin
      if Assigned(JSONResp) then
      begin
        JSONResp.Free;
      end;
      Exit;
    end;
  finally
    ADatabase.Free;
  end;
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

  //BannerAd1.AdUnitID := 'ca-app-pub-5318830765545492/1140840672'; // 'ca-app-pub-5318830765545492/11408406';

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
        fancy.Show(TIconDialog.Question, 'Logout', 'Deseja sair?', 'Sim', ClickLogout, 'Não');
      end;
    end;
  end;
{$ENDIF}
end;

procedure TFrmPrincipal.FormShow(Sender: TObject);
begin
    if Cod_Server = 'Local' then
      LblNomeAvaliador.Text:= 'Avaliador: '+Nome_Usuario+ ' | '+'User: '+Cod_Server
    else
    begin
      if Status_App = 'ON' then
        LblNomeAvaliador.Text:= 'Avaliador: '+Nome_Usuario+ ' | '+'Master: '+Cod_Server
      else
        LblNomeAvaliador.Text:= 'Avaliador: '+Nome_Usuario+ ' | '+'User: '+Cod_Server;
    end;

    TabControl.GotoVisibleTab(1);
    AjustarTabRequisitos;
    ConsultarClube;
    Node_Clube:= '/clubes/'+Cod_Server;

    {$IFDEF ANDROID}
    //BannerAd1.LoadAd;
    {$ENDIF}
end;

procedure TFrmPrincipal.ImgCompartilharClick(Sender: TObject);
begin
    if lvClube.Items.Count = 0 then
    begin
      fancy.Show(TIconDialog.Info, '', 'Não há dados para compartilhar!', 'OK');
      Exit;
    end;

    if not ValidaClubesPonto then
    begin
      fancy.Show(TIconDialog.Info, '', 'Existe clube sem pontuação.'+sLineBreak+'Avalie ou Exclua!', 'OK');
      Exit;
    end;

  tela_imprimir := 'RESUMO';

  {$IFDEF ANDROID}
    PermissionsService.RequestPermissions([PermissaoReadStorage,
                                           PermissaoWriteStorage],
                                           LibraryPermissionRequestResult,
                                           DisplayMessageLibrary
                                           );
  {$ENDIF}

  //lytShared.Visible:=True;

end;

procedure TFrmPrincipal.ImgImprimir_ResultadoClick(Sender: TObject);
begin
  tela_imprimir := 'RESULTADO';

  {$IFDEF ANDROID}
    PermissionsService.RequestPermissions([PermissaoReadStorage,
                                           PermissaoWriteStorage],
                                           LibraryPermissionRequestResult,
                                           DisplayMessageLibrary
                                           );
  {$ENDIF}
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
      fancy.Show(TIconDialog.Info, '', 'Existe clube sem pontuação.'+sLineBreak+'Avalie ou Exclua!', 'OK');
      Exit;
    end;

    posicao_final := 0;
    ConsultarResultado;

    TabControl.GotoVisibleTab(0);
end;

procedure TFrmPrincipal.ImgRefreshClick(Sender: TObject);
begin
    ConsultarResultadoFinal;
end;

procedure TFrmPrincipal.ClickApagar(Sender: TObject);
begin
    EscondeMenuClube;

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

        ConsultarClube;

        ExcluirClubeFirebase('',2);

    except on ex:exception do
        fancy.Show(TIconDialog.Error, '', 'Erro ao apagar avaliações!', 'OK');
    end;
end;

procedure TFrmPrincipal.ClickExcluir(Sender: TObject);
begin
    EscondeMenuClube;

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

        ConsultarClube;

        ExcluirClubeFirebase(lytMenuClube.TagString, 1);
    except on ex:exception do
        fancy.Show(TIconDialog.Error, '', 'Erro ao excluir clube!', 'OK');
    end;
end;

procedure TFrmPrincipal.ClickLogout(Sender: TObject);
begin
  Close;
end;

procedure TFrmPrincipal.ClickSalvar(Sender: TObject);
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
        fancy.Show(TIconDialog.Error, '', 'Erro ao gravar avaliação!', 'OK');
    end;
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

  SalvarClubeFirebase;
end;

procedure TFrmPrincipal.ClickVoltar(Sender: TObject);
begin
      ConsultarClube;
      TabControl.GotoVisibleTab(1);
end;

function TFrmPrincipal.CMToPixel(const Acentimeter: Double): Double;
var
  iPPI: Double;
begin
  iPPI:= TDeviceDisplayMetrics.Default.PixelsPerInch / 2.54;
  Result:= Round(iPPI * ACentimeter);
end;

procedure TFrmPrincipal.rectMenuFecharClick(Sender: TObject);
begin
  EscondeMenuClube;
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
    AnimaAddAvaliadores.Inverse := True;
    AnimaAddAvaliadores.Start;
end;

procedure TFrmPrincipal.RtgCadClubesClick(Sender: TObject);
begin
  // Esconde menu
  AnimaCadClube.Inverse := True;
  AnimaCadClube.Start;

  // Anima botao rotacao
  imgAdd.RotationAngle:= 180;
  imgAdd.AnimateFloat('RotationAngle', 0, 0.5, TAnimationType.InOut, TInterpolationType.Circular);

//    lytCadClube.Visible:=False;
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

    AnimaAddAvaliadores.Inverse := True;
    AnimaAddAvaliadores.Start;
end;

procedure TFrmPrincipal.RtgSalvarClubeClick(Sender: TObject);
begin
    if EdtNome.Text = '' then
    begin
      fancy.Show(TIconDialog.Info, '', 'Digite o nome do clube!', 'OK');
      Exit;
    end;

    SalvarClube(EdtNome.Text, EdtOrdem.Text, EdtInstrutor.Text);

    AnimaCadClube.Inverse := True;
    AnimaCadClube.Start;

    // Anima botao rotacao
    imgAdd.RotationAngle:= 180;
    imgAdd.AnimateFloat('RotationAngle', 0, 0.5, TAnimationType.InOut, TInterpolationType.Circular);

    ConsultarClube;

    SalvarClubeFirebase;
//    lytCadClube.Visible:=False;
end;

procedure TFrmPrincipal.SalvarClube(nome_clube, ordem_clube, instrutor_clube: String);
var
  sCod: Integer;
  sNom: String;
begin
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
    ParamByName('NOME').Value := nome_clube;
    sNom:=nome_clube;
    if ordem_clube<>'' then
      sCod := StrToInt(ordem_clube)
    else
      sCod := 0;
    ParamByName('SEQUENCIA').Value := sCod;
    ParamByName('DIRETOR').Value := instrutor_clube;
    ParamByName('PONTOS').Value := '0,0';

    ExecSQL;
  end;
end;

procedure TFrmPrincipal.SalvarClubeFirebase;
var
  Auth: IFirebaseAuth;
  AResponse: IFirebaseResponse;
  JSONReq: TJSONObject;
  JSONResp: TJSONValue;
  Obj: TJSONObject;
  ADatabase: TFirebaseDatabase;
  Writer: TJsonTextWriter;
  StringWriter: TStringWriter;
  sEmail, sSenha: String;
begin
  with DM.qryConsCliente do
  begin
    Close;
    SQL.Clear;
    SQL.Add('SELECT * FROM TAB_USUARIO');
    Open;
    if RowsAffected > 0 then
    begin
      sEmail:= FieldByName('EMAIL').AsString;
      sSenha:= FieldByName('SENHA').AsString;
    end;
  end;

  //Gerar Token de Autenticação
  Auth := TFirebaseAuth.Create;
  Auth.SetApiKey(key_firebase);
  AResponse := Auth.SignInWithEmailAndPassword(sEmail, sSenha);
  JSONResp := TJSONObject.ParseJSONValue(AResponse.ContentAsString);
  if (not Assigned(JSONResp)) or (not(JSONResp is TJSONObject)) then
  begin
    if Assigned(JSONResp) then
    begin
      JSONResp.Free;
    end;
    Exit;
  end;
  Obj := JSONResp as TJSONObject;
  Obj.Values['idToken'].Value;
  token_firebase := Obj.Values['idToken'].Value;

  ////////
  //Enviar Dados para Firebase
  with DM.qryConsCliente do
  begin
    Close;
    SQL.Clear;
    SQL.Add('SELECT * FROM TAB_CLUBES');
    Open;
    if RowsAffected > 0 then
    begin
      First;
      while not Eof do
      begin
        StringWriter := TStringWriter.Create();
        Writer := TJsonTextWriter.Create(StringWriter);
        Writer.Formatting := TJsonFormatting.None;

        Writer.WriteStartObject;
        Writer.WritePropertyName(FieldByName('COD_CLUBE').AsString);

        Writer.WriteStartObject;
        Writer.WritePropertyName('cod');
        Writer.WriteValue(FieldByName('SEQUENCIA').AsString); //'1'
        Writer.WritePropertyName('clube');
        Writer.WriteValue(FieldByName('NOME').AsString); //'Herois da Fé'
        Writer.WriteEndObject;

        Writer.WriteEndObject;

        JSONReq := TJSONObject.ParseJSONValue(StringWriter.ToString) as TJSONObject;

        ADatabase := TFirebaseDatabase.Create;
        ADatabase.SetBaseURI(domain_firebase);
        ADatabase.SetToken(token_firebase);
        try
          //AResponse := ADatabase.Post([Node_Clube + '.json'], JSONReq);
          //AResponse := ADatabase.Put([Node_Clube + '.json'], JSONReq);
          AResponse := ADatabase.Patch([Node_Clube + '.json'], JSONReq);
          //AResponse := ADatabase.Delete([Node_Clube + '.json']);

          JSONResp := TJSONObject.ParseJSONValue(AResponse.ContentAsString);
          if (not Assigned(JSONResp)) or (not(JSONResp is TJSONObject)) then
          begin
            if Assigned(JSONResp) then
            begin
              JSONResp.Free;
            end;
            Exit;
          end;
        finally
          ADatabase.Free;
        end;

        Next;
      end;
    end;
  end;
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

//procedure TForm1.Button1Click(Sender: TObject);
//var
//  json: string;
//  Obj: TJsonObject;
//  obj1: TJsonObject;
//  i: integer;
//begin
//  json := '{"001":{"nome":"fulano1", "sexo":"M"},"002":{"nome":"fulano2", "sexo":"F"},"003":{"nome":"fulano3", "sexo":"M"}}';
//
//  Obj := TJsonObject.Parse(json) as TJsonObject;
//  try
//    for i := 0 to obj.count -1 do
//    begin
//      obj1 := Obj.Items[i].ObjectValue;
//
//      showmessage(obj.Names[i] + ' ' +obj1.s['nome']);
//    end;
//  finally
//    Obj.Free;
//  end;
//en

end.
