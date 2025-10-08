Unit Gigasecond;

{$mode ObjFPC}{$H+}

Interface

Function RunExercise(moment : String ) :   String;

Implementation

Uses SysUtils, DateUtils, RegExpr;

Const
    seconds :   UInt64 =   1000000000;

Function RunExercise(moment : String ) :   String;

Var
    mask:   String;
Begin

    mask := ReplaceRegExpr('[0-9]', moment, '#', true);
    If mask = '####-##-##' Then moment := moment + 'T00:00:00';

    Result := FormatDateTime(
        'YYYY-MM-DD"T"hh:mm:ss',
        IncSecond(ISO8601ToDate(moment), seconds)
    );

End;

End.
