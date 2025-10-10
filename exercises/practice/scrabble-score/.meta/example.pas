Unit ScrabbleScore;

{$mode ObjFPC}{$H+}

Interface

Function RunExercise(Const word: String) :   Integer;

Implementation

Uses SysUtils;

Var
    i, score    :   Integer;
    temp :   String;

Function RunExercise(Const word: String) :   Integer;
Begin

    score := 0;
    temp := UpperCase(word);

    For i := 1 To Length(temp) Do
        Begin
            Case Copy(temp, i, 1) Of
                'A','E','I','O','U','L','N','R','S','T' :   score := score +  1;
                'D','G'                                 :   score := score +  2;
                'B','C','M','P'                         :   score := score +  3;
                'F','H','V','W','Y'                     :   score := score +  4;
                'K'                                     :   score := score +  5;
                'J','X'                                 :   score := score +  8;
                'Q','Z'                                 :   score := score + 10;
            End;
        End;

    Result := score;

End;

End.
