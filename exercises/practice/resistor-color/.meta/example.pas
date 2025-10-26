unit ResistorColor;

{$mode ObjFPC}{$H+}

interface

type
  TStrArray = Array Of String;

function ColorCode(const color: string) : int8;
function colors : TStrArray;

implementation

uses TypInfo;

type
  ColorCodes = (
    black, brown, red, orange, yellow, green, blue, violet, grey, white
  );

function ColorCode(const color: string) : int8;
begin
  result := GetEnumValue(TypeInfo(ColorCodes), color);
end;

function colors : TStrArray;
var
  i         : integer = 0;
  id        : ColorCodes;
  ColorName : string;
  ColorList : TStrArray;
begin
  ColorList := [];
  for id := low(ColorCodes) to high(ColorCodes) do
    begin
      WriteStr(ColorName, id);
      insert(ColorName, ColorList, length(ColorList));
      inc(i);
    end;
  result := ColorList;
end;

end.
