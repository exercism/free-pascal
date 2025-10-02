Program HammingTests;

{$mode ObjFPC}{$H+}

Uses TAP, TAPCore, SysUtils, Hamming;

var
   ErrorMessage : string;

Begin
    Plan(9);

    TestIs(RunExercise('', ''), 0, 'empty strands');
    TestIs(RunExercise('A', 'A'), 0, 'single letter identical strands');
    TestIs(RunExercise('G', 'T'), 1, 'single letter different strands');
    TestIs(RunExercise('GGACTGAAATCTG', 'GGACTGAAATCTG'), 0, 'long identical strands');
    TestIs(RunExercise('GGACGGATTCTG', 'AGGACGGATTCT'), 9, 'long different strands');

    ErrorMessage := '';
    Try RunExercise('AATG', 'AAA');
    Except On E: Exception do ErrorMessage := E.Message; End;
    TestIs(ErrorMessage, 'strands must be of equal length', 'disallow first strand longer');

    ErrorMessage := '';
    Try RunExercise('ATA', 'AGTG');
    Except On E: Exception do ErrorMessage := E.Message; End;
    TestIs(ErrorMessage, 'strands must be of equal length', 'disallow second strand longer');

    ErrorMessage := '';
    Try RunExercise('', 'G');
    Except On E: Exception do ErrorMessage := E.Message; End;
    TestIs(ErrorMessage, 'strands must be of equal length', 'disallow empty first strand');

    ErrorMessage := '';
    Try RunExercise('G', '');
    Except On E: Exception do ErrorMessage := E.Message; End;
    TestIs(ErrorMessage, 'strands must be of equal length', 'disallow empty second strand');

    DoneTesting;
End.
