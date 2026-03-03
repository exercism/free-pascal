unit Rectangles;

{$mode ObjFPC}{$H+}

interface

type
  TStrArray = Array Of String;

function rectangles(
  const strings : TStrArray
) : Integer;

implementation

uses SysUtils;

function rectangles(
  const strings : TStrArray
) : Integer;
begin

  raise ENotImplemented.Create('Please implement your solution.'); result := length(strings);

end;

end.
