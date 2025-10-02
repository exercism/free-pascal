Unit Triangle;

{$mode ObjFPC}{$H+}

Interface
Function RunExercise(
    AProperty: String; a: Double; b: Double; c: Double
) :   Boolean;

Implementation

Var
    bool :   Boolean;

Function RunExercise(
    AProperty: String; a: Double; b: Double; c: Double
) :   Boolean;
Begin

    bool := false;

    If (a = b) And (a = c) And (a = 0) Then bool := false
    Else If (a + b < c) Or (b + c < a) Or (a + c < b) Then bool := false
    Else If (AProperty = 'equilateral') And (a = b) And (a = c) Then
             bool := true
    Else If (AProperty = 'isosceles') And ((a = b) Or (a = c) Or (b = c)) Then
             bool := true
    Else If (AProperty = 'scalene') And (a <> b) And (a <> c) And (b <> c) Then
             bool := true;

    Result := bool;

End;

End.
