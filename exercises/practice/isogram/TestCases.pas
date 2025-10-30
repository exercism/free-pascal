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

// a0e97d2d-669e-47c7-8134-518a1e2c4555
procedure IsogramTest.empty_string;
begin
  TapAssertTrue(Self, 'empty string', true, Isogram.IsIsogram(''));
end;

// 9a001b50-f194-4143-bc29-2af5ec1ef652
procedure IsogramTest.isogram_with_only_lower_case_characters;
begin
  TapAssertTrue(Self, 'isogram with only lower case characters', true, Isogram.IsIsogram('isogram'));
end;

// 8ddb0ca3-276e-4f8b-89da-d95d5bae78a4
procedure IsogramTest.word_with_one_duplicated_character;
begin
  TapAssertTrue(Self, 'word with one duplicated character', false, Isogram.IsIsogram('eleven'));
end;

// 6450b333-cbc2-4b24-a723-0b459b34fe18
procedure IsogramTest.word_with_one_duplicated_character_from_the_end_of_the_alphabet;
begin
  TapAssertTrue(Self, 'word with one duplicated character from the end of the alphabet', false, Isogram.IsIsogram('zzyzx'));
end;

// a15ff557-dd04-4764-99e7-02cc1a385863
procedure IsogramTest.longest_reported_english_isogram;
begin
  TapAssertTrue(Self, 'longest reported english isogram', true, Isogram.IsIsogram('subdermatoglyphic'));
end;

// f1a7f6c7-a42f-4915-91d7-35b2ea11c92e
procedure IsogramTest.word_with_duplicated_character_in_mixed_case;
begin
  TapAssertTrue(Self, 'word with duplicated character in mixed case', false, Isogram.IsIsogram('Alphabet'));
end;

// 14a4f3c1-3b47-4695-b645-53d328298942
procedure IsogramTest.word_with_duplicated_character_in_mixed_case_lowercase_first;
begin
  TapAssertTrue(Self, 'word with duplicated character in mixed case, lowercase first', false, Isogram.IsIsogram('alphAbet'));
end;

// 423b850c-7090-4a8a-b057-97f1cadd7c42
procedure IsogramTest.hypothetical_isogrammic_word_with_hyphen;
begin
  TapAssertTrue(Self, 'hypothetical isogrammic word with hyphen', true, Isogram.IsIsogram('thumbscrew-japingly'));
end;

// 93dbeaa0-3c5a-45c2-8b25-428b8eacd4f2
procedure IsogramTest.hypothetical_word_with_duplicated_character_following_hyphen;
begin
  TapAssertTrue(Self, 'hypothetical word with duplicated character following hyphen', false, Isogram.IsIsogram('thumbscrew-jappingly'));
end;

// 36b30e5c-173f-49c6-a515-93a3e825553f
procedure IsogramTest.isogram_with_duplicated_hyphen;
begin
  TapAssertTrue(Self, 'isogram with duplicated hyphen', true, Isogram.IsIsogram('six-year-old'));
end;

// cdabafa0-c9f4-4c1f-b142-689c6ee17d93
procedure IsogramTest.made_up_name_that_is_an_isogram;
begin
  TapAssertTrue(Self, 'made-up name that is an isogram', true, Isogram.IsIsogram('Emily Jung Schwartzkopf'));
end;

// 5fc61048-d74e-48fd-bc34-abfc21552d4d
procedure IsogramTest.duplicated_character_in_the_middle;
begin
  TapAssertTrue(Self, 'duplicated character in the middle', false, Isogram.IsIsogram('accentor'));
end;

// 310ac53d-8932-47bc-bbb4-b2b94f25a83e
procedure IsogramTest.same_first_and_last_characters;
begin
  TapAssertTrue(Self, 'same first and last characters', false, Isogram.IsIsogram('angola'));
end;

// 0d0b8644-0a1e-4a31-a432-2b3ee270d847
procedure IsogramTest.word_with_duplicated_character_and_with_two_hyphens;
begin
  TapAssertTrue(Self, 'word with duplicated character and with two hyphens', false, Isogram.IsIsogram('up-to-date'));
end;

initialization
RegisterTest(IsogramTest);

end.
