Unit EliudsEggs;

{$mode ObjFPC}{$H+}

Interface

Function RunExercise(number : Integer) :   Int8;

Implementation

Uses StrUtils;

Function RunExercise(number : Integer) :   Int8;
Begin
    Result := Length(ReplaceStr(IntToBin(number, 32), '0', ''));
End;

End.
