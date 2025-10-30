unit Hamming;

{$mode ObjFPC}{$H+}

interface

function distance(const strand1 : string; const strand2 : string) : integer;

implementation

uses SysUtils;

var
  i, count : integer;

function distance(const strand1 : string; const strand2 : string) : integer;
begin
  if length(strand1) <> length(strand2) then
    raise Exception.Create('strands must be of equal length');

  count := 0;
  for i := 1 to length(strand1) do
    if copy(strand1, i, 1) <> copy(strand2, i, 1) then inc(count);

  result := count;
end;

end.
