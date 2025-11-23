unit ResistorColorDuo;

{$mode ObjFPC}{$H+}

interface

type
  TStrArray = Array Of String;

function value(const colors : TStrArray) : int8;

implementation

uses SysUtils, TypInfo;

type
  ColorCodes = (
    black, brown, red, orange, yellow, green, blue, violet, grey, white
 );

function value(const colors : TStrArray) : int8;
begin
  result := GetEnumValue(TypeInfo(ColorCodes), colors[0]) * 10 +
            GetEnumValue(TypeInfo(ColorCodes), colors[1]);
end;

end.
