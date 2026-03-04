unit Change;

{$mode ObjFPC}{$H+}

interface

type
  TIntArray = Array Of Integer;

function findFewestCoins(
  const coins : TIntArray;
  const target : Integer
) : TIntArray;

implementation

uses SysUtils;

function findFewestCoins(
  const coins : TIntArray;
  const target : Integer
) : TIntArray;
begin

  raise ENotImplemented.Create('Please implement your solution.'); result := [length(coins), target];

end;

end.
