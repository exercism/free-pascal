unit Connect;

{$mode ObjFPC}{$H+}

interface

type
  TIntArray = Array Of Integer;
  TStrArray = Array Of String;

function Winner(
  const board : TStrArray
) : String;

implementation

uses SysUtils;

function Root(parents : TIntArray; node : Integer) : Integer;
var
  current : Integer;
  parent : Integer;
begin
  current := node;
  parent := parents[current];
  while current <> parent do
    begin
      current := parent;
      parent := parents[current];
    end;
  result := current;
end;

function Occupant(const board : TStrArray; const row, column : Integer) : Char;
begin
  if row <= high(board) then
    result := board[row][row + 2 * column + 1]
  else if column < 2 then
    result := 'O' // 0 top, 1 bottom
  else
    result := 'X'; // 2 left, 3 right
end;

procedure MarkAdjacent(parents : TIntArray; const board : TStrArray; const row1, column1, row2, column2 : Integer);
var
  columns : Integer;
  root1 : Integer;
  root2 : Integer;
begin
  if Occupant(board, row1, column1) <> Occupant(board, row2, column2) then
    Exit;

  columns := (length(board[0]) + 1) div 2;
  root1 := Root(parents, row1 * columns + column1);
  root2 := Root(parents, row2 * columns + column2);
  parents[root2] := root1;
end;

function Winner(
  const board : TStrArray
) : String;
var
  rows : Integer;
  columns : Integer;
  parents : TIntArray = ();
  i : Integer;
  j : Integer;
  k : Integer;
  roottop : Integer;
  rootbottom : Integer;
  rootleft : Integer;
  rootright : Integer;
begin
  rows := length(board);
  columns := (length(board[0]) + 1) div 2;
  for k := 0 to (rows * columns + 3) do
    insert(k, parents, k);
  for j := 0 to (columns - 1) do
    begin
      MarkAdjacent(parents, board, 0, j, rows, 0); // top edge
      MarkAdjacent(parents, board, rows - 1, j, rows, 1); // bottom edge
    end;
  for i := 0 to (rows - 1) do
    begin
      MarkAdjacent(parents, board, i, 0, rows, 2); // left edge
      MarkAdjacent(parents, board, i, columns - 1, rows, 3); // right edge
    end;

  for i := 0 to (rows - 1) do
    begin
      for j := 0 to (columns - 2) do
        MarkAdjacent(parents, board, i, j, i, j + 1); // horizontal -
    end;
  for i := 0 to (rows - 2) do
    begin
      for j := 0 to (columns - 1) do
        MarkAdjacent(parents, board, i, j, i + 1, j); // diagonal \
    end;
  for i := 0 to (rows - 2) do
    begin
      for j := 0 to (columns - 2) do
        MarkAdjacent(parents, board, i, j + 1, i + 1, j); // diagonal /
    end;


  roottop := Root(parents, rows * columns + 0);
  rootbottom := Root(parents, rows * columns + 1);
  rootleft := Root(parents, rows * columns + 2);
  rootright := Root(parents, rows * columns + 3);

  if roottop = rootbottom then
    result := 'O'
  else if rootleft = rootright then
    result := 'X'
  else
    result := '';
end;

end.
