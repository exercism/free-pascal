unit FPCUnitTestUtils;

{$MODE ObjFPC}{$H+}

{$WARN 4046 OFF}
{$WARN 5024 OFF}
{$WARN 5062 OFF}
{$WARN 5071 OFF}
{$WARN 6058 OFF}

interface

uses FPCUnit, Generics.Collections;

type
  TIntArray   = Array Of Integer;
  TIntArray2D = Array Of Array Of Integer;
  TStrArray   = Array Of String;
  TCharIntDict = Specialize TDictionary<Char, Integer>;

procedure TapAssertTrue(
  ACase          : TTestCase;
  const AMessage : string;
  const Expect   : boolean;
  const Actual   : boolean
);

procedure TapAssertTrue(
  ACase          : TTestCase;
  const AMessage : string;
  const Expect   : string;
  const Actual   : string
);

procedure TapAssertTrue(
  ACase          : TTestCase;
  const AMessage : string;
  const Expect   : integer;
  const Actual   : integer
);

procedure TapAssertTrue(
  ACase          : TTestCase;
  const AMessage : string;
  const Expect   : UInt64;
  const Actual   : UInt64
);

procedure TapAssertTrue(
  ACase          : TTestCase;
  const AMessage : string;
  const Expect   : double;
  const Actual   : double;
  const epsilon  : double
);

procedure TapAssertTrue(
  ACase          : TTestCase;
  const AMessage : string;
  const Expect   : TIntArray;
  const Actual   : TIntArray
);

procedure TapAssertTrue(
  ACase          : TTestCase;
  const AMessage : string;
  const Expect   : TStrArray;
  const Actual   : TStrArray
);

procedure TapAssertTrue(
  ACase          : TTestCase;
  const AMessage : string;
  const Expect   : TIntArray2D;
  const Actual   : TIntArray2D
);

procedure TapAssertTrue(
  ACase          : TTestCase;
  const AMessage : string;
  const Expect   : TCharIntDict;
  const Actual   : TCharIntDict
);

function EncodeJsonMessage(const AMessage : string; const Expect, Actual : boolean) : string;
function EncodeJsonMessage(const AMessage : string; const Expect, Actual : string ) : string;
function EncodeJsonMessage(const AMessage : string; const Expect, Actual : integer) : string;
function EncodeJsonMessage(const AMessage : string; const Expect, Actual : UInt64)  : string;
function EncodeJsonMessage(const AMessage : string; const Expect, Actual : single ) : string;
function EncodeJsonMessage(const AMessage : string; const Expect, Actual : TIntArray  ) : string;
function EncodeJsonMessage(const AMessage : string; const Expect, Actual : TIntArray2D) : string;
function EncodeJsonMessage(const AMessage : string; const Expect, Actual : TStrArray  ) : string;

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

function CompareTDictionaries(const DictOne, DictTwo : TCharIntDict) : boolean;
var
  key    : char;
  { KvPair : TCharIntDict.TDictionaryPair; }
begin
  if DictOne.Count <> DictTwo.Count then
    begin
      result := false;
      exit;
    end;
  for key in DictOne.Keys do
    begin
      if not(DictTwo.ContainsKey(key)) or (DictTwo[key] <> DictOne[key]) then
        begin
          result := false;
          exit;
        end;
    end;
  result := true;
end;

function EncodeJsonMessage(const AMessage: string; const Expect, Actual : boolean) : string;
var
  JObject     : TJSONObject;
  JsonMessage : string;
begin
  JObject := TJSONObject.Create;
  JObject.Add('message', AMessage);
  JObject.Add('expect', Expect);
  JObject.Add('actual', Actual);
  JsonMessage := JObject.AsJson;
  JObject.Free;
  result := JsonMessage;
end;

function EncodeJsonMessage(const AMessage : string; const Expect, Actual : string) : string;
var
  JObject     : TJSONObject;
  JsonMessage : string;
begin
  JObject := TJSONObject.Create;
  JObject.Add('message', AMessage);
  JObject.Add('expect', Expect);
  JObject.Add('actual', Actual);
  JsonMessage := JObject.AsJson;
  JObject.Free;
  result := JsonMessage;
end;

function EncodeJsonMessage(const AMessage : string; const Expect, Actual : integer) : string;
var
  JObject     : TJSONObject;
  JsonMessage : string;
begin
  JObject := TJSONObject.Create;
  JObject.Add('message', AMessage);
  JObject.Add('expect', Expect);
  JObject.Add('actual', Actual);
  JsonMessage := JObject.AsJson;
  JObject.Free;
  result := JsonMessage;
end;

function EncodeJsonMessage(const AMessage : string; const Expect, Actual : UInt64) : string;
var
  JObject     : TJSONObject;
  JsonMessage : string;
begin
  JObject := TJSONObject.Create;
  JObject.Add('message', AMessage);
  JObject.Add('expect', Expect);
  JObject.Add('actual', Actual);
  JsonMessage := JObject.AsJson;
  JObject.Free;
  result := JsonMessage;
end;

function EncodeJsonMessage(const AMessage : string; const Expect, Actual : single) : string;
var
  JObject     : TJSONObject;
  JsonMessage : string;
begin
  JObject := TJSONObject.Create;
  JObject.Add('message', AMessage);
  JObject.Add('expect', Expect);
  JObject.Add('actual', Actual);
  JsonMessage := JObject.AsJson;
  JObject.Free;
  result := JsonMessage;
end;

function EncodeJsonMessage(const AMessage : string; const Expect, Actual : TIntArray) : string;
var
  JObject     : TJSONObject;
  JArray      : TJSONArray;
  JsonMessage : string;
  i           : integer;
begin
  JObject := TJSONObject.Create;
  JObject.Add('message', AMessage);

  JArray := TJSONArray.Create;
  for i := low(Expect) to high(Expect) do
    begin
      JArray.Add(Expect[i]);
    end;
  JObject.Add('expect', JArray);

  JArray := TJSONArray.Create;
  for i := low(Actual) to high(Actual) do
    begin
      JArray.Add(Actual[i]);
    end;
  JObject.Add('actual', JArray);

  JsonMessage := JObject.AsJson;
  JObject.Free;

  result := JsonMessage;
end;

function EncodeJsonMessage(const AMessage : string; const Expect, Actual : TIntArray2D) : string;
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
  for i := low(Expect) to high(Expect) do
    begin
      JInnerArray := TJSONArray.Create;
      for j := low(Expect[i]) to high(Expect[i]) do
        begin
          JInnerArray.Add(Expect[i][j]);
        end;
      JOuterArray.Add(JInnerArray);
    end;
  JObject.Add('expect', JOuterArray);

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
  JObject.Free;

  result := JsonMessage;
end;

function EncodeJsonMessage(const AMessage : string; const Expect, Actual : TStrArray  ) : string;
var
  JObject     : TJSONObject;
  JArray      : TJSONArray;
  JsonMessage : string;
  i           : integer;
begin
  JObject := TJSONObject.Create;
  JObject.Add('message', AMessage);

  JArray := TJSONArray.Create;
  for i := low(Expect) to high(Expect) do
    begin
      JArray.Add(Expect[i]);
    end;
  JObject.Add('expect', JArray);

  JArray := TJSONArray.Create;
  for i := low(Actual) to high(Actual) do
    begin
      JArray.Add(Actual[i]);
    end;
  JObject.Add('actual', JArray);

  JsonMessage := JObject.AsJson;
  JObject.Free;

  result := JsonMessage;
end;


function EncodeJsonMessage(const AMessage : string; const Expect, Actual : TCharIntDict) : string;
var
  JObject     : TJSONObject;
  JsonMessage : string;
  JExpect     : TJSONObject;
  JActual     : TJSONObject;
  KvPair      : TCharIntDict.TDictionaryPair;
begin
  JObject := TJSONObject.Create;
  JObject.Add('message', AMessage);

  JExpect := TJSONObject.Create;
  for KvPair in Expect do JExpect.Add(KvPair.Key, KvPair.Value);
  JObject.Add('expect', JExpect);

  JActual := TJSONObject.Create;
  for KvPair in Actual do JActual.Add(KvPair.Key, KvPair.Value);
  JObject.Add('actual', JActual);

  JsonMessage := JObject.AsJson;
  JObject.Free;
  result := JsonMessage;
end;

procedure TapAssertTrue(
  ACase          : TTestCase;
  const AMessage : string;
  const Expect   : boolean;
  const Actual   : boolean
);
var JsonMsg : string;
begin
  JsonMsg := EncodeJsonMessage(AMessage, Expect, Actual);
  ACase.AssertTrue(JsonMsg, Expect = Actual);
end;

procedure TapAssertTrue(
  ACase          : TTestCase;
  const AMessage : string;
  const Expect   : string;
  const Actual   : string
);
var JsonMsg : string;
begin
  JsonMsg := EncodeJsonMessage(AMessage, Expect, Actual);
  ACase.AssertTrue(JsonMsg, Expect = Actual);
end;

procedure TapAssertTrue(
  ACase          : TTestCase;
  const AMessage : string;
  const Expect   : integer;
  const Actual   : integer
);
var JsonMsg : string;
begin
  JsonMsg := EncodeJsonMessage(AMessage, Expect, Actual);
  ACase.AssertTrue(JsonMsg, Expect = Actual);
end;

procedure TapAssertTrue(
  ACase          : TTestCase;
  const AMessage : string;
  const Expect   : UInt64;
  const Actual   : UInt64
);
var JsonMsg : string;
begin
  JsonMsg := EncodeJsonMessage(AMessage, Expect, Actual);
  ACase.AssertTrue(JsonMsg, Expect = Actual);
end;


procedure TapAssertTrue(
  ACase          : TTestCase;
  const AMessage : string;
  const Expect   : double;
  const Actual   : double;
  const epsilon  : double
);
var JsonMsg : string;
begin
  JsonMsg := EncodeJsonMessage(AMessage, Expect, Actual);
  ACase.AssertTrue(JsonMsg, SameValue(Expect, Actual, epsilon));
end;

procedure TapAssertTrue(
  ACase          : TTestCase;
  const AMessage : string;
  const Expect   : TIntArray;
  const Actual   : TIntArray
);
var JsonMsg : string;
begin
  JsonMsg := EncodeJsonMessage(AMessage, Expect, Actual);
  ACase.AssertTrue(JsonMsg, CompareArrays(Expect, Actual));
end;

procedure TapAssertTrue(
  ACase          : TTestCase;
  const AMessage : string;
  const Expect   : TStrArray;
  const Actual   : TStrArray
);
var JsonMsg : string;
begin
  JsonMsg := EncodeJsonMessage(AMessage, Expect, Actual);
  ACase.AssertTrue(JsonMsg, CompareArrays(Expect, Actual));
end;

procedure TapAssertTrue(
  ACase          : TTestCase;
  const AMessage : string;
  const Expect   : TIntArray2D;
  const Actual   : TIntArray2D
);
var JsonMsg : string;
begin
  JsonMsg := EncodeJsonMessage(AMessage, Expect, Actual);
  ACase.AssertTrue(JsonMsg, Compare2DArrays(Expect, Actual));
end;

procedure TapAssertTrue(
  ACase          : TTestCase;
  const AMessage : string;
  const Expect   : TCharIntDict;
  const Actual   : TCharIntDict
);
var JsonMsg : string;
begin
  JsonMsg := EncodeJsonMessage(AMessage, Expect, Actual);
  ACase.AssertTrue(JsonMsg, CompareTDictionaries(Expect, Actual));
end;

end.
