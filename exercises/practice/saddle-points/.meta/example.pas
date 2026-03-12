unit SaddlePoints;

{$mode ObjFPC}{$H+}

interface

type
  TMatrix = array of array of integer;
  TPoint  = record
    row    : integer;
    column : integer;
  end;
  TPoints = array of TPoint;

function saddlePoints(const matrix : TMatrix) : TPoints;

implementation

function saddlePoints(const matrix : TMatrix) : TPoints;
var
  rowMax, colMin : array of integer;
  r, c           : integer;
  p              : TPoint;
begin
  result := nil;
  if (length(matrix) = 0) or (length(matrix[0]) = 0) then
    exit;

  rowMax := nil;
  SetLength(rowMax, length(matrix));
  for r := Low(matrix) to High(matrix) do
  begin
    rowMax[r] := Low(integer);
    for c := Low(matrix[r]) to High(matrix[r]) do
      if matrix[r][c] > rowMax[r] then
        rowMax[r] := matrix[r][c];
  end;

  colMin := nil;
  SetLength(colMin, length(matrix[0]));
  for c := Low(matrix[0]) to High(matrix[0]) do
  begin
    colMin[c] := High(integer);
    for r := Low(matrix) to High(matrix) do
      if matrix[r][c] < colMin[c] then
        colMin[c] := matrix[r][c];
  end;

  for r := Low(matrix) to High(matrix) do
    for c := Low(matrix[r]) to High(matrix[r]) do
      if (matrix[r][c] = rowMax[r]) and (matrix[r][c] = colMin[c]) then
        begin
          p.row    := r + 1;
          p.column := c + 1;
          insert(p, result, length(result));
        end;
end;

end.
