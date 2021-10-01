unit UnitPrincipal;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Objects,
  FMX.TabControl, FMX.Controls.Presentation, FMX.StdCtrls, FMX.Edit,
  FMX.ListView.Types, FMX.ListView.Appearances, FMX.ListView.Adapters.Base,
  FMX.ListView, FMX.Layouts;

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
    lvCliente: TListView;
    lvOS: TListView;
    imgData: TImage;
    imgHora: TImage;
    imgOpcao: TImage;
    imgAberta: TImage;
    imgFechada: TImage;
    lytMenuOS: TLayout;
    rectFundoMenu: TRectangle;
    rectMenuFechar: TRectangle;
    lblMenuFechar: TLabel;
    rectMenu: TRectangle;
    lblMenuEncerrar: TLabel;
    lblMenuExcluir: TLabel;
    lblMenuAssinatura: TLabel;
    lblMenuReabrir: TLabel;
    Label4: TLabel;
    imgAdd: TImage;
    Image1: TImage;
    Image2: TImage;
    Rectangle3: TRectangle;
    LblNome_Clube_Pontos: TLabel;
    ImgSalvar: TImage;
    lytCadClube: TLayout;
    RtgCadClubes: TRectangle;
    Rectangle5: TRectangle;
    Label2: TLabel;
    Rectangle6: TRectangle;
    Rectangle7: TRectangle;
    edtBuscaCliente: TEdit;
    Rectangle4: TRectangle;
    Edit1: TEdit;
    Rectangle8: TRectangle;
    Edit2: TEdit;
    procedure imgAbaOSClick(Sender: TObject);
    procedure rectBuscaOSClick(Sender: TObject);
    procedure rectBuscaClienteClick(Sender: TObject);
    procedure lvOSItemClickEx(const Sender: TObject; ItemIndex: Integer;
      const LocalClickPos: TPointF; const ItemObject: TListItemDrawable);
    procedure lblMenuFecharClick(Sender: TObject);
    procedure lblMenuReabrirClick(Sender: TObject);
    procedure lblMenuEncerrarClick(Sender: TObject);
    procedure lblMenuExcluirClick(Sender: TObject);
    procedure lblMenuAssinaturaClick(Sender: TObject);
    procedure imgAddClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    procedure MudarAba(Image: TImage);
    procedure ConsultarOS(filtro: string);
    procedure AddOS(codOS, cliente, dt, hora, status, assunto: string);
    procedure ConsultarCliente(filtro: string);
    procedure AddCliente(codCliente, nome, endereco, cidade, uf: string);
    procedure AlterarStatusOS(codOS, status: string);
    { Private declarations }
  public
    { Public declarations }
    Nome_Usuario: String;
    procedure EditarCampo(objeto: TObject;
                          tipo_campo, titulo, textprompt, ind_obrigatorio,
                          texto_padrao: string; tam_maximo: integer;
                          ProcCallBack : TExecutaClick = nil);
  end;

var
  FrmPrincipal: TFrmPrincipal;

implementation

{$R *.fmx}

uses UnitDM, UnitAssinatura, UnitOS, UnitEditar;

procedure TFrmPrincipal.imgAbaOSClick(Sender: TObject);
begin
    MudarAba(TImage(Sender));
end;

procedure TFrmPrincipal.imgAddClick(Sender: TObject);
begin
    RtgCadClubes.Visible:=True;
end;

procedure TFrmPrincipal.lblMenuFecharClick(Sender: TObject);
begin
    lytMenuOS.Visible := false;
end;

procedure TFrmPrincipal.AlterarStatusOS(codOS, status: string);
begin
    try
        dm.qryGeral.Active := false;
        dm.qryGeral.SQL.Clear;
        dm.qryGeral.SQL.Add('UPDATE TAB_OS SET STATUS=:STATUS');
        dm.qryGeral.SQL.Add('WHERE COD_OS=:COD_OS');
        dm.qryGeral.ParamByName('STATUS').Value := status;
        dm.qryGeral.ParamByName('COD_OS').Value := codOS;
        dm.qryGeral.ExecSQL;

        lytMenuOS.Visible := false;
        ConsultarOS(edtBuscaOS.Text);

    except on ex:exception do
        showmessage('Erro alterar status da OS: ' + ex.Message);
    end;
end;

procedure TFrmPrincipal.lblMenuAssinaturaClick(Sender: TObject);
begin
    if NOT Assigned(FrmAssinatura) then
        Application.CreateForm(TFrmAssinatura, FrmAssinatura);

    FrmAssinatura.codOS := lytMenuOS.TagString;
    FrmAssinatura.Show;

    lytMenuOS.Visible := false;
end;

procedure TFrmPrincipal.lblMenuEncerrarClick(Sender: TObject);
begin
    AlterarStatusOS(lytMenuOS.TagString, 'F');
end;

procedure TFrmPrincipal.lblMenuExcluirClick(Sender: TObject);
begin
    try
        dm.qryGeral.Active := false;
        dm.qryGeral.SQL.Clear;
        dm.qryGeral.SQL.Add('DELETE TAB_OS_FOTO WHERE COD_OS=:COD_OS');
        dm.qryGeral.ParamByName('COD_OS').Value := lytMenuOS.TagString;
        dm.qryGeral.ExecSQL;

        dm.qryGeral.Active := false;
        dm.qryGeral.SQL.Clear;
        dm.qryGeral.SQL.Add('DELETE TAB_OS WHERE COD_OS=:COD_OS');
        dm.qryGeral.ParamByName('COD_OS').Value := lytMenuOS.TagString;
        dm.qryGeral.ExecSQL;

        lytMenuOS.Visible := false;
        ConsultarOS(edtBuscaOS.Text);

    except on ex:exception do
        showmessage('Erro ao excluir OS: ' + ex.Message);
    end;
end;

procedure TFrmPrincipal.lblMenuReabrirClick(Sender: TObject);
begin
    AlterarStatusOS(lytMenuOS.TagString, 'A');
end;

procedure TFrmPrincipal.lvOSItemClickEx(const Sender: TObject;
  ItemIndex: Integer; const LocalClickPos: TPointF;
  const ItemObject: TListItemDrawable);
var
    codOS: string;
begin
    codOS := lvOS.Items[ItemIndex].TagString;

    if Assigned(ItemObject) then
        if ItemObject.Name = 'imgOpcoes' then
        begin
            lytMenuOS.TagString := codOS;
            lytMenuOS.Visible := true;
            exit;
        end;

    OpenCadOS(codOS);
end;

procedure TFrmPrincipal.MudarAba(Image: TImage);
begin
    imgAbaOS.Opacity := 0.4;
    imgAbaCliente.Opacity := 0.4;

    Image.Opacity := 1;
    TabControl.GotoVisibleTab(Image.Tag);
end;

procedure TFrmPrincipal.AddOS(codOS, cliente, dt, hora, status, assunto: string);
var
    item : TListViewItem;
begin
    item := lvOS.Items.Add;

    with item do
    begin
        Height := 125;
        TagString := codOS;

        TListItemText(Objects.FindDrawable('txtOS')).Text := codOS;
        TListItemText(Objects.FindDrawable('txtCliente')).Text := cliente;
        TListItemText(Objects.FindDrawable('txtData')).Text := dt;
        TListItemText(Objects.FindDrawable('txtHora')).Text := hora;
        TListItemText(Objects.FindDrawable('txtAssunto')).Text := assunto;

        TListItemImage(Objects.FindDrawable('imgData')).Bitmap := imgData.Bitmap;
        TListItemImage(Objects.FindDrawable('imgHora')).Bitmap := imgHora.Bitmap;
        TListItemImage(Objects.FindDrawable('imgOpcoes')).Bitmap := imgOpcao.Bitmap;

        if status = 'F' then
            TListItemImage(Objects.FindDrawable('imgStatus')).Bitmap := imgFechada.Bitmap
        else
            TListItemImage(Objects.FindDrawable('imgStatus')).Bitmap := imgAberta.Bitmap
    end;
end;

procedure TFrmPrincipal.ConsultarOS(filtro: string);
begin
    lvOS.Items.Clear;

    dm.qryConsOS.Active := false;
    dm.qryConsOS.SQL.Clear;
    dm.qryConsOS.SQL.Add('SELECT O.*, C.NOME');
    dm.qryConsOS.SQL.Add('FROM TAB_OS O');
    dm.qryConsOS.SQL.Add('JOIN TAB_CLIENTE C ON (C.COD_CLIENTE = O.COD_CLIENTE)');

    if filtro <> '' then
    begin
        dm.qryConsOS.SQL.Add('WHERE C.NOME LIKE :NOME');
        dm.qryConsOS.ParamByName('NOME').Value := '%' + filtro + '%';
    end;

    dm.qryConsOS.SQL.Add('ORDER BY O.COD_OS DESC');
    dm.qryConsOS.Active := true;

    while NOT dm.qryConsOS.Eof do
    begin
        AddOS(dm.qryConsOS.FieldByName('COD_OS').AsString,
              dm.qryConsOS.FieldByName('NOME').AsString,
              FormatDateTime('dd/mm/yyyy', dm.qryConsOS.FieldByName('DT_OS').AsDateTime),
              FormatDateTime('HH:nn', dm.qryConsOS.FieldByName('DT_OS').AsDateTime),
              dm.qryConsOS.FieldByName('STATUS').AsString,
              dm.qryConsOS.FieldByName('ASSUNTO').AsString);

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

procedure TFrmPrincipal.FormShow(Sender: TObject);
begin
    MudarAba(imgAbaOS);
    ConsultarOS(edtBuscaOS.Text);
end;

procedure TFrmPrincipal.AddCliente(codCliente, nome, endereco, cidade, uf: string);
var
    item : TListViewItem;
begin
    item := lvCliente.Items.Add;

    with item do
    begin
        Height := 70;
        TagString := codCliente;

        TListItemText(Objects.FindDrawable('txtNome')).Text := nome;
        TListItemText(Objects.FindDrawable('txtEndereco')).Text := endereco;
        TListItemText(Objects.FindDrawable('txtCidade')).Text := cidade + ' - ' + uf;
    end;
end;

procedure TFrmPrincipal.ConsultarCliente(filtro: string);
begin
    lvCliente.Items.Clear;

    dm.qryConsCliente.Active := false;
    dm.qryConsCliente.SQL.Clear;
    dm.qryConsCliente.SQL.Add('SELECT C.*');
    dm.qryConsCliente.SQL.Add('FROM TAB_CLIENTE C');

    if filtro <> '' then
    begin
        dm.qryConsCliente.SQL.Add('WHERE C.NOME LIKE :NOME');
        dm.qryConsCliente.ParamByName('NOME').Value := '%' + filtro + '%';
    end;

    dm.qryConsCliente.SQL.Add('ORDER BY C.NOME');
    dm.qryConsCliente.Active := true;

    while NOT dm.qryConsCliente.Eof do
    begin
        AddCliente(dm.qryConsCliente.FieldByName('COD_CLIENTE').AsString,
                   dm.qryConsCliente.FieldByName('NOME').AsString,
                   dm.qryConsCliente.FieldByName('ENDERECO').AsString,
                   dm.qryConsCliente.FieldByName('CIDADE').AsString,
                   dm.qryConsCliente.FieldByName('UF').AsString);

        dm.qryConsCliente.Next;
    end;

end;

procedure TFrmPrincipal.rectBuscaClienteClick(Sender: TObject);
begin
    ConsultarCliente(edtBuscaCliente.Text);
end;

procedure TFrmPrincipal.rectBuscaOSClick(Sender: TObject);
begin
    ConsultarOS(edtBuscaOS.Text);
end;

end.
