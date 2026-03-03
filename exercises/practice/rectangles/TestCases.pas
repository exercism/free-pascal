unit TestCases;

{$mode ObjFPC}{$H+}

interface

uses Classes, SysUtils, FPCUnit, TestRegistry, FPCUnitTestUtils;

type
  RectanglesTest = class(TTestCase)
  published
    procedure no_rows;
    procedure no_columns;
    procedure no_rectangles;
    procedure one_rectangle;
    procedure two_rectangles_without_shared_parts;
    procedure five_rectangles_with_shared_parts;
    procedure rectangle_of_height_1_is_counted;
    procedure rectangle_of_width_1_is_counted;
    procedure _1x1_square_is_counted;
    procedure only_complete_rectangles_are_counted;
    procedure rectangles_can_be_of_different_sizes;
    procedure corner_is_required_for_a_rectangle_to_be_complete;
    procedure large_input_with_many_rectangles;
    procedure rectangles_must_have_four_sides;
    procedure very_large_input;
  end;

implementation

uses Rectangles;

// 485b7bab-4150-40aa-a8db-73013427d08c
procedure RectanglesTest.no_rows;
const
  strings : TStrArray = (
  );
begin
  TapAssertTrue(Self, 'no rows', 0, Rectangles.rectangles(strings));
end;

// 076929ed-27e8-45dc-b14b-08279944dc49
procedure RectanglesTest.no_columns;
const
  strings : TStrArray = (
    ''
  );
begin
  TapAssertTrue(Self, 'no columns', 0, Rectangles.rectangles(strings));
end;

// 0a8abbd1-a0a4-4180-aa4e-65c1b1a073fa
procedure RectanglesTest.no_rectangles;
const
  strings : TStrArray = (
    ' '
  );
begin
  TapAssertTrue(Self, 'no rectangles', 0, Rectangles.rectangles(strings));
end;

// a4ba42e9-4e7f-4973-b7c7-4ce0760ac6cd
procedure RectanglesTest.one_rectangle;
const
  strings : TStrArray = (
    '+-+',
    '| |',
    '+-+'
  );
begin
  TapAssertTrue(Self, 'one rectangle', 1, Rectangles.rectangles(strings));
end;

// ced06550-83da-4d23-98b7-d24152e0db93
procedure RectanglesTest.two_rectangles_without_shared_parts;
const
  strings : TStrArray = (
    '  +-+',
    '  | |',
    '+-+-+',
    '| |  ',
    '+-+  '
  );
begin
  TapAssertTrue(Self, 'two rectangles without shared parts', 2, Rectangles.rectangles(strings));
end;

// 5942d69a-a07c-41c8-8b93-2d13877c706a
procedure RectanglesTest.five_rectangles_with_shared_parts;
const
  strings : TStrArray = (
    '  +-+',
    '  | |',
    '+-+-+',
    '| | |',
    '+-+-+'
  );
begin
  TapAssertTrue(Self, 'five rectangles with shared parts', 5, Rectangles.rectangles(strings));
end;

// 82d70be4-ab37-4bf2-a433-e33778d3bbf1
procedure RectanglesTest.rectangle_of_height_1_is_counted;
const
  strings : TStrArray = (
    '+--+',
    '+--+'
  );
begin
  TapAssertTrue(Self, 'rectangle of height 1 is counted', 1, Rectangles.rectangles(strings));
end;

// 57f1bc0e-2782-401e-ab12-7c01d8bfc2e0
procedure RectanglesTest.rectangle_of_width_1_is_counted;
const
  strings : TStrArray = (
    '++',
    '||',
    '++'
  );
begin
  TapAssertTrue(Self, 'rectangle of width 1 is counted', 1, Rectangles.rectangles(strings));
end;

// ef0bb65c-bd80-4561-9535-efc4067054f9
procedure RectanglesTest._1x1_square_is_counted;
const
  strings : TStrArray = (
    '++',
    '++'
  );
begin
  TapAssertTrue(Self, '1x1 square is counted', 1, Rectangles.rectangles(strings));
end;

// e1e1d444-e926-4d30-9bf3-7d8ec9a9e330
procedure RectanglesTest.only_complete_rectangles_are_counted;
const
  strings : TStrArray = (
    '  +-+',
    '    |',
    '+-+-+',
    '| | -',
    '+-+-+'
  );
begin
  TapAssertTrue(Self, 'only complete rectangles are counted', 1, Rectangles.rectangles(strings));
end;

// ca021a84-1281-4a56-9b9b-af14113933a4
procedure RectanglesTest.rectangles_can_be_of_different_sizes;
const
  strings : TStrArray = (
    '+------+----+',
    '|      |    |',
    '+---+--+    |',
    '|   |       |',
    '+---+-------+'
  );
begin
  TapAssertTrue(Self, 'rectangles can be of different sizes', 3, Rectangles.rectangles(strings));
end;

// 51f689a7-ef3f-41ae-aa2f-5ea09ad897ff
procedure RectanglesTest.corner_is_required_for_a_rectangle_to_be_complete;
const
  strings : TStrArray = (
    '+------+----+',
    '|      |    |',
    '+------+    |',
    '|   |       |',
    '+---+-------+'
  );
begin
  TapAssertTrue(Self, 'corner is required for a rectangle to be complete', 2, Rectangles.rectangles(strings));
end;

// d78fe379-8c1b-4d3c-bdf7-29bfb6f6dc66
procedure RectanglesTest.large_input_with_many_rectangles;
const
  strings : TStrArray = (
    '+---+--+----+',
    '|   +--+----+',
    '+---+--+    |',
    '|   +--+----+',
    '+---+--+--+-+',
    '+---+--+--+-+',
    '+------+  | |',
    '          +-+'
  );
begin
  TapAssertTrue(Self, 'large input with many rectangles', 60, Rectangles.rectangles(strings));
end;

// 6ef24e0f-d191-46da-b929-4faca24b4cd2
procedure RectanglesTest.rectangles_must_have_four_sides;
const
  strings : TStrArray = (
    '+-+ +-+',
    '| | | |',
    '+-+-+-+',
    '  | |  ',
    '+-+-+-+',
    '| | | |',
    '+-+ +-+'
  );
begin
  TapAssertTrue(Self, 'rectangles must have four sides', 5, Rectangles.rectangles(strings));
end;

procedure RectanglesTest.very_large_input;
const
  strings : TStrArray = (
    '      +-----+--------+    +-----+ ',
    '++---++-----+--------+---++-----++',
    '||+--++-----+-+-++   |   ||     ||',
    '|||  ||     +-+-++-+ |   ||     ||',
    '|||  ||     | | || | |   ||     ||',
    '||| +++-----+-+-++-+-+---++-+   ||',
    '||| |||     | | || | |+--++-+-+ ||',
    '||| +++---+-+-+-++-+-++--++-+ | ||',
    '||| |||+--+-+-+-+| | |+--++---+ ||',
    '||| ||||  | | | || | |+-+||     ||',
    '||+-++++--+-+++-++-+-++-+++---++||',
    '||  |+++--+-+++-+--+-+| |||   ||||',
    '+++-+++++---++--+-++-++-+++---+|||',
    ' |+-+++++---++--+ || || |||   ||||',
    ' |  +++++---++--+-++-++-++++  ||||',
    ' |   ||||   |+----++-++-++++--+++|',
    ' |   |+++---+|    || || ||    || |',
    '+++  |||+---++----+| || ||    || |',
    '|||  +++----++----++-++-++----++-+',
    '+++---++----++-----+-++-++----++  ',
    '                      +-+         '
  );
begin
  TapAssertTrue(Self, 'very large input', 2063, Rectangles.rectangles(strings));
end;

initialization
RegisterTest(RectanglesTest);

end.
