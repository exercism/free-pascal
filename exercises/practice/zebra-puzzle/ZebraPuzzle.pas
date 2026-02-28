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

  raise ENotImplemented.Create('Please implement your solution.'); result := ownsZebra;

end;

function ownsZebra : Nationality;
begin

  raise ENotImplemented.Create('Please implement your solution.'); result := drinksWater;

end;

end.
