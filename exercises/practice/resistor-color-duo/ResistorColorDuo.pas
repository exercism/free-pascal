unit ResistorColorDuo;

{$mode ObjFPC}{$H+}

interface

function value(colors: Array Of String) : int8;

implementation

uses SysUtils;

function value(colors: Array Of String) : int8;
begin

  raise ENotImplemented.Create('Please implement your solution.'); result := length(colors) * -1;

end;

end.
