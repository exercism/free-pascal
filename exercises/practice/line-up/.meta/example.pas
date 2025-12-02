unit LineUp;

{$mode ObjFPC}{$H+}

interface

function FormatMessage(
  const name : ShortString; const number : byte
) : ShortString;

implementation

uses SysUtils, Math;

function FormatMessage(
  const name : ShortString; const number : byte
) : ShortString;
var
  suffix, ordinal : ShortString;
  tmpnum          : byte;
begin
  tmpnum := IfThen(byte(number mod 100) in [11, 12, 13], number + 3, number);
  suffix := 'th';
  case tmpnum mod 10 of
    1 : suffix := 'st';
    2 : suffix := 'nd';
    3 : suffix := 'rd';
  end;
  ordinal := IntToStr(number) + suffix;
  result := format(
    '%s, you are the %s customer we serve today. Thank you!', [name, ordinal]
  );
end;

end.
