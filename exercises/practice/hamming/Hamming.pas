unit Hamming;

{$mode ObjFPC}{$H+}

interface

function distance(const strand1: string; const strand2: string) : integer;

implementation

uses SysUtils;

function distance(const strand1: string; const strand2: string) : integer;
begin

  raise ENotImplemented.Create('Please implement your solution.'); result := length(strand1) + length(strand2);

end;

end.
