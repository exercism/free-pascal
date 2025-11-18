unit FlowerField;

{$mode ObjFPC}{$H+}

interface

function annotate(const garden : string) : string;

implementation

uses SysUtils;

function annotate(const garden : string) : string;
var
  i, j, LineLength, count : integer;
  idx                     : Array[0..7] Of Integer = (0, 0, 0, 0, 0, 0, 0, 0);
begin
  result := garden;
  LineLength := pos(#10, result);
  if LineLength = 0 then LineLength := length(result);
  for i := 1 to length(result) do
    begin
      if result[i] <> ' ' then continue;
      idx[0] := i - 1;
      idx[1] := i + 1;
      idx[2] := i + LineLength;
      idx[3] := i - LineLength;
      idx[4] := i + 1 + LineLength;
      idx[5] := i - 1 + LineLength;
      idx[6] := i + 1 - LineLength;
      idx[7] := i - 1 - LineLength;
      count := 0;
      for j in idx do
        begin
          if (j < 1) or (j > length(result)) or (result[j] <> '*') then
            continue;
          inc(count);
        end;
      if count > 0 then result[i] := IntToStr(count)[1];
    end;
end;

end.
