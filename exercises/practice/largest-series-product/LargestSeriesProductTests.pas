Program LargestSeriesProductTests;

{$mode ObjFPC}{$H+}

Uses TAP, SysUtils, LargestSeriesProduct;

Procedure TestExceptionMessage(
    Const digits : String; Const span: Integer;
    Const Expected: String; Const TestName : String
);
Var ErrorMessage : String;
Begin
    ErrorMessage := '';
    Try RunExercise(digits, span);
    Except On E: Exception Do ErrorMessage := E.Message End;
    TestIs(ErrorMessage, Expected, TestName);
End;

Begin
    Plan(15);

    TestIs(RunExercise('29', 2), 18, 'finds the largest product if span equals length');
    TestIs(RunExercise('0123456789', 2), 72, 'can find the largest product of 2 with numbers in order');
    TestIs(RunExercise('576802143', 2), 48, 'can find the largest product of 2');
    TestIs(RunExercise('0123456789', 3), 504, 'can find the largest product of 3 with numbers in order');
    TestIs(RunExercise('1027839564', 3), 270, 'can find the largest product of 3');
    TestIs(RunExercise('0123456789', 5), 15120, 'can find the largest product of 5 with numbers in order');
    TestIs(RunExercise('73167176531330624919225119674426574742355349194934', 6), 23520, 'can get the largest product of a big number');
    TestIs(RunExercise('0000', 2), 0, 'reports zero if the only digits are zero');
    TestIs(RunExercise('99099', 3), 0, 'reports zero if all spans include zero');
    TestExceptionMessage('123', 4, 'span must not exceed string length', 'rejects span longer than string length');
    TestIs(RunExercise('', 0), 1, 'reports 1 for empty string and empty product (0 span)');
    TestIs(RunExercise('123', 0), 1, 'reports 1 for nonempty string and empty product (0 span)');
    TestExceptionMessage('', 1, 'span must not exceed string length', 'rejects empty string and nonzero span');
    TestExceptionMessage('1234a5', 2, 'digits input must only contain digits', 'rejects invalid character in digits');
    TestExceptionMessage('12345', -1, 'span must not be negative', 'rejects negative span');

    DoneTesting;
End.
