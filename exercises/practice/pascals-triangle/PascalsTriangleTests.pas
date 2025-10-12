Program PascalsTriangleTests;

{$mode ObjFPC}{$H+}

Uses TAP, SysUtils, PascalsTriangle;

Begin
    Plan(8);

    TestIs(RunExercise(0), [], 'zero rows');
    TestIs(RunExercise(1), [[1]], 'single row');
    TestIs(RunExercise(2), [[1],[1,1]], 'two rows');
    TestIs(RunExercise(3), [[1],[1,1],[1,2,1]], 'three rows');
    TestIs(RunExercise(4), [[1],[1,1],[1,2,1],[1,3,3,1]], 'four rows');
    TestIs(RunExercise(5), [[1],[1,1],[1,2,1],[1,3,3,1],[1,4,6,4,1]], 'five rows');
    TestIs(RunExercise(6), [[1],[1,1],[1,2,1],[1,3,3,1],[1,4,6,4,1],[1,5,10,10,5,1]], 'six rows');
    TestIs(RunExercise(10), [[1],[1,1],[1,2,1],[1,3,3,1],[1,4,6,4,1],[1,5,10,10,5,1],[1,6,15,20,15,6,1],[1,7,21,35,35,21,7,1],[1,8,28,56,70,56,28,8,1],[1,9,36,84,126,126,84,36,9,1]], 'ten rows');

    DoneTesting;
End.
