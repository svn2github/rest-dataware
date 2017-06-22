unit uRESTDWReg;

interface

uses
 System.Classes, uRESTDWBase;

Procedure Register;

implementation

Procedure Register;
Begin
 RegisterComponents('REST Dataware - Service',     [TRESTServicePooler, TRESTClientPooler]);
End;

end.
