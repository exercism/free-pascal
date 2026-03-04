unit Change;

{$mode ObjFPC}{$H+}

interface

type
  TIntArray = Array Of Integer;

function findFewestCoins(
  const coins : TIntArray;
  target : Integer
) : TIntArray;

implementation

uses SysUtils;

function findFewestCoins(
  const coins : TIntArray;
  target : Integer
) : TIntArray;
var
  table : TIntArray = ();
  i : Integer;
  j : Integer;
  coin : Integer;
  best : Integer;
begin
  if target < 0 then
    raise ENotImplemented.Create('target cannot be negative');

  SetLength(table, target + 1);
  table[0] := 0;
  for i := 1 to target do
    begin
      table[i] := target + 1;
      for j := low(coins) to high(coins) do
        begin
          coin := coins[j];
          if (coin <= i) and (table[i] > table[i - coin]) then
            table[i] := table[i - coin] + 1;
        end;
    end;

  if table[target] = target + 1 then
    raise ENotImplemented.Create('cannot make target with given coins');

  result := [];
  while target > 0 do
    begin
      best := -1;
      for j := low(coins) to high(coins) do
        begin
          coin := coins[j];
          if (coin <= target) and ((best = -1) or (table[target - coin] < table[target - best])) then
            best := coin;
        end;
      insert(best, result, length(result));
      target := target - best;
    end;
end;

end.
