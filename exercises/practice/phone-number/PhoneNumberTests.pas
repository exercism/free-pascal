Program PhoneNumberTests;

{$mode ObjFPC}{$H+}

Uses TAP, SysUtils, PhoneNumber;

Procedure TestExceptionMessage(
    Const phrase: String;
    Const Expected: String; Const TestName : String
);
Var ErrorMessage :   String;
Begin
    ErrorMessage := '';
    Try RunExercise(phrase);
    Except On E: Exception Do ErrorMessage := E.Message End;
    TestIs(ErrorMessage, Expected, TestName);
End;

Begin
    Plan(18);

    TestIs(RunExercise('(223) 456-7890'), '2234567890', 'cleans the number');
    TestIs(RunExercise('223.456.7890'), '2234567890', 'cleans numbers with dots');
    TestIs(RunExercise('223 456   7890   '), '2234567890', 'cleans numbers with multiple spaces');
    TestExceptionMessage('123456789', 'must not be fewer than 10 digits', 'invalid when 9 digits');
    TestExceptionMessage('22234567890', '11 digits must start with 1', 'invalid when 11 digits does not start with a 1');
    TestIs(RunExercise('12234567890'), '2234567890', 'valid when 11 digits and starting with 1');
    TestIs(RunExercise('+1 (223) 456-7890'), '2234567890', 'valid when 11 digits and starting with 1 even with punctuation');
    TestExceptionMessage('321234567890', 'must not be greater than 11 digits', 'invalid when more than 11 digits');
    TestExceptionMessage('523-abc-7890', 'letters not permitted', 'invalid with letters');
    TestExceptionMessage('523-@:!-7890', 'punctuations not permitted', 'invalid with punctuations');
    TestExceptionMessage('(023) 456-7890', 'area code cannot start with zero', 'invalid if area code starts with 0');
    TestExceptionMessage('(123) 456-7890', 'area code cannot start with one', 'invalid if area code starts with 1');
    TestExceptionMessage('(223) 056-7890', 'exchange code cannot start with zero', 'invalid if exchange code starts with 0');
    TestExceptionMessage('(223) 156-7890', 'exchange code cannot start with one', 'invalid if exchange code starts with 1');
    TestExceptionMessage('1 (023) 456-7890', 'area code cannot start with zero', 'invalid if area code starts with 0 on valid 11-digit number');
    TestExceptionMessage('1 (123) 456-7890', 'area code cannot start with one', 'invalid if area code starts with 1 on valid 11-digit number');
    TestExceptionMessage('1 (223) 056-7890', 'exchange code cannot start with zero', 'invalid if exchange code starts with 0 on valid 11-digit number');
    TestExceptionMessage('1 (223) 156-7890', 'exchange code cannot start with one', 'invalid if exchange code starts with 1 on valid 11-digit number');

    DoneTesting;
End.
