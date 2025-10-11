Unit Meetup;

{$mode ObjFPC}{$H+}

Interface

Function RunExercise(
    Const year, month: Integer; Const week, ADayOfWeek : String
) :   String;

Implementation

Uses SysUtils, DateUtils;

Function RunExercise(
    Const year, month : Integer; Const week, ADayOfWeek : String
) :   String;

Var
    ADate               :   TDateTime;
    LYear, LMonth, LDay :   Word;
    LDoWStr, LDateStr   :   String;
Begin

    ADate := EncodeDate(year, month, 1);

    Repeat
        DecodeDate(ADate, LYear, LMonth, LDay);
        If LMonth <> month Then break;
        LDoWStr := FormatDateTime('dddd', ADate);
        If LDoWStr = ADayOfWeek Then
            Begin
                If (week = 'teenth') And (LDay In [13..19]) Then
                    Begin
                        LDateStr := FormatDateTime('yyyy-mm-dd', ADate);
                        break
                    End
                Else If week = 'first' Then
                    Begin
                       LDateStr := FormatDateTime('yyyy-mm-dd', ADate);
                       break
                    End
                Else If (week = 'second') And (NthDayOfWeek(ADate) = 2) Then
                    Begin
                       LDateStr := FormatDateTime('yyyy-mm-dd', ADate);
                       break
                    End
                Else If (week = 'third') And (NthDayOfWeek(ADate) = 3) Then
                    Begin
                       LDateStr := FormatDateTime('yyyy-mm-dd', ADate);
                       break
                    End
                Else If (week = 'fourth') And (NthDayOfWeek(ADate) = 4) Then
                    Begin
                       LDateStr := FormatDateTime('yyyy-mm-dd', ADate);
                       break
                    End
                Else If week = 'last' Then
                    LDateStr := FormatDateTime('yyyy-mm-dd', ADate);
            End;
        ADate := IncDay(ADate);
    Until False;

    Result := LDateStr;

End;

End.
