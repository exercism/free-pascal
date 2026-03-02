unit Sieve;

{$mode ObjFPC}{$H+}

interface

type
  TIntArray = Array Of Integer;
  TBoolArray = Array Of Boolean;

function primes(
  const limit   : Integer
) : TIntArray;

implementation

uses SysUtils;

function primes(
  const limit   : Integer
) : TIntArray;
var
  table : TBoolArray = ();
  p : Integer;
  n : Integer;
begin
  SetLength(table, limit + 1);
  for n := Low(table) to High(table) do
    table[n] := true;

  result := [];
  for p := 2 to limit do
    if table[p] then
      begin
        insert(p, result, Length(result));

        n := p * p;
        while n <= limit do
          begin
            table[n] := false;
            n := n + p;
          end;
      end;
end;

end.
