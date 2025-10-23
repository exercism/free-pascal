unit Darts;

{$mode ObjFPC}{$H+}

interface

function score(const x: single; const y: single) : uint8;

implementation

uses SysUtils;

function score(const x: single; const y: single) : uint8;
begin

  raise ENotImplemented.Create('Please implement your solution.'); result := trunc(x) * trunc(y);

end;

end.
