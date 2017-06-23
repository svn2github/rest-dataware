unit ServerUtils;

interface

Uses
  {$IFDEF LCL}
  Classes, SysUtils, IdURI, IdGlobal;
  {$ELSE}
  Classes, StringBuilderUnit,
  SysUtils, IdURI, IdGlobal;
  {$ENDIF}

Type
 TServerParams = Class(TPersistent)
 Private
  fUsername,
  fPassword                     : String;
  fHasAuthenticacion            : Boolean;
  Function GetUserName          : String;
  Function GetPassword          : String;
  Function GetHasAuthentication : Boolean;
 Public
  Property HasAuthentication : Boolean Read fHasAuthenticacion Write fHasAuthenticacion;
  Property UserName          : String  Read GetUserName        Write fUsername;
  Property Password          : String  Read GetPassword        Write fPassword;
  Constructor Create; Overload;
  Procedure   Assign(Source : TPersistent); Override;
End;

implementation

Uses SysTypes;

Procedure TServerParams.Assign(Source: TPersistent);
Var
 Src : TServerParams;
Begin
 If Source is TServerParams Then
  Begin
   Src := TServerParams(Source);
   fUsername := Src.fUsername;
   fPassword := Src.fPassword;
   fHasAuthenticacion := Src.fHasAuthenticacion;
  End
 Else
  Inherited;
End;

Constructor TServerParams.Create;
Begin
 HasAuthentication := False;
End;

Function TServerParams.GetUserName : String;
Begin
 Result := fUsername;
End;

Function TServerParams.GetPassword : String;
Begin
 Result := fPassword;
End;

Function TServerParams.GetHasAuthentication : Boolean;
Begin
 Result := fHasAuthenticacion;
End;

end.
