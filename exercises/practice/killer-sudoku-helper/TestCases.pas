unit TestCases;

{$mode ObjFPC}{$H+}

interface

uses Classes, SysUtils, FPCUnit, TestRegistry, FPCUnitTestUtils;

type
  KillerSudokuHelperTest = class(TTestCase)
  published
    procedure _1;
    procedure _2;
    procedure _3;
    procedure _4;
    procedure _5;
    procedure _6;
    procedure _7;
    procedure _8;
    procedure _9;
    procedure cage_with_sum_45_contains_all_digits_1_to_9;
    procedure cage_with_only_1_possible_combination;
    procedure cage_with_several_combinations;
    procedure cage_with_several_combinations_that_is_restricted;
  end;

implementation

uses KillerSudokuHelper;

// 2aaa8f13-11b5-4054-b95c-a906e4d79fb6
procedure KillerSudokuHelperTest._1;
var
  solutions : TIntArray2D;
begin
  solutions := KillerSudokuHelper.combinations(1, 1, []);
  TapAssertTrue(Self, '1', [[1]], solutions);
end;

// 4645da19-9fdd-4087-a910-a6ed66823563
procedure KillerSudokuHelperTest._2;
var
  solutions : TIntArray2D;
begin
  solutions := KillerSudokuHelper.combinations(2, 1, []);
  TapAssertTrue(Self, '2', [[2]], solutions);
end;

// 07cfc704-f8aa-41b2-8f9a-cbefb674cb48
procedure KillerSudokuHelperTest._3;
var
  solutions : TIntArray2D;
begin
  solutions := KillerSudokuHelper.combinations(3, 1, []);
  TapAssertTrue(Self, '3', [[3]], solutions);
end;

// 22b8b2ba-c4fd-40b3-b1bf-40aa5e7b5f24
procedure KillerSudokuHelperTest._4;
var
  solutions : TIntArray2D;
begin
  solutions := KillerSudokuHelper.combinations(4, 1, []);
  TapAssertTrue(Self, '4', [[4]], solutions);
end;

// b75d16e2-ff9b-464d-8578-71f73094cea7
procedure KillerSudokuHelperTest._5;
var
  solutions : TIntArray2D;
begin
  solutions := KillerSudokuHelper.combinations(5, 1, []);
  TapAssertTrue(Self, '5', [[5]], solutions);
end;

// bcbf5afc-4c89-4ff6-9357-07ab4d42788f
procedure KillerSudokuHelperTest._6;
var
  solutions : TIntArray2D;
begin
  solutions := KillerSudokuHelper.combinations(6, 1, []);
  TapAssertTrue(Self, '6', [[6]], solutions);
end;

// 511b3bf8-186f-4e35-844f-c804d86f4a7a
procedure KillerSudokuHelperTest._7;
var
  solutions : TIntArray2D;
begin
  solutions := KillerSudokuHelper.combinations(7, 1, []);
  TapAssertTrue(Self, '7', [[7]], solutions);
end;

// bd09a60d-3aca-43bd-b6aa-6ccad01bedda
procedure KillerSudokuHelperTest._8;
var
  solutions : TIntArray2D;
begin
  solutions := KillerSudokuHelper.combinations(8, 1, []);
  TapAssertTrue(Self, '8', [[8]], solutions);
end;

// 9b539f27-44ea-4ff8-bd3d-c7e136bee677
procedure KillerSudokuHelperTest._9;
var
  solutions : TIntArray2D;
begin
  solutions := KillerSudokuHelper.combinations(9, 1, []);
  TapAssertTrue(Self, '9', [[9]], solutions);
end;

// 0a8b2078-b3a4-4dbd-be0d-b180f503d5c3
procedure KillerSudokuHelperTest.cage_with_sum_45_contains_all_digits_1_to_9;
var
  solutions : TIntArray2D;
begin
  solutions := KillerSudokuHelper.combinations(45, 9, []);
  TapAssertTrue(Self, 'Cage with sum 45 contains all digits 1 to 9', [[1, 2, 3, 4, 5, 6, 7, 8, 9]], solutions);
end;

// 2635d7c9-c716-4da1-84f1-c96e03900142
procedure KillerSudokuHelperTest.cage_with_only_1_possible_combination;
var
  solutions : TIntArray2D;
begin
  solutions := KillerSudokuHelper.combinations(7, 3, []);
  TapAssertTrue(Self, 'Cage with only 1 possible combination', [[1, 2, 4]], solutions);
end;

// a5bde743-e3a2-4a0c-8aac-e64fceea4228
procedure KillerSudokuHelperTest.cage_with_several_combinations;
var
  solutions : TIntArray2D;
begin
  solutions := KillerSudokuHelper.combinations(10, 2, []);
  TapAssertTrue(Self, 'Cage with several combinations', [[1, 9], [2, 8], [3, 7], [4, 6]], solutions);
end;

// dfbf411c-737d-465a-a873-ca556360c274
procedure KillerSudokuHelperTest.cage_with_several_combinations_that_is_restricted;
var
  solutions : TIntArray2D;
begin
  solutions := KillerSudokuHelper.combinations(10, 2, [1, 4]);
  TapAssertTrue(Self, 'Cage with several combinations that is restricted', [[2, 8], [3, 7]], solutions);
end;

initialization
RegisterTest(KillerSudokuHelperTest);

end.
