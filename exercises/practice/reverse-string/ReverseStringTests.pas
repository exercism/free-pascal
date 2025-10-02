Program ReverseStringTests;

Uses TAP, TAPCore, ReverseString;

Begin
    Plan(6);

    TestIs(RunExercise(''), '', 'an empty string');
    TestIs(RunExercise('robot'), 'tobor', 'a word');
    TestIs(RunExercise('Ramen'), 'nemaR', 'a capitalized word');
    TestIs(RunExercise('I''m hungry!'), '!yrgnuh m''I', 'a sentence with punctuation');
    TestIs(RunExercise('racecar'), 'racecar', 'a palindrome');
    TestIs(RunExercise('drawer'), 'reward', 'an even-sized word');

    DoneTesting;
End.
