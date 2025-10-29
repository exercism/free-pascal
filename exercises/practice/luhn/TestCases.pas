unit TestCases;

{$mode ObjFPC}{$H+}

interface

uses Classes, SysUtils, FPCUnit, TestRegistry, FPCUnitTestUtils;

type
  LuhnTest = class(TTestCase)
  published
    procedure single_digit_strings_can_not_be_valid;
    procedure a_single_zero_is_invalid;
    procedure a_simple_valid_sin_that_remains_valid_if_reversed;
    procedure a_simple_valid_sin_that_becomes_invalid_if_reversed;
    procedure a_valid_canadian_sin;
    procedure invalid_canadian_sin;
    procedure invalid_credit_card;
    procedure invalid_long_number_with_an_even_remainder;
    procedure invalid_long_number_with_a_remainder_divisible_by_5;
    procedure valid_number_with_an_even_number_of_digits;
    procedure valid_number_with_an_odd_number_of_spaces;
    procedure valid_strings_with_a_non_digit_added_at_the_end_become_invalid;
    procedure valid_strings_with_punctuation_included_become_invalid;
    procedure valid_strings_with_symbols_included_become_invalid;
    procedure single_zero_with_space_is_invalid;
    procedure more_than_a_single_zero_is_valid;
    procedure input_digit_9_is_correctly_converted_to_output_digit_9;
    procedure very_long_input_is_valid;
    procedure valid_luhn_with_an_odd_number_of_digits_and_non_zero_first_digit;
    procedure using_ascii_value_for_non_doubled_non_digit_isnt_allowed;
    procedure using_ascii_value_for_doubled_non_digit_isnt_allowed;
    procedure non_numeric_non_space_char_in_the_middle_with_a_sum_thats_divisible_by_10_isnt_allowed;
  end;

implementation

uses Luhn;

var message : string;

// 792a7082-feb7-48c7-b88b-bbfec160865e
procedure LuhnTest.single_digit_strings_can_not_be_valid;
const expected = false;
var actual : boolean;
begin
  actual  := Luhn.valid('1');
  message := EncodeJsonMessage('single digit strings can not be valid', expected, actual);
  AssertTrue(message, expected = actual);
end;

// 698a7924-64d4-4d89-8daa-32e1aadc271e
procedure LuhnTest.a_single_zero_is_invalid;
const expected = false;
var actual : boolean;
begin
  actual  := Luhn.valid('0');
  message := EncodeJsonMessage('a single zero is invalid', expected, actual);
  AssertTrue(message, expected = actual);
end;

// 73c2f62b-9b10-4c9f-9a04-83cee7367965
procedure LuhnTest.a_simple_valid_sin_that_remains_valid_if_reversed;
const expected = true;
var actual : boolean;
begin
  actual  := Luhn.valid('059');
  message := EncodeJsonMessage('a simple valid SIN that remains valid if reversed', expected, actual);
  AssertTrue(message, expected = actual);
end;

// 9369092e-b095-439f-948d-498bd076be11
procedure LuhnTest.a_simple_valid_sin_that_becomes_invalid_if_reversed;
const expected = true;
var actual : boolean;
begin
  actual  := Luhn.valid('59');
  message := EncodeJsonMessage('a simple valid SIN that becomes invalid if reversed', expected, actual);
  AssertTrue(message, expected = actual);
end;

// 8f9f2350-1faf-4008-ba84-85cbb93ffeca
procedure LuhnTest.a_valid_canadian_sin;
const expected = true;
var actual : boolean;
begin
  actual  := Luhn.valid('055 444 285');
  message := EncodeJsonMessage('a valid Canadian SIN', expected, actual);
  AssertTrue(message, expected = actual);
end;

// 1cdcf269-6560-44fc-91f6-5819a7548737
procedure LuhnTest.invalid_canadian_sin;
const expected = false;
var actual : boolean;
begin
  actual  := Luhn.valid('055 444 286');
  message := EncodeJsonMessage('invalid Canadian SIN', expected, actual);
  AssertTrue(message, expected = actual);
end;

// 656c48c1-34e8-4e60-9a5a-aad8a367810a
procedure LuhnTest.invalid_credit_card;
const expected = false;
var actual : boolean;
begin
  actual  := Luhn.valid('8273 1232 7352 0569');
  message := EncodeJsonMessage('invalid credit card', expected, actual);
  AssertTrue(message, expected = actual);
end;

// 20e67fad-2121-43ed-99a8-14b5b856adb9
procedure LuhnTest.invalid_long_number_with_an_even_remainder;
const expected = false;
var actual : boolean;
begin
  actual  := Luhn.valid('1 2345 6789 1234 5678 9012');
  message := EncodeJsonMessage('invalid long number with an even remainder', expected, actual);
  AssertTrue(message, expected = actual);
end;

// 7e7c9fc1-d994-457c-811e-d390d52fba5e
procedure LuhnTest.invalid_long_number_with_a_remainder_divisible_by_5;
const expected = false;
var actual : boolean;
begin
  actual  := Luhn.valid('1 2345 6789 1234 5678 9013');
  message := EncodeJsonMessage('invalid long number with a remainder divisible by 5', expected, actual);
  AssertTrue(message, expected = actual);
end;

// ad2a0c5f-84ed-4e5b-95da-6011d6f4f0aa
procedure LuhnTest.valid_number_with_an_even_number_of_digits;
const expected = true;
var actual : boolean;
begin
  actual  := Luhn.valid('095 245 88');
  message := EncodeJsonMessage('valid number with an even number of digits', expected, actual);
  AssertTrue(message, expected = actual);
end;

// ef081c06-a41f-4761-8492-385e13c8202d
procedure LuhnTest.valid_number_with_an_odd_number_of_spaces;
const expected = true;
var actual : boolean;
begin
  actual  := Luhn.valid('234 567 891 234');
  message := EncodeJsonMessage('valid number with an odd number of spaces', expected, actual);
  AssertTrue(message, expected = actual);
end;

// bef66f64-6100-4cbb-8f94-4c9713c5e5b2
procedure LuhnTest.valid_strings_with_a_non_digit_added_at_the_end_become_invalid;
const expected = false;
var actual : boolean;
begin
  actual  := Luhn.valid('059a');
  message := EncodeJsonMessage('valid strings with a non-digit added at the end become invalid', expected, actual);
  AssertTrue(message, expected = actual);
end;

// 2177e225-9ce7-40f6-b55d-fa420e62938e
procedure LuhnTest.valid_strings_with_punctuation_included_become_invalid;
const expected = false;
var actual : boolean;
begin
  actual  := Luhn.valid('055-444-285');
  message := EncodeJsonMessage('valid strings with punctuation included become invalid', expected, actual);
  AssertTrue(message, expected = actual);
end;

// ebf04f27-9698-45e1-9afe-7e0851d0fe8d
procedure LuhnTest.valid_strings_with_symbols_included_become_invalid;
const expected = false;
var actual : boolean;
begin
  actual  := Luhn.valid('055# 444$ 285');
  message := EncodeJsonMessage('valid strings with symbols included become invalid', expected, actual);
  AssertTrue(message, expected = actual);
end;

// 08195c5e-ce7f-422c-a5eb-3e45fece68ba
procedure LuhnTest.single_zero_with_space_is_invalid;
const expected = false;
var actual : boolean;
begin
  actual  := Luhn.valid(' 0');
  message := EncodeJsonMessage('single zero with space is invalid', expected, actual);
  AssertTrue(message, expected = actual);
end;

// 12e63a3c-f866-4a79-8c14-b359fc386091
procedure LuhnTest.more_than_a_single_zero_is_valid;
const expected = true;
var actual : boolean;
begin
  actual  := Luhn.valid('0000 0');
  message := EncodeJsonMessage('more than a single zero is valid', expected, actual);
  AssertTrue(message, expected = actual);
end;

// ab56fa80-5de8-4735-8a4a-14dae588663e
procedure LuhnTest.input_digit_9_is_correctly_converted_to_output_digit_9;
const expected = true;
var actual : boolean;
begin
  actual  := Luhn.valid('091');
  message := EncodeJsonMessage('input digit 9 is correctly converted to output digit 9', expected, actual);
  AssertTrue(message, expected = actual);
end;

// b9887ee8-8337-46c5-bc45-3bcab51bc36f
procedure LuhnTest.very_long_input_is_valid;
const expected = true;
var actual : boolean;
begin
  actual  := Luhn.valid('9999999999 9999999999 9999999999 9999999999');
  message := EncodeJsonMessage('very long input is valid', expected, actual);
  AssertTrue(message, expected = actual);
end;

// 8a7c0e24-85ea-4154-9cf1-c2db90eabc08
procedure LuhnTest.valid_luhn_with_an_odd_number_of_digits_and_non_zero_first_digit;
const expected = true;
var actual : boolean;
begin
  actual  := Luhn.valid('109');
  message := EncodeJsonMessage('valid luhn with an odd number of digits and non zero first digit', expected, actual);
  AssertTrue(message, expected = actual);
end;

// 39a06a5a-5bad-4e0f-b215-b042d46209b1
procedure LuhnTest.using_ascii_value_for_non_doubled_non_digit_isnt_allowed;
const expected = false;
var actual : boolean;
begin
  actual  := Luhn.valid('055b 444 285');
  message := EncodeJsonMessage('using ascii value for non-doubled non-digit isn''t allowed', expected, actual);
  AssertTrue(message, expected = actual);
end;

// f94cf191-a62f-4868-bc72-7253114aa157
procedure LuhnTest.using_ascii_value_for_doubled_non_digit_isnt_allowed;
const expected = false;
var actual : boolean;
begin
  actual  := Luhn.valid(':9');
  message := EncodeJsonMessage('using ascii value for doubled non-digit isn''t allowed', expected, actual);
  AssertTrue(message, expected = actual);
end;

// 8b72ad26-c8be-49a2-b99c-bcc3bf631b33
procedure LuhnTest.non_numeric_non_space_char_in_the_middle_with_a_sum_thats_divisible_by_10_isnt_allowed;
const expected = false;
var actual : boolean;
begin
  actual  := Luhn.valid('59%59');
  message := EncodeJsonMessage('non-numeric, non-space char in the middle with a sum that''s divisible by 10 isn''t allowed', expected, actual);
  AssertTrue(message, expected = actual);
end;

initialization
RegisterTest(LuhnTest);

end.
