unit uRESTDWReg;

interface

uses
  {$IFDEF LCL}
   Classes, uRESTDWBase;
  {$ELSE}
   System.Classes, uRESTDWBase;
  {$ENDIF}

Procedure Register;

implementation

Procedure Register;
Begin
 RegisterComponents('REST Dataware - Service',     [TRESTServicePooler, TRESTClientPooler]);
End;

end.
