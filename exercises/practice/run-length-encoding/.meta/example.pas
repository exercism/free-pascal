unit RunLengthEncoding;

{$mode ObjFPC}{$H+}

interface

function encode(const AString : string) : string;
function decode(const AString : string) : string;
function consistency(const AString : string) : string;

implementation

uses SysUtils, Character;

function encode(const AString : string) : string;
var
  encoded  : string = '';
  i, count : integer;
  LastChar : char;
begin
  if AString = '' then
    begin
      result := AString;
      exit;
    end;

  count    := 1;
  i        := 1;
  LastChar := AString[i];
  repeat
    begin
      inc(i);
      if (i <= length(AString)) and (LastChar = AString[i]) then
        inc(count)
      else
        begin
          if count = 1 then
            encoded := encoded + LastChar
          else
            encoded := encoded + format('%d%s', [count, LastChar]);
          if i > length(AString) then break;
          LastChar := AString[i];
          count    := 1;
        end;
    end
  until false;

  result := encoded;
end;

function decode(const AString : string) : string;
var
  decoded : string = '';
  NumStr  : string;
  i, j    : integer;
begin
  if AString = '' then
    begin
      result := AString;
      exit;
    end;

  NumStr := '';
  i := 0;
  repeat
    begin
      inc(i);
      if IsNumber(AString[i]) then
        NumStr := NumStr + AString[i]
      else
        begin
          if NumStr = '' then NumStr := '1';
          for j := 1 to StrToInt(NumStr) do
            decoded := decoded + AString[i];
          NumStr := '';
        end;
    end
  until i >= length(AString);

  result := decoded;
end;

function consistency(const AString : string) : string;
begin
  result := decode(encode(AString));
end;

end.
