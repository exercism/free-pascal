unit Isogram;

{$mode ObjFPC}{$H+}

interface

function IsIsogram(const phrase : string) : boolean;

implementation

type
  Letters = Array [ord('a') .. ord('z')] Of Integer;

var
  alpha    : Letters;
  temp     : string;
  i, ascii : integer;

function IsIsogram(const phrase : string) : boolean;
begin

  for i := low(alpha) to high(alpha) do
    alpha[i] := 0;
  temp := LowerCase(phrase);

  for i := 1 to length(phrase) do
    begin
      if (temp[i] < 'a') or (temp[i] > 'z') then continue;
      ascii := ord(temp[i]);
      inc(alpha[ascii]);
    end;

  for i := low(alpha) to high(alpha) do
    if alpha[i] > 1 then exit(false);

  result := true;

end;

end.
