Unit SquareRoot;

{$mode ObjFPC}{$H+}

Interface

Function RunExercise(Const radicand :Integer) :   Integer;

Implementation

Function RunExercise(Const radicand :Integer) :   Integer;

Var
    i, j, mid :   Integer;
Begin

    i := 0;
    j := radicand;

    Repeat
        mid := (i + j) Div 2;
        If      mid * mid < radicand Then
            i := mid + 1
        Else If mid * mid > radicand Then
                 j := mid - 1
        Else break;
    Until (i + j < 0);

    Result := mid;

End;

End.
