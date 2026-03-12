unit TwelveDays;

{$mode ObjFPC}{$H+}

interface

function recite(const startVerse, endVerse : integer) : string;

implementation

const
  ordinals : array[1..12] of string = (
    'first', 'second', 'third', 'fourth', 'fifth', 'sixth',
    'seventh', 'eighth', 'ninth', 'tenth', 'eleventh', 'twelfth');
  gifts : array[1..12] of string = (
    'a Partridge in a Pear Tree',
    'two Turtle Doves',
    'three French Hens',
    'four Calling Birds',
    'five Gold Rings',
    'six Geese-a-Laying',
    'seven Swans-a-Swimming',
    'eight Maids-a-Milking',
    'nine Ladies Dancing',
    'ten Lords-a-Leaping',
    'eleven Pipers Piping',
    'twelve Drummers Drumming');

function verse(const n : integer) : string;
var
  i : integer;
begin
  result := 'On the ' + ordinals[n] + ' day of Christmas my true love gave to me: ';
  for i := n downto 2 do
    result := result + gifts[i] + ', ';
  if n > 1 then
    result := result + 'and ';
  result := result + gifts[1] + '.';
end;

function recite(const startVerse, endVerse : integer) : string;
var
  i : integer;
begin
  result := verse(startVerse);
  for i := startVerse + 1 to endVerse do
    result := result + #10 + verse(i);
end;

end.
