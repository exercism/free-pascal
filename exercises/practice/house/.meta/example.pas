unit House;

{$mode ObjFPC}{$H+}

interface

function recite(const StartVerse, EndVerse : uint8) : string;

implementation

uses SysUtils, StrUtils;

function recite(const StartVerse, EndVerse : uint8) : string;
type
  TNounVerb = record
                noun : string;
                verb : string;
              end;
const
  PAIRS : Array [0..11] Of TNounVerb = (
    (noun: 'house'                           ; verb: 'Jack built.'),
    (noun: 'malt'                            ; verb: 'lay'        ),
    (noun: 'rat'                             ; verb: 'ate'        ),
    (noun: 'cat'                             ; verb: 'killed'     ),
    (noun: 'dog'                             ; verb: 'worried'    ),
    (noun: 'cow with the crumpled horn'      ; verb: 'tossed'     ),
    (noun: 'maiden all forlorn'              ; verb: 'milked'     ),
    (noun: 'man all tattered and torn'       ; verb: 'kissed'     ),
    (noun: 'priest all shaven and shorn'     ; verb: 'married'    ),
    (noun: 'rooster that crowed in the morn' ; verb: 'woke'       ),
    (noun: 'farmer sowing his corn'          ; verb: 'kept'       ),
    (noun: 'horse and the hound and the horn'; verb: 'belonged to')
  );
var
  i, j          : integer;
  verse, verses : string;
begin
  verses := '';
  for i := StartVerse - 1 to EndVerse - 1 do
    begin
      verse := 'This is';
      for j := i downto 0 do
        begin
          verse := verse + ' ' +
          format('the %s that %s', [PAIRS[j].noun, PAIRS[j].verb]);
        end;
      if i > 0 then insert('in ', verse, rpos(' lay ', verse) + 5);
      verses := IfThen(verses = '', '', verses + #10) + verse;
    end;
  result := verses;
end;

end.
