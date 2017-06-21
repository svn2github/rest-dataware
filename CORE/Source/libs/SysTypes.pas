unit SysTypes;

Interface

Uses
 SysUtils, Classes;

Type
 TResultErro = Record
  Status      : Integer;
  MessageText : String;
End;

TArguments = Array Of String;

Type
 TServerMethods = Class(TComponent)
 Private
  Function ReturnIncorrectArgs  : String;
  Function ReturnMethodNotFound : String;
 Public
  Constructor Create(aOwner : TComponent); Override;
  Destructor  Destroy; Override;
  Function CallGETServerMethod   (Argumentos : TArguments) : String;Virtual;
  Function CallPUTServerMethod   (Argumentos : TArguments) : String;Virtual;
  Function CallDELETEServerMethod(Argumentos : TArguments) : String;Virtual;
  Function CallPOSTServerMethod  (Argumentos : TArguments) : String;Virtual;
End;

implementation

{ TServerMethods }

function TServerMethods.CallDELETEServerMethod(Argumentos: TArguments): String;
begin

end;

function TServerMethods.CallGETServerMethod(Argumentos: TArguments): String;
begin

end;

function TServerMethods.CallPOSTServerMethod(Argumentos: TArguments): String;
begin

end;

function TServerMethods.CallPUTServerMethod(Argumentos: TArguments): String;
begin

end;

constructor TServerMethods.Create(aOwner: TComponent);
begin
  inherited;

end;

destructor TServerMethods.Destroy;
begin

  inherited;
end;

function TServerMethods.ReturnIncorrectArgs: String;
begin

end;

function TServerMethods.ReturnMethodNotFound: String;
begin

end;

end.
