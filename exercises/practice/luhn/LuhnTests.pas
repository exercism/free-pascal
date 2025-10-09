Program LuhnTests;

{$mode ObjFPC}{$H+}

Uses TAP, SysUtils, Luhn;

Begin
    Plan(22);

    TestIs(RunExercise('1'), false, 'single digit strings can not be valid');
    TestIs(RunExercise('0'), false, 'a single zero is invalid');
    TestIs(RunExercise('059'), true, 'a simple valid SIN that remains valid if reversed');
    TestIs(RunExercise('59'), true, 'a simple valid SIN that becomes invalid if reversed');
    TestIs(RunExercise('055 444 285'), true, 'a valid Canadian SIN');
    TestIs(RunExercise('055 444 286'), false, 'invalid Canadian SIN');
    TestIs(RunExercise('8273 1232 7352 0569'), false, 'invalid credit card');
    TestIs(RunExercise('1 2345 6789 1234 5678 9012'), false, 'invalid long number with an even remainder');
    TestIs(RunExercise('1 2345 6789 1234 5678 9013'), false, 'invalid long number with a remainder divisible by 5');
    TestIs(RunExercise('095 245 88'), true, 'valid number with an even number of digits');
    TestIs(RunExercise('234 567 891 234'), true, 'valid number with an odd number of spaces');
    TestIs(RunExercise('059a'), false, 'valid strings with a non-digit added at the end become invalid');
    TestIs(RunExercise('055-444-285'), false, 'valid strings with punctuation included become invalid');
    TestIs(RunExercise('055# 444$ 285'), false, 'valid strings with symbols included become invalid');
    TestIs(RunExercise(' 0'), false, 'single zero with space is invalid');
    TestIs(RunExercise('0000 0'), true, 'more than a single zero is valid');
    TestIs(RunExercise('091'), true, 'input digit 9 is correctly converted to output digit 9');
    TestIs(RunExercise('9999999999 9999999999 9999999999 9999999999'), true, 'very long input is valid');
    TestIs(RunExercise('109'), true, 'valid luhn with an odd number of digits and non zero first digit');
    TestIs(RunExercise('055b 444 285'), false, 'using ascii value for non-doubled non-digit isn''t allowed');
    TestIs(RunExercise(':9'), false, 'using ascii value for doubled non-digit isn''t allowed');
    TestIs(RunExercise('59%59'), false, 'non-numeric, non-space char in the middle with a sum that''s divisible by 10 isn''t allowed');

    DoneTesting;
End.
