unit uRESTDWReg;

interface

uses
  {$IFDEF FPC}
   LResources, Classes, uRESTDWBase, uRESTDWPoolerDB;
  {$ELSE}
   System.Classes, uRESTDWBase, uRESTDWPoolerDB;
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
{$ENDIF}

end.
