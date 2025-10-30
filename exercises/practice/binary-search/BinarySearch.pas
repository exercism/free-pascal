unit BinarySearch;

{$mode ObjFPC}{$H+}

interface

type
  TIntArray = Array Of Integer;

function find(const AArray: TIntArray; const AValue : integer) : integer;

implementation

uses SysUtils;

function find(const AArray: TIntArray; const AValue : integer) : integer;
begin

  { raise ENotImplemented.Create('Please implement your solution.'); } result := length(AArray) * Avalue;

end;

end.
