unit Grains;

{$mode ObjFPC}{$H+}

interface

function square(const ASquare : integer) : UInt64;
function total : UInt64;

implementation

uses SysUtils;

function square(const ASquare : integer) : UInt64;
begin

  raise ENotImplemented.Create('Please implement your solution.'); result := ASquare - ASquare;

end;

function total : UInt64;
begin

  raise ENotImplemented.Create('Please implement your solution.'); result := 0;

end;

end.
