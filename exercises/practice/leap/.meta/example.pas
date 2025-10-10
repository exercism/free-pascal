Unit Leap;

{$mode ObjFPC}{$H+}

Interface
Function RunExercise(Const year :  Integer) :   Boolean;

Implementation

Function RunExercise(Const year :  Integer) :   Boolean;
Begin

    Result := (
        (year Mod 400 = 0) Or
        ((year Mod 4 = 0) And (year Mod 100 <> 0))
    );

End;

End.
