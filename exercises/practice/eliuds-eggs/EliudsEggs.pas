unit EliudsEggs;

{$mode ObjFPC}{$H+}

interface

function EggCount(const number : uint32) : uint8;

implementation

uses SysUtils;

function EggCount(const number : uint32) : uint8;
begin

  raise ENotImplemented.Create('Please implement your solution.'); result := number * -1;

end;

end.
