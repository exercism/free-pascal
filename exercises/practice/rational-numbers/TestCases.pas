unit TestCases;

{$mode ObjFPC}{$H+}

interface

uses Classes, SysUtils, FPCUnit, TestRegistry, FPCUnitTestUtils;

type
  RationalNumbersTest = class(TTestCase)
  published
    procedure add_two_positive_rational_numbers;
    procedure add_a_positive_rational_number_and_a_negative_rational_number;
    procedure add_two_negative_rational_numbers;
    procedure add_a_rational_number_to_its_additive_inverse;
    procedure subtract_two_positive_rational_numbers;
    procedure subtract_a_positive_rational_number_and_a_negative_rational_number;
    procedure subtract_two_negative_rational_numbers;
    procedure subtract_a_rational_number_from_itself;
    procedure multiply_two_positive_rational_numbers;
    procedure multiply_a_negative_rational_number_by_a_positive_rational_number;
    procedure multiply_two_negative_rational_numbers;
    procedure multiply_a_rational_number_by_its_reciprocal;
    procedure multiply_a_rational_number_by_1;
    procedure multiply_a_rational_number_by_0;
    procedure divide_two_positive_rational_numbers;
    procedure divide_a_positive_rational_number_by_a_negative_rational_number;
    procedure divide_two_negative_rational_numbers;
    procedure divide_a_rational_number_by_1;
    procedure absolute_value_of_a_positive_rational_number;
    procedure absolute_value_of_a_positive_rational_number_with_negative_numerator_and_denominator;
    procedure absolute_value_of_a_negative_rational_number;
    procedure absolute_value_of_a_negative_rational_number_with_negative_denominator;
    procedure absolute_value_of_zero;
    procedure absolute_value_of_a_rational_number_is_reduced_to_lowest_terms;
    procedure raise_a_positive_rational_number_to_a_positive_integer_power;
    procedure raise_a_negative_rational_number_to_a_positive_integer_power;
    procedure raise_a_positive_rational_number_to_a_negative_integer_power;
    procedure raise_a_negative_rational_number_to_an_even_negative_integer_power;
    procedure raise_a_negative_rational_number_to_an_odd_negative_integer_power;
    procedure raise_zero_to_an_integer_power;
    procedure raise_one_to_an_integer_power;
    procedure raise_a_positive_rational_number_to_the_power_of_zero;
    procedure raise_a_negative_rational_number_to_the_power_of_zero;
    procedure raise_a_real_number_to_a_positive_rational_number;
    procedure raise_a_real_number_to_a_negative_rational_number;
    procedure raise_a_real_number_to_a_zero_rational_number;
    procedure reduce_a_positive_rational_number_to_lowest_terms;
    procedure reduce_places_the_minus_sign_on_the_numerator;
    procedure reduce_a_negative_rational_number_to_lowest_terms;
    procedure reduce_a_rational_number_with_a_negative_denominator_to_lowest_terms;
    procedure reduce_zero_to_lowest_terms;
    procedure reduce_an_integer_to_lowest_terms;
    procedure reduce_one_to_lowest_terms;
  end;

implementation

uses RationalNumbers;

// 0ba4d988-044c-4ed5-9215-4d0bb8d0ae9f
procedure RationalNumbersTest.add_two_positive_rational_numbers;
var
  r1, r2, actual : TRational;
begin
  r1 := Rational(1, 2);
  r2 := Rational(2, 3);
  actual := r1 + r2;
  TapAssertTrue(Self, 'Add two positive rational numbers', 7, actual.Numer);
  TapAssertTrue(Self, 'Add two positive rational numbers', 6, actual.Denom);
end;

// 88ebc342-a2ac-4812-a656-7b664f718b6a
procedure RationalNumbersTest.add_a_positive_rational_number_and_a_negative_rational_number;
var
  r1, r2, actual : TRational;
begin
  r1 := Rational(1, 2);
  r2 := Rational(-2, 3);
  actual := r1 + r2;
  TapAssertTrue(Self, 'Add a positive rational number and a negative rational number', -1, actual.Numer);
  TapAssertTrue(Self, 'Add a positive rational number and a negative rational number', 6, actual.Denom);
end;

// 92ed09c2-991e-4082-a602-13557080205c
procedure RationalNumbersTest.add_two_negative_rational_numbers;
var
  r1, r2, actual : TRational;
begin
  r1 := Rational(-1, 2);
  r2 := Rational(-2, 3);
  actual := r1 + r2;
  TapAssertTrue(Self, 'Add two negative rational numbers', -7, actual.Numer);
  TapAssertTrue(Self, 'Add two negative rational numbers', 6, actual.Denom);
end;

// 6e58999e-3350-45fb-a104-aac7f4a9dd11
procedure RationalNumbersTest.add_a_rational_number_to_its_additive_inverse;
var
  r1, r2, actual : TRational;
begin
  r1 := Rational(1, 2);
  r2 := Rational(-1, 2);
  actual := r1 + r2;
  TapAssertTrue(Self, 'Add a rational number to its additive inverse', 0, actual.Numer);
  TapAssertTrue(Self, 'Add a rational number to its additive inverse', 1, actual.Denom);
end;

// 47bba350-9db1-4ab9-b412-4a7e1f72a66e
procedure RationalNumbersTest.subtract_two_positive_rational_numbers;
var
  r1, r2, actual : TRational;
begin
  r1 := Rational(1, 2);
  r2 := Rational(2, 3);
  actual := r1 - r2;
  TapAssertTrue(Self, 'Subtract two positive rational numbers', -1, actual.Numer);
  TapAssertTrue(Self, 'Subtract two positive rational numbers', 6, actual.Denom);
end;

// 93926e2a-3e82-4aee-98a7-fc33fb328e87
procedure RationalNumbersTest.subtract_a_positive_rational_number_and_a_negative_rational_number;
var
  r1, r2, actual : TRational;
begin
  r1 := Rational(1, 2);
  r2 := Rational(-2, 3);
  actual := r1 - r2;
  TapAssertTrue(Self, 'Subtract a positive rational number and a negative rational number', 7, actual.Numer);
  TapAssertTrue(Self, 'Subtract a positive rational number and a negative rational number', 6, actual.Denom);
end;

// a965ba45-9b26-442b-bdc7-7728e4b8d4cc
procedure RationalNumbersTest.subtract_two_negative_rational_numbers;
var
  r1, r2, actual : TRational;
begin
  r1 := Rational(-1, 2);
  r2 := Rational(-2, 3);
  actual := r1 - r2;
  TapAssertTrue(Self, 'Subtract two negative rational numbers', 1, actual.Numer);
  TapAssertTrue(Self, 'Subtract two negative rational numbers', 6, actual.Denom);
end;

// 0df0e003-f68e-4209-8c6e-6a4e76af5058
procedure RationalNumbersTest.subtract_a_rational_number_from_itself;
var
  r1, r2, actual : TRational;
begin
  r1 := Rational(1, 2);
  r2 := Rational(1, 2);
  actual := r1 - r2;
  TapAssertTrue(Self, 'Subtract a rational number from itself', 0, actual.Numer);
  TapAssertTrue(Self, 'Subtract a rational number from itself', 1, actual.Denom);
end;

// 34fde77a-75f4-4204-8050-8d3a937958d3
procedure RationalNumbersTest.multiply_two_positive_rational_numbers;
var
  r1, r2, actual : TRational;
begin
  r1 := Rational(1, 2);
  r2 := Rational(2, 3);
  actual := r1 * r2;
  TapAssertTrue(Self, 'Multiply two positive rational numbers', 1, actual.Numer);
  TapAssertTrue(Self, 'Multiply two positive rational numbers', 3, actual.Denom);
end;

// 6d015cf0-0ea3-41f1-93de-0b8e38e88bae
procedure RationalNumbersTest.multiply_a_negative_rational_number_by_a_positive_rational_number;
var
  r1, r2, actual : TRational;
begin
  r1 := Rational(-1, 2);
  r2 := Rational(2, 3);
  actual := r1 * r2;
  TapAssertTrue(Self, 'Multiply a negative rational number by a positive rational number', -1, actual.Numer);
  TapAssertTrue(Self, 'Multiply a negative rational number by a positive rational number', 3, actual.Denom);
end;

// d1bf1b55-954e-41b1-8c92-9fc6beeb76fa
procedure RationalNumbersTest.multiply_two_negative_rational_numbers;
var
  r1, r2, actual : TRational;
begin
  r1 := Rational(-1, 2);
  r2 := Rational(-2, 3);
  actual := r1 * r2;
  TapAssertTrue(Self, 'Multiply two negative rational numbers', 1, actual.Numer);
  TapAssertTrue(Self, 'Multiply two negative rational numbers', 3, actual.Denom);
end;

// a9b8f529-9ec7-4c79-a517-19365d779040
procedure RationalNumbersTest.multiply_a_rational_number_by_its_reciprocal;
var
  r1, r2, actual : TRational;
begin
  r1 := Rational(1, 2);
  r2 := Rational(2, 1);
  actual := r1 * r2;
  TapAssertTrue(Self, 'Multiply a rational number by its reciprocal', 1, actual.Numer);
  TapAssertTrue(Self, 'Multiply a rational number by its reciprocal', 1, actual.Denom);
end;

// d89d6429-22fa-4368-ab04-9e01a44d3b48
procedure RationalNumbersTest.multiply_a_rational_number_by_1;
var
  r1, r2, actual : TRational;
begin
  r1 := Rational(1, 2);
  r2 := Rational(1, 1);
  actual := r1 * r2;
  TapAssertTrue(Self, 'Multiply a rational number by 1', 1, actual.Numer);
  TapAssertTrue(Self, 'Multiply a rational number by 1', 2, actual.Denom);
end;

// 0d95c8b9-1482-4ed7-bac9-b8694fa90145
procedure RationalNumbersTest.multiply_a_rational_number_by_0;
var
  r1, r2, actual : TRational;
begin
  r1 := Rational(1, 2);
  r2 := Rational(0, 1);
  actual := r1 * r2;
  TapAssertTrue(Self, 'Multiply a rational number by 0', 0, actual.Numer);
  TapAssertTrue(Self, 'Multiply a rational number by 0', 1, actual.Denom);
end;

// 1de088f4-64be-4e6e-93fd-5997ae7c9798
procedure RationalNumbersTest.divide_two_positive_rational_numbers;
var
  r1, r2, actual : TRational;
begin
  r1 := Rational(1, 2);
  r2 := Rational(2, 3);
  actual := r1 / r2;
  TapAssertTrue(Self, 'Divide two positive rational numbers', 3, actual.Numer);
  TapAssertTrue(Self, 'Divide two positive rational numbers', 4, actual.Denom);
end;

// 7d7983db-652a-4e66-981a-e921fb38d9a9
procedure RationalNumbersTest.divide_a_positive_rational_number_by_a_negative_rational_number;
var
  r1, r2, actual : TRational;
begin
  r1 := Rational(1, 2);
  r2 := Rational(-2, 3);
  actual := r1 / r2;
  TapAssertTrue(Self, 'Divide a positive rational number by a negative rational number', -3, actual.Numer);
  TapAssertTrue(Self, 'Divide a positive rational number by a negative rational number', 4, actual.Denom);
end;

// 1b434d1b-5b38-4cee-aaf5-b9495c399e34
procedure RationalNumbersTest.divide_two_negative_rational_numbers;
var
  r1, r2, actual : TRational;
begin
  r1 := Rational(-1, 2);
  r2 := Rational(-2, 3);
  actual := r1 / r2;
  TapAssertTrue(Self, 'Divide two negative rational numbers', 3, actual.Numer);
  TapAssertTrue(Self, 'Divide two negative rational numbers', 4, actual.Denom);
end;

// d81c2ebf-3612-45a6-b4e0-f0d47812bd59
procedure RationalNumbersTest.divide_a_rational_number_by_1;
var
  r1, r2, actual : TRational;
begin
  r1 := Rational(1, 2);
  r2 := Rational(1, 1);
  actual := r1 / r2;
  TapAssertTrue(Self, 'Divide a rational number by 1', 1, actual.Numer);
  TapAssertTrue(Self, 'Divide a rational number by 1', 2, actual.Denom);
end;

// 5fee0d8e-5955-4324-acbe-54cdca94ddaa
procedure RationalNumbersTest.absolute_value_of_a_positive_rational_number;
var
  r, actual : TRational;
begin
  r := Rational(1, 2);
  actual := RationalNumbers.AbsoluteValue(r);
  TapAssertTrue(Self, 'Absolute value of a positive rational number', 1, actual.Numer);
  TapAssertTrue(Self, 'Absolute value of a positive rational number', 2, actual.Denom);
end;

// 3cb570b6-c36a-4963-a380-c0834321bcaa
procedure RationalNumbersTest.absolute_value_of_a_positive_rational_number_with_negative_numerator_and_denominator;
var
  r, actual : TRational;
begin
  r := Rational(-1, -2);
  actual := RationalNumbers.AbsoluteValue(r);
  TapAssertTrue(Self, 'Absolute value of a positive rational number with negative numerator and denominator', 1, actual.Numer);
  TapAssertTrue(Self, 'Absolute value of a positive rational number with negative numerator and denominator', 2, actual.Denom);
end;

// 6a05f9a0-1f6b-470b-8ff7-41af81773f25
procedure RationalNumbersTest.absolute_value_of_a_negative_rational_number;
var
  r, actual : TRational;
begin
  r := Rational(-1, 2);
  actual := RationalNumbers.AbsoluteValue(r);
  TapAssertTrue(Self, 'Absolute value of a negative rational number', 1, actual.Numer);
  TapAssertTrue(Self, 'Absolute value of a negative rational number', 2, actual.Denom);
end;

// 5d0f2336-3694-464f-8df9-f5852fda99dd
procedure RationalNumbersTest.absolute_value_of_a_negative_rational_number_with_negative_denominator;
var
  r, actual : TRational;
begin
  r := Rational(1, -2);
  actual := RationalNumbers.AbsoluteValue(r);
  TapAssertTrue(Self, 'Absolute value of a negative rational number with negative denominator', 1, actual.Numer);
  TapAssertTrue(Self, 'Absolute value of a negative rational number with negative denominator', 2, actual.Denom);
end;

// f8e1ed4b-9dca-47fb-a01e-5311457b3118
procedure RationalNumbersTest.absolute_value_of_zero;
var
  r, actual : TRational;
begin
  r := Rational(0, 1);
  actual := RationalNumbers.AbsoluteValue(r);
  TapAssertTrue(Self, 'Absolute value of zero', 0, actual.Numer);
  TapAssertTrue(Self, 'Absolute value of zero', 1, actual.Denom);
end;

// 4a8c939f-f958-473b-9f88-6ad0f83bb4c4
procedure RationalNumbersTest.absolute_value_of_a_rational_number_is_reduced_to_lowest_terms;
var
  r, actual : TRational;
begin
  r := Rational(2, 4);
  actual := RationalNumbers.AbsoluteValue(r);
  TapAssertTrue(Self, 'Absolute value of a rational number is reduced to lowest terms', 1, actual.Numer);
  TapAssertTrue(Self, 'Absolute value of a rational number is reduced to lowest terms', 2, actual.Denom);
end;

// ea2ad2af-3dab-41e7-bb9f-bd6819668a84
procedure RationalNumbersTest.raise_a_positive_rational_number_to_a_positive_integer_power;
var
  r, actual : TRational;
begin
  r := Rational(1, 2);
  actual := RationalNumbers.ExpRational(r, 3);
  TapAssertTrue(Self, 'Raise a positive rational number to a positive integer power', 1, actual.Numer);
  TapAssertTrue(Self, 'Raise a positive rational number to a positive integer power', 8, actual.Denom);
end;

// 8168edd2-0af3-45b1-b03f-72c01332e10a
procedure RationalNumbersTest.raise_a_negative_rational_number_to_a_positive_integer_power;
var
  r, actual : TRational;
begin
  r := Rational(-1, 2);
  actual := RationalNumbers.ExpRational(r, 3);
  TapAssertTrue(Self, 'Raise a negative rational number to a positive integer power', -1, actual.Numer);
  TapAssertTrue(Self, 'Raise a negative rational number to a positive integer power', 8, actual.Denom);
end;

// c291cfae-cfd8-44f5-aa6c-b175c148a492
procedure RationalNumbersTest.raise_a_positive_rational_number_to_a_negative_integer_power;
var
  r, actual : TRational;
begin
  r := Rational(3, 5);
  actual := RationalNumbers.ExpRational(r, -2);
  TapAssertTrue(Self, 'Raise a positive rational number to a negative integer power', 25, actual.Numer);
  TapAssertTrue(Self, 'Raise a positive rational number to a negative integer power', 9, actual.Denom);
end;

// 45cb3288-4ae4-4465-9ae5-c129de4fac8e
procedure RationalNumbersTest.raise_a_negative_rational_number_to_an_even_negative_integer_power;
var
  r, actual : TRational;
begin
  r := Rational(-3, 5);
  actual := RationalNumbers.ExpRational(r, -2);
  TapAssertTrue(Self, 'Raise a negative rational number to an even negative integer power', 25, actual.Numer);
  TapAssertTrue(Self, 'Raise a negative rational number to an even negative integer power', 9, actual.Denom);
end;

// 2d47f945-ffe1-4916-a399-c2e8c27d7f72
procedure RationalNumbersTest.raise_a_negative_rational_number_to_an_odd_negative_integer_power;
var
  r, actual : TRational;
begin
  r := Rational(-3, 5);
  actual := RationalNumbers.ExpRational(r, -3);
  TapAssertTrue(Self, 'Raise a negative rational number to an odd negative integer power', -125, actual.Numer);
  TapAssertTrue(Self, 'Raise a negative rational number to an odd negative integer power', 27, actual.Denom);
end;

// e2f25b1d-e4de-4102-abc3-c2bb7c4591e4
procedure RationalNumbersTest.raise_zero_to_an_integer_power;
var
  r, actual : TRational;
begin
  r := Rational(0, 1);
  actual := RationalNumbers.ExpRational(r, 5);
  TapAssertTrue(Self, 'Raise zero to an integer power', 0, actual.Numer);
  TapAssertTrue(Self, 'Raise zero to an integer power', 1, actual.Denom);
end;

// 431cac50-ab8b-4d58-8e73-319d5404b762
procedure RationalNumbersTest.raise_one_to_an_integer_power;
var
  r, actual : TRational;
begin
  r := Rational(1, 1);
  actual := RationalNumbers.ExpRational(r, 4);
  TapAssertTrue(Self, 'Raise one to an integer power', 1, actual.Numer);
  TapAssertTrue(Self, 'Raise one to an integer power', 1, actual.Denom);
end;

// 7d164739-d68a-4a9c-b99f-dd77ce5d55e6
procedure RationalNumbersTest.raise_a_positive_rational_number_to_the_power_of_zero;
var
  r, actual : TRational;
begin
  r := Rational(1, 2);
  actual := RationalNumbers.ExpRational(r, 0);
  TapAssertTrue(Self, 'Raise a positive rational number to the power of zero', 1, actual.Numer);
  TapAssertTrue(Self, 'Raise a positive rational number to the power of zero', 1, actual.Denom);
end;

// eb6bd5f5-f880-4bcd-8103-e736cb6e41d1
procedure RationalNumbersTest.raise_a_negative_rational_number_to_the_power_of_zero;
var
  r, actual : TRational;
begin
  r := Rational(-1, 2);
  actual := RationalNumbers.ExpRational(r, 0);
  TapAssertTrue(Self, 'Raise a negative rational number to the power of zero', 1, actual.Numer);
  TapAssertTrue(Self, 'Raise a negative rational number to the power of zero', 1, actual.Denom);
end;

// 30b467dd-c158-46f5-9ffb-c106de2fd6fa
procedure RationalNumbersTest.raise_a_real_number_to_a_positive_rational_number;
var
  r      : TRational;
  actual : double;
begin
  r := Rational(4, 3);
  actual := RationalNumbers.ExpReal(8.0, r);
  TapAssertTrue(Self, 'Raise a real number to a positive rational number', 16.0, actual, 1e-9);
end;

// 6e026bcc-be40-4b7b-ae22-eeaafc5a1789
procedure RationalNumbersTest.raise_a_real_number_to_a_negative_rational_number;
var
  r      : TRational;
  actual : double;
begin
  r := Rational(-1, 2);
  actual := RationalNumbers.ExpReal(9.0, r);
  TapAssertTrue(Self, 'Raise a real number to a negative rational number', 0.3333333333333333, actual, 1e-9);
end;

// 9f866da7-e893-407f-8cd2-ee85d496eec5
procedure RationalNumbersTest.raise_a_real_number_to_a_zero_rational_number;
var
  r      : TRational;
  actual : double;
begin
  r := Rational(0, 1);
  actual := RationalNumbers.ExpReal(2.0, r);
  TapAssertTrue(Self, 'Raise a real number to a zero rational number', 1.0, actual, 1e-9);
end;

// 0a63fbde-b59c-4c26-8237-1e0c73354d0a
procedure RationalNumbersTest.reduce_a_positive_rational_number_to_lowest_terms;
var
  actual : TRational;
begin
  actual := Rational(2, 4);
  TapAssertTrue(Self, 'Reduce a positive rational number to lowest terms', 1, actual.Numer);
  TapAssertTrue(Self, 'Reduce a positive rational number to lowest terms', 2, actual.Denom);
end;

// 5ed6f248-ad8d-4d4e-a545-9146c6727f33
procedure RationalNumbersTest.reduce_places_the_minus_sign_on_the_numerator;
var
  actual : TRational;
begin
  actual := Rational(3, -4);
  TapAssertTrue(Self, 'Reduce places the minus sign on the numerator', -3, actual.Numer);
  TapAssertTrue(Self, 'Reduce places the minus sign on the numerator', 4, actual.Denom);
end;

// f87c2a4e-d29c-496e-a193-318c503e4402
procedure RationalNumbersTest.reduce_a_negative_rational_number_to_lowest_terms;
var
  actual : TRational;
begin
  actual := Rational(-4, 6);
  TapAssertTrue(Self, 'Reduce a negative rational number to lowest terms', -2, actual.Numer);
  TapAssertTrue(Self, 'Reduce a negative rational number to lowest terms', 3, actual.Denom);
end;

// 3b92ffc0-5b70-4a43-8885-8acee79cdaaf
procedure RationalNumbersTest.reduce_a_rational_number_with_a_negative_denominator_to_lowest_terms;
var
  actual : TRational;
begin
  actual := Rational(3, -9);
  TapAssertTrue(Self, 'Reduce a rational number with a negative denominator to lowest terms', -1, actual.Numer);
  TapAssertTrue(Self, 'Reduce a rational number with a negative denominator to lowest terms', 3, actual.Denom);
end;

// c9dbd2e6-5ac0-4a41-84c1-48b645b4f663
procedure RationalNumbersTest.reduce_zero_to_lowest_terms;
var
  actual : TRational;
begin
  actual := Rational(0, 6);
  TapAssertTrue(Self, 'Reduce zero to lowest terms', 0, actual.Numer);
  TapAssertTrue(Self, 'Reduce zero to lowest terms', 1, actual.Denom);
end;

// 297b45ad-2054-4874-84d4-0358dc1b8887
procedure RationalNumbersTest.reduce_an_integer_to_lowest_terms;
var
  actual : TRational;
begin
  actual := Rational(-14, 7);
  TapAssertTrue(Self, 'Reduce an integer to lowest terms', -2, actual.Numer);
  TapAssertTrue(Self, 'Reduce an integer to lowest terms', 1, actual.Denom);
end;

// a73a17fe-fe8c-4a1c-a63b-e7579e333d9e
procedure RationalNumbersTest.reduce_one_to_lowest_terms;
var
  actual : TRational;
begin
  actual := Rational(13, 13);
  TapAssertTrue(Self, 'Reduce one to lowest terms', 1, actual.Numer);
  TapAssertTrue(Self, 'Reduce one to lowest terms', 1, actual.Denom);
end;

initialization
RegisterTest(RationalNumbersTest);

end.
