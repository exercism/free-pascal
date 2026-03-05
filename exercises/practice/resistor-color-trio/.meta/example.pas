unit ResistorColorTrio;

{$mode ObjFPC}{$H+}

interface

type
  TStrArray = Array Of String;

function resistance(const colors : TStrArray) : String;

implementation

uses TypInfo, SysUtils;

type
  ColorCodes = (
    black, brown, red, orange, yellow, green, blue, violet, grey, white
  );

function ColorCode(const color : string) : Int8;
begin
  result := GetEnumValue(TypeInfo(ColorCodes), color);
end;

function resistance(const colors : TStrArray) : String;
const
  units : TStrArray = (' ohms', ' kiloohms', ' megaohms', ' gigaohms');
var
  first : Int8;
  second : Int8;
  third : Int8;
begin
  first := ColorCode(colors[0]);
  second := ColorCode(colors[1]);
  third := ColorCode(colors[2]) + 1;

  case (third mod 3) of
    0:
      if second = 0 then
        result := Format('%d', [first])
      else
        result := Format('%d.%d', [first, second]);
    1:
      if first = 0 then
        result := Format('%d', [second])
      else
        result := Format('%d%d', [first, second]);
  else
    result := Format('%d%d0', [first, second]);
  end;

  result := result + units[third div 3];
end;

end.
