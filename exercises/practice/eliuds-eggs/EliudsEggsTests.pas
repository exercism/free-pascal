Program EliudsEggsTests;

{$mode ObjFPC}{$H+}

Uses TAP, SysUtils, EliudsEggs;

Begin
    Plan(4);

    TestIs(RunExercise(0), 0, '0 eggs');
    TestIs(RunExercise(16), 1, '1 egg');
    TestIs(RunExercise(89), 4, '4 eggs');
    TestIs(RunExercise(2000000000), 13, '13 eggs');

    DoneTesting;
End.
