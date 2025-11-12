unit BottleSong;

{$mode ObjFPC}{$H+}

interface

function recite(const StartBottle : integer; const TakeDown : integer) : string;

implementation

uses SysUtils, Classes;

function recite(const StartBottle : integer; const TakeDown : integer) : string;
const
  BOTTLE_NUMBERS : Array[1..10] Of String = (
    'One', 'Two', 'Three', 'Four', 'Five',
    'Six', 'Seven', 'Eight', 'Nine', 'Ten'
 );
var
  i             : integer;
  verse, verses : string;
  LPrevBottle   : string;
begin
  verses := '';
  for i := StartBottle downto StartBottle - TakeDown + 1 do
    begin
      if i = 1 then LPrevBottle := 'no green bottles'
      else LPrevBottle := LowerCase(BOTTLE_NUMBERS[i - 1]) + ' green bottles';
      verse := BOTTLE_NUMBERS[i] + ' green bottles hanging on the wall,' + #10 +
               BOTTLE_NUMBERS[i] + ' green bottles hanging on the wall,' + #10 +
               'And if one green bottle should accidentally fall,' + #10 +
               'There''ll be ' + LPrevBottle + ' hanging on the wall.';
      verse := StringReplace(
                 verse, 'One green bottles', 'One green bottle', [rfReplaceAll]
               );
      verse := StringReplace(
                 verse, 'one green bottles', 'one green bottle', []
               );
      if verses <> '' then
        verses := verses + #10 + #10 + verse
      else verses := verse;
    end;
  result := verses;
end;

end.
