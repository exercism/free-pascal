unit SpiralMatrix;

{$mode ObjFPC}{$H+}

interface

type
  TIntMatrix = Array Of Array Of Integer;

function SpiralMatrix(const size : uint8) : TIntMatrix;

implementation

uses SysUtils;

function SpiralMatrix(const size : uint8) : TIntMatrix;
var
  LMatrix          : Array Of Array Of Integer = (());
  row, col, number : integer;
  direction        : integer;
begin
  SetLength(LMatrix, size);
  for row := 0 to size - 1 do
    begin
      SetLength(LMatrix[row], size);
      for col := 0 to size - 1 do LMatrix[row][col] := -1;
    end;

  row       := 0;
  col       := 0;
  direction := 1;
  number    := 1;
  while number <= size * size do
    begin
      LMatrix[row][col] := number;
      inc(number);

      if ((direction = 1) and
          ((col = size - 1) or (LMatrix[row][col+1] <> -1))) or
         ((direction = 2) and
          ((row = size - 1) or (LMatrix[row+1][col] <> -1))) or
         ((direction = 3) and ((col = 0) or (LMatrix[row][col-1] <> -1 ))) or
         ((direction = 4) and ((row = 0) or (LMatrix[row-1][col] <> -1))) then
        begin
          inc(direction);
          if direction > 4 then direction := 1;
        end;

      case direction of
        1 : inc(col);
        2 : inc(row);
        3 : dec(col);
        4 : dec(row);
      end;
    end;

  result := LMatrix;
end;

end.
