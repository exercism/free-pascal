Unit PhoneNumber;

{$mode ObjFPC}{$H+}

Interface

Function RunExercise(Const phrase : String) :   String;

Implementation

Uses Character, SysUtils;

Var
    NumberString :   String;
    chr          :   Char;
    i            :   Integer;

Function RunExercise(Const phrase : String) :   String;
Begin

    NumberString := '';
    For i := 1 To Length(phrase) Do
        Begin
            chr := Copy(phrase, i, 1)[1];
            If IsNumber(chr) Then NumberString := NumberString + chr
            Else If IsLetter(chr) Then
                     Raise Exception.Create('letters not permitted')
            Else If chr In ['@', ':', '!'] Then
                     Raise Exception.Create('punctuations not permitted')
        End;

    If Length(NumberString) = 11 Then
        Begin
            If NumberString[1] = '1' Then
                NumberString := RightStr(NumberString, Length(NumberString) - 1)
            Else Raise Exception.Create('11 digits must start with 1');
        End
    Else If Length(NumberString) > 11 Then
             Raise Exception.Create('must not be greater than 11 digits')
    Else  If Length(NumberString) < 10 Then
              Raise Exception.Create('must not be fewer than 10 digits');

    If NumberString[1] = '0' Then
        Raise Exception.Create('area code cannot start with zero')
    Else If NumberString[1] = '1' Then
             Raise Exception.Create('area code cannot start with one');

    If NumberString[4] = '0' Then
        Raise Exception.Create('exchange code cannot start with zero')
    Else If NumberString[4] = '1' Then
             Raise Exception.Create('exchange code cannot start with one');

    Result := NumberString;

End;

End.
