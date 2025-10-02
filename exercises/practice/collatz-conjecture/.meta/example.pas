Unit CollatzConjecture;

{$mode ObjFPC}{$H+}

Interface
Function RunExercise(number: Integer) :   Integer;

Implementation

Uses SysUtils;

Var
    temp, steps :   Integer;

Function RunExercise(number: Integer) :   Integer;
Begin

    If number < 1 Then
        Raise Exception.Create('Only positive integers are allowed');

    temp  := number;
    steps := 0;

    While temp > 1 Do
        Begin
            Inc(steps);
            If temp Mod 2 = 0 Then
                temp := temp Div 2
            Else temp := temp * 3 + 1;
        End;

    Result := steps;

End;

End.
