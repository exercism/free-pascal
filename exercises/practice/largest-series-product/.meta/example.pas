Unit LargestSeriesProduct;

{$mode ObjFPC}{$H+}

Interface

Function RunExercise(Const digits : String; Const span: Integer) :   Integer;

Implementation

Uses SysUtils, Character;

Function RunExercise(Const digits : String; Const span: Integer) :   Integer;

Var
    character   :   String;
    i, j, product, MaxProduct :   Integer;
Begin

    If span < 0 Then
        Raise Exception.Create('span must not be negative');

    If span > Length(digits) Then
        raise Exception.Create('span must not exceed string length');

    MaxProduct := -1;
    For i := 1 To Length(digits) - span + 1 Do
        Begin
            product := 1;
            For j := i To i + span - 1 Do
                Begin
                    character := Copy(digits, j, 1);
                    If Not(IsNumber(character[1])) Then
                        Raise Exception.Create(
                            'digits input must only contain digits'
                        );
                    product *= StrToInt(character);
                End;
            If product > MaxProduct Then MaxProduct := product;
        End;

    Result := MaxProduct;

End;

End.
