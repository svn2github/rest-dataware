program ServerREST;

{$mode objfpc}{$H+}

// The following line is is necessary for Linux thread support
{$IFDEF UNIX}{$DEFINE UseCThreads}{$ENDIF}

uses
  {$IFDEF UNIX}{$IFDEF UseCThreads}
  cthreads,
  {$ENDIF}{$ENDIF}
  Interfaces, // this includes the LCL widgetset
  Forms, indylaz, formMain, ServerMethodsUnit1;

{$R *.res}

begin
  RequireDerivedFormResource:=True;
  Application.Initialize;
  Application.CreateForm(TfrmMain, frmMain);
  Application.Run;
end.

