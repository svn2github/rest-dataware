unit uRESTDWReg;

interface

uses
  {$IFDEF FPC}
   LResources, Classes, uRESTDWBase, uRESTDWPoolerDB;
  {$ELSE}
   {$if CompilerVersion > 21}
    Classes, uRESTDWBase, uRESTDWPoolerDB;
   {$ELSE}
    Classes, uRESTDWBase, uRESTDWPoolerDB;
   {$IFEND}
  {$ENDIF}

Procedure Register;

implementation

Procedure Register;
Begin
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
