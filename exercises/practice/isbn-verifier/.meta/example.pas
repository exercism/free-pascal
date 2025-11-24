unit IsbnVerifier;

{$mode ObjFPC}{$H+}

interface

function IsValid(const isbn : string) : boolean;

implementation

uses SysUtils, Character;

function IsValid(const isbn : string) : boolean;
var
  i, j       : integer;
  calc       : integer = 0;
  digits     : Array[0..9] Of Integer = (-1,-1,-1,-1,-1,-1,-1,-1,-1,-1);
begin
  result := true;
  j := 0;
  for i := 1 to length(isbn) do
    begin
      if isbn[i] = '-' then continue
      else if j > 9 then
        begin
          result := false;
          exit;
        end
      else if IsDigit(isbn[i]) then
        begin
          digits[j] := StrToInt(isbn[i]);
          inc(j);
        end
      else if (i = length(isbn)) and (UpperCase(isbn[i]) = 'X') then
        begin
          digits[j] := 10;
          inc(j);
        end
      else
        begin
          result := false;
          exit;
        end;
    end;
  for i := low(digits) to high(digits) do
    begin
      if digits[i] = -1 then
        begin
          result := false;
          exit;
        end
      else
        calc := calc + digits[i] * (10 - i);
    end;
  if calc mod 11 <> 0 then result := false;
end;

end.
