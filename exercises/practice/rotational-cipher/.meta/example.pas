unit RotationalCipher;

{$mode ObjFPC}{$H+}

interface

function rotate(const text : string; const shiftKey : shortint) : string;

implementation

uses SysUtils;

function rotate(const text : string; const shiftKey : shortint) : string;
var
  c           : char;
  encoded     : char;
begin
  result := '';
  for c in text do
    begin
      if (c >= 'A') and (c <= 'Z') then
        encoded := chr(((ord(c) - ord('A')) + shiftKey) mod 26 + ord('A'))
      else if (c >= 'a') and (c <= 'z') then
        encoded := chr(((ord(c) - ord('a')) + shiftKey) mod 26 + ord('a'))
      else
        encoded := c;
      result := result + encoded;
    end;
end;

end.
