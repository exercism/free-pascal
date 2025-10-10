Unit RnaTranscription;

{$mode ObjFPC}{$H+}

Interface
Function RunExercise(Const dna : String ) :   string;

Implementation

Var
    i          :   integer;
    nucleotide :   string;
    complement :   string;
    rna        :   string;

Function RunExercise(Const dna : String ) :   string;
Begin

    rna := '';

    For i:= 1 To Length(dna) Do
        Begin
            nucleotide := Copy(dna, i, 1);
            Case nucleotide Of
                'G':   complement := 'C';
                'C':   complement := 'G';
                'T':   complement := 'A';
                'A':   complement := 'U';
            End;
            rna := rna + complement;
        End;

    Result := rna;

End;

End.
