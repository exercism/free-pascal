unit TestCases;

{$mode ObjFPC}{$H+}

interface

uses Classes, SysUtils, FPCUnit, TestRegistry, FPCUnitTestUtils;

type
  PrimeFactorsTest = class(TTestCase)
  published
    procedure no_factors;
    procedure prime_number;
    procedure another_prime_number;
    procedure square_of_a_prime;
    procedure product_of_first_prime;
    procedure cube_of_a_prime;
    procedure product_of_second_prime;
    procedure product_of_third_prime;
    procedure product_of_first_and_second_prime;
    procedure product_of_primes_and_non_primes;
    procedure product_of_primes;
  end;

implementation

uses PrimeFactors;

// 924fc966-a8f5-4288-82f2-6b9224819ccd
procedure PrimeFactorsTest.no_factors;
var
  expect : TIntArray;
  actual : TIntArray;
begin
  expect := [];
  actual := PrimeFactors.factors(1);
  TapAssertTrue(Self, 'no factors', expect, actual);
end;

// 17e30670-b105-4305-af53-ddde182cb6ad
procedure PrimeFactorsTest.prime_number;
var
  expect : TIntArray;
  actual : TIntArray;
begin
  expect := [2];
  actual := PrimeFactors.factors(2);
  TapAssertTrue(Self, 'prime number', expect, actual);
end;

// 238d57c8-4c12-42ef-af34-ae4929f94789
procedure PrimeFactorsTest.another_prime_number;
var
  expect : TIntArray;
  actual : TIntArray;
begin
  expect := [3];
  actual := PrimeFactors.factors(3);
  TapAssertTrue(Self, 'another prime number', expect, actual);
end;

// f59b8350-a180-495a-8fb1-1712fbee1158
procedure PrimeFactorsTest.square_of_a_prime;
var
  expect : TIntArray;
  actual : TIntArray;
begin
  expect := [3, 3];
  actual := PrimeFactors.factors(9);
  TapAssertTrue(Self, 'square of a prime', expect, actual);
end;

// 756949d3-3158-4e3d-91f2-c4f9f043ee70
procedure PrimeFactorsTest.product_of_first_prime;
var
  expect : TIntArray;
  actual : TIntArray;
begin
  expect := [2, 2];
  actual := PrimeFactors.factors(4);
  TapAssertTrue(Self, 'product of first prime', expect, actual);
end;

// bc8c113f-9580-4516-8669-c5fc29512ceb
procedure PrimeFactorsTest.cube_of_a_prime;
var
  expect : TIntArray;
  actual : TIntArray;
begin
  expect := [2, 2, 2];
  actual := PrimeFactors.factors(8);
  TapAssertTrue(Self, 'cube of a prime', expect, actual);
end;

// 7d6a3300-a4cb-4065-bd33-0ced1de6cb44
procedure PrimeFactorsTest.product_of_second_prime;
var
  expect : TIntArray;
  actual : TIntArray;
begin
  expect := [3, 3, 3];
  actual := PrimeFactors.factors(27);
  TapAssertTrue(Self, 'product of second prime', expect, actual);
end;

// 073ac0b2-c915-4362-929d-fc45f7b9a9e4
procedure PrimeFactorsTest.product_of_third_prime;
var
  expect : TIntArray;
  actual : TIntArray;
begin
  expect := [5, 5, 5, 5];
  actual := PrimeFactors.factors(625);
  TapAssertTrue(Self, 'product of third prime', expect, actual);
end;

// 6e0e4912-7fb6-47f3-a9ad-dbcd79340c75
procedure PrimeFactorsTest.product_of_first_and_second_prime;
var
  expect : TIntArray;
  actual : TIntArray;
begin
  expect := [2, 3];
  actual := PrimeFactors.factors(6);
  TapAssertTrue(Self, 'product of first and second prime', expect, actual);
end;

// 00485cd3-a3fe-4fbe-a64a-a4308fc1f870
procedure PrimeFactorsTest.product_of_primes_and_non_primes;
var
  expect : TIntArray;
  actual : TIntArray;
begin
  expect := [2, 2, 3];
  actual := PrimeFactors.factors(12);
  TapAssertTrue(Self, 'product of primes and non-primes', expect, actual);
end;

// 02251d54-3ca1-4a9b-85e1-b38f4b0ccb91
procedure PrimeFactorsTest.product_of_primes;
var
  expect : TIntArray;
  actual : TIntArray;
begin
  expect := [5, 17, 23, 461];
  actual := PrimeFactors.factors(901255);
  TapAssertTrue(Self, 'product of primes', expect, actual);
end;

initialization
RegisterTest(PrimeFactorsTest);

end.
