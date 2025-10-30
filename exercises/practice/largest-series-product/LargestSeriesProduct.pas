unit LargestSeriesProduct;

{$mode ObjFPC}{$H+}

interface

function LargestProduct(const digits : string; const span : integer) : integer;

implementation

uses SysUtils;

function LargestProduct(const digits : string; const span : integer) : integer;
begin

  raise ENotImplemented.Create('Please implement your solution.'); result := length(digits) * span * -1;

end;

end.
