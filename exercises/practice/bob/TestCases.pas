unit TestCases;

{$mode ObjFPC}{$H+}

interface

uses Classes, SysUtils, FPCUnit, TestRegistry, FPCUnitTestUtils;

type
  BobTest = class(TTestCase)
  published
    procedure stating_something;
    procedure shouting;
    procedure shouting_gibberish;
    procedure asking_a_question;
    procedure asking_a_numeric_question;
    procedure asking_gibberish;
    procedure talking_forcefully;
    procedure using_acronyms_in_regular_speech;
    procedure forceful_question;
    procedure shouting_numbers;
    procedure no_letters;
    procedure question_with_no_letters;
    procedure shouting_with_special_characters;
    procedure shouting_with_no_exclamation_mark;
    procedure statement_containing_question_mark;
    procedure non_letters_with_question;
    procedure prattling_on;
    procedure silence;
    procedure prolonged_silence;
    procedure alternate_silence;
    procedure starting_with_whitespace;
    procedure ending_with_whitespace;
    procedure other_whitespace;
    procedure non_question_ending_with_whitespace;
    procedure multiple_line_question;
  end;

implementation

uses Bob;

// e162fead-606f-437a-a166-d051915cea8e
procedure BobTest.stating_something;
begin
  TapAssertTrue(Self, 'stating something', 'Whatever.', Bob.response('Tom-ay-to, tom-aaaah-to.'));
end;

// 73a966dc-8017-47d6-bb32-cf07d1a5fcd9
procedure BobTest.shouting;
begin
  TapAssertTrue(Self, 'shouting', 'Whoa, chill out!', Bob.response('WATCH OUT!'));
end;

// d6c98afd-df35-4806-b55e-2c457c3ab748
procedure BobTest.shouting_gibberish;
begin
  TapAssertTrue(Self, 'shouting gibberish', 'Whoa, chill out!', Bob.response('FCECDFCAAB'));
end;

// 8a2e771d-d6f1-4e3f-b6c6-b41495556e37
procedure BobTest.asking_a_question;
begin
  TapAssertTrue(Self, 'asking a question', 'Sure.', Bob.response('Does this cryogenic chamber make me look fat?'));
end;

// 81080c62-4e4d-4066-b30a-48d8d76920d9
procedure BobTest.asking_a_numeric_question;
begin
  TapAssertTrue(Self, 'asking a numeric question', 'Sure.', Bob.response('You are, what, like 15?'));
end;

// 2a02716d-685b-4e2e-a804-2adaf281c01e
procedure BobTest.asking_gibberish;
begin
  TapAssertTrue(Self, 'asking gibberish', 'Sure.', Bob.response('fffbbcbeab?'));
end;

// c02f9179-ab16-4aa7-a8dc-940145c385f7
procedure BobTest.talking_forcefully;
begin
  TapAssertTrue(Self, 'talking forcefully', 'Whatever.', Bob.response('Hi there!'));
end;

// 153c0e25-9bb5-4ec5-966e-598463658bcd
procedure BobTest.using_acronyms_in_regular_speech;
begin
  TapAssertTrue(Self, 'using acronyms in regular speech', 'Whatever.', Bob.response('It''s OK if you don''t want to go work for NASA.'));
end;

// a5193c61-4a92-4f68-93e2-f554eb385ec6
procedure BobTest.forceful_question;
begin
  TapAssertTrue(Self, 'forceful question', 'Calm down, I know what I''m doing!', Bob.response('WHAT''S GOING ON?'));
end;

// a20e0c54-2224-4dde-8b10-bd2cdd4f61bc
procedure BobTest.shouting_numbers;
begin
  TapAssertTrue(Self, 'shouting numbers', 'Whoa, chill out!', Bob.response('1, 2, 3 GO!'));
end;

// f7bc4b92-bdff-421e-a238-ae97f230ccac
procedure BobTest.no_letters;
begin
  TapAssertTrue(Self, 'no letters', 'Whatever.', Bob.response('1, 2, 3'));
end;

// bb0011c5-cd52-4a5b-8bfb-a87b6283b0e2
procedure BobTest.question_with_no_letters;
begin
  TapAssertTrue(Self, 'question with no letters', 'Sure.', Bob.response('4?'));
end;

// 496143c8-1c31-4c01-8a08-88427af85c66
procedure BobTest.shouting_with_special_characters;
begin
  TapAssertTrue(Self, 'shouting with special characters', 'Whoa, chill out!', Bob.response('ZOMG THE %^*@#$(*^ ZOMBIES ARE COMING!!11!!1!'));
end;

// e6793c1c-43bd-4b8d-bc11-499aea73925f
procedure BobTest.shouting_with_no_exclamation_mark;
begin
  TapAssertTrue(Self, 'shouting with no exclamation mark', 'Whoa, chill out!', Bob.response('I HATE THE DENTIST'));
end;

// aa8097cc-c548-4951-8856-14a404dd236a
procedure BobTest.statement_containing_question_mark;
begin
  TapAssertTrue(Self, 'statement containing question mark', 'Whatever.', Bob.response('Ending with ? means a question.'));
end;

// 9bfc677d-ea3a-45f2-be44-35bc8fa3753e
procedure BobTest.non_letters_with_question;
begin
  TapAssertTrue(Self, 'non-letters with question', 'Sure.', Bob.response(':) ?'));
end;

// 8608c508-f7de-4b17-985b-811878b3cf45
procedure BobTest.prattling_on;
begin
  TapAssertTrue(Self, 'prattling on', 'Sure.', Bob.response('Wait! Hang on. Are you going to be OK?'));
end;

// bc39f7c6-f543-41be-9a43-fd1c2f753fc0
procedure BobTest.silence;
begin
  TapAssertTrue(Self, 'silence', 'Fine. Be that way!', Bob.response(''));
end;

// d6c47565-372b-4b09-b1dd-c40552b8378b
procedure BobTest.prolonged_silence;
begin
  TapAssertTrue(Self, 'prolonged silence', 'Fine. Be that way!', Bob.response('          '));
end;

// 4428f28d-4100-4d85-a902-e5a78cb0ecd3
procedure BobTest.alternate_silence;
begin
  TapAssertTrue(Self, 'alternate silence', 'Fine. Be that way!', Bob.response(#9 + #9 + #9 + #9 + #9 + #9 + #9 + #9 + #9 + #9));
end;

// 5371ef75-d9ea-4103-bcfa-2da973ddec1b
procedure BobTest.starting_with_whitespace;
begin
  TapAssertTrue(Self, 'starting with whitespace', 'Whatever.', Bob.response('         hmmmmmmm...'));
end;

// 05b304d6-f83b-46e7-81e0-4cd3ca647900
procedure BobTest.ending_with_whitespace;
begin
  TapAssertTrue(Self, 'ending with whitespace', 'Sure.', Bob.response('Okay if like my  spacebar  quite a bit?   '));
end;

// 72bd5ad3-9b2f-4931-a988-dce1f5771de2
procedure BobTest.other_whitespace;
begin
  TapAssertTrue(Self, 'other whitespace', 'Fine. Be that way!', Bob.response(#10 + #13 + ' ' + #9));
end;

// 12983553-8601-46a8-92fa-fcaa3bc4a2a0
procedure BobTest.non_question_ending_with_whitespace;
begin
  TapAssertTrue(Self, 'non-question ending with whitespace', 'Whatever.', Bob.response('This is a statement ending with whitespace      '));
end;

// 2c7278ac-f955-4eb4-bf8f-e33eb4116a15
procedure BobTest.multiple_line_question;
begin
  TapAssertTrue(Self, 'multiple line question', 'Sure.', Bob.response(#10 + 'Does this cryogenic chamber make' + #10 + ' me look fat?'));
end;

initialization
RegisterTest(BobTest);

end.
