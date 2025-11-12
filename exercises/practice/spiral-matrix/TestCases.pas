unit TestCases;

{$mode ObjFPC}{$H+}

interface

uses Classes, SysUtils, FPCUnit, TestRegistry, FPCUnitTestUtils;

type
  SpiralMatrixTest = class(TTestCase)
  published
    procedure empty_spiral;
    procedure trivial_spiral;
    procedure spiral_of_size_2;
    procedure spiral_of_size_3;
    procedure spiral_of_size_4;
    procedure spiral_of_size_5;
  end;

implementation

uses SpiralMatrix;

// 8f584201-b446-4bc9-b132-811c8edd9040
procedure SpiralMatrixTest.empty_spiral;
begin
  TapAssertTrue(Self, 'empty spiral', [], SpiralMatrix.SpiralMatrix(0));
end;

// e40ae5f3-e2c9-4639-8116-8a119d632ab2
procedure SpiralMatrixTest.trivial_spiral;
begin
  TapAssertTrue(Self, 'trivial spiral', [[1]], SpiralMatrix.SpiralMatrix(1));
end;

// cf05e42d-eb78-4098-a36e-cdaf0991bc48
procedure SpiralMatrixTest.spiral_of_size_2;
begin
  TapAssertTrue(Self, 'spiral of size 2', [[1, 2], [4, 3]], SpiralMatrix.SpiralMatrix(2));
end;

// 1c475667-c896-4c23-82e2-e033929de939
procedure SpiralMatrixTest.spiral_of_size_3;
begin
  TapAssertTrue(Self, 'spiral of size 3', [[1, 2, 3], [8, 9, 4], [7, 6, 5]], SpiralMatrix.SpiralMatrix(3));
end;

// 05ccbc48-d891-44f5-9137-f4ce462a759d
procedure SpiralMatrixTest.spiral_of_size_4;
begin
  TapAssertTrue(Self, 'spiral of size 4', [[1, 2, 3, 4], [12, 13, 14, 5], [11, 16, 15, 6], [10, 9, 8, 7]], SpiralMatrix.SpiralMatrix(4));
end;

// f4d2165b-1738-4e0c-bed0-c459045ae50d
procedure SpiralMatrixTest.spiral_of_size_5;
begin
  TapAssertTrue(Self, 'spiral of size 5', [[1, 2, 3, 4, 5], [16, 17, 18, 19, 6], [15, 24, 25, 20, 7], [14, 23, 22, 21, 8], [13, 12, 11, 10, 9]], SpiralMatrix.SpiralMatrix(5));
end;

initialization
RegisterTest(SpiralMatrixTest);

end.
