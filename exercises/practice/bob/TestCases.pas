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
const expected = 'Whatever.';
var
  actual  : string;
  message : string;
begin
  actual  := Bob.response('Tom-ay-to, tom-aaaah-to.');
  message := EncodeJsonMessage('stating something', expected, actual);
  AssertTrue(message, expected = actual);
end;

// 73a966dc-8017-47d6-bb32-cf07d1a5fcd9
procedure BobTest.shouting;
const expected = 'Whoa, chill out!';
var
  actual  : string;
  message : string;
begin
  actual  := Bob.response('WATCH OUT!');
  message := EncodeJsonMessage('shouting', expected, actual);
  AssertTrue(message, expected = actual);
end;

// d6c98afd-df35-4806-b55e-2c457c3ab748
procedure BobTest.shouting_gibberish;
const expected = 'Whoa, chill out!';
var
  actual  : string;
  message : string;
begin
  actual  := Bob.response('FCECDFCAAB');
  message := EncodeJsonMessage('shouting gibberish', expected, actual);
  AssertTrue(message, expected = actual);
end;

// 8a2e771d-d6f1-4e3f-b6c6-b41495556e37
procedure BobTest.asking_a_question;
const expected = 'Sure.';
var
  actual  : string;
  message : string;
begin
  actual  := Bob.response('Does this cryogenic chamber make me look fat?');
  message := EncodeJsonMessage('asking a question', expected, actual);
  AssertTrue(message, expected = actual);
end;

// 81080c62-4e4d-4066-b30a-48d8d76920d9
procedure BobTest.asking_a_numeric_question;
const expected = 'Sure.';
var
  actual  : string;
  message : string;
begin
  actual  := Bob.response('You are, what, like 15?');
  message := EncodeJsonMessage('asking a numeric question', expected, actual);
  AssertTrue(message, expected = actual);
end;

// 2a02716d-685b-4e2e-a804-2adaf281c01e
procedure BobTest.asking_gibberish;
const expected = 'Sure.';
var
  actual  : string;
  message : string;
begin
  actual  := Bob.response('fffbbcbeab?');
  message := EncodeJsonMessage('asking gibberish', expected, actual);
  AssertTrue(message, expected = actual);
end;

// c02f9179-ab16-4aa7-a8dc-940145c385f7
procedure BobTest.talking_forcefully;
const expected = 'Whatever.';
var
  actual  : string;
  message : string;
begin
  actual  := Bob.response('Hi there!');
  message := EncodeJsonMessage('talking forcefully', expected, actual);
  AssertTrue(message, expected = actual);
end;

// 153c0e25-9bb5-4ec5-966e-598463658bcd
procedure BobTest.using_acronyms_in_regular_speech;
const expected = 'Whatever.';
var
  actual  : string;
  message : string;
begin
  actual  := Bob.response('It''s OK if you don''t want to go work for NASA.');
  message := EncodeJsonMessage('using acronyms in regular speech', expected, actual);
  AssertTrue(message, expected = actual);
end;

// a5193c61-4a92-4f68-93e2-f554eb385ec6
procedure BobTest.forceful_question;
const expected = 'Calm down, I know what I''m doing!';
var
  actual  : string;
  message : string;
begin
  actual  := Bob.response('WHAT''S GOING ON?');
  message := EncodeJsonMessage('forceful question', expected, actual);
  AssertTrue(message, expected = actual);
end;

// a20e0c54-2224-4dde-8b10-bd2cdd4f61bc
procedure BobTest.shouting_numbers;
const expected = 'Whoa, chill out!';
var
  actual  : string;
  message : string;
begin
  actual  := Bob.response('1, 2, 3 GO!');
  message := EncodeJsonMessage('shouting numbers', expected, actual);
  AssertTrue(message, expected = actual);
end;

// f7bc4b92-bdff-421e-a238-ae97f230ccac
procedure BobTest.no_letters;
const expected = 'Whatever.';
var
  actual  : string;
  message : string;
begin
  actual  := Bob.response('1, 2, 3');
  message := EncodeJsonMessage('no letters', expected, actual);
  AssertTrue(message, expected = actual);
end;

// bb0011c5-cd52-4a5b-8bfb-a87b6283b0e2
procedure BobTest.question_with_no_letters;
const expected = 'Sure.';
var
  actual  : string;
  message : string;
begin
  actual  := Bob.response('4?');
  message := EncodeJsonMessage('question with no letters', expected, actual);
  AssertTrue(message, expected = actual);
end;

// 496143c8-1c31-4c01-8a08-88427af85c66
procedure BobTest.shouting_with_special_characters;
const expected = 'Whoa, chill out!';
var
  actual  : string;
  message : string;
begin
  actual  := Bob.response('ZOMG THE %^*@#$(*^ ZOMBIES ARE COMING!!11!!1!');
  message := EncodeJsonMessage('shouting with special characters', expected, actual);
  AssertTrue(message, expected = actual);
end;

// e6793c1c-43bd-4b8d-bc11-499aea73925f
procedure BobTest.shouting_with_no_exclamation_mark;
const expected = 'Whoa, chill out!';
var
  actual  : string;
  message : string;
begin
  actual  := Bob.response('I HATE THE DENTIST');
  message := EncodeJsonMessage('shouting with no exclamation mark', expected, actual);
  AssertTrue(message, expected = actual);
end;

// aa8097cc-c548-4951-8856-14a404dd236a
procedure BobTest.statement_containing_question_mark;
const expected = 'Whatever.';
var
  actual  : string;
  message : string;
begin
  actual  := Bob.response('Ending with ? means a question.');
  message := EncodeJsonMessage('statement containing question mark', expected, actual);
  AssertTrue(message, expected = actual);
end;

// 9bfc677d-ea3a-45f2-be44-35bc8fa3753e
procedure BobTest.non_letters_with_question;
const expected = 'Sure.';
var
  actual  : string;
  message : string;
begin
  actual  := Bob.response(':) ?');
  message := EncodeJsonMessage('non-letters with question', expected, actual);
  AssertTrue(message, expected = actual);
end;

// 8608c508-f7de-4b17-985b-811878b3cf45
procedure BobTest.prattling_on;
const expected = 'Sure.';
var
  actual  : string;
  message : string;
begin
  actual  := Bob.response('Wait! Hang on. Are you going to be OK?');
  message := EncodeJsonMessage('prattling on', expected, actual);
  AssertTrue(message, expected = actual);
end;

// bc39f7c6-f543-41be-9a43-fd1c2f753fc0
procedure BobTest.silence;
const expected = 'Fine. Be that way!';
var
  actual  : string;
  message : string;
begin
  actual  := Bob.response('');
  message := EncodeJsonMessage('silence', expected, actual);
  AssertTrue(message, expected = actual);
end;

// d6c47565-372b-4b09-b1dd-c40552b8378b
procedure BobTest.prolonged_silence;
const expected = 'Fine. Be that way!';
var
  actual  : string;
  message : string;
begin
  actual  := Bob.response('          ');
  message := EncodeJsonMessage('prolonged silence', expected, actual);
  AssertTrue(message, expected = actual);
end;

// 4428f28d-4100-4d85-a902-e5a78cb0ecd3
procedure BobTest.alternate_silence;
const expected = 'Fine. Be that way!';
var
  actual  : string;
  message : string;
begin
  actual  := Bob.response(#9 + #9 + #9 + #9 + #9 + #9 + #9 + #9 + #9 + #9);
  message := EncodeJsonMessage('alternate silence', expected, actual);
  AssertTrue(message, expected = actual);
end;

// 5371ef75-d9ea-4103-bcfa-2da973ddec1b
procedure BobTest.starting_with_whitespace;
const expected = 'Whatever.';
var
  actual  : string;
  message : string;
begin
  actual  := Bob.response('         hmmmmmmm...');
  message := EncodeJsonMessage('starting with whitespace', expected, actual);
  AssertTrue(message, expected = actual);
end;

// 05b304d6-f83b-46e7-81e0-4cd3ca647900
procedure BobTest.ending_with_whitespace;
const expected = 'Sure.';
var
  actual  : string;
  message : string;
begin
  actual  := Bob.response('Okay if like my  spacebar  quite a bit?   ');
  message := EncodeJsonMessage('ending with whitespace', expected, actual);
  AssertTrue(message, expected = actual);
end;

// 72bd5ad3-9b2f-4931-a988-dce1f5771de2
procedure BobTest.other_whitespace;
const expected = 'Fine. Be that way!';
var
  actual  : string;
  message : string;
begin
  actual  := Bob.response(#10 + #13 + ' ' + #9);
  message := EncodeJsonMessage('other whitespace', expected, actual);
  AssertTrue(message, expected = actual);
end;

// 12983553-8601-46a8-92fa-fcaa3bc4a2a0
procedure BobTest.non_question_ending_with_whitespace;
const expected = 'Whatever.';
var
  actual  : string;
  message : string;
begin
  actual  := Bob.response('This is a statement ending with whitespace      ');
  message := EncodeJsonMessage('non-question ending with whitespace', expected, actual);
  AssertTrue(message, expected = actual);
end;

// 2c7278ac-f955-4eb4-bf8f-e33eb4116a15
procedure BobTest.multiple_line_question;
const expected = 'Sure.';
var
  actual  : string;
  message : string;
begin
  actual  := Bob.response(#10 + 'Does this cryogenic chamber make' + #10 + ' me look fat?');
  message := EncodeJsonMessage('multiple line question', expected, actual);
  AssertTrue(message, expected = actual);
end;

initialization
RegisterTest(BobTest);

end.
