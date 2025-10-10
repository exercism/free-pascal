Unit Raindrops;

{$mode ObjFPC}{$H+}

Interface
Function RunExercise(Const number: Integer) :   String;

Implementation

Uses SysUtils;

Var
    sounds :   string;

Function RunExercise(Const number: Integer) :   String;
Begin

    sounds := '';

    If number Mod 3 = 0 Then sounds := sounds + 'Pling';
    If number Mod 5 = 0 Then sounds := sounds + 'Plang';
    If number Mod 7 = 0 Then sounds := sounds + 'Plong';

    If sounds = '' Then sounds := intToStr(number);

    Result := sounds;

End;

End.
