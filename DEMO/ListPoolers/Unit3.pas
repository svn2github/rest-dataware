unit Unit3;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uRestPoolerDB, Vcl.StdCtrls;

type
  TForm3 = class(TForm)
    RESTPoolerList1: TRESTPoolerList;
    ListBox1: TListBox;
    Button1: TButton;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form3: TForm3;

implementation

{$R *.dfm}

procedure TForm3.Button1Click(Sender: TObject);
begin
 RESTPoolerList1.Active := True;
 If RESTPoolerList1.Active Then
  Begin
   ListBox1.Clear;
   If RESTPoolerList1.Poolers <> Nil Then
    If RESTPoolerList1.Poolers.Count > 0 Then
     ListBox1.Items.Assign(RESTPoolerList1.Poolers);
  End;
end;

end.
