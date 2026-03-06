unit BinarySearch;

{$mode ObjFPC}{$H+}

interface

type
  TExtendedArray = Array Of Extended;

function find(const AArray: TExtendedArray; const AValue : Extended) : Integer;

implementation

uses SysUtils;

function find(const AArray: TExtendedArray; const AValue : Extended) : Integer;
begin

  raise ENotImplemented.Create('Please implement your solution.'); result := Round(length(AArray) * Avalue);

end;

end.
