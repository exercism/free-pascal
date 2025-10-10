Unit SpaceAge;

{$mode ObjFPC}{$H+}

Interface

Function RunExercise(Const planet: String; Const seconds: LongInt) :   Double;

Implementation

Uses Math, SysUtils;

Const
    EarthYearSeconds:   Integer =   31557600;

Var
    age, PlanetSeconds :   Double;

Function RunExercise(Const planet: String; Const seconds: LongInt) :   Double;
Begin

    Case planet Of
        'Mercury' :   PlanetSeconds :=   0.2408467  ;
        'Venus'   :   PlanetSeconds :=   0.61519726 ;
        'Earth'   :   PlanetSeconds :=   1.0        ;
        'Mars'    :   PlanetSeconds :=   1.8808158  ;
        'Jupiter' :   PlanetSeconds :=  11.862615   ;
        'Saturn'  :   PlanetSeconds :=  29.447498   ;
        'Uranus'  :   PlanetSeconds :=  84.016846   ;
        'Neptune' :   PlanetSeconds := 164.79132    ;
        Else Raise Exception.Create('not a planet');
    End;

    age := seconds / EarthYearSeconds / PlanetSeconds;

    Result := RoundTo(age, -2);

End;

End.
