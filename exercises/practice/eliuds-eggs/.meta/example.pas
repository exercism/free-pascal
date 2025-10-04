Unit EliudsEggs;

{$mode ObjFPC}{$H+}

Interface

Function RunExercise(number : UInt32) :   UInt8;

Implementation

Var
    i, eggs :   UInt8;

Function RunExercise(number : UInt32) :   Uint8;
Begin

    eggs := 0;

    For i := 0 To 31 Do
        Begin
            If ((number And (1 shl i)) <> 0) Then Inc(eggs);
        End;

    Result := eggs;

End;

End.
