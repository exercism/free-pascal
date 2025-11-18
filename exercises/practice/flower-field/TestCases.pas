unit TestCases;

{$mode ObjFPC}{$H+}

interface

uses Classes, SysUtils, FPCUnit, TestRegistry, FPCUnitTestUtils;

type
  FlowerFieldTest = class(TTestCase)
  published
    procedure no_rows;
    procedure no_columns;
    procedure no_flowers;
    procedure garden_full_of_flowers;
    procedure flower_surrounded_by_spaces;
    procedure space_surrounded_by_flowers;
    procedure horizontal_line;
    procedure horizontal_line_flowers_at_edges;
    procedure vertical_line;
    procedure vertical_line_flowers_at_edges;
    procedure cross;
    procedure large_garden;
    procedure multiple_adjacent_flowers;
  end;

implementation

uses FlowerField;

// 237ff487-467a-47e1-9b01-8a891844f86c
procedure FlowerFieldTest.no_rows;
begin
  TapAssertTrue(Self, 'no rows', '', FlowerField.annotate(''));
end;

// 4b4134ec-e20f-439c-a295-664c38950ba1
procedure FlowerFieldTest.no_columns;
begin
  TapAssertTrue(Self, 'no columns', '', FlowerField.annotate(''));
end;

// d774d054-bbad-4867-88ae-069cbd1c4f92
procedure FlowerFieldTest.no_flowers;
begin
  TapAssertTrue(Self, 'no flowers', '   ' + #10 + '   ' + #10 + '   ', FlowerField.annotate('   ' + #10 + '   ' + #10 + '   '));
end;

// 225176a0-725e-43cd-aa13-9dced501f16e
procedure FlowerFieldTest.garden_full_of_flowers;
begin
  TapAssertTrue(Self, 'garden full of flowers', '***' + #10 + '***' + #10 + '***', FlowerField.annotate('***' + #10 + '***' + #10 + '***'));
end;

// 3f345495-f1a5-4132-8411-74bd7ca08c49
procedure FlowerFieldTest.flower_surrounded_by_spaces;
begin
  TapAssertTrue(Self, 'flower surrounded by spaces', '111' + #10 + '1*1' + #10 + '111', FlowerField.annotate('   ' + #10 + ' * ' + #10 + '   '));
end;

// 6cb04070-4199-4ef7-a6fa-92f68c660fca
procedure FlowerFieldTest.space_surrounded_by_flowers;
begin
  TapAssertTrue(Self, 'space surrounded by flowers', '***' + #10 + '*8*' + #10 + '***', FlowerField.annotate('***' + #10 + '* *' + #10 + '***'));
end;

// 272d2306-9f62-44fe-8ab5-6b0f43a26338
procedure FlowerFieldTest.horizontal_line;
begin
  TapAssertTrue(Self, 'horizontal line', '1*2*1', FlowerField.annotate(' * * '));
end;

// c6f0a4b2-58d0-4bf6-ad8d-ccf4144f1f8e
procedure FlowerFieldTest.horizontal_line_flowers_at_edges;
begin
  TapAssertTrue(Self, 'horizontal line, flowers at edges', '*1 1*', FlowerField.annotate('*   *'));
end;

// a54e84b7-3b25-44a8-b8cf-1753c8bb4cf5
procedure FlowerFieldTest.vertical_line;
begin
  TapAssertTrue(Self, 'vertical line', '1' + #10 + '*' + #10 + '2' + #10 + '*' + #10 + '1', FlowerField.annotate(' ' + #10 + '*' + #10 + ' ' + #10 + '*' + #10 + ' '));
end;

// b40f42f5-dec5-4abc-b167-3f08195189c1
procedure FlowerFieldTest.vertical_line_flowers_at_edges;
begin
  TapAssertTrue(Self, 'vertical line, flowers at edges', '*' + #10 + '1' + #10 + ' ' + #10 + '1' + #10 + '*', FlowerField.annotate('*' + #10 + ' ' + #10 + ' ' + #10 + ' ' + #10 + '*'));
end;

// 58674965-7b42-4818-b930-0215062d543c
procedure FlowerFieldTest.cross;
begin
  TapAssertTrue(Self, 'cross', ' 2*2 ' + #10 + '25*52' + #10 + '*****' + #10 + '25*52' + #10 + ' 2*2 ', FlowerField.annotate('  *  ' + #10 + '  *  ' + #10 + '*****' + #10 + '  *  ' + #10 + '  *  '));
end;

// dd9d4ca8-9e68-4f78-a677-a2a70fd7a7b8
procedure FlowerFieldTest.large_garden;
begin
  TapAssertTrue(Self, 'large garden', '1*22*1' + #10 + '12*322' + #10 + ' 123*2' + #10 + '112*4*' + #10 + '1*22*2' + #10 + '111111', FlowerField.annotate(' *  * ' + #10 + '  *   ' + #10 + '    * ' + #10 + '   * *' + #10 + ' *  * ' + #10 + '      '));
end;

// 6e4ac13a-3e43-4728-a2e3-3551d4b1a996
procedure FlowerFieldTest.multiple_adjacent_flowers;
begin
  TapAssertTrue(Self, 'multiple adjacent flowers', '1**1', FlowerField.annotate(' ** '));
end;

initialization
RegisterTest(FlowerFieldTest);

end.
