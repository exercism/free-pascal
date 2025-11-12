unit SpiralMatrix;

{$mode ObjFPC}{$H+}

interface

type
  TIntMatrix = Array Of Array Of Integer;

function SpiralMatrix(const size : uint8) : TIntMatrix;

implementation

uses SysUtils;

function SpiralMatrix(const size : uint8) : TIntMatrix;
begin

  raise ENotImplemented.Create('Please implement your solution.'); result := [[size]];

end;

end.
