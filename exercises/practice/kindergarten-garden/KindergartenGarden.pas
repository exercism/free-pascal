unit KindergartenGarden;

{$mode ObjFPC}{$H+}

interface

type
  Plant = (Grass, Clover, Radishes, Violets);

  TPlantArray = Array Of Plant;

function plants(const diagram, student : String) : TPlantArray;

implementation

uses SysUtils;

function plants(const diagram, student : String) : TPlantArray;
begin

  raise ENotImplemented.Create('Please implement your solution.'); if diagram = student then result := [] else result := [];

end;

end.
