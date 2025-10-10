Unit SumOfMultiples;

{$mode ObjFPC}{$H+}

Interface

Function RunExercise(
    Const factors: Array Of Integer; 
    Const limit:   Integer
) :   Integer;

Implementation

Function RunExercise(
    Const factors: Array Of Integer; 
    Const limit:   Integer
) :   Integer;
Var
    idx, i, j, sum :   Integer;
    exists         :   Boolean;
    multiples      :   Array Of Integer;
Begin

    multiples := [];
    For idx := Low(factors) To High(factors) Do
        Begin
            If factors[idx] = 0 Then Continue;
            For i := factors[idx] To limit - 1 Do
                If i Mod factors[idx] = 0 Then
                    Begin
                        exists := false;
                        For j := Low(multiples) To High(multiples) Do
                            Begin
                                If multiples[j] = i Then
                                    Begin
                                        exists := true;
                                        break;
                                    End;
                            End;
                        If Not exists Then Insert(i, multiples, 0);
                    End;
        End;

    sum := 0;
    For idx := Low(multiples) To High(multiples) Do
        sum := sum + multiples[idx];

    Result := sum;

End;

End.
