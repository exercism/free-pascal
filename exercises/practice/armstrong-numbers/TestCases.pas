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

var message : string;

// c1ed103c-258d-45b2-be73-d8c6d9580c7b
procedure ArmstrongNumbersTest.zero_is_an_Armstrong_number;
const expected = true;
var actual : boolean;
begin
  actual  := ArmstrongNumbers.IsArmstrongNumber(0);
  message := EncodeJsonMessage('Zero is an Armstrong number', expected, actual);
  AssertTrue(message, expected = actual);
end;

// 579e8f03-9659-4b85-a1a2-d64350f6b17a
procedure ArmstrongNumbersTest.single_digit_numbers_are_Armstrong_numbers;
const expected = true;
var actual : boolean;
begin
  actual  := ArmstrongNumbers.IsArmstrongNumber(5);
  message := EncodeJsonMessage('Single-digit numbers are Armstrong numbers', expected, actual);
  AssertTrue(message, expected = actual);
end;

// 2d6db9dc-5bf8-4976-a90b-b2c2b9feba60
procedure ArmstrongNumbersTest.there_are_no_two_digit_armstrong_numbers;
const expected = false;
var actual : boolean;
begin
  actual  := ArmstrongNumbers.IsArmstrongNumber(10);
  message := EncodeJsonMessage('There are no two-digit Armstrong numbers', expected, actual);
  AssertTrue(message, expected = actual);
end;

// 509c087f-e327-4113-a7d2-26a4e9d18283
procedure ArmstrongNumbersTest.three_digit_number_that_is_an_armstrong_number;
const expected = true;
var actual : boolean;
begin
  actual  := ArmstrongNumbers.IsArmstrongNumber(153);
  message := EncodeJsonMessage('Three-digit number that is an Armstrong number', expected, actual);
  AssertTrue(message, expected = actual);
end;

// 7154547d-c2ce-468d-b214-4cb953b870cf
procedure ArmstrongNumbersTest.three_digit_number_that_is_not_an_armstrong_number;
const expected = false;
var actual : boolean;
begin
  actual  := ArmstrongNumbers.IsArmstrongNumber(100);
  message := EncodeJsonMessage('Three-digit number that is not an Armstrong number', expected, actual);
  AssertTrue(message, expected = actual);
end;

// 6bac5b7b-42e9-4ecb-a8b0-4832229aa103
procedure ArmstrongNumbersTest.four_digit_number_that_is_an_armstrong_number;
const expected = true;
var actual : boolean;
begin
  actual  := ArmstrongNumbers.IsArmstrongNumber(9474);
  message := EncodeJsonMessage('Four-digit number that is an Armstrong number', expected, actual);
  AssertTrue(message, expected = actual);
end;

// eed4b331-af80-45b5-a80b-19c9ea444b2e
procedure ArmstrongNumbersTest.four_digit_number_that_is_not_an_armstrong_number;
const expected = false;
var actual : boolean;
begin
  actual  := ArmstrongNumbers.IsArmstrongNumber(9475);
  message := EncodeJsonMessage('Four-digit number that is not an Armstrong number', expected, actual);
  AssertTrue(message, expected = actual);
end;

// f971ced7-8d68-4758-aea1-d4194900b864
procedure ArmstrongNumbersTest.seven_digit_number_that_is_an_armstrong_number;
const expected = true;
var actual : boolean;
begin
  actual  := ArmstrongNumbers.IsArmstrongNumber(9926315);
  message := EncodeJsonMessage('Seven-digit number that is an Armstrong number', expected, actual);
  AssertTrue(message, expected = actual);
end;

// 7ee45d52-5d35-4fbd-b6f1-5c8cd8a67f18
procedure ArmstrongNumbersTest.seven_digit_number_that_is_not_an_armstrong_number;
const expected = false;
var actual : boolean;
begin
e  actual  := ArmstrongNumbers.IsArmstrongNumber(9926314);
  message := EncodeJsonMessage('Seven-digit number that is not an Armstrong number', expected, actual);
  AssertTrue(message, expected = actual);
end;

initialization
RegisterTest(ArmstrongNumbersTest);

end.
