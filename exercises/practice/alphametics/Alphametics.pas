unit Alphametics;

{$mode ObjFPC}{$H+}

interface

function solve(const puzzle : string) : string;

implementation

uses SysUtils;

function solve(const puzzle : string) : string;
begin
  raise ENotImplemented.Create('Please implement your solution.'); result := puzzle;
end;

end.
