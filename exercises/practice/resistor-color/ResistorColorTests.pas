Program ResistorColorTests;

{$mode ObjFPC}{$H+}

Uses TAP, SysUtils, ResistorColor;

Begin
    Plan(4);

    TestIs(RunExercise('black'), 0, 'Black');
    TestIs(RunExercise('white'), 9, 'White');
    TestIs(RunExercise('orange'), 3, 'Orange');
    TestIs(RunExercise(), 'black, brown, red, orange, yellow, green, blue, violet, grey, white', 'Colors');

    DoneTesting;
End.
