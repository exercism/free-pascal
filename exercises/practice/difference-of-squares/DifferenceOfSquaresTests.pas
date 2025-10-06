Program DifferenceOfSquaresTests;

Uses TAP, DifferenceOfSquares;

Begin
    Plan(9);

    TestIs(RunExercise('squareOfSum', 1), 1, 'square of sum 1');
    TestIs(RunExercise('squareOfSum', 5), 225, 'square of sum 5');
    TestIs(RunExercise('squareOfSum', 100), 25502500, 'square of sum 100');
    TestIs(RunExercise('sumOfSquares', 1), 1, 'sum of squares 1');
    TestIs(RunExercise('sumOfSquares', 5), 55, 'sum of squares 5');
    TestIs(RunExercise('sumOfSquares', 100), 338350, 'sum of squares 100');
    TestIs(RunExercise('differenceOfSquares', 1), 0, 'difference of squares 1');
    TestIs(RunExercise('differenceOfSquares', 5), 170, 'difference of squares 5');
    TestIs(RunExercise('differenceOfSquares', 100), 25164150, 'difference of squares 100');

    DoneTesting;
End.
