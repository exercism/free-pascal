Program SumOfMultiplesTests;

{$mode ObjFPC}{$H+}

Uses TAP, SysUtils, SumOfMultiples;

Begin
    Plan(16);

    TestIs(RunExercise([3,5], 1), 0, 'no multiples within limit');
    TestIs(RunExercise([3,5], 4), 3, 'one factor has multiples within limit');
    TestIs(RunExercise([3], 7), 9, 'more than one multiple within limit');
    TestIs(RunExercise([3,5], 10), 23, 'more than one factor with multiples within limit');
    TestIs(RunExercise([3,5], 100), 2318, 'each multiple is only counted once');
    TestIs(RunExercise([3,5], 1000), 233168, 'a much larger limit');
    TestIs(RunExercise([7,13,17], 20), 51, 'three factors');
    TestIs(RunExercise([4,6], 15), 30, 'factors not relatively prime');
    TestIs(RunExercise([5,6,8], 150), 4419, 'some pairs of factors relatively prime and some not');
    TestIs(RunExercise([5,25], 51), 275, 'one factor is a multiple of another');
    TestIs(RunExercise([43,47], 10000), 2203160, 'much larger factors');
    TestIs(RunExercise([1], 100), 4950, 'all numbers are multiples of 1');
    TestIs(RunExercise([], 10000), 0, 'no factors means an empty sum');
    TestIs(RunExercise([0], 1), 0, 'the only multiple of 0 is 0');
    TestIs(RunExercise([3,0], 4), 3, 'the factor 0 does not affect the sum of multiples of other factors');
    TestIs(RunExercise([2,3,5,7,11], 10000), 39614537, 'solutions using include-exclude must extend to cardinality greater than 3');

    DoneTesting;
End.
