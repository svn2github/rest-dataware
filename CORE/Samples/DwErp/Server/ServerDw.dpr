program ServerDw;

uses
  madExcept,
  madLinkDisAsm,
  madListHardware,
  madListProcesses,
  madListModules,
  MidasLib,
  Vcl.Forms,
  System.UITypes,
  uPrincipal in 'uPrincipal.pas' {FrmServer},
  uClassePonto in 'Libs\uClassePonto.pas',

  uUpdateDB in 'Libs\uUpdateDB.pas' {$R *.res},
  Winapi.Windows,
  Vcl.Dialogs,
  System.SysUtils,
  UDmService in 'UDmService.pas' {ServerMetodDM: TDataModule},
  NFDXML in '..\lib\NFDXML.pas';

{$R *.res}

var
  MutexHandle: THandle;

function OneInstanceAndRunning: Boolean;
begin
  Result := false;
  if (MutexHandle <> 0) and (GetLastError = ERROR_ALREADY_EXISTS) then
  begin
    MessageDlg('O servidor já está rodando nesta máquina.', mtWarning, [mbOK], 0);
    Result := True;
  end;
end;

begin
{$IFDEF Debug}

   ReportMemoryLeaksOnShutdown := True;

{$ENDIF}
  FormatSettings.DecimalSeparator := ',';
  FormatSettings.ShortDateFormat := 'dd/mm/yyyy';
  FormatSettings.LongDateFormat := 'dd/mm/yyyy';

  MutexHandle := CreateMutex(nil, True, 'ServerConflex3c');

  // Deixa rodar apenas uma instância do aplicativo
  if OneInstanceAndRunning then
  begin
    CloseHandle(MutexHandle);
    Halt;
  end;
  try
    Application.Initialize;
    Application.MainFormOnTaskbar := True;
    if FindCmdLineSwitch('updatedb', ['-', '\', '/'], True) then
      Funcoes.UpdateDB := True
    else
      Funcoes.UpdateDB := false;
  Application.CreateForm(TDM_UpdateDB, DM_UpdateDB);
  Application.CreateForm(TFrmServer, FrmServer);
  Application.Run;
  finally
    if LongBool(MutexHandle) then
      CloseHandle(MutexHandle);
  end;

end.
