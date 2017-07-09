﻿unit uZlibLaz;

interface

Uses
 SysUtils, Classes, zlib{$IFDEF FPC}, zstream{$ENDIF};

  //Funções de Compressão e descompressão de Stream com ZLib
  Procedure ZCompressStream  (inStream, outStream : TStream);
  Procedure ZDecompressStream(inStream, outStream : TStream);


implementation

Procedure ZCompressStream  (inStream, outStream : TStream);
Var
 DS        : TCompressionStream;
Begin
 inStream.Position := 0; // goto start of input stream
 DS := TCompressionstream.Create(clDefault, outStream);
 Try
  inStream.Position := 0;
  DS.CopyFrom(inStream, inStream.Size);
 Finally
  DS.Free;
 End;
End;

Function ReadDWord(Value : TStream) : Cardinal;
Var
 d : Cardinal;
Begin
 Value.Position := 0;
 Value.ReadBuffer(d, 4);
 ReadDWord := d;
End;

Procedure ZDecompressStream(inStream, outStream : TStream);
Var
 D : TDecompressionstream;
 B : Array[1..2048] of Byte;
 R : Integer;
Begin
 inStream.Position := 0;
 d := TDecompressionstream.Create(inStream);
 Try
  Repeat
   R := d.Read(B, SizeOf(B));
   If R > 0 then
    outStream.Write(B, R);
  Until R < SizeOf(B);
 Finally
  outStream.Position := 0;
  d.Free;
 End;
End;

end.
