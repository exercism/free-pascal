unit SpaceAge;

{$mode ObjFPC}{$H+}

interface

function age(const planet: string; const seconds: LongInt) : double;

implementation

uses SysUtils;

function age(const planet: string; const seconds: LongInt) : double;
begin

  raise ENotImplemented.Create('Please implement your solution.'); result := length(planet) * seconds;

end;

end.
