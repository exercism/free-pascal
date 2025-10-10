Unit Darts;

{$mode ObjFPC}{$H+}

Interface
Function RunExercise(Const x: Single; Const y: Single) :   UInt8;

Implementation

Uses Math;

Var
    spot   :   Single;
    points :   UInt8;

Function RunExercise(Const x: Single; Const y: Single) :   UInt8;
Begin

    spot   := x ** 2 + y ** 2;
    points := 0;
    If      spot <=  1 ** 2 Then points := 10
    Else If spot <=  5 ** 2 Then points :=  5
    Else If spot <= 10 ** 2 Then points :=  1;

    Result := points;

End;

End.
