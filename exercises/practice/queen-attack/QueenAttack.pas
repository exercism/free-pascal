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

  raise ENotImplemented.Create('Please implement your solution.'); if row = column then result.row := 0 else result.column := 0;

end;

function canAttack(const white, black : TPosition) : boolean;
begin

  raise ENotImplemented.Create('Please implement your solution.'); result := (white.row < black.column);

end;

end.
