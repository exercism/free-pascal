unit KindergartenGarden;

{$mode ObjFPC}{$H+}

interface

type
  Plant = (Grass, Clover, Radishes, Violets);

  TPlantArray = Array Of Plant;

function plants(const diagram, student : String) : TPlantArray;

implementation

uses SysUtils;

function decode(const ch : Char) : Plant;
begin
  result := Grass;

  if ch = 'G' then
    result := Grass;
  if ch = 'C' then
    result := Clover;
  if ch = 'R' then
    result := Radishes;
  if ch = 'V' then
    result := Violets;
end;

function plants(const diagram, student : String) : TPlantArray;
var
  first : Integer;
  second : Integer;
  third : Integer;
  fourth : Integer;
begin
  first := 2 * (Ord(student[1]) - 65) + 1;
  second := first + 1;
  third := (Length(diagram) + 1) div 2 + first;
  fourth := third + 1;

  result := [decode(diagram[first]), decode(diagram[second]), decode(diagram[third]), decode(diagram[fourth])];
end;

end.
