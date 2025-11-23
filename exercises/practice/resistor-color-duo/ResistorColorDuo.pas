unit ResistorColorDuo;

{$mode ObjFPC}{$H+}

interface

type
  TStrArray = Array Of String;

function value(const colors : TStrArray) : int8;

implementation

uses SysUtils;

function value(const colors : TStrArray) : int8;
begin

  raise ENotImplemented.Create('Please implement your solution.'); result := length(colors) * -1;

end;

end.
