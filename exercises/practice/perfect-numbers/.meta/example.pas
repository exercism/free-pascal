Unit PerfectNumbers;

{$mode ObjFPC}{$H+}

Interface

Function RunExercise(Const number : Integer ) :   String;

Implementation

Uses SysUtils;

Function RunExercise(Const number : Integer ) :   String;

Var
    factor, AliquotSum :   Integer;
    classification :   String;
Begin

    If number < 1 Then
        Raise Exception.Create(
            'Classification is only possible for positive integers.'
        );

    AliquotSum := 0;

    For factor := 1 To number - 1 Do
        Begin
            If number Mod factor <> 0 Then continue;
            AliquotSum := AliquotSum + factor;
        End;

    If      number = AliquotSum Then classification := 'perfect'
    Else If number < AliquotSum Then classification := 'abundant'
    Else                             classification := 'deficient';

    Result := classification;

End;

End.
