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

// e46c542b-31fc-4506-bcae-6b62b3268537
procedure DifferenceOfSquaresTest.square_of_sum_1;
begin
  TapAssertTrue(Self, 'square of sum 1', 1, DifferenceOfSquares.squareOfSum(1));
end;

// 9b3f96cb-638d-41ee-99b7-b4f9c0622948
procedure DifferenceOfSquaresTest.square_of_sum_5;
begin
  TapAssertTrue(Self, 'square of sum 5', 225, DifferenceOfSquares.squareOfSum(5));
end;

// 54ba043f-3c35-4d43-86ff-3a41625d5e86
procedure DifferenceOfSquaresTest.square_of_sum_100;
begin
  TapAssertTrue(Self, 'square of sum 100', 25502500, DifferenceOfSquares.squareOfSum(100));
end;

// 01d84507-b03e-4238-9395-dd61d03074b5
procedure DifferenceOfSquaresTest.sum_of_squares_1;
begin
  TapAssertTrue(Self, 'sum of squares 1', 1, DifferenceOfSquares.sumOfSquares(1));
end;

// c93900cd-8cc2-4ca4-917b-dd3027023499
procedure DifferenceOfSquaresTest.sum_of_squares_5;
begin
  TapAssertTrue(Self, 'sum of squares 5', 55, DifferenceOfSquares.sumOfSquares(5));
end;

// 94807386-73e4-4d9e-8dec-69eb135b19e4
procedure DifferenceOfSquaresTest.sum_of_squares_100;
begin
  TapAssertTrue(Self, 'sum of squares 100', 338350, DifferenceOfSquares.sumOfSquares(100));
end;

// 44f72ae6-31a7-437f-858d-2c0837adabb6
procedure DifferenceOfSquaresTest.difference_of_squares_1;
begin
  TapAssertTrue(Self, 'difference of squares 1', 0, DifferenceOfSquares.differenceOfSquares(1));
end;

// 005cb2bf-a0c8-46f3-ae25-924029f8b00b
procedure DifferenceOfSquaresTest.difference_of_squares_5;
begin
  TapAssertTrue(Self, 'difference of squares 5', 170, DifferenceOfSquares.differenceOfSquares(5));
end;

// b1bf19de-9a16-41c0-a62b-1f02ecc0b036
procedure DifferenceOfSquaresTest.difference_of_squares_100;
begin
  TapAssertTrue(Self, 'difference of squares 100', 25164150, DifferenceOfSquares.differenceOfSquares(100));
end;

initialization
RegisterTest(DifferenceOfSquaresTest);

end.
