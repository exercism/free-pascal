Program ArmstrongNumbersTests;

Uses TAP, TAPCore, ArmstrongNumbers;

Begin

    Plan(11);

    TestIs(RunExercise(0), true, 'Zero is an Armstrong number');
    TestIs(RunExercise(5), true, 'Single-digit numbers are Armstrong numbers');
    TestIs(RunExercise(10), false, 'There are no two-digit Armstrong numbers');
    TestIs(RunExercise(153), true, 'Three-digit number that is an Armstrong number');
    TestIs(RunExercise(100), false, 'Three-digit number that is not an Armstrong number');
    TestIs(RunExercise(9474), true, 'Four-digit number that is an Armstrong number');
    TestIs(RunExercise(9475), false, 'Four-digit number that is not an Armstrong number');
    TestIs(RunExercise(9926315), true, 'Seven-digit number that is an Armstrong number');
    TestIs(RunExercise(9926314), false, 'Seven-digit number that is not an Armstrong number');

    DoneTesting;
End.
