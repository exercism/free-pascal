unit Acronym;

{$mode ObjFPC}{$H+}

interface

function abbreviate(const phrase: string) : string;

implementation

uses StrUtils, SysUtils;

var
  temp, abbrev  :   string;
  i     : integer;
  words : array of string;

function abbreviate(const phrase: string) : string;
begin

  temp := UpperCase(DelChars(phrase, ''''));

  for i := low(temp) to high(temp) do
    begin
      if (temp[i] < 'A') or (temp[i] > 'Z') then temp[i] := ' ';
    end;

  words  := SplitString(temp, ' ');
  abbrev := '';

  for i:= low(words) to high(words) do
    abbrev := abbrev + Copy(words[i], 1, 1);

  result := abbrev;

end;

end.
