Program ProteinTranslationTests;

{$mode ObjFPC}{$H+}

Uses TAP, SysUtils, ProteinTranslation;

Procedure TestExceptionMessage(
    Const strand: String;
    Const Expected: String; Const TestName : String
);
Var ErrorMessage :   String;
Begin
    ErrorMessage := '';
    Try RunExercise(strand);
    Except On E: Exception Do ErrorMessage := E.Message End;
    TestIs(ErrorMessage, Expected, TestName);
End;

Begin
    Plan(30);

    TestIs(RunExercise(''), [], 'Empty RNA sequence results in no proteins');
    TestIs(RunExercise('AUG'), ['Methionine'], 'Methionine RNA sequence');
    TestIs(RunExercise('UUU'), ['Phenylalanine'], 'Phenylalanine RNA sequence 1');
    TestIs(RunExercise('UUC'), ['Phenylalanine'], 'Phenylalanine RNA sequence 2');
    TestIs(RunExercise('UUA'), ['Leucine'], 'Leucine RNA sequence 1');
    TestIs(RunExercise('UUG'), ['Leucine'], 'Leucine RNA sequence 2');
    TestIs(RunExercise('UCU'), ['Serine'], 'Serine RNA sequence 1');
    TestIs(RunExercise('UCC'), ['Serine'], 'Serine RNA sequence 2');
    TestIs(RunExercise('UCA'), ['Serine'], 'Serine RNA sequence 3');
    TestIs(RunExercise('UCG'), ['Serine'], 'Serine RNA sequence 4');
    TestIs(RunExercise('UAU'), ['Tyrosine'], 'Tyrosine RNA sequence 1');
    TestIs(RunExercise('UAC'), ['Tyrosine'], 'Tyrosine RNA sequence 2');
    TestIs(RunExercise('UGU'), ['Cysteine'], 'Cysteine RNA sequence 1');
    TestIs(RunExercise('UGC'), ['Cysteine'], 'Cysteine RNA sequence 2');
    TestIs(RunExercise('UGG'), ['Tryptophan'], 'Tryptophan RNA sequence');
    TestIs(RunExercise('UAA'), [], 'STOP codon RNA sequence 1');
    TestIs(RunExercise('UAG'), [], 'STOP codon RNA sequence 2');
    TestIs(RunExercise('UGA'), [], 'STOP codon RNA sequence 3');
    TestIs(RunExercise('UUUUUU'), ['Phenylalanine','Phenylalanine'], 'Sequence of two protein codons translates into proteins');
    TestIs(RunExercise('UUAUUG'), ['Leucine','Leucine'], 'Sequence of two different protein codons translates into proteins');
    TestIs(RunExercise('AUGUUUUGG'), ['Methionine','Phenylalanine','Tryptophan'], 'Translate RNA strand into correct protein list');
    TestIs(RunExercise('UAGUGG'), [], 'Translation stops if STOP codon at beginning of sequence');
    TestIs(RunExercise('UGGUAG'), ['Tryptophan'], 'Translation stops if STOP codon at end of two-codon sequence');
    TestIs(RunExercise('AUGUUUUAA'), ['Methionine','Phenylalanine'], 'Translation stops if STOP codon at end of three-codon sequence');
    TestIs(RunExercise('UGGUAGUGG'), ['Tryptophan'], 'Translation stops if STOP codon in middle of three-codon sequence');
    TestIs(RunExercise('UGGUGUUAUUAAUGGUUU'), ['Tryptophan','Cysteine','Tyrosine'], 'Translation stops if STOP codon in middle of six-codon sequence');
    TestIs(RunExercise('AUGAUG'), ['Methionine','Methionine'], 'Sequence of two non-STOP codons does not translate to a STOP codon');
    TestExceptionMessage('XYZ', 'Invalid codon', 'Unknown amino acids, not part of a codon, can''t translate');
    TestExceptionMessage('AUGU', 'Invalid codon', 'Incomplete RNA sequence can''t translate');
    TestIs(RunExercise('UUCUUCUAAUGGU'), ['Phenylalanine','Phenylalanine'], 'Incomplete RNA sequence can translate if valid until a STOP codon');

    DoneTesting;
End.
