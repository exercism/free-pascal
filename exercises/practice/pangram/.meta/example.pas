Unit Pangram;

{$mode ObjFPC}{$H+}

Interface
Function RunExercise(Const sentence: String) :   Boolean;

Implementation

Type
    Letters =   Array [Ord('a') .. Ord('z')] Of Integer;

Var
    alpha    :   Letters;
    temp     :   String;
    i, ascii :   Integer;

Function RunExercise(Const sentence: String) :   Boolean;
Begin

    For i := Low(alpha) To High(alpha) Do
        alpha[i] := 0;
    temp := LowerCase(sentence);

    For i := 1 To length(temp) Do
        Begin
            If (temp[i] < 'a') Or (temp[i] > 'z') Then continue;
            ascii := Ord(temp[i]);
            Inc(alpha[ascii]);
        End;

    For i := Low(alpha) To High(alpha) Do
        If alpha[i] = 0 Then Exit(False);

    Result := True;

End;

End.
