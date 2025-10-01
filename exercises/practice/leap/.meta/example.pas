Unit Leap;

{$mode ObjFPC}{$H+}

Interface
Function RunExercise(year :  integer) :   boolean;

Implementation

Function RunExercise(year :  integer) :   boolean;
Begin

    Result := (
        (year Mod 400 = 0) Or
        ((year Mod 4 = 0) And (year Mod 100 <> 0))
    );

End;

End.
