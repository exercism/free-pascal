Program SecretHandshakeTests;

{$mode ObjFPC}{$H+}

Uses TAP, SysUtils, SecretHandshake;

Begin
    Plan(11);

    TestIs(RunExercise(1), ['wink'], 'wink for 1');
    TestIs(RunExercise(2), ['double blink'], 'double blink for 10');
    TestIs(RunExercise(4), ['close your eyes'], 'close your eyes for 100');
    TestIs(RunExercise(8), ['jump'], 'jump for 1000');
    TestIs(RunExercise(3), ['wink','double blink'], 'combine two actions');
    TestIs(RunExercise(19), ['double blink','wink'], 'reverse two actions');
    TestIs(RunExercise(24), ['jump'], 'reversing one action gives the same action');
    TestIs(RunExercise(16), [], 'reversing no actions still gives no actions');
    TestIs(RunExercise(15), ['wink','double blink','close your eyes','jump'], 'all possible actions');
    TestIs(RunExercise(31), ['jump','close your eyes','double blink','wink'], 'reverse all possible actions');
    TestIs(RunExercise(0), [], 'do nothing for zero');

    DoneTesting;
End.
