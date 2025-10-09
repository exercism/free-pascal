Unit Luhn;

{$mode ObjFPC}{$H+}

Interface

Function RunExercise(Const InputValue : String) :   Boolean;

Implementation

Uses SysUtils, StrUtils, Character;

Function RunExercise(Const InputValue : String) :   Boolean;

Var
    TempStr          :   String;
    character        :   Char;
    i, j, digit, sum :   Integer;
Begin

    TempStr := ReplaceStr(InputValue, ' ', '');

    If TempStr = '0' Then Exit(False);

    sum := 0;
    j   := 1;
    For i := Length(TempStr) Downto 1 Do
        Begin
            character := Copy(TempStr, i, 1)[1];
            If Not(IsNumber(character)) Then Exit(False);
            digit := StrToInt(character);
            If j And 1 = 0 Then digit *= 2;
            Inc(j);
            If digit > 9 Then Dec(digit, 9);
            Inc(sum, digit);
        End;

    Result := sum Mod 10 = 0;

End;

End.
