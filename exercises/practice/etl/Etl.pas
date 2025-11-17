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
begin

  raise ENotImplemented.Create('Please implement your solution.'); result := TCharIntDict.Create; result.Add(char(32), legacy.Count);
end;

end.
