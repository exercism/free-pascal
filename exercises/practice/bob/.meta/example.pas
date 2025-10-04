Unit Bob;

{$mode ObjFPC}{$H+}

Interface

Function RunExercise(HeyBob: String) :   String;

Implementation

Uses SysUtils;

Var
    i                  :   Integer;
    answer             :   String;
    HasLetters, IsYell :   Boolean;

Function RunExercise(HeyBob: String) :   String;
Begin

    answer     := 'Whatever.';
    HasLetters := False;
    IsYell     := False;

    For i := low(HeyBob) To high(HeyBob) Do
        Begin
            If LowerCase(HeyBob[i]) In ['a'..'z'] Then
                Begin
                    HasLetters := True;
                    break;
                End;
        End;
    If HasLetters And (UpperCase(HeyBob) = HeyBob) Then IsYell := True;

    If Trim(HeyBob) = '' Then answer := 'Fine. Be that way!'
    Else If Copy(Trim(HeyBob), Length(Trim(HeyBob))) = '?' Then
             If IsYell Then answer := 'Calm down, I know what I''m doing!'
    Else answer := 'Sure.'
    Else If IsYell Then answer := 'Whoa, chill out!';

    Result := answer;

End;

End.
