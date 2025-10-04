Program ResistorColorDuoTests;

{$mode ObjFPC}{$H+}

Uses TAP, TAPCore, SysUtils, ResistorColorDuo;

Begin
    Plan(7);

    TestIs(RunExercise(['brown', 'black']), 10, 'Brown and black');
    TestIs(RunExercise(['blue', 'grey']), 68, 'Blue and grey');
    TestIs(RunExercise(['yellow', 'violet']), 47, 'Yellow and violet');
    TestIs(RunExercise(['white', 'red']), 92, 'White and red');
    TestIs(RunExercise(['orange', 'orange']), 33, 'Orange and orange');
    TestIs(RunExercise(['green', 'brown', 'orange']), 51, 'Ignore additional colors');
    TestIs(RunExercise(['black', 'brown']), 1, 'Black and brown, one-digit');

    DoneTesting;
End.
