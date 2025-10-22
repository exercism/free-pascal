unit FPCUnitTestUtils;

{$mode objfpc}

interface

function EncodeJsonMessage(const AMessage : string; Expected : boolean; Actual : boolean) : string;
function EncodeJsonMessage(const AMessage : string; Expected : string; Actual : string) : string;

implementation

uses FpJson, SysUtils;

var
  JObject     : TJSONObject;
  JsonMessage : string;

function EncodeJsonMessage(const AMessage : string; Expected : boolean; Actual : boolean) : string;
begin
  JObject := TJSONObject.Create;
  JObject.Add('message', AMessage);
  JObject.Add('expected', Expected);
  JObject.Add('actual', Actual);
  JsonMessage := JObject.AsJson;
  JOBJECT.Free;
  Result := JsonMessage;
end;

function EncodeJsonMessage(const AMessage : string; Expected : string; Actual : string) : string;
begin
  JObject := TJSONObject.Create;
  JObject.Add('message', AMessage);
  JObject.Add('expected', Expected);
  JObject.Add('actual', Actual);
  JsonMessage := JObject.AsJson;
  JOBJECT.Free;
  Result := JsonMessage;
end;

end.
