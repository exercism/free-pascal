unit FPCUnitTestUtils;

{$mode objfpc}

interface

type
  IntArray = Array Of Integer;

function CompareArrays(const ArrayOne, ArrayTwo : IntArray) : boolean;
function EncodeJsonMessage(const AMessage : string; const Expected : boolean; const Actual : boolean) : string;
function EncodeJsonMessage(const AMessage : string; const Expected : string; const Actual : string) : string;
function EncodeJsonMessage(const AMessage : string; const Expected : IntArray; const Actual : IntArray) : string;

implementation

uses FpJson, SysUtils;

var
  JObject     : TJSONObject;
  JArray      : TJSONArray;
  JsonMessage : string;
  i           : integer;

function CompareArrays(const ArrayOne, ArrayTwo : IntArray) : boolean;
var
  i : integer;
begin
  if length(ArrayOne) <> length(ArrayTwo) then
    begin
      result := false;
      exit;
    end;
  for i := low(ArrayOne) to high(ArrayOne) do
    if ArrayOne[i] <> ArrayTwo[i] then
    begin
      result := false;
      exit;
    end;
  result := true;  
end;

function EncodeJsonMessage(const AMessage: string; const Expected : boolean; const Actual : boolean) : string;
begin
  JObject := TJSONObject.Create;
  JObject.Add('message', AMessage);
  JObject.Add('expected', Expected);
  JObject.Add('actual', Actual);
  JsonMessage := JObject.AsJson;
  JOBJECT.Free;
  result := JsonMessage;
end;

function EncodeJsonMessage(const AMessage : string; const Expected : string; const Actual : string) : string;
begin
  JObject := TJSONObject.Create;
  JObject.Add('message', AMessage);
  JObject.Add('expected', Expected);
  JObject.Add('actual', Actual);
  JsonMessage := JObject.AsJson;
  JOBJECT.Free;
  result := JsonMessage;
end;

function EncodeJsonMessage(const AMessage : string; const Expected : IntArray; const Actual : IntArray) : string;
begin

  JObject := TJSONObject.Create;
  JObject.Add('message', AMessage);

  JArray := TJSONArray.Create;

  for i := low(Expected) to high(Expected) do
    begin
      JArray.Add(Expected[i]);
    end;
  if (length(Expected) > 1) and (length(JArray.asJSON) > 70) then
    JObject.Add('expected', JArray.FormatJSON)
  else
    JObject.Add('expected', JArray.asJSON);

  JArray.Clear;

  for i := low(Actual) to high(Actual) do
    begin
      JArray.Add(Actual[i]);
    end;
  if (length(actual) > 1) and (length(JArray.asJSON) > 70) then
    JObject.Add('actual', JArray.FormatJSON)
  else
    JObject.Add('actual', JArray.asJSON);

  JArray.Free;

  JsonMessage := JObject.AsJson;
  JOBJECT.Free;

  result := JsonMessage;

end;

end.
