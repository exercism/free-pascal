unit TestCases;

{$mode ObjFPC}{$H+}

interface

uses Classes, SysUtils, FPCUnit, TestRegistry, FPCUnitTestUtils;

type
  DifferenceOfSquaresTest = class(TTestCase)
  published
    procedure square_of_sum_1;
    procedure square_of_sum_5;
    procedure square_of_sum_100;
    procedure sum_of_squares_1;
    procedure sum_of_squares_5;
    procedure sum_of_squares_100;
    procedure difference_of_squares_1;
    procedure difference_of_squares_5;
    procedure difference_of_squares_100;
  end;

implementation

uses DifferenceOfSquares;

var message : string;

// e46c542b-31fc-4506-bcae-6b62b3268537
procedure DifferenceOfSquaresTest.square_of_sum_1;
const expected = 1;
var actual : longint;
begin
  actual  := DifferenceOfSquares.squareOfSum(1);
  message := EncodeJsonMessage('square of sum 1', expected, actual);
  AssertTrue(message, expected = actual);
end;

// 9b3f96cb-638d-41ee-99b7-b4f9c0622948
procedure DifferenceOfSquaresTest.square_of_sum_5;
const expected = 225;
var actual : longint;
begin
  actual  := DifferenceOfSquares.squareOfSum(5);
  message := EncodeJsonMessage('square of sum 5', expected, actual);
  AssertTrue(message, expected = actual);
end;

// 54ba043f-3c35-4d43-86ff-3a41625d5e86
procedure DifferenceOfSquaresTest.square_of_sum_100;
const expected = 25502500;
var actual : longint;
begin
  actual  := DifferenceOfSquares.squareOfSum(100);
  message := EncodeJsonMessage('square of sum 100', expected, actual);
  AssertTrue(message, expected = actual);
end;

// 01d84507-b03e-4238-9395-dd61d03074b5
procedure DifferenceOfSquaresTest.sum_of_squares_1;
const expected = 1;
var actual : longint;
begin
  actual  := DifferenceOfSquares.sumOfSquares(1);
  message := EncodeJsonMessage('sum of squares 1', expected, actual);
  AssertTrue(message, expected = actual);
end;

// c93900cd-8cc2-4ca4-917b-dd3027023499
procedure DifferenceOfSquaresTest.sum_of_squares_5;
const expected = 55;
var actual : longint;
begin
  actual  := DifferenceOfSquares.sumOfSquares(5);
  message := EncodeJsonMessage('sum of squares 5', expected, actual);
  AssertTrue(message, expected = actual);
end;

// 94807386-73e4-4d9e-8dec-69eb135b19e4
procedure DifferenceOfSquaresTest.sum_of_squares_100;
const expected = 338350;
var actual : longint;
begin
  actual  := DifferenceOfSquares.sumOfSquares(100);
  message := EncodeJsonMessage('sum of squares 100', expected, actual);
  AssertTrue(message, expected = actual);
end;

// 44f72ae6-31a7-437f-858d-2c0837adabb6
procedure DifferenceOfSquaresTest.difference_of_squares_1;
const expected = 0;
var actual : longint;
begin
  actual  := DifferenceOfSquares.differenceOfSquares(1);
  message := EncodeJsonMessage('difference of squares 1', expected, actual);
  AssertTrue(message, expected = actual);
end;

// 005cb2bf-a0c8-46f3-ae25-924029f8b00b
procedure DifferenceOfSquaresTest.difference_of_squares_5;
const expected = 170;
var actual : longint;
begin
  actual  := DifferenceOfSquares.differenceOfSquares(5);
  message := EncodeJsonMessage('difference of squares 5', expected, actual);
  AssertTrue(message, expected = actual);
end;

// b1bf19de-9a16-41c0-a62b-1f02ecc0b036
procedure DifferenceOfSquaresTest.difference_of_squares_100;
const expected = 25164150;
var actual : longint;
begin
  actual  := DifferenceOfSquares.differenceOfSquares(100);
  message := EncodeJsonMessage('difference of squares 100', expected, actual);
  AssertTrue(message, expected = actual);
end;

initialization
RegisterTest(DifferenceOfSquaresTest);

end.
