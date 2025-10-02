Unit ArmstrongNumbers;

{$mode ObjFPC}{$H+}

Interface
Function RunExercise(number: QWord) :   Boolean;

Implementation

Uses Math;

Var
    tmp              :   QWord;
    nlen, digit, sum :   Integer;

Function RunExercise(number: QWord) :   Boolean;
Begin

    tmp := number;
    nlen := 1;
    If number > 0 Then nlen := Floor(Log10(number) + 1);
    sum    := 0;

    While tmp > 0 Do
        Begin
            digit := tmp Mod 10;
            tmp   := tmp Div 10;
            sum   := sum + digit ** nlen;
        End;

    Result := number = sum;

End;

End.
