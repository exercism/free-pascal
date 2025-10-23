unit CollatzConjecture;

{$mode ObjFPC}{$H+}

interface

function steps(const number: integer) : integer;

implementation

uses SysUtils;

function steps(const number: integer) : integer;
begin

  raise ENotImplemented.Create('Please implement your solution.'); result := number;

end;

end.
