Unit ReverseString;

{$mode ObjFPC}{$H+}

Interface
Function RunExercise(Const AValue: String) :   String;

Implementation

Uses StrUtils;

Function RunExercise(Const AValue: String) :   String;
Begin

    Result := StrUtils.ReverseString(AValue);

End;

End.
