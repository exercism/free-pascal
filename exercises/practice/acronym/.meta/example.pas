Unit Acronym;

{$mode ObjFPC}{$H+}

Interface

Function RunExercise(Const phrase: String) :   String;

Implementation

Uses StrUtils, SysUtils;

Var
    temp, abbrev  :   String;
    i     :   Integer;
    words :   Array Of String;

Function RunExercise(Const phrase: String) :   String;
Begin

    temp := UpperCase(DelChars(phrase, ''''));

    For i := low(temp) To high(temp) Do
        Begin
            If (temp[i] < 'A') Or (temp[i] > 'Z') Then temp[i] := ' ';
        End;

    words  := SplitString(temp, ' ');
    abbrev := '';

    For i:= low(words) To high(words) Do
        abbrev := abbrev + Copy(words[i], 1, 1);

    Result := abbrev;

End;

End.
