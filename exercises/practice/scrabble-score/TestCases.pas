unit TestCases;

{$mode ObjFPC}{$H+}

interface

uses Classes, SysUtils, FPCUnit, TestRegistry, FPCUnitTestUtils;

type
  ScrabbleScoreTest = class(TTestCase)
  published
    procedure lowercase_letter;
    procedure uppercase_letter;
    procedure valuable_letter;
    procedure short_word;
    procedure short_valuable_word;
    procedure medium_word;
    procedure medium_valuable_word;
    procedure long_mixed_case_word;
    procedure english_like_word;
    procedure empty_input;
    procedure entire_alphabet_available;
  end;

implementation

uses ScrabbleScore;

// f46cda29-1ca5-4ef2-bd45-388a767e3db2
procedure ScrabbleScoreTest.lowercase_letter;
const expected = 1;
var
  actual  : integer;
  message : string;
begin
  actual  := ScrabbleScore.score('a');
  message := EncodeJsonMessage('lowercase letter', expected, actual);
  AssertTrue(message, expected = actual);
end;

// f7794b49-f13e-45d1-a933-4e48459b2201
procedure ScrabbleScoreTest.uppercase_letter;
const expected = 1;
var
  actual  : integer;
  message : string;
begin
  actual  := ScrabbleScore.score('A');
  message := EncodeJsonMessage('uppercase letter', expected, actual);
  AssertTrue(message, expected = actual);
end;

// eaba9c76-f9fa-49c9-a1b0-d1ba3a5b31fa
procedure ScrabbleScoreTest.valuable_letter;
const expected = 4;
var
  actual  : integer;
  message : string;
begin
  actual  := ScrabbleScore.score('f');
  message := EncodeJsonMessage('valuable letter', expected, actual);
  AssertTrue(message, expected = actual);
end;

// f3c8c94e-bb48-4da2-b09f-e832e103151e
procedure ScrabbleScoreTest.short_word;
const expected = 2;
var
  actual  : integer;
  message : string;
begin
  actual  := ScrabbleScore.score('at');
  message := EncodeJsonMessage('short word', expected, actual);
  AssertTrue(message, expected = actual);
end;

// 71e3d8fa-900d-4548-930e-68e7067c4615
procedure ScrabbleScoreTest.short_valuable_word;
const expected = 12;
var
  actual  : integer;
  message : string;
begin
  actual  := ScrabbleScore.score('zoo');
  message := EncodeJsonMessage('short, valuable word', expected, actual);
  AssertTrue(message, expected = actual);
end;

// d3088ad9-570c-4b51-8764-c75d5a430e99
procedure ScrabbleScoreTest.medium_word;
const expected = 6;
var
  actual  : integer;
  message : string;
begin
  actual  := ScrabbleScore.score('street');
  message := EncodeJsonMessage('medium word', expected, actual);
  AssertTrue(message, expected = actual);
end;

// fa20c572-ad86-400a-8511-64512daac352
procedure ScrabbleScoreTest.medium_valuable_word;
const expected = 22;
var
  actual  : integer;
  message : string;
begin
  actual  := ScrabbleScore.score('quirky');
  message := EncodeJsonMessage('medium, valuable word', expected, actual);
  AssertTrue(message, expected = actual);
end;

// 9336f0ba-9c2b-4fa0-bd1c-2e2d328cf967
procedure ScrabbleScoreTest.long_mixed_case_word;
const expected = 41;
var
  actual  : integer;
  message : string;
begin
  actual  := ScrabbleScore.score('OxyphenButazone');
  message := EncodeJsonMessage('long, mixed-case word', expected, actual);
  AssertTrue(message, expected = actual);
end;

// 1e34e2c3-e444-4ea7-b598-3c2b46fd2c10
procedure ScrabbleScoreTest.english_like_word;
const expected = 8;
var
  actual  : integer;
  message : string;
begin
  actual  := ScrabbleScore.score('pinata');
  message := EncodeJsonMessage('english-like word', expected, actual);
  AssertTrue(message, expected = actual);
end;

// 4efe3169-b3b6-4334-8bae-ff4ef24a7e4f
procedure ScrabbleScoreTest.empty_input;
const expected = 0;
var
  actual  : integer;
  message : string;
begin
  actual  := ScrabbleScore.score('');
  message := EncodeJsonMessage('empty input', expected, actual);
  AssertTrue(message, expected = actual);
end;

// 3b305c1c-f260-4e15-a5b5-cb7d3ea7c3d7
procedure ScrabbleScoreTest.entire_alphabet_available;
const expected = 87;
var
  actual  : integer;
  message : string;
begin
  actual  := ScrabbleScore.score('abcdefghijklmnopqrstuvwxyz');
  message := EncodeJsonMessage('entire alphabet available', expected, actual);
  AssertTrue(message, expected = actual);
end;

initialization
RegisterTest(ScrabbleScoreTest);

end.
