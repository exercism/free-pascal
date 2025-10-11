Unit ReverseString;

{$mode ObjFPC}{$H+}

Interface

Function RunExercise(Const AValue: String) :   String;

Implementation

Function RunExercise(Const AValue: String) :   String;

Var
    TmpStr :   String;
    i      :   Integer;
Begin
    TmpStr := '' ;
    For i := Length(AValue) Downto 1 Do TmpStr := TmpStr + AValue[i];
    Result := TmpStr;
End;

End.
