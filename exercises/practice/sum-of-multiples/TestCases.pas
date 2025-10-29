unit TestCases;

{$mode ObjFPC}{$H+}

interface

uses Classes, SysUtils, FPCUnit, TestRegistry, FPCUnitTestUtils;

type
  SumOfMultiplesTest = class(TTestCase)
  published
    procedure no_multiples_within_limit;
    procedure one_factor_has_multiples_within_limit;
    procedure more_than_one_multiple_within_limit;
    procedure more_than_one_factor_with_multiples_within_limit;
    procedure each_multiple_is_only_counted_once;
    procedure a_much_larger_limit;
    procedure three_factors;
    procedure factors_not_relatively_prime;
    procedure some_pairs_of_factors_relatively_prime_and_some_not;
    procedure one_factor_is_a_multiple_of_another;
    procedure much_larger_factors;
    procedure all_numbers_are_multiples_of_1;
    procedure no_factors_means_an_empty_sum;
    procedure the_only_multiple_of_0_is_0;
    procedure the_factor_0_does_not_affect_the_sum_of_multiples_of_other_factors;
    procedure solutions_using_include_exclude_must_extend_to_cardinality_greater_than_3;
  end;

implementation

uses SumOfMultiples;

// 54aaab5a-ce86-4edc-8b40-d3ab2400a279
procedure SumOfMultiplesTest.no_multiples_within_limit;
const expected = 0;
var
  actual  : integer;
  message : string;
begin
  actual  := SumOfMultiples.sum([3, 5], 1);
  message := EncodeJsonMessage('no multiples within limit', expected, actual);
  AssertTrue(message, expected = actual);
end;

// 361e4e50-c89b-4f60-95ef-5bc5c595490a
procedure SumOfMultiplesTest.one_factor_has_multiples_within_limit;
const expected = 3;
var
  actual  : integer;
  message : string;
begin
  actual  := SumOfMultiples.sum([3, 5], 4);
  message := EncodeJsonMessage('one factor has multiples within limit', expected, actual);
  AssertTrue(message, expected = actual);
end;

// e644e070-040e-4ae0-9910-93c69fc3f7ce
procedure SumOfMultiplesTest.more_than_one_multiple_within_limit;
const expected = 9;
var
  actual  : integer;
  message : string;
begin
  actual  := SumOfMultiples.sum([3], 7);
  message := EncodeJsonMessage('more than one multiple within limit', expected, actual);
  AssertTrue(message, expected = actual);
end;

// 607d6eb9-535c-41ce-91b5-3a61da3fa57f
procedure SumOfMultiplesTest.more_than_one_factor_with_multiples_within_limit;
const expected = 23;
var
  actual  : integer;
  message : string;
begin
  actual  := SumOfMultiples.sum([3, 5], 10);
  message := EncodeJsonMessage('more than one factor with multiples within limit', expected, actual);
  AssertTrue(message, expected = actual);
end;

// f47e8209-c0c5-4786-b07b-dc273bf86b9b
procedure SumOfMultiplesTest.each_multiple_is_only_counted_once;
const expected = 2318;
var
  actual  : integer;
  message : string;
begin
  actual  := SumOfMultiples.sum([3, 5], 100);
  message := EncodeJsonMessage('each multiple is only counted once', expected, actual);
  AssertTrue(message, expected = actual);
end;

// 28c4b267-c980-4054-93e9-07723db615ac
procedure SumOfMultiplesTest.a_much_larger_limit;
const expected = 233168;
var
  actual  : integer;
  message : string;
begin
  actual  := SumOfMultiples.sum([3, 5], 1000);
  message := EncodeJsonMessage('a much larger limit', expected, actual);
  AssertTrue(message, expected = actual);
end;

// 09c4494d-ff2d-4e0f-8421-f5532821ee12
procedure SumOfMultiplesTest.three_factors;
const expected = 51;
var
  actual  : integer;
  message : string;
begin
  actual  := SumOfMultiples.sum([7, 13, 17], 20);
  message := EncodeJsonMessage('three factors', expected, actual);
  AssertTrue(message, expected = actual);
end;

// 2d0d5faa-f177-4ad6-bde9-ebb865083751
procedure SumOfMultiplesTest.factors_not_relatively_prime;
const expected = 30;
var
  actual  : integer;
  message : string;
begin
  actual  := SumOfMultiples.sum([4, 6], 15);
  message := EncodeJsonMessage('factors not relatively prime', expected, actual);
  AssertTrue(message, expected = actual);
end;

// ece8f2e8-96aa-4166-bbb7-6ce71261e354
procedure SumOfMultiplesTest.some_pairs_of_factors_relatively_prime_and_some_not;
const expected = 4419;
var
  actual  : integer;
  message : string;
begin
  actual  := SumOfMultiples.sum([5, 6, 8], 150);
  message := EncodeJsonMessage('some pairs of factors relatively prime and some not', expected, actual);
  AssertTrue(message, expected = actual);
end;

// 624fdade-6ffb-400e-8472-456a38c171c0
procedure SumOfMultiplesTest.one_factor_is_a_multiple_of_another;
const expected = 275;
var
  actual  : integer;
  message : string;
begin
  actual  := SumOfMultiples.sum([5, 25], 51);
  message := EncodeJsonMessage('one factor is a multiple of another', expected, actual);
  AssertTrue(message, expected = actual);
end;

// 949ee7eb-db51-479c-b5cb-4a22b40ac057
procedure SumOfMultiplesTest.much_larger_factors;
const expected = 2203160;
var
  actual  : integer;
  message : string;
begin
  actual  := SumOfMultiples.sum([43, 47], 10000);
  message := EncodeJsonMessage('much larger factors', expected, actual);
  AssertTrue(message, expected = actual);
end;

// 41093673-acbd-482c-ab80-d00a0cbedecd
procedure SumOfMultiplesTest.all_numbers_are_multiples_of_1;
const expected = 4950;
var
  actual  : integer;
  message : string;
begin
  actual  := SumOfMultiples.sum([1], 100);
  message := EncodeJsonMessage('all numbers are multiples of 1', expected, actual);
  AssertTrue(message, expected = actual);
end;

// 1730453b-baaa-438e-a9c2-d754497b2a76
procedure SumOfMultiplesTest.no_factors_means_an_empty_sum;
const expected = 0;
var
  actual  : integer;
  message : string;
begin
  actual  := SumOfMultiples.sum([], 10000);
  message := EncodeJsonMessage('no factors means an empty sum', expected, actual);
  AssertTrue(message, expected = actual);
end;

// 214a01e9-f4bf-45bb-80f1-1dce9fbb0310
procedure SumOfMultiplesTest.the_only_multiple_of_0_is_0;
const expected = 0;
var
  actual  : integer;
  message : string;
begin
  actual  := SumOfMultiples.sum([0], 1);
  message := EncodeJsonMessage('the only multiple of 0 is 0', expected, actual);
  AssertTrue(message, expected = actual);
end;

// c423ae21-a0cb-4ec7-aeb1-32971af5b510
procedure SumOfMultiplesTest.the_factor_0_does_not_affect_the_sum_of_multiples_of_other_factors;
const expected = 3;
var
  actual  : integer;
  message : string;
begin
  actual  := SumOfMultiples.sum([3, 0], 4);
  message := EncodeJsonMessage('the factor 0 does not affect the sum of multiples of other factors', expected, actual);
  AssertTrue(message, expected = actual);
end;

// 17053ba9-112f-4ac0-aadb-0519dd836342
procedure SumOfMultiplesTest.solutions_using_include_exclude_must_extend_to_cardinality_greater_than_3;
const expected = 39614537;
var
  actual  : integer;
  message : string;
begin
  actual  := SumOfMultiples.sum([2, 3, 5, 7, 11], 10000);
  message := EncodeJsonMessage('solutions using include-exclude must extend to cardinality greater than 3', expected, actual);
  AssertTrue(message, expected = actual);
end;

initialization
RegisterTest(SumOfMultiplesTest);

end.
