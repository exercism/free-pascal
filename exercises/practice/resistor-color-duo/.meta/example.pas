unit ResistorColorDuo;

{$mode ObjFPC}{$H+}

interface

function value(colors : Array Of String) : int8;

implementation

uses TypInfo;

type
  ColorCodes = (
    black, brown, red, orange, yellow, green, blue, violet, grey, white
 );

function value(colors : Array Of String) : int8;
begin

  result := GetEnumValue(TypeInfo(ColorCodes), colors[0]) * 10 +
            GetEnumValue(TypeInfo(ColorCodes), colors[1]);

end;

end.
