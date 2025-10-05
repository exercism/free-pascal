Program AllYourBaseTests;

{$mode ObjFPC}{$H+}

Uses TAP, SysUtils, AllYourBase;

Procedure TestExceptionMessage(
    Const InputBase   : Integer;
    Const InputDigits : IntArray;
    Const OutputBase  : Integer;
    Const Expected: String; Const TestName : String
);
Begin
    Try RunExercise(InputBase, InputDigits, OutputBase);
    Except On E: Exception Do
        TestIs(E.Message, Expected, TestName);
    End;
End;

Begin
    Plan(21);

    TestIs(RunExercise(2, [1], 10), [1], 'single bit one to decimal');
    TestIs(RunExercise(2, [1,0,1], 10), [5], 'binary to single decimal');
    TestIs(RunExercise(10, [5], 2), [1,0,1], 'single decimal to binary');
    TestIs(RunExercise(2, [1,0,1,0,1,0], 10), [4,2], 'binary to multiple decimal');
    TestIs(RunExercise(10, [4,2], 2), [1,0,1,0,1,0], 'decimal to binary');
    TestIs(RunExercise(3, [1,1,2,0], 16), [2,10], 'trinary to hexadecimal');
    TestIs(RunExercise(16, [2,10], 3), [1,1,2,0], 'hexadecimal to trinary');
    TestIs(RunExercise(97, [3,46,60], 73), [6,10,45], '15-bit integer');
    TestIs(RunExercise(2, [], 10), [0], 'empty list');
    TestIs(RunExercise(10, [0], 2), [0], 'single zero');
    TestIs(RunExercise(10, [0,0,0], 2), [0], 'multiple zeros');
    TestIs(RunExercise(7, [0,6,0], 10), [4,2], 'leading zeros');
    TestExceptionMessage(1, [0], 10, 'input base must be >= 2', 'input base is one');
    TestExceptionMessage(0, [], 10, 'input base must be >= 2', 'input base is zero');
    TestExceptionMessage(-2, [1], 10, 'input base must be >= 2', 'input base is negative');
    TestExceptionMessage(2, [1,-1,1,0,1,0], 10, 'all digits must satisfy 0 <= d < input base', 'negative digit');
    TestExceptionMessage(2, [1,2,1,0,1,0], 10, 'all digits must satisfy 0 <= d < input base', 'invalid positive digit');
    TestExceptionMessage(2, [1,0,1,0,1,0], 1, 'output base must be >= 2', 'output base is one');
    TestExceptionMessage(10, [7], 0, 'output base must be >= 2', 'output base is zero');
    TestExceptionMessage(2, [1], -7, 'output base must be >= 2', 'output base is negative');
    TestExceptionMessage(-2, [1], -7, 'input base must be >= 2', 'both bases are negative');

    DoneTesting;
End.
