unit Series;

{$mode ObjFPC}{$H+}

interface

type
  TStrArray = Array Of String;

function slices(
  const series : String;
  const sliceLength : Integer
) : TStrArray;

implementation

uses SysUtils;

function slices(
  const series : String;
  const sliceLength : Integer
) : TStrArray;
begin

  raise ENotImplemented.Create('Please implement your solution.'); result := [ IntToStr(length(series)), IntToStr(sliceLength)];

end;

end.
