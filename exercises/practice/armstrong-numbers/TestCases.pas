unit TestCases;

{$mode ObjFPC}{$H+}

interface

uses Classes, SysUtils, FPCUnit, TestRegistry, FPCUnitTestUtils;

type
  ArmstrongNumbersTest = class(TTestCase)
  published
    procedure zero_is_an_Armstrong_number;
    procedure single_digit_numbers_are_Armstrong_numbers;
    procedure there_are_no_two_digit_armstrong_numbers;
    procedure three_digit_number_that_is_an_armstrong_number;
    procedure three_digit_number_that_is_not_an_armstrong_number;
    procedure four_digit_number_that_is_an_armstrong_number;
    procedure four_digit_number_that_is_not_an_armstrong_number;
    procedure seven_digit_number_that_is_an_armstrong_number;
    procedure seven_digit_number_that_is_not_an_armstrong_number;
  end;

implementation

uses ArmstrongNumbers;

// c1ed103c-258d-45b2-be73-d8c6d9580c7b
procedure ArmstrongNumbersTest.zero_is_an_Armstrong_number;
begin
  TapAssertTrue(Self, 'Zero is an Armstrong number', true, ArmstrongNumbers.IsArmstrongNumber(0));
end;

// 579e8f03-9659-4b85-a1a2-d64350f6b17a
procedure ArmstrongNumbersTest.single_digit_numbers_are_Armstrong_numbers;
begin
  TapAssertTrue(Self, 'Single-digit numbers are Armstrong numbers', true, ArmstrongNumbers.IsArmstrongNumber(5));
end;

// 2d6db9dc-5bf8-4976-a90b-b2c2b9feba60
procedure ArmstrongNumbersTest.there_are_no_two_digit_armstrong_numbers;
begin
  TapAssertTrue(Self, 'There are no two-digit Armstrong numbers', false, ArmstrongNumbers.IsArmstrongNumber(10));
end;

// 509c087f-e327-4113-a7d2-26a4e9d18283
procedure ArmstrongNumbersTest.three_digit_number_that_is_an_armstrong_number;
begin
  TapAssertTrue(Self, 'Three-digit number that is an Armstrong number', true, ArmstrongNumbers.IsArmstrongNumber(153));
end;

// 7154547d-c2ce-468d-b214-4cb953b870cf
procedure ArmstrongNumbersTest.three_digit_number_that_is_not_an_armstrong_number;
begin
  TapAssertTrue(Self, 'Three-digit number that is not an Armstrong number', false, ArmstrongNumbers.IsArmstrongNumber(100));
end;

// 6bac5b7b-42e9-4ecb-a8b0-4832229aa103
procedure ArmstrongNumbersTest.four_digit_number_that_is_an_armstrong_number;
begin
  TapAssertTrue(Self, 'Four-digit number that is an Armstrong number', true, ArmstrongNumbers.IsArmstrongNumber(9474));
end;

// eed4b331-af80-45b5-a80b-19c9ea444b2e
procedure ArmstrongNumbersTest.four_digit_number_that_is_not_an_armstrong_number;
begin
  TapAssertTrue(Self, 'Four-digit number that is not an Armstrong number', false, ArmstrongNumbers.IsArmstrongNumber(9475));
end;

// f971ced7-8d68-4758-aea1-d4194900b864
procedure ArmstrongNumbersTest.seven_digit_number_that_is_an_armstrong_number;
begin
  TapAssertTrue(Self, 'Seven-digit number that is an Armstrong number', true, ArmstrongNumbers.IsArmstrongNumber(9926315));
end;

// 7ee45d52-5d35-4fbd-b6f1-5c8cd8a67f18
procedure ArmstrongNumbersTest.seven_digit_number_that_is_not_an_armstrong_number;
begin
  TapAssertTrue(Self, 'Seven-digit number that is not an Armstrong number', false, ArmstrongNumbers.IsArmstrongNumber(9926314));
end;

initialization
RegisterTest(ArmstrongNumbersTest);

end.
