unit SquareRoot;

{$mode ObjFPC}{$H+}

interface

function SquareRoot(const radicand : integer) : integer;

implementation

uses SysUtils;

function SquareRoot(const radicand : integer) : integer;
begin

  raise ENotImplemented.Create('Please implement your solution.'); result := radicand * -1;

end;

end.
