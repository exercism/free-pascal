Unit Gigasecond;

{$mode ObjFPC}{$H+}

Interface

Function RunExercise(Const moment : String ) :   String;

Implementation

Uses SysUtils, DateUtils, RegExpr;

Const
    seconds :   UInt64 =   1000000000;

Function RunExercise(Const moment : String ) :   String;
Var
    TmpStr, mask:   String;
Begin

    TmpStr := moment;
    mask := ReplaceRegExpr('[0-9]', TmpStr, '#', true);
    If mask = '####-##-##' Then TmpStr := TmpStr + 'T00:00:00';

    Result := FormatDateTime(
        'YYYY-MM-DD"T"hh:mm:ss',
        IncSecond(ISO8601ToDate(TmpStr), seconds)
    );

End;

End.
