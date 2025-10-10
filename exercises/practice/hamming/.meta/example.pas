Unit Hamming;

{$mode ObjFPC}{$H+}

Interface
Function RunExercise(Const strand1: String; Const strand2: String) :   Integer;

Implementation

Uses SysUtils;

Var
    i         :   integer;
    distance  :   integer;

Function RunExercise(Const strand1: String; Const strand2: String) :   Integer;
Begin

    If Length(strand1) <> Length(strand2) Then
        Raise Exception.Create('strands must be of equal length');

    distance := 0;
    For i := 1 To Length(strand1) Do
        Begin
            If Copy(strand1, i, 1) <> Copy(strand2, i, 1) Then Inc(distance)
        End;

    Result := distance;

End;

End.
