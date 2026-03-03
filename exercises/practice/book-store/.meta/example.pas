unit BookStore;

{$mode ObjFPC}{$H+}

interface

function total(const basket : Array Of Smallint) : integer;

implementation

uses Math, SysUtils;

function total(const basket : Array Of Smallint) : integer;
var
  tally : Array Of Integer = ();
  i : Integer;
  j : Integer;
  temp : Integer;
begin
  for i := 0 to 5 do
    insert(0, tally, length(tally));

  for i := low(basket) to high(basket) do
    tally[basket[i]] := tally[basket[i]] + 1;

  for i := 4 downto 1 do
    for j := i to 4 do
      if tally[j] < tally[j + 1] then
        begin
          temp := tally[j];
          tally[j] := tally[j + 1];
          tally[j + 1] := temp;
        end;

  for i := 1 to 4 do
    tally[i] := tally[i] - tally[i + 1];

  temp := min(tally[3], tally[5]);
  tally[3] := tally[3] - temp;
  tally[5] := tally[5] - temp;
  tally[4] := tally[4] + 2 * temp;

  result := 5 * 600 * tally[5] + 4 * 640 * tally[4] + 3 * 720 * tally[3] + 2 * 760 * tally[2] + 1 * 800 * tally[1];
end;

end.
