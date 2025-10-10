Unit MatchingBrackets;

{$mode ObjFPC}{$H+}

Interface

Function RunExercise(Const input : String) :   Boolean;

Implementation

Uses StrUtils;

Function RunExercise(Const input : String) :   Boolean;

Var
    i      :   Integer;
    TmpStr :   String;
Begin

    TmpStr := '';
    For i := 1 To Length(input) Do
        Begin
            If input[i] In ['{','}','[',']','(',')'] Then
                TmpStr := TmpStr + input[i]
        End;

    While (ContainsStr(TmpStr, '{}')) Or
          (ContainsStr(TmpStr, '[]')) Or
          (ContainsStr(TmpStr, '()')) Do
        Begin
            TmpStr := ReplaceStr(TmpStr, '{}', '');
            TmpStr := ReplaceStr(TmpStr, '[]', '');
            TmpStr := ReplaceStr(TmpStr, '()', '');
        End;

    Result := TmpStr = '';

End;

End.
