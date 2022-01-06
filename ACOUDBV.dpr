program ACOUDBV;

uses
  System.StartUpCopy,
  FMX.Forms,
  UnitLogin in 'UnitLogin.pas' {FrmLogin},
  UnitPrincipal in 'UnitPrincipal.pas' {FrmPrincipal},
  UnitDM in 'UnitDM.pas' {dm: TDataModule},
  UnitFunctions in 'Units\UnitFunctions.pas',
  u99Permissions in 'Units\u99Permissions.pas',
  UnitEditar in 'UnitEditar.pas' {FrmEditar},
  {$IFDEF ANDROID}
  UnitPdfPrint in 'Units\UnitPdfPrint.pas',
  {$ENDIF }
  uFancyDialog in 'Units\uFancyDialog.pas',
  Unitinicial in 'Unitinicial.pas' {FrmInicial},
  FMX.BitmapHelper in 'Units\FMX.BitmapHelper.pas',
  AnonThread in 'Units\AnonThread.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.FormFactor.Orientations := [TFormOrientation.Portrait];
  Application.CreateForm(Tdm, dm);
  Application.CreateForm(TFrmInicial, FrmInicial);
  Application.Run;
end.
