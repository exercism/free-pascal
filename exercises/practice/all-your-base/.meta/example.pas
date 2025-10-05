Unit AllYourBase;

{$mode ObjFPC}{$H+}

Interface

Type
    IntArray =   Array Of Integer;

Function RunExercise(
    Const InputBase   : Integer;
    Const InputDigits : IntArray;
    Const OutputBase  : Integer
) :   IntArray;

Implementation

Uses Math, SysUtils;

Function ToBase10(
    Const InputDigits : Array Of Integer;
    Const InputBase: Integer
) :   UInt64;

Var
    number  :   UInt64;
    i, position :   Integer;
Begin
    number := 0;
    position := 0;
    For i := high(InputDigits) Downto low(InputDigits) Do
        Begin
            number := number + InputDigits[i]  * InputBase ** position;
            inc(position);
        End;
    Result := number;
End;

Function ToAnyBase(
    Const NumberBase10 : UInt64;
    Const OutputBase   : Integer
):   IntArray;

Var
    TempArr, digits :   IntArray;
    i, j    :   Integer;
    number :   UInt64;
Begin
    TempArr := [];
    digits := [];
    number := NumberBase10;
    i      := 0;
    While number > 0 Do
        Begin
            Insert(number Mod OutputBase, TempArr, i);
            number := number Div OutputBase;
            Inc(i);
        End;
    j := 0;
    For i:=high(TempArr) Downto low(TempArr) Do
        Begin
            Insert(TempArr[i], digits, j);
            inc(j);
        End;
    Result := digits;
End;

Var
    number:   UInt64;
    i, nlen :   Integer;
    digits :   IntArray =   ();

Function RunExercise(
    Const InputBase   : Integer;
    Const InputDigits : IntArray;
    Const OutputBase  : Integer
) :   IntArray;
Begin

    If InputBase < 2 Then
        Raise Exception.Create('input base must be >= 2');

    If OutputBase < 2 Then
        Raise Exception.Create('output base must be >= 2');

    For i := low(InputDigits) To high(InputDigits) Do
        Begin
            If (InputDigits[i] < 0) Or (InputDigits[i] > InputBase) Then
                Raise Exception.Create(
                    'all digits must satisfy 0 <= d < input base'
                );
        End;

    digits := [];
    number := ToBase10(InputDigits, InputBase);

    if number = 0 then Exit([0]);

    If OutputBase <> 10 Then
        digits := ToAnyBase(number, OutputBase)
    Else
        Begin
            digits := [];
            If number = 0 Then nlen := 1
            Else nlen := Floor(Log10(Number) + 1);
            i := 0;
            While nlen > 0 Do
                Begin
                    Insert(number Div (10 ** (nlen - 1)), digits, i);
                    number := number Mod (10 ** (nlen - 1));
                    Inc(i);
                    Dec(nlen);
                End;
        End;

    Result := digits;

End;

End.
