unit SquareRoot;

{$mode ObjFPC}{$H+}

interface

function SquareRoot(const radicand : integer) : integer;

implementation

function SquareRoot(const radicand : integer) : integer;
var
  i, j, mid : integer;
begin
  i := 0;
  j := radicand;

  repeat
    mid := (i + j) div 2;
    if mid * mid < radicand then
      i := mid + 1
    else if mid * mid > radicand then
      j := mid - 1
    else break;
  until (i + j < 0);

  result := mid;
end;

end.
