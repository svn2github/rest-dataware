unit uRESTDWReg;

interface

uses
  {$IFDEF LCL}
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

{$IFDEF LCL}
initialization
{$I resteasyobjectscore.lrs}
{$ENDIF}

end.
