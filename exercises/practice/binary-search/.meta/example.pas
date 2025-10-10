Unit BinarySearch;

{$mode ObjFPC}{$H+}

Interface

Function RunExercise(
    Const AArray: Array Of Integer; AValue : Integer
) :   Integer;

Implementation

Uses SysUtils;

Function RunExercise(
    Const AArray: Array Of Integer; AValue : Integer
) :   Integer;

Var
    i, j, mid :   Integer;
    WasFound  :   Boolean;
Begin

    If Length(AArray) = 0 Then
        Raise Exception.Create('value not in array');

    i := 0;
    j := Length(AArray) - 1;
    WasFound := False;

    Repeat
        Begin
            mid := (i + j) Div 2;
            If AArray[mid] < AValue Then
                i := mid + 1
            Else If AArray[mid] > AValue Then
                     j := mid - 1
            Else
                Begin
                    WasFound := True;
                    break;
                End;
        End;
    Until (i + j < 0) Or (i > j);

    If WasFound Then
        Result := mid
    Else
        Raise Exception.Create('value not in array');

End;

End.
