unit uZlibLaz;

interface

Uses
 SysUtils, Classes, ZLib;

Type
 TZCompressionLevel = (zcNone, zcFastest, zcDefault, zcMax);

Const
 _z_errmsg : Array [0..9] of PChar = ('need dictionary',      // Z_NEED_DICT      (2)  //do not localize
                                                 'stream end',           // Z_STREAM_END     (1)  //do not localize
                                                 '',                     // Z_OK             (0)  //do not localize
                                                 'file error',           // Z_ERRNO          (-1) //do not localize
                                                 'stream error',         // Z_STREAM_ERROR   (-2) //do not localize
                                                 'data error',           // Z_DATA_ERROR     (-3) //do not localize
                                                 'insufficient memory',  // Z_MEM_ERROR      (-4) //do not localize
                                                 'buffer error',         // Z_BUF_ERROR      (-5) //do not localize
                                                 'incompatible version', // Z_VERSION_ERROR  (-6) //do not localize
                                                 '');

  ZLevels : Array[TZCompressionLevel] of Shortint = (Z_NO_COMPRESSION, Z_BEST_SPEED, Z_DEFAULT_COMPRESSION, Z_BEST_COMPRESSION);

  Procedure ZCompressStream  (inStream, outStream : TStream; level : TZCompressionLevel);
  Procedure ZDecompressStream(inStream, outStream : TStream);


implementation

Function ZDecompressCheck(code: Integer): Integer;
Begin
 Result := code;
 If code < 0 then
  Raise Exception.Create(String(_z_errmsg[2 - code]));
End;

Function ZCompressCheck(code: Integer): Integer;
Begin
 Result := code;
 If code < 0 Then
  Raise Exception.Create(string(_z_errmsg[2 - code]));
End;

Function ZDecompressCheckWithoutBufferError(Code: Integer): Integer;
Begin
 Result := code;
 If code < 0 Then
  If (code <> Z_BUF_ERROR) Then
   Raise Exception.Create(string(_z_errmsg[2 - code]));
end;

Function ZCompressCheckWithoutBufferError(code: Integer): Integer;
Begin
 Result := code;
 If code < 0 Then
  If (code <> Z_BUF_ERROR) Then
   Raise Exception.Create(string(_z_errmsg[2 - code]));
End;

Function inflateInit(Var strm: z_stream): Integer;
Begin
 Result := inflateInit_(strm, ZLIB_VERSION, SizeOf(z_stream));
End;

Procedure ZCompressStream(inStream,
                          outStream : TStream;
                          level     : TZCompressionLevel);
Const
 bufferSize = 32768;
Var
 zstream   : TZStreamRec;
 zresult,
 inSize,
 outSize   : Integer;
 inBuffer,
 outBuffer : TBytes;
Begin
 SetLength(inBuffer,  BufferSize);
 SetLength(outBuffer, BufferSize);
 FillChar (zstream,   SizeOf(TZStreamRec), 0);
 ZCompressCheck(DeflateInit(zstream, ZLevels[level]));
 Try
  inSize := inStream.Read(inBuffer, bufferSize);
  While inSize > 0 Do
   Begin
    zstream.next_in    := @inBuffer[0];
    zstream.avail_in   := inSize;
    Repeat
     zstream.next_out  := @outBuffer[0];
     zstream.avail_out := bufferSize;
     ZCompressCheckWithoutBufferError(deflate(zstream, Z_NO_FLUSH));
     outSize           := bufferSize - zstream.avail_out;
     outStream.Write(outBuffer, outSize);
    Until (zstream.avail_in = 0) and (zstream.avail_out > 0);
    inSize := inStream.Read(inBuffer, bufferSize);
   End;
  Repeat
   zstream.next_out  := @outBuffer[0];
   zstream.avail_out := bufferSize;
   zresult           := ZCompressCheck(deflate(zstream, Z_FINISH));
   outSize           := bufferSize - zstream.avail_out;
   outStream.Write(outBuffer, outSize);
  Until (zresult = Z_STREAM_END) and (zstream.avail_out > 0);
 Finally
  ZCompressCheck(deflateEnd(zstream));
 End;
End;

Procedure ZDecompressStream(inStream,
                            outStream : TStream);
Const
 bufferSize = 32768;
Var
 zstream   : TZStreamRec;
 inSize,
 outSize,
 zresult   : Integer;
 inBuffer,
 outBuffer : TBytes;
Begin
 SetLength(inBuffer,  BufferSize);
 SetLength(outBuffer, BufferSize);
 FillChar (zstream,   SizeOf(TZStreamRec), 0);
 ZDecompressCheck(InflateInit(zstream));
 Try
  inSize := inStream.Read(inBuffer, bufferSize);
  While inSize > 0 Do
   Begin
    zstream.next_in    := @inBuffer[0];
    zstream.avail_in   := inSize;
    Repeat
     zstream.next_out  := @outBuffer[0];
     zstream.avail_out := bufferSize;
     ZDecompressCheckWithoutBufferError(inflate(zstream, Z_NO_FLUSH));
     outSize           := bufferSize - zstream.avail_out;
     outStream.Write(outBuffer, outSize);
    Until (zstream.avail_in = 0) and (zstream.avail_out > 0);
    inSize := inStream.Read(inBuffer, bufferSize);
   End;
  Repeat
   zstream.next_out  := @outBuffer[0];
   zstream.avail_out := bufferSize;
   zresult           := ZDecompressCheckWithoutBufferError(inflate(zstream, Z_FINISH));
   outSize           := bufferSize - zstream.avail_out;
   outStream.Write(outBuffer, outSize);
  Until (zresult = Z_STREAM_END) And (zstream.avail_out > 0);
 Finally
  ZDecompressCheck(inflateEnd(zstream));
 End;
End;

end.

