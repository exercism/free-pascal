unit TestCases;

{$mode ObjFPC}{$H+}

interface

uses Classes, SysUtils, FPCUnit, TestRegistry, FPCUnitTestUtils;

type
  TransposeTest = class(TTestCase)
  published
    procedure empty_string;
    procedure two_characters_in_a_row;
    procedure two_characters_in_a_column;
    procedure simple;
    procedure single_line;
    procedure first_line_longer_than_second_line;
    procedure second_line_longer_than_first_line;
    procedure mixed_line_length;
    procedure square;
    procedure rectangle;
    procedure triangle;
    procedure jagged_triangle;
  end;

implementation

uses Transpose;

// 404b7262-c050-4df0-a2a2-0cb06cd6a821
procedure TransposeTest.empty_string;
const
  lines  : TStrArray = ();
  expect : TStrArray = ();
begin
  TapAssertTrue(Self, 'empty string', expect, Transpose.transpose(lines));
end;

// a89ce8a3-c940-4703-a688-3ea39412fbcb
procedure TransposeTest.two_characters_in_a_row;
const
  lines  : TStrArray = ('A1');
  expect : TStrArray = ('A', '1');
begin
  TapAssertTrue(Self, 'two characters in a row', expect, Transpose.transpose(lines));
end;

// 855bb6ae-4180-457c-abd0-ce489803ce98
procedure TransposeTest.two_characters_in_a_column;
const
  lines  : TStrArray = ('A', '1');
  expect : TStrArray = ('A1');
begin
  TapAssertTrue(Self, 'two characters in a column', expect, Transpose.transpose(lines));
end;

// 5ceda1c0-f940-441c-a244-0ced197769c8
procedure TransposeTest.simple;
const
  lines  : TStrArray = ('ABC', '123');
  expect : TStrArray = ('A1', 'B2', 'C3');
begin
  TapAssertTrue(Self, 'simple', expect, Transpose.transpose(lines));
end;

// a54675dd-ae7d-4a58-a9c4-0c20e99a7c1f
procedure TransposeTest.single_line;
const
  lines  : TStrArray = ('Single line.');
  expect : TStrArray = ('S', 'i', 'n', 'g', 'l', 'e', ' ', 'l', 'i', 'n', 'e', '.');
begin
  TapAssertTrue(Self, 'single line', expect, Transpose.transpose(lines));
end;

// 0dc2ec0b-549d-4047-aeeb-8029fec8d5c5
procedure TransposeTest.first_line_longer_than_second_line;
const
  lines  : TStrArray = ('The fourth line.', 'The fifth line.');
  expect : TStrArray = ('TT', 'hh', 'ee', '  ', 'ff', 'oi', 'uf', 'rt', 'th', 'h ', ' l', 'li', 'in', 'ne', 'e.', '.');
begin
  TapAssertTrue(Self, 'first line longer than second line', expect, Transpose.transpose(lines));
end;

// 984e2ec3-b3d3-4b53-8bd6-96f5ef404102
procedure TransposeTest.second_line_longer_than_first_line;
const
  lines  : TStrArray = ('The first line.', 'The second line.');
  expect : TStrArray = ('TT', 'hh', 'ee', '  ', 'fs', 'ie', 'rc', 'so', 'tn', ' d', 'l ', 'il', 'ni', 'en', '.e', ' .');
begin
  TapAssertTrue(Self, 'second line longer than first line', expect, Transpose.transpose(lines));
end;

// eccd3784-45f0-4a3f-865a-360cb323d314
procedure TransposeTest.mixed_line_length;
const
  lines  : TStrArray = ('The longest line.', 'A long line.', 'A longer line.', 'A line.');
  expect : TStrArray = ('TAAA', 'h   ', 'elll', ' ooi', 'lnnn', 'ogge', 'n e.', 'glr', 'ei ', 'snl', 'tei', ' .n', 'l e', 'i .', 'n', 'e', '.');
begin
  TapAssertTrue(Self, 'mixed line length', expect, Transpose.transpose(lines));
end;

// 85b96b3f-d00c-4f80-8ca2-c8a5c9216c2d
procedure TransposeTest.square;
const
  lines  : TStrArray = ('HEART', 'EMBER', 'ABUSE', 'RESIN', 'TREND');
  expect : TStrArray = ('HEART', 'EMBER', 'ABUSE', 'RESIN', 'TREND');
begin
  TapAssertTrue(Self, 'square', expect, Transpose.transpose(lines));
end;

// b9257625-7a53-4748-8863-e08e9d27071d
procedure TransposeTest.rectangle;
const
  lines  : TStrArray = ('FRACTURE', 'OUTLINED', 'BLOOMING', 'SEPTETTE');
  expect : TStrArray = ('FOBS', 'RULE', 'ATOP', 'CLOT', 'TIME', 'UNIT', 'RENT', 'EDGE');
begin
  TapAssertTrue(Self, 'rectangle', expect, Transpose.transpose(lines));
end;

// b80badc9-057e-4543-bd07-ce1296a1ea2c
procedure TransposeTest.triangle;
const
  lines  : TStrArray = ('T', 'EE', 'AAA', 'SSSS', 'EEEEE', 'RRRRRR');
  expect : TStrArray = ('TEASER', ' EASER', '  ASER', '   SER', '    ER', '     R');
begin
  TapAssertTrue(Self, 'triangle', expect, Transpose.transpose(lines));
end;

// 76acfd50-5596-4d05-89f1-5116328a7dd9
procedure TransposeTest.jagged_triangle;
const
  lines  : TStrArray = ('11', '2', '3333', '444', '555555', '66666');
  expect : TStrArray = ('123456', '1 3456', '  3456', '  3 56', '    56', '    5');
begin
  TapAssertTrue(Self, 'jagged triangle', expect, Transpose.transpose(lines));
end;

initialization
RegisterTest(TransposeTest);

end.
