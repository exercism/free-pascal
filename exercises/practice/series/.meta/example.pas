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
var
  index : Integer;
begin
  if length(series) = 0 then
    raise Exception.Create('series cannot be empty');
  if sliceLength < 0 then
    raise Exception.Create('slice length cannot be negative');
  if sliceLength = 0 then
    raise Exception.Create('slice length cannot be zero');
  if sliceLength > length(series) then
    raise Exception.Create('slice length cannot be greater than series length');

  result := [];
  for index := 1 to length(series) + 1 - sliceLength do
    insert(Copy(series, index, sliceLength), result, length(result));
end;

end.
