unit TestCases;

{$mode ObjFPC}{$H+}

interface

uses Classes, SysUtils, FPCUnit, TestRegistry, FPCUnitTestUtils;

type
  PhoneNumberTest = class(TTestCase)
  published
    procedure cleans_the_number;
    procedure cleans_numbers_with_dots;
    procedure cleans_numbers_with_multiple_spaces;
    procedure invalid_when_9_digits;
    procedure invalid_when_11_digits_does_not_start_with_a_1;
    procedure valid_when_11_digits_and_starting_with_1;
    procedure valid_when_11_digits_and_starting_with_1_even_with_punctuation;
    procedure invalid_when_more_than_11_digits;
    procedure invalid_with_letters;
    procedure invalid_with_punctuations;
    procedure invalid_if_area_code_starts_with_0;
    procedure invalid_if_area_code_starts_with_1;
    procedure invalid_if_exchange_code_starts_with_0;
    procedure invalid_if_exchange_code_starts_with_1;
    procedure invalid_if_area_code_starts_with_0_on_valid_11_digit_number;
    procedure invalid_if_area_code_starts_with_1_on_valid_11_digit_number;
    procedure invalid_if_exchange_code_starts_with_0_on_valid_11_digit_number;
    procedure invalid_if_exchange_code_starts_with_1_on_valid_11_digit_number;
  end;

implementation

uses PhoneNumber;

var message : string;

// 79666dce-e0f1-46de-95a1-563802913c35
procedure PhoneNumberTest.cleans_the_number;
const expected = '2234567890';
var actual : string;
begin
  actual  := PhoneNumber.clean('(223) 456-7890');
  message := EncodeJsonMessage('cleans the number', expected, actual);
  AssertTrue(message, expected = actual);
end;

// c360451f-549f-43e4-8aba-fdf6cb0bf83f
procedure PhoneNumberTest.cleans_numbers_with_dots;
const expected = '2234567890';
var actual : string;
begin
  actual  := PhoneNumber.clean('223.456.7890');
  message := EncodeJsonMessage('cleans numbers with dots', expected, actual);
  AssertTrue(message, expected = actual);
end;

// 08f94c34-9a37-46a2-a123-2a8e9727395d
procedure PhoneNumberTest.cleans_numbers_with_multiple_spaces;
const expected = '2234567890';
var actual : string;
begin
  actual  := PhoneNumber.clean('223 456   7890   ');
  message := EncodeJsonMessage('cleans numbers with multiple spaces', expected, actual);
  AssertTrue(message, expected = actual);
end;

// 2de74156-f646-42b5-8638-0ef1d8b58bc2
procedure PhoneNumberTest.invalid_when_9_digits;
const expected = 'must not be fewer than 10 digits';
var actual : string;
begin
  actual := '';
  try
    PhoneNumber.clean('123456789');
  except
    on E: Exception do actual := E.Message;
  end;
  message := EncodeJsonMessage('invalid when 9 digits', expected, actual);
  AssertTrue(message, expected = actual);
end;

// 57061c72-07b5-431f-9766-d97da7c4399d
procedure PhoneNumberTest.invalid_when_11_digits_does_not_start_with_a_1;
const expected = '11 digits must start with 1';
var actual : string;
begin
  actual := '';
  try
    PhoneNumber.clean('22234567890');
  except
    on E: Exception do actual := E.Message;
  end;
  message := EncodeJsonMessage('invalid when 11 digits does not start with a 1', expected, actual);
  AssertTrue(message, expected = actual);
end;

// 9962cbf3-97bb-4118-ba9b-38ff49c64430
procedure PhoneNumberTest.valid_when_11_digits_and_starting_with_1;
const expected = '2234567890';
var actual : string;
begin
  actual  := PhoneNumber.clean('12234567890');
  message := EncodeJsonMessage('valid when 11 digits and starting with 1', expected, actual);
  AssertTrue(message, expected = actual);
end;

// fa724fbf-054c-4d91-95da-f65ab5b6dbca
procedure PhoneNumberTest.valid_when_11_digits_and_starting_with_1_even_with_punctuation;
const expected = '2234567890';
var actual : string;
begin
  actual  := PhoneNumber.clean('+1 (223) 456-7890');
  message := EncodeJsonMessage('valid when 11 digits and starting with 1 even with punctuation', expected, actual);
  AssertTrue(message, expected = actual);
end;

// 4a1509b7-8953-4eec-981b-c483358ff531
procedure PhoneNumberTest.invalid_when_more_than_11_digits;
const expected = 'must not be greater than 11 digits';
var actual : string;
begin
  actual := '';
  try
    PhoneNumber.clean('321234567890');
  except
    on E: Exception do actual := E.Message;
  end;
  message := EncodeJsonMessage('invalid when more than 11 digits', expected, actual);
  AssertTrue(message, expected = actual);
end;

// eb8a1fc0-64e5-46d3-b0c6-33184208e28a
procedure PhoneNumberTest.invalid_with_letters;
const expected = 'letters not permitted';
var actual : string;
begin
  actual := '';
  try
    PhoneNumber.clean('523-abc-7890');
  except
    on E: Exception do actual := E.Message;
  end;
  message := EncodeJsonMessage('invalid with letters', expected, actual);
  AssertTrue(message, expected = actual);
end;

// 065f6363-8394-4759-b080-e6c8c351dd1f
procedure PhoneNumberTest.invalid_with_punctuations;
const expected = 'punctuations not permitted';
var actual : string;
begin
  actual := '';
  try
    PhoneNumber.clean('523-@:!-7890');
  except
    on E: Exception do actual := E.Message;
  end;
  message := EncodeJsonMessage('invalid with punctuations', expected, actual);
  AssertTrue(message, expected = actual);
end;

// d77d07f8-873c-4b17-8978-5f66139bf7d7
procedure PhoneNumberTest.invalid_if_area_code_starts_with_0;
const expected = 'area code cannot start with zero';
var actual : string;
begin
  actual := '';
  try
    PhoneNumber.clean('(023) 456-7890');
  except
    on E: Exception do actual := E.Message;
  end;
  message := EncodeJsonMessage('invalid if area code starts with 0', expected, actual);
  AssertTrue(message, expected = actual);
end;

// c7485cfb-1e7b-4081-8e96-8cdb3b77f15e
procedure PhoneNumberTest.invalid_if_area_code_starts_with_1;
const expected = 'area code cannot start with one';
var actual : string;
begin
  actual := '';
  try
    PhoneNumber.clean('(123) 456-7890');
  except
    on E: Exception do actual := E.Message;
  end;
  message := EncodeJsonMessage('invalid if area code starts with 1', expected, actual);
  AssertTrue(message, expected = actual);
end;

// 4d622293-6976-413d-b8bf-dd8a94d4e2ac
procedure PhoneNumberTest.invalid_if_exchange_code_starts_with_0;
const expected = 'exchange code cannot start with zero';
var actual : string;
begin
  actual := '';
  try
    PhoneNumber.clean('(223) 056-7890');
  except
    on E: Exception do actual := E.Message;
  end;
  message := EncodeJsonMessage('invalid if exchange code starts with 0', expected, actual);
  AssertTrue(message, expected = actual);
end;

// 4cef57b4-7d8e-43aa-8328-1e1b89001262
procedure PhoneNumberTest.invalid_if_exchange_code_starts_with_1;
const expected = 'exchange code cannot start with one';
var actual : string;
begin
  actual := '';
  try
    PhoneNumber.clean('(223) 156-7890');
  except
    on E: Exception do actual := E.Message;
  end;
  message := EncodeJsonMessage('invalid if exchange code starts with 1', expected, actual);
  AssertTrue(message, expected = actual);
end;

// 9925b09c-1a0d-4960-a197-5d163cbe308c
procedure PhoneNumberTest.invalid_if_area_code_starts_with_0_on_valid_11_digit_number;
const expected = 'area code cannot start with zero';
var actual : string;
begin
  actual := '';
  try
    PhoneNumber.clean('1 (023) 456-7890');
  except
    on E: Exception do actual := E.Message;
  end;
  message := EncodeJsonMessage('invalid if area code starts with 0 on valid 11-digit number', expected, actual);
  AssertTrue(message, expected = actual);
end;

// 3f809d37-40f3-44b5-ad90-535838b1a816
procedure PhoneNumberTest.invalid_if_area_code_starts_with_1_on_valid_11_digit_number;
const expected = 'area code cannot start with one';
var actual : string;
begin
  actual := '';
  try
    PhoneNumber.clean('1 (123) 456-7890');
  except
    on E: Exception do actual := E.Message;
  end;
  message := EncodeJsonMessage('invalid if area code starts with 1 on valid 11-digit number', expected, actual);
  AssertTrue(message, expected = actual);
end;

// e08e5532-d621-40d4-b0cc-96c159276b65
procedure PhoneNumberTest.invalid_if_exchange_code_starts_with_0_on_valid_11_digit_number;
const expected = 'exchange code cannot start with zero';
var actual : string;
begin
  actual := '';
  try
    PhoneNumber.clean('1 (223) 056-7890');
  except
    on E: Exception do actual := E.Message;
  end;
  message := EncodeJsonMessage('invalid if exchange code starts with 0 on valid 11-digit number', expected, actual);
  AssertTrue(message, expected = actual);
end;

// 57b32f3d-696a-455c-8bf1-137b6d171cdf
procedure PhoneNumberTest.invalid_if_exchange_code_starts_with_1_on_valid_11_digit_number;
const expected = 'exchange code cannot start with one';
var actual : string;
begin
  actual := '';
  try
    PhoneNumber.clean('1 (223) 156-7890');
  except
    on E: Exception do actual := E.Message;
  end;
  message := EncodeJsonMessage('invalid if exchange code starts with 1 on valid 11-digit number', expected, actual);
  AssertTrue(message, expected = actual);
end;

initialization
RegisterTest(PhoneNumberTest);

end.
