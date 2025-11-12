unit FPCUnitTestUtils;

{$MODE ObjFPC}{$H+}

interface

uses FPCUnit;

type
  TIntArray   = Array Of Integer;
  TIntArray2D = Array Of Array Of Integer;
  TStrArray   = Array Of String;

procedure TapAssertTrue(
  ACase          : TTestCase;
  const AMessage : string;
  const Expected : boolean;
  const Actual   : boolean
);

procedure TapAssertTrue(
  ACase          : TTestCase;
  const AMessage : string;
  const Expected : string;
  const Actual   : string
);

procedure TapAssertTrue(
  ACase          : TTestCase;
  const AMessage : string;
  const Expected : integer;
  const Actual   : integer
);

procedure TapAssertTrue(
  ACase          : TTestCase;
  const AMessage : string;
  const Expected : double;
  const Actual   : double;
  const epsilon  : double
);

procedure TapAssertTrue(
  ACase          : TTestCase;
  const AMessage : string;
  const Expected : TIntArray;
  const Actual   : TIntArray
);

procedure TapAssertTrue(
  ACase          : TTestCase;
  const AMessage : string;
  const Expected : TStrArray;
  const Actual   : TStrArray
);

procedure TapAssertTrue(
  ACase          : TTestCase;
  const AMessage : string;
  const Expected : TIntArray2D;
  const Actual   : TIntArray2D
);


function EncodeJsonMessage(const AMessage : string; const Expected : boolean; const Actual : boolean) : string;
function EncodeJsonMessage(const AMessage : string; const Expected : string;  const Actual : string ) : string;
function EncodeJsonMessage(const AMessage : string; const Expected : integer; const Actual : integer) : string;
function EncodeJsonMessage(const AMessage : string; const Expected : single;  const Actual : single ) : string;
function EncodeJsonMessage(const AMessage : string; const Expected : TIntArray;   const Actual : TIntArray  ) : string;
function EncodeJsonMessage(const AMessage : string; const Expected : TIntArray2D; const Actual : TIntArray2D) : string;
function EncodeJsonMessage(const AMessage : string; const Expected : TStrArray;   const Actual : TStrArray  ) : string;

implementation

uses FpJson, SysUtils, Math;

function CompareArrays(const ArrayOne, ArrayTwo : TIntArray) : boolean;
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

function CompareArrays(const ArrayOne, ArrayTwo : TStrArray) : boolean;
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

function Compare2DArrays(const ArrayOne, ArrayTwo : TIntArray2D) : boolean;
var
  i, j : integer;
begin

  if length(ArrayOne) <> length(ArrayTwo) then
    begin
      result := false;
      exit;
    end;

  for i := low(ArrayOne) to high(ArrayOne) do
    begin
      if length(ArrayOne[i]) <> length(ArrayTwo[i]) then
      begin
        result := false;
        exit;
      end;
      for j := low(ArrayOne[i]) to high(ArrayOne[i]) do
        begin
          if ArrayOne[i][j] <> ArrayTwo[i][j] then
            begin
              result := false;
              exit;
            end;
        end;
    end;

  result := true;
end;

function EncodeJsonMessage(const AMessage: string; const Expected : boolean; const Actual : boolean) : string;
var
  JObject     : TJSONObject;
  JsonMessage : string;
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
var
  JObject     : TJSONObject;
  JsonMessage : string;
begin
  JObject := TJSONObject.Create;
  JObject.Add('message', AMessage);
  JObject.Add('expected', Expected);
  JObject.Add('actual', Actual);
  JsonMessage := JObject.AsJson;
  JOBJECT.Free;
  result := JsonMessage;
end;

function EncodeJsonMessage(const AMessage : string; const Expected : integer; const Actual : integer) : string;
var
  JObject     : TJSONObject;
  JsonMessage : string;
begin
  JObject := TJSONObject.Create;
  JObject.Add('message', AMessage);
  JObject.Add('expected', Expected);
  JObject.Add('actual', Actual);
  JsonMessage := JObject.AsJson;
  JOBJECT.Free;
  result := JsonMessage;
end;

function EncodeJsonMessage(const AMessage : string; const Expected : single; const Actual : single) : string;
var
  JObject     : TJSONObject;
  JsonMessage : string;
begin
  JObject := TJSONObject.Create;
  JObject.Add('message', AMessage);
  JObject.Add('expected', Expected);
  JObject.Add('actual', Actual);
  JsonMessage := JObject.AsJson;
  JOBJECT.Free;
  result := JsonMessage;
end;

function EncodeJsonMessage(const AMessage : string; const Expected : TIntArray; const Actual : TIntArray) : string;
var
  JObject     : TJSONObject;
  JArray      : TJSONArray;
  JsonMessage : string;
  i           : integer;
begin
  JObject := TJSONObject.Create;
  JObject.Add('message', AMessage);

  JArray := TJSONArray.Create;
  for i := low(Expected) to high(Expected) do
    begin
      JArray.Add(Expected[i]);
    end;
  JObject.Add('expected', JArray);

  JArray := TJSONArray.Create;
  for i := low(Actual) to high(Actual) do
    begin
      JArray.Add(Actual[i]);
    end;
  JObject.Add('actual', JArray);

  JsonMessage := JObject.AsJson;
  JOBJECT.Free;

  result := JsonMessage;
end;

function EncodeJsonMessage(const AMessage : string; const Expected : TIntArray2D; const Actual : TIntArray2D) : string;
var
  JObject     : TJSONObject;
  JOuterArray : TJSONArray;
  JInnerArray : TJSONArray;
  JsonMessage : string;
  i,j         : integer;
begin
  JObject := TJSONObject.Create;
  JObject.Add('message', AMessage);

  JOuterArray := TJSONArray.Create;
  for i := low(Expected) to high(Expected) do
    begin
      JInnerArray := TJSONArray.Create;
      for j := low(Expected[i]) to high(Expected[i]) do
        begin
          JInnerArray.Add(Expected[i][j]);
        end;
      JOuterArray.Add(JInnerArray);
    end;
  JObject.Add('expected', JOuterArray);

  JOuterArray := TJSONArray.Create;
  for i := low(Actual) to high(Actual) do
    begin
      JInnerArray := TJSONArray.Create;
      for j := low(Actual[i]) to high(Actual[i]) do
        begin
          JInnerArray.Add(Actual[i][j]);
        end;
      JOuterArray.Add(JInnerArray);
    end;
  JObject.Add('actual', JOuterArray);

  JsonMessage := JObject.AsJson;
  JOBJECT.Free;

  result := JsonMessage;
end;

function EncodeJsonMessage(const AMessage : string; const Expected : TStrArray;   const Actual : TStrArray  ) : string;
var
  JObject     : TJSONObject;
  JArray      : TJSONArray;
  JsonMessage : string;
  i           : integer;
begin
  JObject := TJSONObject.Create;
  JObject.Add('message', AMessage);

  JArray := TJSONArray.Create;
  for i := low(Expected) to high(Expected) do
    begin
      JArray.Add(Expected[i]);
    end;
  JObject.Add('expected', JArray);

  JArray := TJSONArray.Create;
  for i := low(Actual) to high(Actual) do
    begin
      JArray.Add(Actual[i]);
    end;
  JObject.Add('actual', JArray);

  JsonMessage := JObject.AsJson;
  JOBJECT.Free;

  result := JsonMessage;
end;

procedure TapAssertTrue(
  ACase          : TTestCase;
  const AMessage : string;
  const Expected : boolean;
  const Actual   : boolean
);
var JsonMsg : string;
begin
  JsonMsg := EncodeJsonMessage(AMessage, Expected, Actual);
  ACase.AssertTrue(JsonMsg, Expected = Actual);
end;

procedure TapAssertTrue(
  ACase          : TTestCase;
  const AMessage : string;
  const Expected : string;
  const Actual   : string
);
var JsonMsg : string;
begin
  JsonMsg := EncodeJsonMessage(AMessage, Expected, Actual);
  ACase.AssertTrue(JsonMsg, Expected = Actual);
end;

procedure TapAssertTrue(
  ACase          : TTestCase;
  const AMessage : string;
  const Expected : integer;
  const Actual   : integer
);
var JsonMsg : string;
begin
  JsonMsg := EncodeJsonMessage(AMessage, Expected, Actual);
  ACase.AssertTrue(JsonMsg, Expected = Actual);
end;

procedure TapAssertTrue(
  ACase          : TTestCase;
  const AMessage : string;
  const Expected : double;
  const Actual   : double;
  const epsilon  : double
);
var JsonMsg : string;
begin
  JsonMsg := EncodeJsonMessage(AMessage, Expected, Actual);
  ACase.AssertTrue(JsonMsg, SameValue(Expected, Actual, epsilon));
end;

procedure TapAssertTrue(
  ACase          : TTestCase;
  const AMessage : string;
  const Expected : TIntArray;
  const Actual   : TIntArray
);
var JsonMsg : string;
begin
  JsonMsg := EncodeJsonMessage(AMessage, Expected, Actual);
  ACase.AssertTrue(JsonMsg, CompareArrays(Expected, Actual));
end;

procedure TapAssertTrue(
  ACase          : TTestCase;
  const AMessage : string;
  const Expected : TStrArray;
  const Actual   : TStrArray
);
var JsonMsg : string;
begin
  JsonMsg := EncodeJsonMessage(AMessage, Expected, Actual);
  ACase.AssertTrue(JsonMsg, CompareArrays(Expected, Actual));
end;

procedure TapAssertTrue(
  ACase          : TTestCase;
  const AMessage : string;
  const Expected : TIntArray2D;
  const Actual   : TIntArray2D
);
var JsonMsg : string;
begin
  JsonMsg := EncodeJsonMessage(AMessage, Expected, Actual);
  ACase.AssertTrue(JsonMsg, Compare2DArrays(Expected, Actual));
end;

end.
