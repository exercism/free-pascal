Unit NucleotideCount;

{$mode ObjFPC}{$H+}

Interface

Function RunExercise(Const strand: String) :   String;

Implementation

Uses SysUtils;

Const
    nucleotides :   Array [0..3] Of Char =   ('A', 'C', 'G', 'T');

Function GetNucleotideIdx (Const Nucleotide : Char) :   Integer;

Var i :   Integer;
Begin
    For i := Low(nucleotides) To High(nucleotides) Do
        If Nucleotide = nucleotides[i] Then Exit(i);
    Result := -1;
End;

Function RunExercise(Const strand: String) :   String;

Var
    i, idx :   Integer;
    counts :   Array [0..3] Of Integer =   (0, 0, 0, 0);
    output :   String;
Begin

    For i := Low(strand) To High(strand) Do
        Begin
            idx := GetNucleotideIdx(strand[i]);
            If idx = -1 Then
                Raise Exception.Create('Invalid nucleotide in strand');
            Inc(counts[idx]);
        End;

    output := '';
    For i:= low(nucleotides) To high(nucleotides) Do
        Begin
            If output = '' Then
                output := Format('%s:%d', [nucleotides[i], counts[i]])
            Else
                output := Format(
                    '%s, %s:%d', [output, nucleotides[i], counts[i]]
                );
        End;

    Result := output;

End;

End.
