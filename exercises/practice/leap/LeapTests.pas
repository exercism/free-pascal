Program LeapTests;

Uses TAP, Leap;

Begin
    Plan(9);

    TestIs(RunExercise(2015), false, 'year not divisible by 4 in common year');
    TestIs(RunExercise(1970), false, 'year divisible by 2, not divisible by 4 in common year');
    TestIs(RunExercise(1996), true , 'year divisible by 4, not divisible by 100 in leap year');
    TestIs(RunExercise(1960), true , 'year divisible by 4 and 5 is still a leap year');
    TestIs(RunExercise(2100), false, 'year divisible by 100, not divisible by 400 in common year');
    TestIs(RunExercise(1900), false, 'year divisible by 100 but not by 3 is still not a leap year');
    TestIs(RunExercise(2000), true , 'year divisible by 400 is leap year');
    TestIs(RunExercise(2400), true , 'year divisible by 400 but not by 125 is still a leap year');
    TestIs(RunExercise(1800), false, 'year divisible by 200, not divisible by 400 in common year');

    DoneTesting;
End.
