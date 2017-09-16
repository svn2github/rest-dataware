program RestDWServerProject;

{$MODE Delphi}

uses
  {$IFDEF FPC}
   {$IFDEF UNIX}{$IFDEF UseCThreads}
    cthreads,
   {$ENDIF}{$ENDIF}
  {$Endif}
  Forms, Interfaces,
  RestDWServerFormU in 'RestDWServerFormU.pas' {RestDWForm},
  ServerMethodsUnit1 in 'ServerMethodsUnit1.pas' {ServerMethods1: TDataModule},
  uDmService in 'uDmService.pas' {DataModule1: TDataModule};

{.$R *.res}

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TRestDWForm, RestDWForm);
  Application.Run;
end.
