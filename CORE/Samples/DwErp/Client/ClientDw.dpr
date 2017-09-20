program ClientDw;
{$APPTYPE GUI}

uses
  madExcept,
  madLinkDisAsm,
  madListHardware,
  madListProcesses,
  madListModules,
  Vcl.Forms,
  UPrincipal in 'UPrincipal.pas' {FrmPrincipal},
  Ufuncoes in 'Ufuncoes.pas',
  UDM in 'UDM.pas' {DM: TDataModule},
  csDXFunctions in '..\lib\csDXFunctions.pas',
  uLogin in 'uLogin.pas' {FrmLogin},
  uSplashConexao in 'uSplashConexao.pas' {FrmSplashConexao},
  UFindArea in 'UFindArea.pas',
  uClasseFindArea in 'uClasseFindArea.pas',
  uAdminConfig in 'uAdminConfig.pas' {FrmAdminConfig},
  NFDXML in '..\lib\NFDXML.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TDM, DM);
  Application.CreateForm(TFrmPrincipal, FrmPrincipal);
  Application.Run;
end.
