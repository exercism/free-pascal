Program NucleotideCountTests;

{$mode ObjFPC}{$H+}

Uses TAP, SysUtils, NucleotideCount;

Procedure TestExceptionMessage(
    Const strand : String;
    Const Expected: String; Const TestName : String
);
Begin
    Try RunExercise(strand);
    Except On E: Exception Do
        TestIs(E.Message, Expected, TestName);
    End;
End;

Begin
    Plan(5);

    TestIs(RunExercise(''), 'A:0, C:0, G:0, T:0', 'empty strand');
    TestIs(RunExercise('G'), 'A:0, C:0, G:1, T:0', 'can count one nucleotide in single-character input');
    TestIs(RunExercise('GGGGGGG'), 'A:0, C:0, G:7, T:0', 'strand with repeated nucleotide');
    TestIs(RunExercise('AGCTTTTCATTCTGACTGCAACGGGCAATATGTCTCTGTGTGGATTAAAAAAAGAGTGTCTGATAGCAGC'), 'A:20, C:12, G:17, T:21', 'strand with multiple nucleotides');
    TestExceptionMessage('AGXXACT', 'Invalid nucleotide in strand', 'strand with invalid nucleotides');

    DoneTesting;
End.
