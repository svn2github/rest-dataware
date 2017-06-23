{ This file was automatically created by Lazarus. Do not edit!
  This source is only used to compile and install the package.
 }

unit RestEasyObjectsCORE;

interface

uses
  ServerUtils, SysTypes, uDWConsts, uDWJSONObject, uDWJSONTools, uKBDynamic, 
  uRESTDWBase, LazarusPackageIntf;

implementation

procedure Register;
begin
 RegisterComponents('REST Dataware - Service', [TRESTServicePooler, TRESTClientPooler]);
end;

initialization
  RegisterPackage('RestEasyObjectsCORE', @Register);
end.
