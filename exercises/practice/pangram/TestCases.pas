unit TestCases;

{$mode ObjFPC}{$H+}

interface

uses Classes, SysUtils, FPCUnit, TestRegistry, FPCUnitTestUtils;

type
  PangramTest = class(TTestCase)
  published
    procedure empty_sentence;
    procedure perfect_lower_case;
    procedure only_lower_case;
    procedure missing_the_letter_x;
    procedure missing_the_letter_h;
    procedure with_underscores;
    procedure with_numbers;
    procedure missing_letters_replaced_by_numbers;
    procedure mixed_case_and_punctuation;
    procedure am_and_AM_are_26_different_characters_but_not_a_pangram;
  end;

implementation

uses Pangram;

var message : string;

// 64f61791-508e-4f5c-83ab-05de042b0149
procedure PangramTest.empty_sentence;
const expected = false;
var actual : boolean;
begin
  actual  := Pangram.IsPangram('');
  message := EncodeJsonMessage('empty sentence', expected, actual);
  AssertTrue(message, expected = actual);
end;

// 74858f80-4a4d-478b-8a5e-c6477e4e4e84
procedure PangramTest.perfect_lower_case;
const expected = true;
var actual : boolean;
begin
  actual  := Pangram.IsPangram('abcdefghijklmnopqrstuvwxyz');
  message := EncodeJsonMessage('perfect lower case', expected, actual);
  AssertTrue(message, expected = actual);
end;

// 61288860-35ca-4abe-ba08-f5df76ecbdcd
procedure PangramTest.only_lower_case;
const expected = true;
var actual : boolean;
begin
  actual  := Pangram.IsPangram('the quick brown fox jumps over the lazy dog');
  message := EncodeJsonMessage('only lower case', expected, actual);
  AssertTrue(message, expected = actual);
end;

// 6564267d-8ac5-4d29-baf2-e7d2e304a743
procedure PangramTest.missing_the_letter_x;
const expected = false;
var actual : boolean;
begin
  actual  := Pangram.IsPangram('a quick movement of the enemy will jeopardize five gunboats');
  message := EncodeJsonMessage('missing the letter ''x''', expected, actual);
  AssertTrue(message, expected = actual);
end;

// c79af1be-d715-4cdb-a5f2-b2fa3e7e0de0
procedure PangramTest.missing_the_letter_h;
const expected = false;
var actual : boolean;
begin
  actual  := Pangram.IsPangram('five boxing wizards jump quickly at it');
  message := EncodeJsonMessage('missing the letter ''h''', expected, actual);
  AssertTrue(message, expected = actual);
end;

// d835ec38-bc8f-48e4-9e36-eb232427b1df
procedure PangramTest.with_underscores;
const expected = true;
var actual : boolean;
begin
  actual  := Pangram.IsPangram('the_quick_brown_fox_jumps_over_the_lazy_dog');
  message := EncodeJsonMessage('with underscores', expected, actual);
  AssertTrue(message, expected = actual);
end;

// 8cc1e080-a178-4494-b4b3-06982c9be2a8
procedure PangramTest.with_numbers;
const expected = true;
var actual : boolean;
begin
  actual  := Pangram.IsPangram('the 1 quick brown fox jumps over the 2 lazy dogs');
  message := EncodeJsonMessage('with numbers', expected, actual);
  AssertTrue(message, expected = actual);
end;

// bed96b1c-ff95-45b8-9731-fdbdcb6ede9a
procedure PangramTest.missing_letters_replaced_by_numbers;
const expected = false;
var actual : boolean;
begin
  actual  := Pangram.IsPangram('7h3 qu1ck brown fox jumps ov3r 7h3 lazy dog');
  message := EncodeJsonMessage('missing letters replaced by numbers', expected, actual);
  AssertTrue(message, expected = actual);
end;

// 938bd5d8-ade5-40e2-a2d9-55a338a01030
procedure PangramTest.mixed_case_and_punctuation;
const expected = true;
var actual : boolean;
begin
  actual  := Pangram.IsPangram('"Five quacking Zephyrs jolt my wax bed."');
  message := EncodeJsonMessage('mixed case and punctuation', expected, actual);
  AssertTrue(message, expected = actual);
end;

// 7138e389-83e4-4c6e-8413-1e40a0076951
procedure PangramTest.am_and_AM_are_26_different_characters_but_not_a_pangram;
const expected = false;
var actual : boolean;
begin
  actual  := Pangram.IsPangram('abcdefghijklm ABCDEFGHIJKLM');
  message := EncodeJsonMessage('a-m and A-M are 26 different characters but not a pangram', expected, actual);
  AssertTrue(message, expected = actual);
end;

initialization
RegisterTest(PangramTest);

end.
