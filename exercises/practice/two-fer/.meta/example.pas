Unit TwoFer;

{$mode ObjFPC}{$H+}

Interface
Function RunExercise(name :  String) :   string;

Implementation

Var
    phrase :   string;

Function RunExercise(name :  String) :   string;
Begin

    If name = '' Then
        phrase := 'One for you, one for me.'
    Else
        phrase := concat('One for ', name, ', one for me.');

    Result := phrase;

End;

End.
