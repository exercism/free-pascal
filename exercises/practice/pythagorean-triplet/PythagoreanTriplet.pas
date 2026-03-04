unit PythagoreanTriplet;

{$mode ObjFPC}{$H+}

interface

type
  TIntArray   = Array Of Integer;
  TIntArray2D = Array Of Array Of Integer;

function tripletsWithSum(const n : Integer) : TIntArray2D;

implementation

uses SysUtils;

function tripletsWithSum(const n : Integer) : TIntArray2D;
begin

  raise ENotImplemented.Create('Please implement your solution.'); result := [[n]];

end;

end.
