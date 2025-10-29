unit TestCases;

{$mode ObjFPC}{$H+}

interface

uses Classes, SysUtils, FPCUnit, TestRegistry, FPCUnitTestUtils;

type
  PerfectNumbersTest = class(TTestCase)
  published
    procedure smallest_perfect_number_is_classified_correctly;
    procedure medium_perfect_number_is_classified_correctly;
    procedure large_perfect_number_is_classified_correctly;
    procedure smallest_abundant_number_is_classified_correctly;
    procedure medium_abundant_number_is_classified_correctly;
    procedure large_abundant_number_is_classified_correctly;
    procedure smallest_prime_deficient_number_is_classified_correctly;
    procedure smallest_non_prime_deficient_number_is_classified_correctly;
    procedure medium_deficient_number_is_classified_correctly;
    procedure large_deficient_number_is_classified_correctly;
    procedure edge_case_no_factors_other_than_itself_is_classified_correctly;
    procedure zero_is_rejected_as_it_is_not_a_positive_integer;
    procedure negative_integer_is_rejected_as_it_is_not_a_positive_integer;
  end;

implementation

uses PerfectNumbers;

// 163e8e86-7bfd-4ee2-bd68-d083dc3381a3
procedure PerfectNumbersTest.smallest_perfect_number_is_classified_correctly;
const expected = 'perfect';
var
  actual  : string;
  message : string;
begin
  actual  := PerfectNumbers.classify(6);
  message := EncodeJsonMessage('Smallest perfect number is classified correctly', expected, actual);
  AssertTrue(message, expected = actual);
end;

// 169a7854-0431-4ae0-9815-c3b6d967436d
procedure PerfectNumbersTest.medium_perfect_number_is_classified_correctly;
const expected = 'perfect';
var
  actual  : string;
  message : string;
begin
  actual  := PerfectNumbers.classify(28);
  message := EncodeJsonMessage('Medium perfect number is classified correctly', expected, actual);
  AssertTrue(message, expected = actual);
end;

// ee3627c4-7b36-4245-ba7c-8727d585f402
procedure PerfectNumbersTest.large_perfect_number_is_classified_correctly;
const expected = 'perfect';
var
  actual  : string;
  message : string;
begin
  actual  := PerfectNumbers.classify(33550336);
  message := EncodeJsonMessage('Large perfect number is classified correctly', expected, actual);
  AssertTrue(message, expected = actual);
end;

// 80ef7cf8-9ea8-49b9-8b2d-d9cb3db3ed7e
procedure PerfectNumbersTest.smallest_abundant_number_is_classified_correctly;
const expected = 'abundant';
var
  actual  : string;
  message : string;
begin
  actual  := PerfectNumbers.classify(12);
  message := EncodeJsonMessage('Smallest abundant number is classified correctly', expected, actual);
  AssertTrue(message, expected = actual);
end;

// 3e300e0d-1a12-4f11-8c48-d1027165ab60
procedure PerfectNumbersTest.medium_abundant_number_is_classified_correctly;
const expected = 'abundant';
var
  actual  : string;
  message : string;
begin
  actual  := PerfectNumbers.classify(30);
  message := EncodeJsonMessage('Medium abundant number is classified correctly', expected, actual);
  AssertTrue(message, expected = actual);
end;

// ec7792e6-8786-449c-b005-ce6dd89a772b
procedure PerfectNumbersTest.large_abundant_number_is_classified_correctly;
const expected = 'abundant';
var
  actual  : string;
  message : string;
begin
  actual  := PerfectNumbers.classify(33550335);
  message := EncodeJsonMessage('Large abundant number is classified correctly', expected, actual);
  AssertTrue(message, expected = actual);
end;

// e610fdc7-2b6e-43c3-a51c-b70fb37413ba
procedure PerfectNumbersTest.smallest_prime_deficient_number_is_classified_correctly;
const expected = 'deficient';
var
  actual  : string;
  message : string;
begin
  actual  := PerfectNumbers.classify(2);
  message := EncodeJsonMessage('Smallest prime deficient number is classified correctly', expected, actual);
  AssertTrue(message, expected = actual);
end;

// 0beb7f66-753a-443f-8075-ad7fbd9018f3
procedure PerfectNumbersTest.smallest_non_prime_deficient_number_is_classified_correctly;
const expected = 'deficient';
var
  actual  : string;
  message : string;
begin
  actual  := PerfectNumbers.classify(4);
  message := EncodeJsonMessage('Smallest non-prime deficient number is classified correctly', expected, actual);
  AssertTrue(message, expected = actual);
end;

// 1c802e45-b4c6-4962-93d7-1cad245821ef
procedure PerfectNumbersTest.medium_deficient_number_is_classified_correctly;
const expected = 'deficient';
var
  actual  : string;
  message : string;
begin
  actual  := PerfectNumbers.classify(32);
  message := EncodeJsonMessage('Medium deficient number is classified correctly', expected, actual);
  AssertTrue(message, expected = actual);
end;

// 47dd569f-9e5a-4a11-9a47-a4e91c8c28aa
procedure PerfectNumbersTest.large_deficient_number_is_classified_correctly;
const expected = 'deficient';
var
  actual  : string;
  message : string;
begin
  actual  := PerfectNumbers.classify(33550337);
  message := EncodeJsonMessage('Large deficient number is classified correctly', expected, actual);
  AssertTrue(message, expected = actual);
end;

// a696dec8-6147-4d68-afad-d38de5476a56
procedure PerfectNumbersTest.edge_case_no_factors_other_than_itself_is_classified_correctly;
const expected = 'deficient';
var
  actual  : string;
  message : string;
begin
  actual  := PerfectNumbers.classify(1);
  message := EncodeJsonMessage('Edge case (no factors other than itself) is classified correctly', expected, actual);
  AssertTrue(message, expected = actual);
end;

// 72445cee-660c-4d75-8506-6c40089dc302
procedure PerfectNumbersTest.zero_is_rejected_as_it_is_not_a_positive_integer;
const expected = 'Classification is only possible for positive integers.';
var
  actual  : string;
  message : string;
begin
  actual := '';
  try
    PerfectNumbers.classify(0);
  except
    on E: Exception do actual := E.Message;
  end;
  message := EncodeJsonMessage('Zero is rejected (as it is not a positive integer)', expected, actual);
  AssertTrue(message, expected = actual);
end;

// 2d72ce2c-6802-49ac-8ece-c790ba3dae13
procedure PerfectNumbersTest.negative_integer_is_rejected_as_it_is_not_a_positive_integer;
const expected = 'Classification is only possible for positive integers.';
var
  actual  : string;
  message : string;
begin
  actual := '';
  try
    PerfectNumbers.classify(-1);
  except
    on E: Exception do actual := E.Message;
  end;
  message := EncodeJsonMessage('Negative integer is rejected (as it is not a positive integer)', expected, actual);
  AssertTrue(message, expected = actual);
end;

initialization
RegisterTest(PerfectNumbersTest);

end.
