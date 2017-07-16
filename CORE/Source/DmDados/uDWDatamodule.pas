unit uDWDatamodule;

interface

Uses
  SysUtils, Classes, SysTypes, uDWJSONObject, uDWConstsData;

 Type
  TServerMethodDataModule = Class(TDataModule)
  Private
   vReplyEvent : TReplyEvent;
  Public
  Published
   Property OnReplyEvent : TReplyEvent Read vReplyEvent Write vReplyEvent;
 End;

implementation

{$R *.dfm}

end.
