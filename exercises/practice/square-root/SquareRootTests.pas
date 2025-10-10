Program SquareRootTests;

{$mode ObjFPC}{$H+}

Uses TAP, SysUtils, SquareRoot;

Begin
    Plan(6);

    TestIs(RunExercise(1), 1, 'root of 1');
    TestIs(RunExercise(4), 2, 'root of 4');
    TestIs(RunExercise(25), 5, 'root of 25');
    TestIs(RunExercise(81), 9, 'root of 81');
    TestIs(RunExercise(196), 14, 'root of 196');
    TestIs(RunExercise(65025), 255, 'root of 65025');

    DoneTesting;
End.
