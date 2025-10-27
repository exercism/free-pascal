unit SumOfMultiples;

{$mode ObjFPC}{$H+}

interface

function sum(const factors: Array Of Integer; const limit: integer) : integer;

implementation

function sum(const factors: Array Of Integer; const limit: integer) : integer;
var
  idx, i, j, acc : integer;
  exists         : boolean;
  multiples      : Array Of Integer;
begin
  multiples := [];
  for idx := low(factors) to high(factors) do
    begin
      if factors[idx] = 0 then continue;
      for i := factors[idx] to limit - 1 do
        if i mod factors[idx] = 0 then
          begin
            exists := false;
            for j := low(multiples) to high(multiples) do
              if multiples[j] = i then
              begin
                exists := true;
                break;
              end;
            if not exists then insert(i, multiples, 0);
          end;
    end;
  acc := 0;
  for idx := low(multiples) to high(multiples) do
    acc := acc + multiples[idx];
  result := acc;
end;

end.
