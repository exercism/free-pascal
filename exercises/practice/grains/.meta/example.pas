unit Grains;

{$mode ObjFPC}{$H+}

interface

function square(const ASquare : integer) : UInt64;
function total : UInt64;

implementation

uses SysUtils;

function square(const ASquare : integer) : UInt64;
var
  i : integer;
begin
  if (ASquare < 1) or (ASquare > 64) then
    raise Exception.Create('square must be between 1 and 64');
  result := 1;
  for i := 2 to ASquare do
    result := result * 2;
end;

function total : UInt64;
begin
  result := square(64) - 1;
  result := result * 2 + 1;
end;

end.
