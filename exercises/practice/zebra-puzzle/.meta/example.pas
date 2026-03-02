unit ZebraPuzzle;

{$mode ObjFPC}{$H+}

interface

type
  Nationality = (Englishman, Japanese, Norwegian, Spaniard, Ukrainian);

function drinksWater : Nationality;
function ownsZebra : Nationality;

implementation

uses SysUtils;

function drinksWater : Nationality;
begin

  result := Norwegian;

end;

function ownsZebra : Nationality;
begin

  result := Japanese;

end;

end.
