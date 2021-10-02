unit UnitEditar;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Objects,
  FMX.Controls.Presentation, FMX.StdCtrls, FMX.Edit, FMX.Layouts, FMX.ScrollBox,

  {$IFDEF ANDROID}
  FMX.VirtualKeyboard, FMX.Platform,
  {$ENDIF}

  FMX.Memo, FMX.DateTimeCtrls;

type
  TFrmEditar = class(TForm)
    Rectangle1: TRectangle;
    lbl_titulo: TLabel;
    img_salvar: TImage;
    img_voltar_cad: TImage;
    layout_edit: TLayout;
    Rectangle2: TRectangle;
    edt_texto: TEdit;
    layout_senha: TLayout;
    Rectangle3: TRectangle;
    edt_senha: TEdit;
    layout_memo: TLayout;
    Rectangle4: TRectangle;
    m_memo: TMemo;
    layout_data: TLayout;
    Rectangle5: TRectangle;
    dt_data: TDateEdit;
    layout_valor: TLayout;
    lbl_valor: TLabel;
    Layout1: TLayout;
    Layout2: TLayout;
    Layout3: TLayout;
    Layout4: TLayout;
    Layout5: TLayout;
    Layout6: TLayout;
    Layout7: TLayout;
    Layout8: TLayout;
    Layout9: TLayout;
    Layout10: TLayout;
    Layout11: TLayout;
    Layout12: TLayout;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    img_backspace: TImage;
    procedure FormShow(Sender: TObject);
    procedure img_voltar_cadClick(Sender: TObject);
    procedure img_salvarClick(Sender: TObject);
    procedure Label1Click(Sender: TObject);
    procedure img_backspaceClick(Sender: TObject);
    procedure FormKeyUp(Sender: TObject; var Key: Word; var KeyChar: Char;
      Shift: TShiftState);
  private
    { Private declarations }
    lbl : TLabel;
  public
    { Public declarations }
    tipo, ind_campo_obrigatorio : string;
    obj : TObject;
  end;

var
  FrmEditar: TFrmEditar;

implementation

{$R *.fmx}

uses UnitPrincipal;

procedure TeclaNumero(lbl: TObject);
var
    valor : string;
begin
    valor := FrmEditar.lbl_valor.Text; // 8.900,00
    valor := StringReplace(valor, '.', '', [rfReplaceAll]); // 8900,00
    valor := StringReplace(valor, ',', '', [rfReplaceAll]); // 890000

    valor := valor + TLabel(lbl).Text;

    FrmEditar.lbl_valor.Text := FormatFloat('#,##0.00', valor.ToDouble / 100);
end;

procedure TeclaBackspace();
var
    valor : string;
begin
    valor := FrmEditar.lbl_valor.Text; // 8.900,00
    valor := StringReplace(valor, '.', '', [rfReplaceAll]); // 8900,00
    valor := StringReplace(valor, ',', '', [rfReplaceAll]); // 890000

    if Length(valor) > 1 then
        valor := Copy(valor, 1, length(valor) - 1)
    else
        valor := '0';

    FrmEditar.lbl_valor.Text := FormatFloat('#,##0.00', valor.ToDouble / 100);
end;

procedure TFrmEditar.FormKeyUp(Sender: TObject; var Key: Word;
  var KeyChar: Char; Shift: TShiftState);
{$IFDEF ANDROID}
var
        FService : IFMXVirtualKeyboardService;
{$ENDIF}

begin
        {$IFDEF ANDROID}
        if (Key = vkHardwareBack) then
        begin
                TPlatformServices.Current.SupportsPlatformService(IFMXVirtualKeyboardService, IInterface(FService));

                if (FService <> nil) and (TVirtualKeyboardState.Visible in FService.VirtualKeyBoardState) then
                begin
                        // Botao back pressionado e teclado visivel...
                        // (apenas fecha o teclado)
                end
                else
                begin
                        // Botao back pressionado e teclado NAO visivel...
                        Key := 0;
                        close;
                end;
        end;
        {$ENDIF}
end;

procedure TFrmEditar.FormShow(Sender: TObject);
begin
    layout_edit.Visible := tipo = 'EDIT';
    layout_senha.Visible := tipo = 'SENHA';
    layout_memo.Visible := tipo = 'MEMO';
    layout_data.Visible := tipo = 'DATA';
    layout_valor.Visible := tipo = 'VALOR';
    Edt_Texto.SetFocus;
    Edt_Texto.SelectAll;
end;

procedure TFrmEditar.img_backspaceClick(Sender: TObject);
begin
    TeclaBackspace;
end;

procedure TFrmEditar.img_salvarClick(Sender: TObject);
var
    ret : string;
begin
    if tipo = 'EDIT' then
        ret := edt_texto.Text;
    if tipo = 'MEMO' then
        ret := m_memo.Lines.Text;
    if tipo = 'SENHA' then
        ret := edt_senha.Text;
    if tipo = 'DATA' then
        ret := FormatDateTime('dd/mm/yyyy', dt_data.Date);
    if tipo = 'VALOR' then
        ret := lbl_valor.Text;

    // Campo obrigatorio...
    if (ind_campo_obrigatorio = 'S') and (ret = '') then
    begin
        ShowMessage('Esse campo é obrigatório');
        exit;
    end;

    if obj is TLabel then
        TLabel(obj).Text := ret;

    close;
end;

procedure TFrmEditar.img_voltar_cadClick(Sender: TObject);
begin
    close;
end;

procedure TFrmEditar.Label1Click(Sender: TObject);
begin
    TeclaNumero(Sender);
end;

end.
