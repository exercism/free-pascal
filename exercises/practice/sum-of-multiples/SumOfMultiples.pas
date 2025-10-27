unit SumOfMultiples;

{$mode ObjFPC}{$H+}

interface

function sum(const factors: Array Of Integer; const limit: integer) : integer;

implementation

uses SysUtils;

function sum(const factors: Array Of Integer; const limit: integer) : integer;
begin

  raise ENotImplemented.Create('Please implement your solution.'); result := length(factors) * limit * -1;

end;

end.
