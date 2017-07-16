unit uRESTDWReg;

interface

uses
  Windows,
  {$IFDEF FPC}
   LResources, Classes, uRESTDWBase, uRESTDWPoolerDB, uDWDatamodule;
  {$ELSE}
   {$if CompilerVersion > 21}
    DMForm, DesignIntf, Classes, uRESTDWBase, uRESTDWPoolerDB, uDWDatamodule;
   {$ELSE}
    ToolsApi, DMForm, DesignEditors, DesignIntf, Classes, uRESTDWBase, uRESTDWPoolerDB, uDWDatamodule;
   {$IFEND}
  {$ENDIF}

Procedure Register;

implementation

Procedure Register;
Begin
 RegisterCustomModule(TServerMethodDataModule,      TDataModuleCustomModule);
 RegisterComponents('REST Dataware - Service',     [TRESTServicePooler, TRESTClientPooler]);
 RegisterComponents('REST Dataware - CORE - DB',   [TRESTDWPoolerDB, TRESTDWDataBase, TRESTDWClientSQL, TRESTDWStoredProc, TRESTDWPoolerList]);
End;

{$IFDEF FPC}
initialization
{$I resteasyobjectscore.lrs}
{$ELSE}
{$if CompilerVersion < 21}
 {$R ..\Packages\Delphi\D7\RestEasyObjectsCORE.dcr}
{$IFEND}
{$ENDIF}

end.
