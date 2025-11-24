unit TestCases;

{$mode ObjFPC}{$H+}

interface

uses Classes, SysUtils, FPCUnit, TestRegistry, FPCUnitTestUtils;

type
  IsbnVerifierTest = class(TTestCase)
  published
    procedure valid_isbn;
    procedure invalid_isbn_check_digit;
    procedure valid_isbn_with_a_check_digit_of_10;
    procedure check_digit_is_a_character_other_than_x;
    procedure invalid_check_digit_in_isbn_is_not_treated_as_zero;
    procedure invalid_character_in_isbn_is_not_treated_as_zero;
    procedure x_is_only_valid_as_a_check_digit;
    procedure only_one_check_digit_is_allowed;
    procedure x_is_not_substituted_by_the_value_10;
    procedure valid_isbn_without_separating_dashes;
    procedure isbn_without_separating_dashes_and_x_as_check_digit;
    procedure isbn_without_check_digit_and_dashes;
    procedure too_long_isbn_and_no_dashes;
    procedure too_short_isbn;
    procedure isbn_without_check_digit;
    procedure check_digit_of_x_should_not_be_used_for_0;
    procedure empty_isbn;
    procedure input_is_9_characters;
    procedure invalid_characters_are_not_ignored_after_checking_length;
    procedure invalid_characters_are_not_ignored_before_checking_length;
    procedure input_is_too_long_but_contains_a_valid_isbn;
  end;

implementation

uses IsbnVerifier;

// 0caa3eac-d2e3-4c29-8df8-b188bc8c9292
procedure IsbnVerifierTest.valid_isbn;
begin
  TapAssertTrue(Self, 'valid isbn', true, IsbnVerifier.IsValid('3-598-21508-8'));
end;

// 19f76b53-7c24-45f8-87b8-4604d0ccd248
procedure IsbnVerifierTest.invalid_isbn_check_digit;
begin
  TapAssertTrue(Self, 'invalid isbn check digit', false, IsbnVerifier.IsValid('3-598-21508-9'));
end;

// 4164bfee-fb0a-4a1c-9f70-64c6a1903dcd
procedure IsbnVerifierTest.valid_isbn_with_a_check_digit_of_10;
begin
  TapAssertTrue(Self, 'valid isbn with a check digit of 10', true, IsbnVerifier.IsValid('3-598-21507-X'));
end;

// 3ed50db1-8982-4423-a993-93174a20825c
procedure IsbnVerifierTest.check_digit_is_a_character_other_than_x;
begin
  TapAssertTrue(Self, 'check digit is a character other than X', false, IsbnVerifier.IsValid('3-598-21507-A'));
end;

// 9416f4a5-fe01-4b61-a07b-eb75892ef562
procedure IsbnVerifierTest.invalid_check_digit_in_isbn_is_not_treated_as_zero;
begin
  TapAssertTrue(Self, 'invalid check digit in isbn is not treated as zero', false, IsbnVerifier.IsValid('4-598-21507-B'));
end;

// c19ba0c4-014f-4dc3-a63f-ff9aefc9b5ec
procedure IsbnVerifierTest.invalid_character_in_isbn_is_not_treated_as_zero;
begin
  TapAssertTrue(Self, 'invalid character in isbn is not treated as zero', false, IsbnVerifier.IsValid('3-598-P1581-X'));
end;

// 28025280-2c39-4092-9719-f3234b89c627
procedure IsbnVerifierTest.x_is_only_valid_as_a_check_digit;
begin
  TapAssertTrue(Self, 'X is only valid as a check digit', false, IsbnVerifier.IsValid('3-598-2X507-9'));
end;

// 8005b57f-f194-44ee-88d2-a77ac4142591
procedure IsbnVerifierTest.only_one_check_digit_is_allowed;
begin
  TapAssertTrue(Self, 'only one check digit is allowed', false, IsbnVerifier.IsValid('3-598-21508-96'));
end;

// fdb14c99-4cf8-43c5-b06d-eb1638eff343
procedure IsbnVerifierTest.x_is_not_substituted_by_the_value_10;
begin
  TapAssertTrue(Self, 'X is not substituted by the value 10', false, IsbnVerifier.IsValid('3-598-2X507-5'));
end;

// f6294e61-7e79-46b3-977b-f48789a4945b
procedure IsbnVerifierTest.valid_isbn_without_separating_dashes;
begin
  TapAssertTrue(Self, 'valid isbn without separating dashes', true, IsbnVerifier.IsValid('3598215088'));
end;

// 185ab99b-3a1b-45f3-aeec-b80d80b07f0b
procedure IsbnVerifierTest.isbn_without_separating_dashes_and_x_as_check_digit;
begin
  TapAssertTrue(Self, 'isbn without separating dashes and X as check digit', true, IsbnVerifier.IsValid('359821507X'));
end;

// 7725a837-ec8e-4528-a92a-d981dd8cf3e2
procedure IsbnVerifierTest.isbn_without_check_digit_and_dashes;
begin
  TapAssertTrue(Self, 'isbn without check digit and dashes', false, IsbnVerifier.IsValid('359821507'));
end;

// 47e4dfba-9c20-46ed-9958-4d3190630bdf
procedure IsbnVerifierTest.too_long_isbn_and_no_dashes;
begin
  TapAssertTrue(Self, 'too long isbn and no dashes', false, IsbnVerifier.IsValid('3598215078X'));
end;

// 737f4e91-cbba-4175-95bf-ae630b41fb60
procedure IsbnVerifierTest.too_short_isbn;
begin
  TapAssertTrue(Self, 'too short isbn', false, IsbnVerifier.IsValid('00'));
end;

// 5458a128-a9b6-4ff8-8afb-674e74567cef
procedure IsbnVerifierTest.isbn_without_check_digit;
begin
  TapAssertTrue(Self, 'isbn without check digit', false, IsbnVerifier.IsValid('3-598-21507'));
end;

// 70b6ad83-d0a2-4ca7-a4d5-a9ab731800f7
procedure IsbnVerifierTest.check_digit_of_x_should_not_be_used_for_0;
begin
  TapAssertTrue(Self, 'check digit of X should not be used for 0', false, IsbnVerifier.IsValid('3-598-21515-X'));
end;

// 94610459-55ab-4c35-9b93-ff6ea1a8e562
procedure IsbnVerifierTest.empty_isbn;
begin
  TapAssertTrue(Self, 'empty isbn', false, IsbnVerifier.IsValid(''));
end;

// 7bff28d4-d770-48cc-80d6-b20b3a0fb46c
procedure IsbnVerifierTest.input_is_9_characters;
begin
  TapAssertTrue(Self, 'input is 9 characters', false, IsbnVerifier.IsValid('134456729'));
end;

// ed6e8d1b-382c-4081-8326-8b772c581fec
procedure IsbnVerifierTest.invalid_characters_are_not_ignored_after_checking_length;
begin
  TapAssertTrue(Self, 'invalid characters are not ignored after checking length', false, IsbnVerifier.IsValid('3132P34035'));
end;

// daad3e58-ce00-4395-8a8e-e3eded1cdc86
procedure IsbnVerifierTest.invalid_characters_are_not_ignored_before_checking_length;
begin
  TapAssertTrue(Self, 'invalid characters are not ignored before checking length', false, IsbnVerifier.IsValid('3598P215088'));
end;

// fb5e48d8-7c03-4bfb-a088-b101df16fdc3
procedure IsbnVerifierTest.input_is_too_long_but_contains_a_valid_isbn;
begin
  TapAssertTrue(Self, 'input is too long but contains a valid isbn', false, IsbnVerifier.IsValid('98245726788'));
end;

initialization
RegisterTest(IsbnVerifierTest);

end.
