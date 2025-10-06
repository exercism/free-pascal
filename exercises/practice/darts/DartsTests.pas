Program DartsTests;

Uses TAP, Darts;

Begin
   Plan(13);

    TestIs(RunExercise(-9, 9), 0, 'Missed target');
    TestIs(RunExercise(0, 10), 1, 'On the outer circle');
    TestIs(RunExercise(-5, 0), 5, 'On the middle circle');
    TestIs(RunExercise(0, -1), 10, 'On the inner circle');
    TestIs(RunExercise(0, 0), 10, 'Exactly on center');
    TestIs(RunExercise(-0.1, -0.1), 10, 'Near the center');
    TestIs(RunExercise(0.7, 0.7), 10, 'Just within the inner circle');
    TestIs(RunExercise(0.8, -0.8), 5, 'Just outside the inner circle');
    TestIs(RunExercise(-3.5, 3.5), 5, 'Just within the middle circle');
    TestIs(RunExercise(-3.6, -3.6), 1, 'Just outside the middle circle');
    TestIs(RunExercise(-7.0, 7.0), 1, 'Just within the outer circle');
    TestIs(RunExercise(7.1, -7.1), 0, 'Just outside the outer circle');
    TestIs(RunExercise(0.5, -4), 5, 'Asymmetric position between the inner and middle circles');


    DoneTesting;
End.
