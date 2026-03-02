unit PrimeFactors;

{$mode ObjFPC}{$H+}

interface

type
  TIntArray = Array Of Integer;

function factors(
  const value   : integer
) : TIntArray;

implementation

uses SysUtils;

function factors(
  const value   : integer
) : TIntArray;
begin

  raise ENotImplemented.Create('Please implement your solution.'); result := [value];

end;

end.
