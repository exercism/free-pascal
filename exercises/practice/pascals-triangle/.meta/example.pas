unit PascalsTriangle;

{$mode ObjFPC}{$H+}

interface

type
  TIntArray2D = Array Of Array Of Integer;

function rows(const count : integer) : TIntArray2D;

implementation

function rows(const count : integer) : TIntArray2D;
var
  triangle : TIntArray2D;
  row, col : integer;
  i, j     : integer;
begin
  if count = 0 then exit([]);

  row := 0;
  col := 0;

  triangle := [];
  SetLength(triangle, count);
  SetLength(triangle[0], 1);
  triangle[row][col] := 1;

  for row := 1 to count - 1 do
    begin
      SetLength(triangle[row], row + 1);
      triangle[row][0]   := 1;
      triangle[row][row] := 1;
      if row = 1 then continue;
      j := 1;
      for i := 0 to row - 2 do
        begin
          triangle[row][j] :=
            triangle[row - 1][i] + triangle[row - 1][i + 1];
          inc(j);
        end;
    end;

  result := triangle;
end;

end.
