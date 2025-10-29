unit TestCases;

{$mode ObjFPC}{$H+}

interface

uses Classes, SysUtils, FPCUnit, TestRegistry, FPCUnitTestUtils;

type
  LargestSeriesProductTest = class(TTestCase)
  published
    procedure finds_the_largest_product_if_span_equals_length;
    procedure can_find_the_largest_product_of_2_with_numbers_in_order;
    procedure can_find_the_largest_product_of_2;
    procedure can_find_the_largest_product_of_3_with_numbers_in_order;
    procedure can_find_the_largest_product_of_3;
    procedure can_find_the_largest_product_of_5_with_numbers_in_order;
    procedure can_get_the_largest_product_of_a_big_number;
    procedure reports_zero_if_the_only_digits_are_zero;
    procedure reports_zero_if_all_spans_include_zero;
    procedure rejects_span_longer_than_string_length;
    procedure reports_1_for_empty_string_and_empty_product_0_span;
    procedure reports_1_for_nonempty_string_and_empty_product_0_span;
    procedure rejects_empty_string_and_nonzero_span;
    procedure rejects_invalid_character_in_digits;
    procedure rejects_negative_span;
  end;

implementation

uses LargestSeriesProduct;

// 7c82f8b7-e347-48ee-8a22-f672323324d4
procedure LargestSeriesProductTest.finds_the_largest_product_if_span_equals_length;
const expected = 18;
var
  actual  : integer;
  message : string;
begin
  actual  := LargestSeriesProduct.LargestProduct('29', 2);
  message := EncodeJsonMessage('finds the largest product if span equals length', expected, actual);
  AssertTrue(message, expected = actual);
end;

// 88523f65-21ba-4458-a76a-b4aaf6e4cb5e
procedure LargestSeriesProductTest.can_find_the_largest_product_of_2_with_numbers_in_order;
const expected = 72;
var
  actual  : integer;
  message : string;
begin
  actual  := LargestSeriesProduct.LargestProduct('0123456789', 2);
  message := EncodeJsonMessage('can find the largest product of 2 with numbers in order', expected, actual);
  AssertTrue(message, expected = actual);
end;

// f1376b48-1157-419d-92c2-1d7e36a70b8a
procedure LargestSeriesProductTest.can_find_the_largest_product_of_2;
const expected = 48;
var
  actual  : integer;
  message : string;
begin
  actual  := LargestSeriesProduct.LargestProduct('576802143', 2);
  message := EncodeJsonMessage('can find the largest product of 2', expected, actual);
  AssertTrue(message, expected = actual);
end;

// 46356a67-7e02-489e-8fea-321c2fa7b4a4
procedure LargestSeriesProductTest.can_find_the_largest_product_of_3_with_numbers_in_order;
const expected = 504;
var
  actual  : integer;
  message : string;
begin
  actual  := LargestSeriesProduct.LargestProduct('0123456789', 3);
  message := EncodeJsonMessage('can find the largest product of 3 with numbers in order', expected, actual);
  AssertTrue(message, expected = actual);
end;

// a2dcb54b-2b8f-4993-92dd-5ce56dece64a
procedure LargestSeriesProductTest.can_find_the_largest_product_of_3;
const expected = 270;
var
  actual  : integer;
  message : string;
begin
  actual  := LargestSeriesProduct.LargestProduct('1027839564', 3);
  message := EncodeJsonMessage('can find the largest product of 3', expected, actual);
  AssertTrue(message, expected = actual);
end;

// 673210a3-33cd-4708-940b-c482d7a88f9d
procedure LargestSeriesProductTest.can_find_the_largest_product_of_5_with_numbers_in_order;
const expected = 15120;
var
  actual  : integer;
  message : string;
begin
  actual  := LargestSeriesProduct.LargestProduct('0123456789', 5);
  message := EncodeJsonMessage('can find the largest product of 5 with numbers in order', expected, actual);
  AssertTrue(message, expected = actual);
end;

// 02acd5a6-3bbf-46df-8282-8b313a80a7c9
procedure LargestSeriesProductTest.can_get_the_largest_product_of_a_big_number;
const expected = 23520;
var
  actual  : integer;
  message : string;
begin
  actual  := LargestSeriesProduct.LargestProduct('73167176531330624919225119674426574742355349194934', 6);
  message := EncodeJsonMessage('can get the largest product of a big number', expected, actual);
  AssertTrue(message, expected = actual);
end;

// 76dcc407-21e9-424c-a98e-609f269622b5
procedure LargestSeriesProductTest.reports_zero_if_the_only_digits_are_zero;
const expected = 0;
var
  actual  : integer;
  message : string;
begin
  actual  := LargestSeriesProduct.LargestProduct('0000', 2);
  message := EncodeJsonMessage('reports zero if the only digits are zero', expected, actual);
  AssertTrue(message, expected = actual);
end;

// 6ef0df9f-52d4-4a5d-b210-f6fae5f20e19
procedure LargestSeriesProductTest.reports_zero_if_all_spans_include_zero;
const expected = 0;
var
  actual  : integer;
  message : string;
begin
  actual  := LargestSeriesProduct.LargestProduct('99099', 3);
  message := EncodeJsonMessage('reports zero if all spans include zero', expected, actual);
  AssertTrue(message, expected = actual);
end;

// 0ae1ce53-d9ba-41bb-827f-2fceb64f058b
procedure LargestSeriesProductTest.rejects_span_longer_than_string_length;
const expected = 'span must not exceed string length';
var
  actual  : string;
  message : string;
begin
  actual := '';
  try
    LargestSeriesProduct.LargestProduct('123', 4);
  except
    on E: Exception do actual := E.Message;
  end;
  message := EncodeJsonMessage('rejects span longer than string length', expected, actual);
  AssertTrue(message, expected = actual);
end;

// 06bc8b90-0c51-4c54-ac22-3ec3893a079e
procedure LargestSeriesProductTest.reports_1_for_empty_string_and_empty_product_0_span;
const expected = 1;
var
  actual  : integer;
  message : string;
begin
  actual  := LargestSeriesProduct.LargestProduct('', 0);
  message := EncodeJsonMessage('reports 1 for empty string and empty product (0 span)', expected, actual);
  AssertTrue(message, expected = actual);
end;

// 3ec0d92e-f2e2-4090-a380-70afee02f4c0
procedure LargestSeriesProductTest.reports_1_for_nonempty_string_and_empty_product_0_span;
const expected = 1;
var
  actual  : integer;
  message : string;
begin
  actual  := LargestSeriesProduct.LargestProduct('123', 0);
  message := EncodeJsonMessage('reports 1 for nonempty string and empty product (0 span)', expected, actual);
  AssertTrue(message, expected = actual);
end;

// 6cf66098-a6af-4223-aab1-26aeeefc7402
procedure LargestSeriesProductTest.rejects_empty_string_and_nonzero_span;
const expected = 'span must not exceed string length';
var
  actual  : string;
  message : string;
begin
  actual := '';
  try
    LargestSeriesProduct.LargestProduct('', 1);
  except
    on E: Exception do actual := E.Message;
  end;
  message := EncodeJsonMessage('rejects empty string and nonzero span', expected, actual);
  AssertTrue(message, expected = actual);
end;

// 7a38f2d6-3c35-45f6-8d6f-12e6e32d4d74
procedure LargestSeriesProductTest.rejects_invalid_character_in_digits;
const expected = 'digits input must only contain digits';
var
  actual  : string;
  message : string;
begin
  actual := '';
  try
    LargestSeriesProduct.LargestProduct('1234a5', 2);
  except
    on E: Exception do actual := E.Message;
  end;
  message := EncodeJsonMessage('rejects invalid character in digits', expected, actual);
  AssertTrue(message, expected = actual);
end;

// c859f34a-9bfe-4897-9c2f-6d7f8598e7f0
procedure LargestSeriesProductTest.rejects_negative_span;
const expected = 'span must not be negative';
var
  actual  : string;
  message : string;
begin
  actual := '';
  try
    LargestSeriesProduct.LargestProduct('12345', -1);
  except
    on E: Exception do actual := E.Message;
  end;
  message := EncodeJsonMessage('rejects negative span', expected, actual);
  AssertTrue(message, expected = actual);
end;

initialization
RegisterTest(LargestSeriesProductTest);

end.
