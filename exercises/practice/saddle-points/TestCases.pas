unit TestCases;

{$mode ObjFPC}{$H+}

interface

uses Classes, SysUtils, FPCUnit, TestRegistry, FPCUnitTestUtils;

type
  SaddlePointsTest = class(TTestCase)
  published
    procedure can_identify_single_saddle_point;
    procedure can_identify_that_empty_matrix_has_no_saddle_points;
    procedure can_identify_lack_of_saddle_points_when_there_are_none;
    procedure can_identify_multiple_saddle_points_in_a_column;
    procedure can_identify_multiple_saddle_points_in_a_row;
    procedure can_identify_saddle_point_in_bottom_right_corner;
    procedure can_identify_saddle_points_in_a_non_square_matrix;
    procedure can_identify_that_saddle_points_in_a_single_column_matrix_are_those_with_the_minimum_value;
    procedure can_identify_that_saddle_points_in_a_single_row_matrix_are_those_with_the_maximum_value;
  end;

implementation

uses SaddlePoints;

function PointsToStr(const points : TPoints) : string;
var
  i : integer;
begin
  result := '[';
  for i := 0 to high(points) do
  begin
    if i > 0 then result := result + ', ';
    result := result + '(' + IntToStr(points[i].row) + ', ' + IntToStr(points[i].column) + ')';
  end;
  result := result + ']';
end;

procedure TapAssertPoints(
  ACase          : TTestCase;
  const AMessage : string;
  const expect   : TPoints;
  const actual   : TPoints
);
var
  JsonMsg : string;
begin
  JsonMsg := EncodeJsonMessage(AMessage, PointsToStr(expect), PointsToStr(actual));
  ACase.AssertTrue(JsonMsg, PointsToStr(expect) = PointsToStr(actual));
end;

// 3e374e63-a2e0-4530-a39a-d53c560382bd
procedure SaddlePointsTest.can_identify_single_saddle_point;
const
  matrix : TMatrix = ((9, 8, 7), (5, 3, 2), (6, 6, 7));
  expect : TPoints = ((row: 2; column: 1));
begin
  TapAssertPoints(Self, 'Can identify single saddle point', expect, SaddlePoints.saddlePoints(matrix));
end;

// 6b501e2b-6c1f-491f-b1bb-7f278f760534
procedure SaddlePointsTest.can_identify_that_empty_matrix_has_no_saddle_points;
const
  matrix : TMatrix = (());
  expect : TPoints = ();
begin
  TapAssertPoints(Self, 'Can identify that empty matrix has no saddle points', expect, SaddlePoints.saddlePoints(matrix));
end;

// 8c27cc64-e573-4fcb-a099-f0ae863fb02f
procedure SaddlePointsTest.can_identify_lack_of_saddle_points_when_there_are_none;
const
  matrix : TMatrix = ((1, 2, 3), (3, 1, 2), (2, 3, 1));
  expect : TPoints = ();
begin
  TapAssertPoints(Self, 'Can identify lack of saddle points when there are none', expect, SaddlePoints.saddlePoints(matrix));
end;

// 6d1399bd-e105-40fd-a2c9-c6609507d7a3
procedure SaddlePointsTest.can_identify_multiple_saddle_points_in_a_column;
const
  matrix : TMatrix = ((4, 5, 4), (3, 5, 5), (1, 5, 4));
  expect : TPoints = ((row: 1; column: 2), (row: 2; column: 2), (row: 3; column: 2));
begin
  TapAssertPoints(Self, 'Can identify multiple saddle points in a column', expect, SaddlePoints.saddlePoints(matrix));
end;

// 3e81dce9-53b3-44e6-bf26-e328885fd5d1
procedure SaddlePointsTest.can_identify_multiple_saddle_points_in_a_row;
const
  matrix : TMatrix = ((6, 7, 8), (5, 5, 5), (7, 5, 6));
  expect : TPoints = ((row: 2; column: 1), (row: 2; column: 2), (row: 2; column: 3));
begin
  TapAssertPoints(Self, 'Can identify multiple saddle points in a row', expect, SaddlePoints.saddlePoints(matrix));
end;

// 88868621-b6f4-4837-bb8b-3fad8b25d46b
procedure SaddlePointsTest.can_identify_saddle_point_in_bottom_right_corner;
const
  matrix : TMatrix = ((8, 7, 9), (6, 7, 6), (3, 2, 5));
  expect : TPoints = ((row: 3; column: 3));
begin
  TapAssertPoints(Self, 'Can identify saddle point in bottom right corner', expect, SaddlePoints.saddlePoints(matrix));
end;

// 5b9499ca-fcea-4195-830a-9c4584a0ee79
procedure SaddlePointsTest.can_identify_saddle_points_in_a_non_square_matrix;
const
  matrix : TMatrix = ((3, 1, 3), (3, 2, 4));
  expect : TPoints = ((row: 1; column: 1), (row: 1; column: 3));
begin
  TapAssertPoints(Self, 'Can identify saddle points in a non square matrix', expect, SaddlePoints.saddlePoints(matrix));
end;

// ee99ccd2-a1f1-4283-ad39-f8c70f0cf594
procedure SaddlePointsTest.can_identify_that_saddle_points_in_a_single_column_matrix_are_those_with_the_minimum_value;
const
  matrix : TMatrix = ((2), (1), (4), (1));
  expect : TPoints = ((row: 2; column: 1), (row: 4; column: 1));
begin
  TapAssertPoints(Self, 'Can identify that saddle points in a single column matrix are those with the minimum value', expect, SaddlePoints.saddlePoints(matrix));
end;

// 63abf709-a84b-407f-a1b3-456638689713
procedure SaddlePointsTest.can_identify_that_saddle_points_in_a_single_row_matrix_are_those_with_the_maximum_value;
const
  matrix : TMatrix = ((2, 5, 3, 5));
  expect : TPoints = ((row: 1; column: 2), (row: 1; column: 4));
begin
  TapAssertPoints(Self, 'Can identify that saddle points in a single row matrix are those with the maximum value', expect, SaddlePoints.saddlePoints(matrix));
end;

initialization
RegisterTest(SaddlePointsTest);

end.
