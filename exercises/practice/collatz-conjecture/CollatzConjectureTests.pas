Program CollatzConjectureTests;

{$mode ObjFPC}{$H+}

Uses TAP, TAPCore, SysUtils, CollatzConjecture;

Var
   ErrorMessage : string;

Begin
    Plan(6);

    TestIs(RunExercise(1), 0, 'zero steps for one');
    TestIs(RunExercise(16), 4, 'divide if even');
    TestIs(RunExercise(12), 9, 'even and odd steps');
    TestIs(RunExercise(1000000), 152, 'large number of even and odd steps');

    ErrorMessage := '';
    Try RunExercise(0);
    Except On E: Exception do ErrorMessage := E.Message; End;
    TestIs(ErrorMessage, 'Only positive integers are allowed', 'zero is an error');

    ErrorMessage := '';
    Try RunExercise(-15);
    Except On E: Exception do ErrorMessage := E.Message; End;
    TestIs(ErrorMessage, 'Only positive integers are allowed', 'negative value is an error');

    DoneTesting;
End.
