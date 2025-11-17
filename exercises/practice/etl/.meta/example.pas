unit Etl;

{$mode ObjFPC}{$H+}

{$WARN 4046 OFF}
{$WARN 5024 OFF}
{$WARN 5062 OFF}
{$WARN 5071 OFF}
{$WARN 6058 OFF}

interface

uses Generics.Collections;

type
  TCharArray        = Array Of Char;
  TIntCharArrayDict = Specialize TDictionary<Integer, TCharArray>;
  TCharIntDict      = Specialize TDictionary<Char, Integer>;

function transform(const legacy : TIntCharArrayDict) : TCharIntDict;

implementation

uses SysUtils;

function transform(const legacy : TIntCharArrayDict) : TCharIntDict;
var
  i       : integer;
  KvPair  : TIntCharArrayDict.TDictionaryPair;
begin
  result := TCharIntDict.Create;
  for KvPair in legacy do
    for i := low(KvPair.Value) to high(KvPair.Value) do
      result.Add(LowerCase(KvPair.Value[i]), KvPair.Key);
end;

end.
