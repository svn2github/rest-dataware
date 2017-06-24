unit uRESTDWReg;

interface

uses
  {$IFDEF FPC}
   LResources, Classes, uRESTDWBase;
  {$ELSE}
   System.Classes, uRESTDWBase;
  {$ENDIF}

Procedure Register;

implementation

Procedure Register;
Begin
 RegisterComponents('REST Dataware - Service',     [TRESTServicePooler, TRESTClientPooler]);
End;

{$IFDEF FPC}
initialization
{$I resteasyobjectscore.lrs}
{$ENDIF}

end.
