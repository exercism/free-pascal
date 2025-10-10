Unit TwoFer;

{$mode ObjFPC}{$H+}

Interface
Function RunExercise(Const name :  String) :   String;

Implementation

Var
    phrase :   string;

Function RunExercise(Const name :  String) :   String;
Begin

    If name = '' Then
        phrase := 'One for you, one for me.'
    Else
        phrase := concat('One for ', name, ', one for me.');

    Result := phrase;

End;

End.
