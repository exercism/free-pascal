unit AffineCipher;

{$mode ObjFPC}{$H+}

interface

function encode(const phrase : string; const a, b : longword) : string;
function decode(const phrase : string; const a, b : longword) : string;

implementation

uses SysUtils;

function inverse(const a : longword) : longword;
begin
  result := 0;
  if a = 1 then result := 1;
  if a = 3 then result := 9;
  if a = 5 then result := 21;
  if a = 7 then result := 15;
  if a = 9 then result := 3;
  if a = 11 then result := 19;
  if a = 15 then result := 7;
  if a = 17 then result := 23;
  if a = 19 then result := 11;
  if a = 21 then result := 5;
  if a = 23 then result := 17;
  if a = 25 then result := 25;
  if result = 0 then
    raise Exception.Create('a and m must be coprime.');
end;

function process(const phrase : string; const a, b : longword; group : integer) : string;
var
  c           : char;
  encoded     : char;
  remaining   : integer;
begin
  remaining := group;
  result := '';
  for c in phrase do
    begin
      if (c >= '0') and (c <= '9') then
        encoded := c
      else if (c >= 'A') and (c <= 'Z') then
        encoded := chr(((ord(c) - ord('A')) * a + b) mod 26 + ord('a'))
      else if (c >= 'a') and (c <= 'z') then
        encoded := chr(((ord(c) - ord('a')) * a + b) mod 26 + ord('a'))
      else
        continue;

      if remaining = 0 then
        begin
          result := result + ' ';
          remaining := group;
        end;

      result := result + encoded;
      remaining := remaining - 1;
    end;
end;

function encode(const phrase : string; const a, b : longword) : string;
begin
  inverse(a);
  result := process(phrase, a, b, 5);
end;

function decode(const phrase : string; const a, b : longword) : string;
var
  inv         : longword;
begin
  inv := inverse(a);
  result := process(phrase, inv, (26 - inv) * b, -1);
end;

end.
