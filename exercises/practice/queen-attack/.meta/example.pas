unit QueenAttack;

{$mode ObjFPC}{$H+}

interface

type
  TPosition = record
    row    : 0..7;
    column : 0..7;
  end;

function create(const row, column : integer) : TPosition;
function canAttack(const white, black : TPosition) : boolean;

implementation

uses SysUtils;

function create(const row, column : integer) : TPosition;
begin
  if row < 0 then
    raise EArgumentException.Create('row not positive');
  if row > 7 then
    raise EArgumentException.Create('row not on board');
  if column < 0 then
    raise EArgumentException.Create('column not positive');
  if column > 7 then
    raise EArgumentException.Create('column not on board');

  result.row    := row;
  result.column := column;
end;

function canAttack(const white, black : TPosition) : boolean;
var
  rowDiff : integer;
  colDiff : integer;
begin
  rowDiff := white.row - black.row;
  colDiff := white.column - black.column;
  result := (rowDiff = 0)
         or (colDiff = 0)
         or (rowDiff = colDiff)
         or (rowDiff + colDiff = 0);
end;

end.
