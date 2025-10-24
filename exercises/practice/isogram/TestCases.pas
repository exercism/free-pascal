unit TestCases;

{$mode ObjFPC}{$H+}

interface

uses Classes, SysUtils, FPCUnit, TestRegistry, FPCUnitTestUtils;

type
  IsogramTest = class(TTestCase)
  published
    procedure empty_string;
    procedure isogram_with_only_lower_case_characters;
    procedure word_with_one_duplicated_character;
    procedure word_with_one_duplicated_character_from_the_end_of_the_alphabet;
    procedure longest_reported_english_isogram;
    procedure word_with_duplicated_character_in_mixed_case;
    procedure word_with_duplicated_character_in_mixed_case_lowercase_first;
    procedure hypothetical_isogrammic_word_with_hyphen;
    procedure hypothetical_word_with_duplicated_character_following_hyphen;
    procedure isogram_with_duplicated_hyphen;
    procedure made_up_name_that_is_an_isogram;
    procedure duplicated_character_in_the_middle;
    procedure same_first_and_last_characters;
    procedure word_with_duplicated_character_and_with_two_hyphens;
  end;

implementation

uses Isogram;

var message : string;

procedure IsogramTest.empty_string;
const expected = true;
var actual : boolean;
begin
  // a0e97d2d-669e-47c7-8134-518a1e2c4555
  actual  := Isogram.IsIsogram('');
  message := EncodeJsonMessage('empty string', expected, actual);
  AssertTrue(message, expected = actual);
end;

procedure IsogramTest.isogram_with_only_lower_case_characters;
const expected = true;
var actual : boolean;
begin
  // 9a001b50-f194-4143-bc29-2af5ec1ef652
  actual  := Isogram.IsIsogram('isogram');
  message := EncodeJsonMessage('isogram with only lower case characters', expected, actual);
  AssertTrue(message, expected = actual);
end;

procedure IsogramTest.word_with_one_duplicated_character;
const expected = false;
var actual : boolean;
begin
  // 8ddb0ca3-276e-4f8b-89da-d95d5bae78a4
  actual  := Isogram.IsIsogram('eleven');
  message := EncodeJsonMessage('word with one duplicated character', expected, actual);
  AssertTrue(message, expected = actual);
end;

procedure IsogramTest.word_with_one_duplicated_character_from_the_end_of_the_alphabet;
const expected = false;
var actual : boolean;
begin
  // 6450b333-cbc2-4b24-a723-0b459b34fe18
  actual  := Isogram.IsIsogram('zzyzx');
  message := EncodeJsonMessage('word with one duplicated character from the end of the alphabet', expected, actual);
  AssertTrue(message, expected = actual);
end;

procedure IsogramTest.longest_reported_english_isogram;
const expected = true;
var actual : boolean;
begin
  // a15ff557-dd04-4764-99e7-02cc1a385863
  actual  := Isogram.IsIsogram('subdermatoglyphic');
  message := EncodeJsonMessage('longest reported english isogram', expected, actual);
  AssertTrue(message, expected = actual);
end;

procedure IsogramTest.word_with_duplicated_character_in_mixed_case;
const expected = false;
var actual : boolean;
begin
  // f1a7f6c7-a42f-4915-91d7-35b2ea11c92e
  actual  := Isogram.IsIsogram('Alphabet');
  message := EncodeJsonMessage('word with duplicated character in mixed case', expected, actual);
  AssertTrue(message, expected = actual);
end;

procedure IsogramTest.word_with_duplicated_character_in_mixed_case_lowercase_first;
const expected = false;
var actual : boolean;
begin
  // 14a4f3c1-3b47-4695-b645-53d328298942
  actual  := Isogram.IsIsogram('alphAbet');
  message := EncodeJsonMessage('word with duplicated character in mixed case, lowercase first', expected, actual);
  AssertTrue(message, expected = actual);
end;

procedure IsogramTest.hypothetical_isogrammic_word_with_hyphen;
const expected = true;
var actual : boolean;
begin
  // 423b850c-7090-4a8a-b057-97f1cadd7c42
  actual  := Isogram.IsIsogram('thumbscrew-japingly');
  message := EncodeJsonMessage('hypothetical isogrammic word with hyphen', expected, actual);
  AssertTrue(message, expected = actual);
end;

procedure IsogramTest.hypothetical_word_with_duplicated_character_following_hyphen;
const expected = false;
var actual : boolean;
begin
  // 93dbeaa0-3c5a-45c2-8b25-428b8eacd4f2
  actual  := Isogram.IsIsogram('thumbscrew-jappingly');
  message := EncodeJsonMessage('hypothetical word with duplicated character following hyphen', expected, actual);
  AssertTrue(message, expected = actual);
end;

procedure IsogramTest.isogram_with_duplicated_hyphen;
const expected = true;
var actual : boolean;
begin
  // 36b30e5c-173f-49c6-a515-93a3e825553f
  actual  := Isogram.IsIsogram('six-year-old');
  message := EncodeJsonMessage('isogram with duplicated hyphen', expected, actual);
  AssertTrue(message, expected = actual);
end;

procedure IsogramTest.made_up_name_that_is_an_isogram;
const expected = true;
var actual : boolean;
begin
  // cdabafa0-c9f4-4c1f-b142-689c6ee17d93
  actual  := Isogram.IsIsogram('Emily Jung Schwartzkopf');
  message := EncodeJsonMessage('made-up name that is an isogram', expected, actual);
  AssertTrue(message, expected = actual);
end;

procedure IsogramTest.duplicated_character_in_the_middle;
const expected = false;
var actual : boolean;
begin
  // 5fc61048-d74e-48fd-bc34-abfc21552d4d
  actual  := Isogram.IsIsogram('accentor');
  message := EncodeJsonMessage('duplicated character in the middle', expected, actual);
  AssertTrue(message, expected = actual);
end;

procedure IsogramTest.same_first_and_last_characters;
const expected = false;
var actual : boolean;
begin
  // 310ac53d-8932-47bc-bbb4-b2b94f25a83e
  actual  := Isogram.IsIsogram('angola');
  message := EncodeJsonMessage('same first and last characters', expected, actual);
  AssertTrue(message, expected = actual);
end;

procedure IsogramTest.word_with_duplicated_character_and_with_two_hyphens;
const expected = false;
var actual : boolean;
begin
  // 0d0b8644-0a1e-4a31-a432-2b3ee270d847
  actual  := Isogram.IsIsogram('up-to-date');
  message := EncodeJsonMessage('word with duplicated character and with two hyphens', expected, actual);
  AssertTrue(message, expected = actual);
end;

initialization
RegisterTest(IsogramTest);

end.
