Program BobTests;

{$mode ObjFPC}{$H+}

Uses TAP, TAPCore, SysUtils, Bob;

Begin
    Plan(25);

    TestIs(RunExercise('Tom-ay-to, tom-aaaah-to.'), 'Whatever.', 'stating something');
    TestIs(RunExercise('WATCH OUT!'), 'Whoa, chill out!', 'shouting');
    TestIs(RunExercise('FCECDFCAAB'), 'Whoa, chill out!', 'shouting gibberish');
    TestIs(RunExercise('Does this cryogenic chamber make me look fat?'), 'Sure.', 'asking a question');
    TestIs(RunExercise('You are, what, like 15?'), 'Sure.', 'asking a numeric question');
    TestIs(RunExercise('fffbbcbeab?'), 'Sure.', 'asking gibberish');
    TestIs(RunExercise('Hi there!'), 'Whatever.', 'talking forcefully');
    TestIs(RunExercise('It''s OK if you don''t want to go work for NASA.'), 'Whatever.', 'using acronyms in regular speech');
    TestIs(RunExercise('WHAT''S GOING ON?'), 'Calm down, I know what I''m doing!', 'forceful question');
    TestIs(RunExercise('1, 2, 3 GO!'), 'Whoa, chill out!', 'shouting numbers');
    TestIs(RunExercise('1, 2, 3'), 'Whatever.', 'no letters');
    TestIs(RunExercise('4?'), 'Sure.', 'question with no letters');
    TestIs(RunExercise('ZOMG THE %^*@#$(*^ ZOMBIES ARE COMING!!11!!1!'), 'Whoa, chill out!', 'shouting with special characters');
    TestIs(RunExercise('I HATE THE DENTIST'), 'Whoa, chill out!', 'shouting with no exclamation mark');
    TestIs(RunExercise('Ending with ? means a question.'), 'Whatever.', 'statement containing question mark');
    TestIs(RunExercise(':) ?'), 'Sure.', 'non-letters with question');
    TestIs(RunExercise('Wait! Hang on. Are you going to be OK?'), 'Sure.', 'prattling on');
    TestIs(RunExercise(''), 'Fine. Be that way!', 'silence');
    TestIs(RunExercise('          '), 'Fine. Be that way!', 'prolonged silence');
    TestIs(RunExercise('										'), 'Fine. Be that way!', 'alternate silence');
    TestIs(RunExercise('         hmmmmmmm...'), 'Whatever.', 'starting with whitespace');
    TestIs(RunExercise('Okay if like my  spacebar  quite a bit?   '), 'Sure.', 'ending with whitespace');
    TestIs(RunExercise(#10#13 + '       '), 'Fine. Be that way!', 'other whitespace');
    TestIs(RunExercise('This is a statement ending with whitespace      '), 'Whatever.', 'non-question ending with whitespace');
    TestIs(RunExercise(#10 + 'Does this cryogenic chamber make' + #10 + ' me look fat?'), 'Sure.', 'multiple line question');

    DoneTesting;
End.
