Program IsogramTests;

Uses TAP, TAPCore, Isogram;

Begin
    Plan(14);

    TestIs(RunExercise(''), true, 'empty string');
    TestIs(RunExercise('isogram'), true, 'isogram with only lower case characters');
    TestIs(RunExercise('eleven'), false, 'word with one duplicated character');
    TestIs(RunExercise('zzyzx'), false, 'word with one duplicated character from the end of the alphabet');
    TestIs(RunExercise('subdermatoglyphic'), true, 'longest reported english isogram');
    TestIs(RunExercise('Alphabet'), false, 'word with duplicated character in mixed case');
    TestIs(RunExercise('alphAbet'), false, 'word with duplicated character in mixed case, lowercase first');
    TestIs(RunExercise('thumbscrew-japingly'), true, 'hypothetical isogrammic word with hyphen');
    TestIs(RunExercise('thumbscrew-jappingly'), false, 'hypothetical word with duplicated character following hyphen');
    TestIs(RunExercise('six-year-old'), true, 'isogram with duplicated hyphen');
    TestIs(RunExercise('Emily Jung Schwartzkopf'), true, 'made-up name that is an isogram');
    TestIs(RunExercise('accentor'), false, 'duplicated character in the middle');
    TestIs(RunExercise('angola'), false, 'same first and last characters');
    TestIs(RunExercise('up-to-date'), false, 'word with duplicated character and with two hyphens');

    DoneTesting;
End.
