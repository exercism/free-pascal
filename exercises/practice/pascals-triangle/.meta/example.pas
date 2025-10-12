Unit PascalsTriangle;

{$mode ObjFPC}{$H+}

Interface

Type
    DynBiDimIntArray =   Array Of Array Of Integer;

Function RunExercise(Const count : Integer) :   DynBiDimIntArray;

Implementation

Function RunExercise(Const count : Integer) :   DynBiDimIntArray;

Var
    triangle :   DynBiDimIntArray;
    row, col :   Integer;
    i, j     :   Integer;
Begin

    If count = 0 Then Exit([]);

    row := 0;
    col := 0;

    triangle := [];
    SetLength(triangle, count);
    SetLength(triangle[0], 1);
    triangle[row][col] := 1;

    For row := 1 To count - 1 Do
        Begin
            SetLength(triangle[row], row + 1);
            triangle[row][0]   := 1;
            triangle[row][row] := 1;
            If row = 1 Then Continue;
            j := 1;
            For i := 0 To row - 2 Do
                Begin
                    triangle[row][j] := triangle[row - 1][i] +
                                        triangle[row - 1][i + 1];
                    Inc(j);
                End;
        End;

    Result := triangle;

End;

End.
