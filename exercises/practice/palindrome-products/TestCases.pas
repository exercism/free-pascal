unit TestCases;

{$mode ObjFPC}{$H+}

interface

uses Classes, SysUtils, FPCUnit, TestRegistry, FPCUnitTestUtils;

type
  TProductFunction = function(const min, max : UInt64) : UInt64;

  PalindromeProductsTest = class(TTestCase)
  published
    procedure find_the_smallest_palindrome_from_single_digit_factors;
    procedure find_the_largest_palindrome_from_single_digit_factors;
    procedure find_the_smallest_palindrome_from_double_digit_factors;
    procedure find_the_largest_palindrome_from_double_digit_factors;
    procedure find_the_smallest_palindrome_from_triple_digit_factors;
    procedure find_the_largest_palindrome_from_triple_digit_factors;
    procedure find_the_smallest_palindrome_from_four_digit_factors;
    procedure find_the_largest_palindrome_from_four_digit_factors;
    procedure empty_result_for_smallest_if_no_palindrome_in_the_range;
    procedure empty_result_for_largest_if_no_palindrome_in_the_range;
    procedure error_result_for_smallest_if_min_is_more_than_max;
    procedure error_result_for_largest_if_min_is_more_than_max;
    procedure smallest_product_does_not_use_the_smallest_factor;
  end;

implementation

uses PalindromeProducts;

procedure TapAssertExpectionMessage(
  ACase             : TTestCase ;
  const AMessage    : String    ;
  const Expected    : String    ;
  const productFunction : TProductFunction ;
  const min         : UInt64    ;
  const max         : UInt64
);
var
  JsonMsg : string;
  actual  : string;
begin
  actual := '';
  try
    productFunction(min, max);
  except
    on E: Exception do actual := E.Message;
  end;
  JsonMsg := EncodeJsonMessage(AMessage, expected, actual);
  ACase.AssertTrue(JsonMsg, expected = actual);
end;

// 5cff78fe-cf02-459d-85c2-ce584679f887
procedure PalindromeProductsTest.find_the_smallest_palindrome_from_single_digit_factors;
const
  expect : UInt64 = 1;
begin
  TapAssertTrue(Self, 'find the smallest palindrome from single digit factors', expect, PalindromeProducts.smallest(1, 9));
end;

// 0853f82c-5fc4-44ae-be38-fadb2cced92d
procedure PalindromeProductsTest.find_the_largest_palindrome_from_single_digit_factors;
const
  expect : UInt64 = 9;
begin
  TapAssertTrue(Self, 'find the largest palindrome from single digit factors', expect, PalindromeProducts.largest(1, 9));
end;

// 66c3b496-bdec-4103-9129-3fcb5a9063e1
procedure PalindromeProductsTest.find_the_smallest_palindrome_from_double_digit_factors;
const
  expect : UInt64 = 121;
begin
  TapAssertTrue(Self, 'find the smallest palindrome from double digit factors', expect, PalindromeProducts.smallest(10, 99));
end;

// a10682ae-530a-4e56-b89d-69664feafe53
procedure PalindromeProductsTest.find_the_largest_palindrome_from_double_digit_factors;
const
  expect : UInt64 = 9009;
begin
  TapAssertTrue(Self, 'find the largest palindrome from double digit factors', expect, PalindromeProducts.largest(10, 99));
end;

// cecb5a35-46d1-4666-9719-fa2c3af7499d
procedure PalindromeProductsTest.find_the_smallest_palindrome_from_triple_digit_factors;
const
  expect : UInt64 = 10201;
begin
  TapAssertTrue(Self, 'find the smallest palindrome from triple digit factors', expect, PalindromeProducts.smallest(100, 999));
end;

// edab43e1-c35f-4ea3-8c55-2f31dddd92e5
procedure PalindromeProductsTest.find_the_largest_palindrome_from_triple_digit_factors;
const
  expect : UInt64 = 906609;
begin
  TapAssertTrue(Self, 'find the largest palindrome from triple digit factors', expect, PalindromeProducts.largest(100, 999));
end;

// 4f802b5a-9d74-4026-a70f-b53ff9234e4e
procedure PalindromeProductsTest.find_the_smallest_palindrome_from_four_digit_factors;
const
  expect : UInt64 = 1002001;
begin
  TapAssertTrue(Self, 'find the smallest palindrome from four digit factors', expect, PalindromeProducts.smallest(1000, 9999));
end;

// 787525e0-a5f9-40f3-8cb2-23b52cf5d0be
procedure PalindromeProductsTest.find_the_largest_palindrome_from_four_digit_factors;
const
  expect : UInt64 = 99000099;
begin
  TapAssertTrue(Self, 'find the largest palindrome from four digit factors', expect, PalindromeProducts.largest(1000, 9999));
end;

// 58fb1d63-fddb-4409-ab84-a7a8e58d9ea0
procedure PalindromeProductsTest.empty_result_for_smallest_if_no_palindrome_in_the_range;
begin
  TapAssertExpectionMessage(Self, 'empty result for smallest if no palindrome in the range', 'no solution', @PalindromeProducts.smallest, 1002, 1003);
end;

// 9de9e9da-f1d9-49a5-8bfc-3d322efbdd02
procedure PalindromeProductsTest.empty_result_for_largest_if_no_palindrome_in_the_range;
begin
  TapAssertExpectionMessage(Self, 'empty result for largest if no palindrome in the range', 'no solution', @PalindromeProducts.largest, 15, 15);
end;

// 12e73aac-d7ee-4877-b8aa-2aa3dcdb9f8a
procedure PalindromeProductsTest.error_result_for_smallest_if_min_is_more_than_max;
begin
  TapAssertExpectionMessage(Self, 'error result for smallest if min is more than max', 'min must be <= max', @PalindromeProducts.smallest, 10000, 1);
end;

// eeeb5bff-3f47-4b1e-892f-05829277bd74
procedure PalindromeProductsTest.error_result_for_largest_if_min_is_more_than_max;
begin
  TapAssertExpectionMessage(Self, 'error result for largest if min is more than max', 'min must be <= max', @PalindromeProducts.largest, 2, 1);
end;

// 16481711-26c4-42e0-9180-e2e4e8b29c23
procedure PalindromeProductsTest.smallest_product_does_not_use_the_smallest_factor;
const
  expect : UInt64 = 10988901;
begin
  TapAssertTrue(Self, 'smallest product does not use the smallest factor', expect, PalindromeProducts.smallest(3215, 4000));
end;

initialization
RegisterTest(PalindromeProductsTest);

end.
