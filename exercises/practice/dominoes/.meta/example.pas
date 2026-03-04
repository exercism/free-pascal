unit Dominoes;

{$mode ObjFPC}{$H+}

interface

type
  TIntArray   = Array Of Integer;
  TIntArray2D = Array Of Array Of Integer;

function canChain(const stones : TIntArray2D) : Boolean;

implementation

uses SysUtils;

function root(const parents : TIntArray; node : Integer) : Integer;
var
  current : Integer;
begin
  current := node;
  while parents[current] <> current do
    current := parents[current];
  result := current;
end;

function canChain(const stones : TIntArray2D) : Boolean;
var
  tally : TIntArray = ();
  parents : TIntArray = ();
  i : Integer;
  j : Integer;
  k : Integer;
  count : Integer = 0;
begin
  for i := 0 to 6 do
    begin
      insert(0, tally, length(tally));
      insert(i, parents, length(parents));
    end;

  for i := low(stones) to high(stones) do
    begin
      j := stones[i][0];
      tally[j] := tally[j] + 1;
      k := stones[i][1];
      tally[k] := tally[k] + 1;

      j := root(parents, j);
      k := root(parents, k);
      parents[k] := j;
    end;

  for i := 0 to 6 do
    begin
      if tally[i] mod 2 <> 0 then
        begin
          result := false;
          exit;
        end;

      if (tally[i] > 0) and (parents[i] = i) then
        count := count + 1;
    end;

  result := (count <= 1);
end;

end.
