unit PrimeFactors;

{$mode ObjFPC}{$H+}

interface

type
  TIntArray = Array Of Integer;

function factors(
  const value   : integer
) : TIntArray;

implementation

uses SysUtils;

function factors(
  const value   : integer
) : TIntArray;
var
  n : integer;
  p : integer = 2;
begin
  result := [];

  n := value;
  while n > 1 do
    if n mod p <> 0 then
      p := p + 1
    else
      begin
        insert(p, result, length(result));
        n := n div p;
      end;
end;

end.
