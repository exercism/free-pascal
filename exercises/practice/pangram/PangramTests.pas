Program PangramTests;

Uses TAP, Pangram;

Begin
    Plan(10);

    TestIs(RunExercise(''), false, 'empty sentence');
    TestIs(RunExercise('abcdefghijklmnopqrstuvwxyz'), true, 'perfect lower case');
    TestIs(RunExercise('the quick brown fox jumps over the lazy dog'), true, 'only lower case');
    TestIs(RunExercise('a quick movement of the enemy will jeopardize five gunboats'), false, 'missing the letter ''x''');
    TestIs(RunExercise('five boxing wizards jump quickly at it'), false, 'missing the letter ''h''');
    TestIs(RunExercise('the_quick_brown_fox_jumps_over_the_lazy_dog'), true, 'with underscores');
    TestIs(RunExercise('the 1 quick brown fox jumps over the 2 lazy dogs'), true, 'with numbers');
    TestIs(RunExercise('7h3 qu1ck brown fox jumps ov3r 7h3 lazy dog'), false, 'missing letters replaced by numbers');
    TestIs(RunExercise('"Five quacking Zephyrs jolt my wax bed."'), true, 'mixed case and punctuation');
    TestIs(RunExercise('abcdefghijklm ABCDEFGHIJKLM'), false, 'a-m and A-M are 26 different characters but not a pangram');

    DoneTesting;
End.
