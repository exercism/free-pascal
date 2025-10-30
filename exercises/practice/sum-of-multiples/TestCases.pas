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
begin
  TapAssertTrue(Self, 'no multiples within limit', 0, SumOfMultiples.sum([3, 5], 1));
end;

// 361e4e50-c89b-4f60-95ef-5bc5c595490a
procedure SumOfMultiplesTest.one_factor_has_multiples_within_limit;
begin
  TapAssertTrue(Self, 'one factor has multiples within limit', 3, SumOfMultiples.sum([3, 5], 4));
end;

// e644e070-040e-4ae0-9910-93c69fc3f7ce
procedure SumOfMultiplesTest.more_than_one_multiple_within_limit;
begin
  TapAssertTrue(Self, 'more than one multiple within limit', 9, SumOfMultiples.sum([3], 7));
end;

// 607d6eb9-535c-41ce-91b5-3a61da3fa57f
procedure SumOfMultiplesTest.more_than_one_factor_with_multiples_within_limit;
begin
  TapAssertTrue(Self, 'more than one factor with multiples within limit', 23, SumOfMultiples.sum([3, 5], 10));
end;

// f47e8209-c0c5-4786-b07b-dc273bf86b9b
procedure SumOfMultiplesTest.each_multiple_is_only_counted_once;
begin
  TapAssertTrue(Self, 'each multiple is only counted once', 2318, SumOfMultiples.sum([3, 5], 100));
end;

// 28c4b267-c980-4054-93e9-07723db615ac
procedure SumOfMultiplesTest.a_much_larger_limit;
begin
  TapAssertTrue(Self, 'a much larger limit', 233168, SumOfMultiples.sum([3, 5], 1000));
end;

// 09c4494d-ff2d-4e0f-8421-f5532821ee12
procedure SumOfMultiplesTest.three_factors;
begin
  TapAssertTrue(Self, 'three factors', 51, SumOfMultiples.sum([7, 13, 17], 20));
end;

// 2d0d5faa-f177-4ad6-bde9-ebb865083751
procedure SumOfMultiplesTest.factors_not_relatively_prime;
begin
  TapAssertTrue(Self, 'factors not relatively prime', 30, SumOfMultiples.sum([4, 6], 15));
end;

// ece8f2e8-96aa-4166-bbb7-6ce71261e354
procedure SumOfMultiplesTest.some_pairs_of_factors_relatively_prime_and_some_not;
begin
  TapAssertTrue(Self, 'some pairs of factors relatively prime and some not', 4419, SumOfMultiples.sum([5, 6, 8], 150));
end;

// 624fdade-6ffb-400e-8472-456a38c171c0
procedure SumOfMultiplesTest.one_factor_is_a_multiple_of_another;
begin
  TapAssertTrue(Self, 'one factor is a multiple of another', 275, SumOfMultiples.sum([5, 25], 51));
end;

// 949ee7eb-db51-479c-b5cb-4a22b40ac057
procedure SumOfMultiplesTest.much_larger_factors;
begin
  TapAssertTrue(Self, 'much larger factors', 2203160, SumOfMultiples.sum([43, 47], 10000));
end;

// 41093673-acbd-482c-ab80-d00a0cbedecd
procedure SumOfMultiplesTest.all_numbers_are_multiples_of_1;
begin
  TapAssertTrue(Self, 'all numbers are multiples of 1', 4950, SumOfMultiples.sum([1], 100));
end;

// 1730453b-baaa-438e-a9c2-d754497b2a76
procedure SumOfMultiplesTest.no_factors_means_an_empty_sum;
begin
  TapAssertTrue(Self, 'no factors means an empty sum', 0, SumOfMultiples.sum([], 10000));
end;

// 214a01e9-f4bf-45bb-80f1-1dce9fbb0310
procedure SumOfMultiplesTest.the_only_multiple_of_0_is_0;
begin
  TapAssertTrue(Self, 'the only multiple of 0 is 0', 0, SumOfMultiples.sum([0], 1));
end;

// c423ae21-a0cb-4ec7-aeb1-32971af5b510
procedure SumOfMultiplesTest.the_factor_0_does_not_affect_the_sum_of_multiples_of_other_factors;
begin
  TapAssertTrue(Self, 'the factor 0 does not affect the sum of multiples of other factors', 3, SumOfMultiples.sum([3, 0], 4));
end;

// 17053ba9-112f-4ac0-aadb-0519dd836342
procedure SumOfMultiplesTest.solutions_using_include_exclude_must_extend_to_cardinality_greater_than_3;
begin
  TapAssertTrue(Self, 'solutions using include-exclude must extend to cardinality greater than 3', 39614537, SumOfMultiples.sum([2, 3, 5, 7, 11], 10000));
end;

initialization
RegisterTest(SumOfMultiplesTest);

end.
