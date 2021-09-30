unit UnitBuscaCliente;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Objects,
  FMX.Controls.Presentation, FMX.StdCtrls, FMX.Edit, FMX.ListView.Types,
  FMX.ListView.Appearances, FMX.ListView.Adapters.Base, FMX.ListView,
  FMX.TabControl, FMX.Layouts, uFancyDialog;

type
  TCallbackCliente = procedure(codCliente: string) of Object;

  TFrmBuscaCliente = class(TForm)
    rectOSToolbar: TRectangle;
    lblTitulo: TLabel;
    imgVoltar: TImage;
    Rectangle2: TRectangle;
    edtBuscaCliente: TEdit;
    rectBuscaCliente: TRectangle;
    Label4: TLabel;
    lvCliente: TListView;
    imgAdd: TImage;
    TabControl: TTabControl;
    TabConsulta: TTabItem;
    TabCadastrar: TTabItem;
    rectCliToolbar: TRectangle;
    Label1: TLabel;
    imgCancelar: TImage;
    imgSalvar: TImage;
    img_no_cliente: TImage;
    VertScrollBox1: TVertScrollBox;
    rect_nome: TRectangle;
    Label2: TLabel;
    Image2: TImage;
    lbl_nome: TLabel;
    rect_email: TRectangle;
    Label5: TLabel;
    Image3: TImage;
    lbl_email: TLabel;
    rect_cidade: TRectangle;
    Label6: TLabel;
    Image4: TImage;
    lbl_cidade: TLabel;
    rect_endereco: TRectangle;
    Label10: TLabel;
    Image6: TImage;
    lbl_endereco: TLabel;
    rect_fone: TRectangle;
    Label12: TLabel;
    Image7: TImage;
    lbl_fone: TLabel;
    procedure rectBuscaClienteClick(Sender: TObject);
    procedure lvClienteItemClick(const Sender: TObject;
      const AItem: TListViewItem);
    procedure imgVoltarClick(Sender: TObject);
    procedure imgAddClick(Sender: TObject);
    procedure rect_nomeClick(Sender: TObject);
    procedure rect_nomeTap(Sender: TObject; const Point: TPointF);
    procedure rect_foneClick(Sender: TObject);
    procedure rect_foneTap(Sender: TObject; const Point: TPointF);
    procedure rect_emailClick(Sender: TObject);
    procedure rect_emailTap(Sender: TObject; const Point: TPointF);
    procedure rect_enderecoClick(Sender: TObject);
    procedure rect_enderecoTap(Sender: TObject; const Point: TPointF);
    procedure rect_cidadeClick(Sender: TObject);
    procedure rect_cidadeTap(Sender: TObject; const Point: TPointF);
    procedure imgSalvarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure imgCancelarClick(Sender: TObject);
  private
    fancy : TFancyDialog;
    procedure AddCliente(codCliente, nome, endereco, cidade, uf: string);
    procedure ConsultarCliente(filtro: string);
    procedure MudarAba(Image: TImage);
    { Private declarations }
  public
    executeOnClose: TCallbackCliente;
  end;

var
  FrmBuscaCliente: TFrmBuscaCliente;

implementation

{$R *.fmx}

uses UnitDM, UnitPrincipal, UnitFunctions;

procedure TFrmBuscaCliente.MudarAba(Image: TImage);
begin

    TabControl.GotoVisibleTab(Image.Tag);
end;

procedure TFrmBuscaCliente.AddCliente(codCliente, nome, endereco, cidade, uf: string);
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

procedure TFrmBuscaCliente.ConsultarCliente(filtro: string);
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

    img_no_cliente.Visible := lvCliente.Items.Count = 0;
end;

procedure TFrmBuscaCliente.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  fancy.DisposeOf;
end;

procedure TFrmBuscaCliente.FormCreate(Sender: TObject);
begin
  fancy := TFancyDialog.Create(FrmBuscaCliente);
end;

procedure TFrmBuscaCliente.FormShow(Sender: TObject);
begin
  ConsultarCliente(edtBuscaCliente.Text);
end;

procedure TFrmBuscaCliente.imgAddClick(Sender: TObject);
begin
  MudarAba(TImage(Sender));
end;

procedure TFrmBuscaCliente.imgCancelarClick(Sender: TObject);
begin
  MudarAba(TImage(Sender));
  lbl_nome.Text:='Digite um nome';
  lbl_fone.Text:='(00)90000-0000';
  lbl_email.Text:='Digite um email';
  lbl_endereco.Text:='Digite um endereço';
  lbl_cidade.Text:='Digite uma cidade';
end;

procedure TFrmBuscaCliente.imgSalvarClick(Sender: TObject);
begin
    if lbl_nome.Text = '' then
    begin
        fancy.Show(TIconDialog.Error, '', 'Informe o nome do cliente', 'OK');
        exit;
    end;

    try
        dm.qryConsCliente.Active := false;
        dm.qryConsCliente.SQL.Clear;

        dm.qryConsCliente.SQL.Add('INSERT INTO TAB_CLIENTE(COD_CLIENTE, NOME, FONE, EMAIL, ENDERECO, CIDADE)');
        dm.qryConsCliente.SQL.Add('VALUES(:COD_CLIENTE, :NOME, :FONE, :EMAIL, :ENDERECO, :CIDADE )');

        dm.qryConsCliente.ParamByName('COD_CLIENTE').Value := GeraCodCliente;
        dm.qryConsCliente.ParamByName('NOME').Value := lbl_nome.Text;
        dm.qryConsCliente.ParamByName('FONE').Value := lbl_fone.Text;
        dm.qryConsCliente.ParamByName('EMAIL').Value := lbl_email.Text;
        dm.qryConsCliente.ParamByName('ENDERECO').Value := lbl_endereco.Text;
        dm.qryConsCliente.ParamByName('CIDADE').Value := lbl_cidade.Text;

        dm.qryConsCliente.ExecSQL;

    except on ex:exception do
    begin
        showmessage('Erro ao cadastrar cliente: ' + ex.Message);
        exit;
    end;
    end;

    ConsultarCliente(edtBuscaCliente.Text);
    TabControl.GotoVisibleTab(0);
end;

procedure TFrmBuscaCliente.imgVoltarClick(Sender: TObject);
begin
  close;
end;

procedure TFrmBuscaCliente.lvClienteItemClick(const Sender: TObject;
  const AItem: TListViewItem);
begin
    if Assigned(executeOnClose) then
    begin
        executeOnClose(AItem.TagString);
        close;
    end;
end;

procedure TFrmBuscaCliente.rectBuscaClienteClick(Sender: TObject);
begin
    ConsultarCliente(edtBuscaCliente.Text);
end;

procedure TFrmBuscaCliente.rect_cidadeClick(Sender: TObject);
begin
    FrmPrincipal.EditarCampo(lbl_cidade, 'EDIT', 'Cidade do cliente',
                             'Informe a cidade', 'S', lbl_cidade.Text, 50);
end;

procedure TFrmBuscaCliente.rect_cidadeTap(Sender: TObject;
  const Point: TPointF);
begin
    FrmPrincipal.EditarCampo(lbl_cidade, 'EDIT', 'Cidade do cliente',
                             'Informe a cidade', 'S', lbl_cidade.Text, 50);
end;

procedure TFrmBuscaCliente.rect_emailClick(Sender: TObject);
begin
    {$IFDEF MSWINDOWS}
    FrmPrincipal.EditarCampo(lbl_email, 'EDIT', 'Email do cliente',
                             'Informe o email', 'S', lbl_email.Text, 100);
    {$ENDIF}
end;

procedure TFrmBuscaCliente.rect_emailTap(Sender: TObject; const Point: TPointF);
begin
    FrmPrincipal.EditarCampo(lbl_email, 'EDIT', 'Email do cliente',
                             'Informe o email', 'S', lbl_email.Text, 100);
end;

procedure TFrmBuscaCliente.rect_enderecoClick(Sender: TObject);
begin
    {$IFDEF MSWINDOWS}
    FrmPrincipal.EditarCampo(lbl_endereco, 'MEMO', 'Endereço do cliente',
                             'Informe o endereço', 'S', lbl_endereco.Text, 500);
    {$ENDIF}
end;

procedure TFrmBuscaCliente.rect_enderecoTap(Sender: TObject;
  const Point: TPointF);
begin
    FrmPrincipal.EditarCampo(lbl_endereco, 'MEMO', 'Endereço do cliente',
                             'Informe o endereço', 'S', lbl_endereco.Text, 500);
end;

procedure TFrmBuscaCliente.rect_foneClick(Sender: TObject);
begin
    {$IFDEF MSWINDOWS}
    FrmPrincipal.EditarCampo(lbl_fone, 'EDIT', 'Telefone do cliente',
                             'Informe o telefone', 'S', lbl_fone.Text, 20);
    {$ENDIF}
end;

procedure TFrmBuscaCliente.rect_foneTap(Sender: TObject; const Point: TPointF);
begin
    FrmPrincipal.EditarCampo(lbl_fone, 'EDIT', 'Telefone do cliente',
                             'Informe o telefone', 'S', lbl_fone.Text, 20);
end;

procedure TFrmBuscaCliente.rect_nomeClick(Sender: TObject);
begin
    {$IFDEF MSWINDOWS}
    FrmPrincipal.EditarCampo(lbl_nome, 'EDIT', 'Nome do cliente',
                             'Informe o nome', 'S', lbl_nome.Text, 100);
    {$ENDIF}
end;

procedure TFrmBuscaCliente.rect_nomeTap(Sender: TObject; const Point: TPointF);
begin
    FrmPrincipal.EditarCampo(lbl_nome, 'EDIT', 'Nome do cliente',
                             'Informe o nome', 'S', lbl_nome.Text, 100);
end;

end.
