unit Raindrops;

{$mode ObjFPC}{$H+}

interface

function convert(const number : integer) : string;

implementation

uses SysUtils;

function convert(const number : integer) : string;
begin

  raise ENotImplemented.Create('Please implement your solution.'); result := format('"%.5d"', [number]);

end;

end.
