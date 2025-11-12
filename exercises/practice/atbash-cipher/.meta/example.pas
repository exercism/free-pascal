unit AtbashCipher;

{$mode ObjFPC}{$H+}

interface

function encode(const phrase : string) : string;
function decode(const phrase : string) : string;

implementation

uses SysUtils, Character;

function encode(const phrase : string) : string;
var
  i, j    : integer;
  encoded : string;
begin
  encoded := '';
  j := 0;
  for i := 1 to length(phrase) do
    begin
      if IsWhiteSpace(phrase[i]) or IsPunctuation(phrase[i]) then continue;
      inc(j);
      if IsLetter(phrase[i]) then
        encoded := encoded +
                   (char(ord('z') - (ord(LowerCase(phrase[i])) - ord('a'))))
      else
        encoded := encoded + phrase[i];
      if j mod 5 = 0 then encoded := encoded + ' ';
    end;
  encoded := TrimRight(encoded);
  result := encoded;
end;

function decode(const phrase : string) : string;
var
  i       : integer;
  decoded : string;
begin
  decoded := '';
  for i := 1 to length(phrase) do
    begin
      if IsWhiteSpace(phrase[i]) then continue;
      if IsLetter(phrase[i]) then
        decoded := decoded +
                   (char(ord('z') - (ord(LowerCase(phrase[i])) - ord('a'))))
        else
          decoded := decoded + phrase[i];
    end;
  result := decoded;
end;

end.
