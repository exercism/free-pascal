Program PerfectNumbersTests;

{$mode ObjFPC}{$H+}

Uses TAP, SysUtils, PerfectNumbers;

Procedure TestExceptionMessage(
    Const number: Integer;
    Const Expected: String; Const TestName : String
);
Var ErrorMessage :   String;
Begin
    ErrorMessage := '';
    Try RunExercise(number);
    Except On E: Exception Do ErrorMessage := E.Message End;
    TestIs(ErrorMessage, Expected, TestName);
End;

Begin
    Plan(13);

    TestIs(RunExercise(6), 'perfect', 'Smallest perfect number is classified correctly');
    TestIs(RunExercise(28), 'perfect', 'Medium perfect number is classified correctly');
    TestIs(RunExercise(33550336), 'perfect', 'Large perfect number is classified correctly');
    TestIs(RunExercise(12), 'abundant', 'Smallest abundant number is classified correctly');
    TestIs(RunExercise(30), 'abundant', 'Medium abundant number is classified correctly');
    TestIs(RunExercise(33550335), 'abundant', 'Large abundant number is classified correctly');
    TestIs(RunExercise(2), 'deficient', 'Smallest prime deficient number is classified correctly');
    TestIs(RunExercise(4), 'deficient', 'Smallest non-prime deficient number is classified correctly');
    TestIs(RunExercise(32), 'deficient', 'Medium deficient number is classified correctly');
    TestIs(RunExercise(33550337), 'deficient', 'Large deficient number is classified correctly');
    TestIs(RunExercise(1), 'deficient', 'Edge case (no factors other than itself) is classified correctly');
    TestExceptionMessage(0, 'Classification is only possible for positive integers.', 'Zero is rejected (as it is not a positive integer)');
    TestExceptionMessage(-1, 'Classification is only possible for positive integers.', 'Negative integer is rejected (as it is not a positive integer)');

    DoneTesting;
End.
