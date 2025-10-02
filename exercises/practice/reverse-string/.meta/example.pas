Unit ReverseString;

{$mode ObjFPC}{$H+}

Interface
Function RunExercise(value: String) :   String;

Implementation

Uses StrUtils;

Function RunExercise(value: String) :   String;
Begin

    Result := StrUtils.ReverseString(value);

End;

End.
