Program ScrabbleScoreTests;

{$mode ObjFPC}{$H+}

Uses TAP, TAPCore, SysUtils, ScrabbleScore;

Begin
    Plan(11);

    TestIs(RunExercise('a'), 1, 'lowercase letter');
    TestIs(RunExercise('A'), 1, 'uppercase letter');
    TestIs(RunExercise('f'), 4, 'valuable letter');
    TestIs(RunExercise('at'), 2, 'short word');
    TestIs(RunExercise('zoo'), 12, 'short, valuable word');
    TestIs(RunExercise('street'), 6, 'medium word');
    TestIs(RunExercise('quirky'), 22, 'medium, valuable word');
    TestIs(RunExercise('OxyphenButazone'), 41, 'long, mixed-case word');
    TestIs(RunExercise('pinata'), 8, 'english-like word');
    TestIs(RunExercise(''), 0, 'empty input');
    TestIs(RunExercise('abcdefghijklmnopqrstuvwxyz'), 87, 'entire alphabet available');

    DoneTesting;
End.
