Unit DifferenceOfSquares;

{$mode ObjFPC}{$H+}

Interface
Function RunExercise(myproperty: String; number: longint):   longint;

Implementation

Var
    i :   integer;
    acc :   longint;

Function SquareOfSum(number: longint):   longint;
Begin
    acc := 0;
    For i := 1 To number Do
        Begin
            acc := acc + i;
        End;
    Result := acc * acc;
End;

Function SumOfSquares(number: longint):   longint;
Begin
    acc := 0;
    For i := 1 To number Do
        Begin
            acc := acc + i * i;
        End;
    Result := acc;
End;

Function DifferenceOfSquares(number :  longint):   longint;
Begin
    Result := SquareOfSum(number) - SumOfSquares(number);
End;

Function RunExercise(myproperty     : String; number: longint):   longint;
Begin
    Case myproperty Of
        'squareOfSum'       :   Result := SquareOfSum(number);
        'sumOfSquares'      :   Result := SumOfSquares(number);
        'differenceOfSquares' :   Result := DifferenceOfSquares(number);
    End;
End;

End.
