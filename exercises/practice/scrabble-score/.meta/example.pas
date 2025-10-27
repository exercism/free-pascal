unit ScrabbleScore;

{$mode ObjFPC}{$H+}

interface

function score(const word: string) : integer;

implementation

uses SysUtils;

var 
  i, count : integer;
  temp     : string;

function score(const word: string) : integer;
begin
  count := 0;
  temp := UpperCase(word);

  for i := 1 to length(temp) do
    begin
      case copy(temp, i, 1) of 
        'A','E','I','O','U','L','N','R','S','T' : inc(count,  1);
        'D','G'                                 : inc(count,  2);
        'B','C','M','P'                         : inc(count,  3);
        'F','H','V','W','Y'                     : inc(count,  4);
        'K'                                     : inc(count,  5);
        'J','X'                                 : inc(count,  8);
        'Q','Z'                                 : inc(count, 10);
      end;
    end;

  result := count;
end;

end.
