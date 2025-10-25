unit Pangram;

{$mode ObjFPC}{$H+}

interface

function IsPangram(const sentence: string) : boolean;

implementation

type
  Letters = Array [ord('a') .. ord('z')] Of Integer;

var
  alpha    : letters;
  temp     : string;
  i, ascii : integer;

function IsPangram(const sentence: string) : boolean;
begin

  for i := low(alpha) to high(alpha) do
    alpha[i] := 0;
  temp := LowerCase(sentence);

  for i := 1 to length(temp) do
    begin
      if (temp[i] < 'a') or (temp[i] > 'z') then continue;
      ascii := ord(temp[i]);
      inc(alpha[ascii]);
    end;

  for i := low(alpha) to high(alpha) do
    if alpha[i] = 0 then exit(false);

  result := true;

end;

end.
