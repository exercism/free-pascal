unit TestCases;

{$mode ObjFPC}{$H+}

interface

uses Classes, SysUtils, FPCUnit, TestRegistry, FPCUnitTestUtils;

type
  TriangleTest = class(TTestCase)
  published
    procedure equilateral_all_sides_are_equal;
    procedure equilateral_any_side_is_unequal;
    procedure equilateral_no_sides_are_equal;
    procedure equilateral_all_zero_sides_is_not_a_triangle;
    procedure equilateral_sides_may_be_floats;
    procedure isosceles_last_two_sides_are_equal;
    procedure isosceles_first_two_sides_are_equal;
    procedure isosceles_first_and_last_sides_are_equal;
    procedure isosceles_equilateral_triangles_are_also_isosceles;
    procedure isosceles_no_sides_are_equal;
    procedure isosceles_first_triangle_inequality_violation;
    procedure isosceles_second_triangle_inequality_violation;
    procedure isosceles_third_triangle_inequality_violation;
    procedure isosceles_sides_may_be_floats;
    procedure scalene_no_sides_are_equal;
    procedure scalene_all_sides_are_equal;
    procedure scalene_first_and_second_sides_are_equal;
    procedure scalene_first_and_third_sides_are_equal;
    procedure scalene_second_and_third_sides_are_equal;
    procedure scalene_may_not_violate_triangle_inequality;
    procedure scalene_sides_may_be_floats;
  end;

implementation

uses Triangle;

// 8b2c43ac-7257-43f9-b552-7631a91988af
procedure TriangleTest.equilateral_all_sides_are_equal;
const expected = true;
var
  actual  : boolean;
  message : string;
begin
  actual  := Triangle.equilateral(2, 2, 2);
  message := EncodeJsonMessage('equilateral - all sides are equal', expected, actual);
  AssertTrue(message, expected = actual);
end;

// 33eb6f87-0498-4ccf-9573-7f8c3ce92b7b
procedure TriangleTest.equilateral_any_side_is_unequal;
const expected = false;
var
  actual  : boolean;
  message : string;
begin
  actual  := Triangle.equilateral(2, 3, 2);
  message := EncodeJsonMessage('equilateral - any side is unequal', expected, actual);
  AssertTrue(message, expected = actual);
end;

// c6585b7d-a8c0-4ad8-8a34-e21d36f7ad87
procedure TriangleTest.equilateral_no_sides_are_equal;
const expected = false;
var
  actual  : boolean;
  message : string;
begin
  actual  := Triangle.equilateral(5, 4, 6);
  message := EncodeJsonMessage('equilateral - no sides are equal', expected, actual);
  AssertTrue(message, expected = actual);
end;

// 16e8ceb0-eadb-46d1-b892-c50327479251
procedure TriangleTest.equilateral_all_zero_sides_is_not_a_triangle;
const expected = false;
var
  actual  : boolean;
  message : string;
begin
  actual  := Triangle.equilateral(0, 0, 0);
  message := EncodeJsonMessage('equilateral - all zero sides is not a triangle', expected, actual);
  AssertTrue(message, expected = actual);
end;

// 3022f537-b8e5-4cc1-8f12-fd775827a00c
procedure TriangleTest.equilateral_sides_may_be_floats;
const expected = true;
var
  actual  : boolean;
  message : string;
begin
  actual  := Triangle.equilateral(0.5, 0.5, 0.5);
  message := EncodeJsonMessage('equilateral - sides may be floats', expected, actual);
  AssertTrue(message, expected = actual);
end;

// cbc612dc-d75a-4c1c-87fc-e2d5edd70b71
procedure TriangleTest.isosceles_last_two_sides_are_equal;
const expected = true;
var
  actual  : boolean;
  message : string;
begin
  actual  := Triangle.isosceles(3, 4, 4);
  message := EncodeJsonMessage('isosceles - last two sides are equal', expected, actual);
  AssertTrue(message, expected = actual);
end;

// e388ce93-f25e-4daf-b977-4b7ede992217
procedure TriangleTest.isosceles_first_two_sides_are_equal;
const expected = true;
var
  actual  : boolean;
  message : string;
begin
  actual  := Triangle.isosceles(4, 4, 3);
  message := EncodeJsonMessage('isosceles - first two sides are equal', expected, actual);
  AssertTrue(message, expected = actual);
end;

// d2080b79-4523-4c3f-9d42-2da6e81ab30f
procedure TriangleTest.isosceles_first_and_last_sides_are_equal;
const expected = true;
var
  actual  : boolean;
  message : string;
begin
  actual  := Triangle.isosceles(4, 3, 4);
  message := EncodeJsonMessage('isosceles - first and last sides are equal', expected, actual);
  AssertTrue(message, expected = actual);
end;

// 8d71e185-2bd7-4841-b7e1-71689a5491d8
procedure TriangleTest.isosceles_equilateral_triangles_are_also_isosceles;
const expected = true;
var
  actual  : boolean;
  message : string;
begin
  actual  := Triangle.isosceles(4, 4, 4);
  message := EncodeJsonMessage('isosceles - equilateral triangles are also isosceles', expected, actual);
  AssertTrue(message, expected = actual);
end;

// 840ed5f8-366f-43c5-ac69-8f05e6f10bbb
procedure TriangleTest.isosceles_no_sides_are_equal;
const expected = false;
var
  actual  : boolean;
  message : string;
begin
  actual  := Triangle.isosceles(2, 3, 4);
  message := EncodeJsonMessage('isosceles - no sides are equal', expected, actual);
  AssertTrue(message, expected = actual);
end;

// 2eba0cfb-6c65-4c40-8146-30b608905eae
procedure TriangleTest.isosceles_first_triangle_inequality_violation;
const expected = false;
var
  actual  : boolean;
  message : string;
begin
  actual  := Triangle.isosceles(1, 1, 3);
  message := EncodeJsonMessage('isosceles - first triangle inequality violation', expected, actual);
  AssertTrue(message, expected = actual);
end;

// 278469cb-ac6b-41f0-81d4-66d9b828f8ac
procedure TriangleTest.isosceles_second_triangle_inequality_violation;
const expected = false;
var
  actual  : boolean;
  message : string;
begin
  actual  := Triangle.isosceles(1, 3, 1);
  message := EncodeJsonMessage('isosceles - second triangle inequality violation', expected, actual);
  AssertTrue(message, expected = actual);
end;

// 90efb0c7-72bb-4514-b320-3a3892e278ff
procedure TriangleTest.isosceles_third_triangle_inequality_violation;
const expected = false;
var
  actual  : boolean;
  message : string;
begin
  actual  := Triangle.isosceles(3, 1, 1);
  message := EncodeJsonMessage('isosceles - third triangle inequality violation', expected, actual);
  AssertTrue(message, expected = actual);
end;

// adb4ee20-532f-43dc-8d31-e9271b7ef2bc
procedure TriangleTest.isosceles_sides_may_be_floats;
const expected = true;
var
  actual  : boolean;
  message : string;
begin
  actual  := Triangle.isosceles(0.5, 0.4, 0.5);
  message := EncodeJsonMessage('isosceles - sides may be floats', expected, actual);
  AssertTrue(message, expected = actual);
end;

// e8b5f09c-ec2e-47c1-abec-f35095733afb
procedure TriangleTest.scalene_no_sides_are_equal;
const expected = true;
var
  actual  : boolean;
  message : string;
begin
  actual  := Triangle.scalene(5, 4, 6);
  message := EncodeJsonMessage('scalene - no sides are equal', expected, actual);
  AssertTrue(message, expected = actual);
end;

// 2510001f-b44d-4d18-9872-2303e7977dc1
procedure TriangleTest.scalene_all_sides_are_equal;
const expected = false;
var
  actual  : boolean;
  message : string;
begin
  actual  := Triangle.scalene(4, 4, 4);
  message := EncodeJsonMessage('scalene - all sides are equal', expected, actual);
  AssertTrue(message, expected = actual);
end;

// c6e15a92-90d9-4fb3-90a2-eef64f8d3e1e
procedure TriangleTest.scalene_first_and_second_sides_are_equal;
const expected = false;
var
  actual  : boolean;
  message : string;
begin
  actual  := Triangle.scalene(4, 4, 3);
  message := EncodeJsonMessage('scalene - first and second sides are equal', expected, actual);
  AssertTrue(message, expected = actual);
end;

// 3da23a91-a166-419a-9abf-baf4868fd985
procedure TriangleTest.scalene_first_and_third_sides_are_equal;
const expected = false;
var
  actual  : boolean;
  message : string;
begin
  actual  := Triangle.scalene(3, 4, 3);
  message := EncodeJsonMessage('scalene - first and third sides are equal', expected, actual);
  AssertTrue(message, expected = actual);
end;

// b6a75d98-1fef-4c42-8e9a-9db854ba0a4d
procedure TriangleTest.scalene_second_and_third_sides_are_equal;
const expected = false;
var
  actual  : boolean;
  message : string;
begin
  actual  := Triangle.scalene(4, 3, 3);
  message := EncodeJsonMessage('scalene - second and third sides are equal', expected, actual);
  AssertTrue(message, expected = actual);
end;

// 70ad5154-0033-48b7-af2c-b8d739cd9fdc
procedure TriangleTest.scalene_may_not_violate_triangle_inequality;
const expected = false;
var
  actual  : boolean;
  message : string;
begin
  actual  := Triangle.scalene(7, 3, 2);
  message := EncodeJsonMessage('scalene - may not violate triangle inequality', expected, actual);
  AssertTrue(message, expected = actual);
end;

// 26d9d59d-f8f1-40d3-ad58-ae4d54123d7d
procedure TriangleTest.scalene_sides_may_be_floats;
const expected = true;
var
  actual  : boolean;
  message : string;
begin
  actual  := Triangle.scalene(0.5, 0.4, 0.6);
  message := EncodeJsonMessage('scalene - sides may be floats', expected, actual);
  AssertTrue(message, expected = actual);
end;

initialization
RegisterTest(TriangleTest);

end.
