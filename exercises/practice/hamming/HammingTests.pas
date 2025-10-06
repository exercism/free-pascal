Program HammingTests;

{$mode ObjFPC}{$H+}

Uses TAP, SysUtils, Hamming;

Procedure TestExceptionMessage(
    strand1: String; strand2: String;
    Expected: String; TestName : String
);
Begin
    Try RunExercise(strand1, strand2);
    Except On E: Exception Do
        TestIs(E.Message, Expected, TestName);
    End;
End;

Begin
    Plan(9);

    TestIs(RunExercise('', ''), 0, 'empty strands');
    TestIs(RunExercise('A', 'A'), 0, 'single letter identical strands');
    TestIs(RunExercise('G', 'T'), 1, 'single letter different strands');
    TestIs(RunExercise('GGACTGAAATCTG', 'GGACTGAAATCTG'), 0, 'long identical strands');
    TestIs(RunExercise('GGACGGATTCTG', 'AGGACGGATTCT'), 9, 'long different strands');
    TestExceptionMessage('AATG', 'AAA', 'strands must be of equal length', 'disallow first strand longer');
    TestExceptionMessage('ATA', 'AGTG', 'strands must be of equal length', 'disallow second strand longer');
    TestExceptionMessage('', 'G', 'strands must be of equal length', 'disallow empty first strand');
    TestExceptionMessage('G', '', 'strands must be of equal length', 'disallow empty second strand');

    DoneTesting;
End.
