unit TestCases;

{$mode ObjFPC}{$H+}

interface

uses Classes, SysUtils, FPCUnit, TestRegistry, FPCUnitTestUtils;

type
  PascalsTriangleTest = class(TTestCase)
  published
    procedure zero_rows;
    procedure single_row;
    procedure two_rows;
    procedure three_rows;
    procedure four_rows;
    procedure five_rows;
    procedure six_rows;
    procedure ten_rows;
  end;

implementation

uses PascalsTriangle;

// 9920ce55-9629-46d5-85d6-4201f4a4234d
procedure PascalsTriangleTest.zero_rows;
begin
  TapAssertTrue(Self, 'zero rows', [], PascalsTriangle.rows(0));
end;

// 70d643ce-a46d-4e93-af58-12d88dd01f21
procedure PascalsTriangleTest.single_row;
begin
  TapAssertTrue(Self, 'single row', [[1]], PascalsTriangle.rows(1));
end;

// a6e5a2a2-fc9a-4b47-9f4f-ed9ad9fbe4bd
procedure PascalsTriangleTest.two_rows;
begin
  TapAssertTrue(Self, 'two rows', [[1],[1,1]], PascalsTriangle.rows(2));
end;

// 97206a99-79ba-4b04-b1c5-3c0fa1e16925
procedure PascalsTriangleTest.three_rows;
begin
  TapAssertTrue(Self, 'three rows', [[1],[1,1],[1,2,1]], PascalsTriangle.rows(3));
end;

// 565a0431-c797-417c-a2c8-2935e01ce306
procedure PascalsTriangleTest.four_rows;
begin
  TapAssertTrue(Self, 'four rows', [[1],[1,1],[1,2,1],[1,3,3,1]], PascalsTriangle.rows(4));
end;

// 06f9ea50-9f51-4eb2-b9a9-c00975686c27
procedure PascalsTriangleTest.five_rows;
begin
  TapAssertTrue(Self, 'five rows', [[1],[1,1],[1,2,1],[1,3,3,1],[1,4,6,4,1]], PascalsTriangle.rows(5));
end;

// c3912965-ddb4-46a9-848e-3363e6b00b13
procedure PascalsTriangleTest.six_rows;
begin
  TapAssertTrue(Self, 'six rows', [[1],[1,1],[1,2,1],[1,3,3,1],[1,4,6,4,1],[1,5,10,10,5,1]], PascalsTriangle.rows(6));
end;

// 6cb26c66-7b57-4161-962c-81ec8c99f16b
procedure PascalsTriangleTest.ten_rows;
begin
  TapAssertTrue(Self, 'ten rows', [[1],[1,1],[1,2,1],[1,3,3,1],[1,4,6,4,1],[1,5,10,10,5,1],[1,6,15,20,15,6,1],[1,7,21,35,35,21,7,1],[1,8,28,56,70,56,28,8,1],[1,9,36,84,126,126,84,36,9,1]], PascalsTriangle.rows(10));
end;

initialization
RegisterTest(PascalsTriangleTest);

end.
