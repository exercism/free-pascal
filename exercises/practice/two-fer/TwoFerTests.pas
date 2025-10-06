Program TwoFerTests;

Uses TAP, TwoFer;

Begin
    Plan(3);

   TestIs(RunExercise(''), 'One for you, one for me.', 'no name given');
   TestIs(RunExercise('Alice'), 'One for Alice, one for me.', 'a name given');
   TestIs(RunExercise('Bob'), 'One for Bob, one for me.', 'another name given');

   DoneTesting;
End.
