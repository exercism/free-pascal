unit TestCases;

{$mode ObjFPC}{$H+}

interface

uses Classes, SysUtils, FPCUnit, TestRegistry, FPCUnitTestUtils;

type
  ResistorColorTrioTest = class(TTestCase)
  published
    procedure orange_and_orange_and_black;
    procedure blue_and_grey_and_brown;
    procedure red_and_black_and_red;
    procedure green_and_brown_and_orange;
    procedure yellow_and_violet_and_yellow;
    procedure blue_and_violet_and_blue;
    procedure minimum_possible_value;
    procedure maximum_possible_value;
    procedure first_two_colors_make_an_invalid_octal_number;
    procedure ignore_extra_colors;
    procedure orange_and_orange_and_red;
    procedure orange_and_orange_and_green;
    procedure white_and_white_and_violet;
    procedure white_and_white_and_grey;
  end;

implementation

uses ResistorColorTrio;

// d6863355-15b7-40bb-abe0-bfb1a25512ed
procedure ResistorColorTrioTest.orange_and_orange_and_black;
const
  colors : TStrArray = ('orange', 'orange', 'black');
begin
  TapAssertTrue(Self, 'Orange and orange and black', '33 ohms', ResistorColorTrio.resistance(colors));
end;

// 1224a3a9-8c8e-4032-843a-5224e04647d6
procedure ResistorColorTrioTest.blue_and_grey_and_brown;
const
  colors : TStrArray = ('blue', 'grey', 'brown');
begin
  TapAssertTrue(Self, 'Blue and grey and brown', '680 ohms', ResistorColorTrio.resistance(colors));
end;

// b8bda7dc-6b95-4539-abb2-2ad51d66a207
procedure ResistorColorTrioTest.red_and_black_and_red;
const
  colors : TStrArray = ('red', 'black', 'red');
begin
  TapAssertTrue(Self, 'Red and black and red', '2 kiloohms', ResistorColorTrio.resistance(colors));
end;

// 5b1e74bc-d838-4eda-bbb3-eaba988e733b
procedure ResistorColorTrioTest.green_and_brown_and_orange;
const
  colors : TStrArray = ('green', 'brown', 'orange');
begin
  TapAssertTrue(Self, 'Green and brown and orange', '51 kiloohms', ResistorColorTrio.resistance(colors));
end;

// f5d37ef9-1919-4719-a90d-a33c5a6934c9
procedure ResistorColorTrioTest.yellow_and_violet_and_yellow;
const
  colors : TStrArray = ('yellow', 'violet', 'yellow');
begin
  TapAssertTrue(Self, 'Yellow and violet and yellow', '470 kiloohms', ResistorColorTrio.resistance(colors));
end;

// 5f6404a7-5bb3-4283-877d-3d39bcc33854
procedure ResistorColorTrioTest.blue_and_violet_and_blue;
const
  colors : TStrArray = ('blue', 'violet', 'blue');
begin
  TapAssertTrue(Self, 'Blue and violet and blue', '67 megaohms', ResistorColorTrio.resistance(colors));
end;

// 7d3a6ab8-e40e-46c3-98b1-91639fff2344
procedure ResistorColorTrioTest.minimum_possible_value;
const
  colors : TStrArray = ('black', 'black', 'black');
begin
  TapAssertTrue(Self, 'Minimum possible value', '0 ohms', ResistorColorTrio.resistance(colors));
end;

// ca0aa0ac-3825-42de-9f07-dac68cc580fd
procedure ResistorColorTrioTest.maximum_possible_value;
const
  colors : TStrArray = ('white', 'white', 'white');
begin
  TapAssertTrue(Self, 'Maximum possible value', '99 gigaohms', ResistorColorTrio.resistance(colors));
end;

// 0061a76c-903a-4714-8ce2-f26ce23b0e09
procedure ResistorColorTrioTest.first_two_colors_make_an_invalid_octal_number;
const
  colors : TStrArray = ('black', 'grey', 'black');
begin
  TapAssertTrue(Self, 'First two colors make an invalid octal number', '8 ohms', ResistorColorTrio.resistance(colors));
end;

// 30872c92-f567-4b69-a105-8455611c10c4
procedure ResistorColorTrioTest.ignore_extra_colors;
const
  colors : TStrArray = ('blue', 'green', 'yellow', 'orange');
begin
  TapAssertTrue(Self, 'Ignore extra colors', '650 kiloohms', ResistorColorTrio.resistance(colors));
end;

procedure ResistorColorTrioTest.orange_and_orange_and_red;
const
  colors : TStrArray = ('orange', 'orange', 'red');
begin
  TapAssertTrue(Self, 'Orange and orange and red', '3.3 kiloohms', ResistorColorTrio.resistance(colors));
end;

procedure ResistorColorTrioTest.orange_and_orange_and_green;
const
  colors : TStrArray = ('orange', 'orange', 'green');
begin
  TapAssertTrue(Self, 'Orange and orange and green', '3.3 megaohms', ResistorColorTrio.resistance(colors));
end;

procedure ResistorColorTrioTest.white_and_white_and_violet;
const
  colors : TStrArray = ('white', 'white', 'violet');
begin
  TapAssertTrue(Self, 'White and white and violet', '990 megaohms', ResistorColorTrio.resistance(colors));
end;

procedure ResistorColorTrioTest.white_and_white_and_grey;
const
  colors : TStrArray = ('white', 'white', 'grey');
begin
  TapAssertTrue(Self, 'White and white and grey', '9.9 gigaohms', ResistorColorTrio.resistance(colors));
end;

initialization
RegisterTest(ResistorColorTrioTest);

end.
