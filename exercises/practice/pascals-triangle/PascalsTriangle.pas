unit PascalsTriangle;

{$mode ObjFPC}{$H+}

interface

type
  TIntArray2D = Array Of Array Of Integer;

function rows(const count : integer) : TIntArray2D;

implementation

uses SysUtils;

function rows(const count : integer) : TIntArray2D;
begin

  raise ENotImplemented.Create('Please implement your solution.'); result := [[count * -1]];

end;

end.
