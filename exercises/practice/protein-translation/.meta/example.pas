Unit ProteinTranslation;

{$mode ObjFPC}{$H+}

Interface

Uses SysUtils;

Type
    DynStringArray =   Array Of String;

Function RunExercise(Const strand : String ) :   DynStringArray;

Implementation

Function RunExercise(Const strand : String ) :   DynStringArray;

Const
    CondonLength:   UInt8 =   3;

Var
    i                :   Integer;
    codon, AminoAcid :   String;
    DynAminoAcids    :   DynStringArray;
Begin

    DynAminoAcids := [];
    i := 1;
    While i <= Length(strand) Do
        Begin
            codon := Copy(strand, i, CondonLength);
            Inc(i, CondonLength);
            AminoAcid := '';
            Case codon Of
                'AUG'                   :   AminoAcid := 'Methionine';
                'UUU','UUC'             :   AminoAcid := 'Phenylalanine';
                'UUA','UUG'             :   AminoAcid := 'Leucine';
                'UCU','UCC','UCA','UCG' :   AminoAcid := 'Serine';
                'UAU','UAC'             :   AminoAcid := 'Tyrosine';
                'UGU','UGC'             :   AminoAcid := 'Cysteine';
                'UGG'                   :   AminoAcid := 'Tryptophan';
                'UAA','UAG','UGA'       :   Break;
                otherwise Raise Exception.Create('Invalid codon');
            End;
            Insert(AminoAcid, DynAminoAcids, Length(DynAminoAcids));
        End;

    Result := DynAminoAcids;

End;

End.
