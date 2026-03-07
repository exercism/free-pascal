unit BinarySearch;

{$mode ObjFPC}{$H+}

interface

type
  TExtendedArray = Array Of Extended;

function find(const AArray: TExtendedArray; const AValue : Extended) : Integer;

implementation

uses SysUtils;

function find(const AArray: TExtendedArray; const AValue : Extended) : Integer;
var
  i, j, mid : integer;
  WasFound  : boolean;
begin

  if length(AArray) = 0 then
    raise Exception.Create('value not in array');

  i := 0;
  j := length(AArray) - 1;
  WasFound := False;

  repeat
    begin
      mid := (i + j) div 2;
      if AArray[mid] < AValue then
        i := mid + 1
      else if AArray[mid] > AValue then
             j := mid - 1
      else
        begin
          WasFound := true;
          break;
        end;
    end;
  until (i + j < 0) or (i > j);

  if WasFound then
    Result := mid
  else
    raise Exception.Create('value not in array');

end;

end.
