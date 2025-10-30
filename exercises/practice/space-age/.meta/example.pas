unit SpaceAge;

{$mode ObjFPC}{$H+}

interface

function age(const planet : string; const seconds : LongInt) : double;

implementation

uses SysUtils;

const
  EarthYearSeconds : integer = 31557600;

var
  PlanetSeconds : double;

function age(const planet : string; const seconds : LongInt) : double;
begin
  case planet of
    'Mercury' : PlanetSeconds :=   0.2408467 ;
    'Venus'   : PlanetSeconds :=   0.61519726;
    'Earth'   : PlanetSeconds :=   1.0       ;
    'Mars'    : PlanetSeconds :=   1.8808158 ;
    'Jupiter' : PlanetSeconds :=  11.862615  ;
    'Saturn'  : PlanetSeconds :=  29.447498  ;
    'Uranus'  : PlanetSeconds :=  84.016846  ;
    'Neptune' : PlanetSeconds := 164.79132   ;
    else raise Exception.Create('not a planet');
  end;
  result := seconds / EarthYearSeconds / PlanetSeconds;
end;

end.
