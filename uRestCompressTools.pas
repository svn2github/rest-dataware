unit uRestCompressTools;

Interface

Uses
 System.SysUtils, System.Types, System.Classes, IPPeerClient, REST.Client,
 System.Zlib, IdBaseComponent, IdException, IdZLibCompressorBase, IdCompressorZLib;

 Type // protected mode work around
  TProtectedRESTResponse = Class(TRESTResponse)
  Public
   Class Procedure DecodeRestResponse(ARestResponse: TRESTResponse);
 End;

Implementation

Class Procedure TProtectedRESTResponse.DecodeRestResponse(ARestResponse : TRESTResponse);
Var
 LCompressed   : TMemoryStream;
 LDecompressed : TStringStream;
 LDecompress   : TIdCompressorZLib;
Begin
 If Length(ARestResponse.ContentEncoding) = 0 Then Exit;
 LCompressed := nil;
 LDecompressed := nil;
 LDecompress := nil;
 Try
  LCompressed   := TMemoryStream.Create;
  LDecompressed := TStringStream.Create;
  LCompressed.WriteData(ARESTResponse.RawBytes, Length(ARESTResponse.RawBytes));
  LCompressed.Position := 0;
  // Use the Indy decompression libraries because the HTTP stream doesn't
  //   have the proper headers that System.ZLib looks for.
  LDecompress   := TIdCompressorZLib.Create();
  If ARestResponse.ContentEncoding = 'gzip' Then
   LDecompress.DecompressGZipStream(LCompressed, LDecompressed)
  Else if ARestResponse.ContentEncoding = 'deflate' Then
   Begin
    // Due to variations in the deflate server side implementations,
    //   this rarely works, but is here for completeness and just in case
    LDecompress.DecompressHTTPDeflate(LCompressed, LDecompressed);
   End;
  TProtectedRESTResponse(ARESTResponse).SetContent(LDecompressed.DataString);
 Finally
  LDecompressed.Free;
  LCompressed.Free;
  LDecompress.Free;
 End;
End;

end.
