unit Transpose;

{$mode ObjFPC}{$H+}

interface

type
  TStrArray = array of string;

function transpose(const lines : TStrArray) : TStrArray;

implementation

function transpose(const lines : TStrArray) : TStrArray;
var
  r, c : integer;
  col  : string;
begin
  result := nil;
  c := 1;
  repeat
    col := '';
    for r := High(lines) downto Low(lines) do
      if c <= length(lines[r]) then
        col := lines[r][c] + col
      else if col <> '' then
        col := ' ' + col;
    inc(c);
    if col <> '' then
      insert(col, result, length(result));
  until col = '';
end;

end.
