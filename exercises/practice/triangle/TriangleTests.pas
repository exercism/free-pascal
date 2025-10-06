Program TriangleTests;

Uses TAP, Triangle;

Begin
    Plan(21);

    TestIs(RunExercise('equilateral', 2, 2, 2), true, 'all sides are equal');
    TestIs(RunExercise('equilateral', 2, 3, 2), false, 'any side is unequal');
    TestIs(RunExercise('equilateral', 5, 4, 6), false, 'no sides are equal');
    TestIs(RunExercise('equilateral', 0, 0, 0), false, 'all zero sides is not a triangle');
    TestIs(RunExercise('equilateral', 0.5, 0.5, 0.5), true, 'sides may be floats');
    TestIs(RunExercise('isosceles', 3, 4, 4), true, 'last two sides are equal');
    TestIs(RunExercise('isosceles', 4, 4, 3), true, 'first two sides are equal');
    TestIs(RunExercise('isosceles', 4, 3, 4), true, 'first and last sides are equal');
    TestIs(RunExercise('isosceles', 4, 4, 4), true, 'equilateral triangles are also isosceles');
    TestIs(RunExercise('isosceles', 2, 3, 4), false, 'no sides are equal');
    TestIs(RunExercise('isosceles', 1, 1, 3), false, 'first triangle inequality violation');
    TestIs(RunExercise('isosceles', 1, 3, 1), false, 'second triangle inequality violation');
    TestIs(RunExercise('isosceles', 3, 1, 1), false, 'third triangle inequality violation');
    TestIs(RunExercise('isosceles', 0.5, 0.4, 0.5), true, 'sides may be floats');
    TestIs(RunExercise('scalene', 5, 4, 6), true, 'no sides are equal');
    TestIs(RunExercise('scalene', 4, 4, 4), false, 'all sides are equal');
    TestIs(RunExercise('scalene', 4, 4, 3), false, 'first and second sides are equal');
    TestIs(RunExercise('scalene', 3, 4, 3), false, 'first and third sides are equal');
    TestIs(RunExercise('scalene', 4, 3, 3), false, 'second and third sides are equal');
    TestIs(RunExercise('scalene', 7, 3, 2), false, 'may not violate triangle inequality');
    TestIs(RunExercise('scalene', 0.5, 0.4, 0.6), true, 'sides may be floats');

    DoneTesting;
End.
