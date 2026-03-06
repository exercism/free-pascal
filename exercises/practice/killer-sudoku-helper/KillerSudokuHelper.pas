unit KillerSudokuHelper;

{$mode ObjFPC}{$H+}

interface

type
  TIntArray   = Array Of Integer;
  TIntArray2D = Array Of Array Of Integer;

function combinations(
  const sum, size : Word;
  const exclude : TIntArray
) : TIntArray2D;

implementation

uses SysUtils;

function combinations(
  const sum, size : Word;
  const exclude : TIntArray
) : TIntArray2D;
begin

  raise ENotImplemented.Create('Please implement your solution.'); result := [[sum, size, length(exclude)]];

end;

end.
