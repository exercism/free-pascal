unit Luhn;

{$mode ObjFPC}{$H+}

interface

function valid(const value : string) : boolean;

implementation

uses SysUtils, StrUtils, Character;

function valid(const value : string) : boolean;
var
  TempStr          : string;
  character        : char;
  i, j, digit, sum : integer;
begin

  TempStr := ReplaceStr(value, ' ', '');

  if TempStr = '0' then exit(false);

  sum := 0;
  j   := 1;
  for i := length(TempStr) downto 1 do
    begin
      character := copy(TempStr, i, 1)[1];
      if not(IsNumber(character)) then exit(false);
      digit := StrToInt(character);
      if j and 1 = 0 then digit *= 2;
      inc(j);
      if digit > 9 then dec(digit, 9);
      inc(sum, digit);
    end;

  result := sum mod 10 = 0;

end;

end.
