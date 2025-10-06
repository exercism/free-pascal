Program RaindropsTests;

Uses TAP, Raindrops;

Begin
    Plan(18);

    TestIs(RunExercise(1), '1', 'the sound for 1 is 1');
    TestIs(RunExercise(3), 'Pling', 'the sound for 3 is Pling');
    TestIs(RunExercise(5), 'Plang', 'the sound for 5 is Plang');
    TestIs(RunExercise(7), 'Plong', 'the sound for 7 is Plong');
    TestIs(RunExercise(6), 'Pling', 'the sound for 6 is Pling as it has a factor 3');
    TestIs(RunExercise(8), '8', '2 to the power 3 does not make a raindrop sound as 3 is the exponent not the base');
    TestIs(RunExercise(9), 'Pling', 'the sound for 9 is Pling as it has a factor 3');
    TestIs(RunExercise(10), 'Plang', 'the sound for 10 is Plang as it has a factor 5');
    TestIs(RunExercise(14), 'Plong', 'the sound for 14 is Plong as it has a factor of 7');
    TestIs(RunExercise(15), 'PlingPlang', 'the sound for 15 is PlingPlang as it has factors 3 and 5');
    TestIs(RunExercise(21), 'PlingPlong', 'the sound for 21 is PlingPlong as it has factors 3 and 7');
    TestIs(RunExercise(25), 'Plang', 'the sound for 25 is Plang as it has a factor 5');
    TestIs(RunExercise(27), 'Pling', 'the sound for 27 is Pling as it has a factor 3');
    TestIs(RunExercise(35), 'PlangPlong', 'the sound for 35 is PlangPlong as it has factors 5 and 7');
    TestIs(RunExercise(49), 'Plong', 'the sound for 49 is Plong as it has a factor 7');
    TestIs(RunExercise(52), '52', 'the sound for 52 is 52');
    TestIs(RunExercise(105), 'PlingPlangPlong', 'the sound for 105 is PlingPlangPlong as it has factors 3, 5 and 7');
    TestIs(RunExercise(3125), 'Plang', 'the sound for 3125 is Plang as it has a factor 5');

    DoneTesting;
End.
