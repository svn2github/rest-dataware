{ This file was automatically created by Lazarus. Do not edit!
  This source is only used to compile and install the package.
 }

unit RESTDWLazDriver;

interface

uses
  uRestDWLazDriver, uDWConsts, uDWConstsData, uRESTDWPoolerDB, uDWJSONObject, 
  uDWJSON, uDWDatamodule, LazarusPackageIntf;

implementation

procedure Register;
begin
end;

initialization
  RegisterPackage('RESTDWLazDriver', @Register);
end.
