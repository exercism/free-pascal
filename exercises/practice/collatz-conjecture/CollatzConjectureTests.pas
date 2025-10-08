Program CollatzConjectureTests;

{$mode ObjFPC}{$H+}

Uses TAP, SysUtils, CollatzConjecture;

Procedure TestExceptionMessage(
    number: Integer;
    Expected: String; TestName : String
);
Var ErrorMessage :   String;
Begin
    ErrorMessage := '';
    Try RunExercise(number);
    Except On E: Exception Do ErrorMessage := E.Message End;
    TestIs(ErrorMessage, Expected, TestName);
End;

Begin
    Plan(6);

    TestIs(RunExercise(1), 0, 'zero steps for one');
    TestIs(RunExercise(16), 4, 'divide if even');
    TestIs(RunExercise(12), 9, 'even and odd steps');
    TestIs(RunExercise(1000000), 152, 'large number of even and odd steps');
    TestExceptionMessage(0, 'Only positive integers are allowed', 'zero is an error');
    TestExceptionMessage(-15, 'Only positive integers are allowed', 'negative value is an error');

    DoneTesting;
End.
