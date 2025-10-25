unit PigLatin;

{$mode ObjFPC}{$H+}

interface

function translate(const phrase : string) : string;

implementation

uses Character, StrUtils;

function IsVowel(const chr : char) : boolean;
begin
  result := chr in ['a', 'e', 'i', 'o', 'u'];
end;

function IsConsonant(const chr : char) : boolean;
begin
  result := IsLetter(chr) and not(IsVowel(chr));
end;

function translate(const phrase : string) : string;
var
  translated  : string;
  words      : Array Of String;
  i, j, clen : integer;
begin
  words := SplitString(phrase, ' ');
  for i := low(words) to high(words) do
   begin
     if IsVowel(words[i][1])          or
        (copy(words[i], 1, 2) = 'xr') or
        (copy(words[i], 1, 2) = 'yt') then
       words[i] := words[i] + 'ay'
    else if IsConsonant(words[i][1]) then
    begin
      clen := 1;
      for j := 2 to length(words[i]) do
      begin
        if IsConsonant(words[i][j]) and
          (words[i][j] <> 'y') then
          inc(clen)
        else break;
      end;
      if (copy(words[i], clen, 2) = 'qu') then inc(clen);
      words[i] := copy(words[i], clen + 1) +
                  copy(words[i], 1, clen)  +
                  'ay';
    end;
  end;

  translated := '';
  for i := low(words) to high(words) do
    if translated = '' then translated := words[i]
    else translated := translated + ' ' + words[i];

  result := translated;
end;

end.
