unit ResistorColor;

{$mode ObjFPC}{$H+}

interface

type
  TStrArray = Array Of String;

function ColorCode(const color: string) : int8;
function colors : TStrArray;

implementation

uses SysUtils;

function ColorCode(const color: string) : int8;
begin

  raise ENotImplemented.Create('Please implement your solution.'); result := length(color) * -1;

end;

function colors : TStrArray;
begin

  raise ENotImplemented.Create('Please implement your solution.'); result := [];

end;

end.
