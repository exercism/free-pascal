unit TestCases;

{$mode ObjFPC}{$H+}

interface

uses Classes, SysUtils, FPCUnit, TestRegistry, FPCUnitTestUtils;

type
  DiamondTest = class(TTestCase)
  published
    procedure degenerate_case_with_a_single_a_row;
    procedure degenerate_case_with_no_row_containing_3_distinct_groups_of_spaces;
    procedure smallest_non_degenerate_case_with_odd_diamond_side_length;
    procedure smallest_non_degenerate_case_with_even_diamond_side_length;
    procedure largest_possible_diamond;
  end;

implementation

uses Diamond;

// 202fb4cc-6a38-4883-9193-a29d5cb92076
procedure DiamondTest.degenerate_case_with_a_single_a_row;
begin
  TapAssertTrue(Self, 'Degenerate case with a single ''A'' row', 'A', Diamond.rows('A'));
end;

// bd6a6d78-9302-42e9-8f60-ac1461e9abae
procedure DiamondTest.degenerate_case_with_no_row_containing_3_distinct_groups_of_spaces;
begin
  TapAssertTrue(Self, 'Degenerate case with no row containing 3 distinct groups of spaces', ' A ' + #10 + 'B B' + #10 + ' A ', Diamond.rows('B'));
end;

// af8efb49-14ed-447f-8944-4cc59ce3fd76
procedure DiamondTest.smallest_non_degenerate_case_with_odd_diamond_side_length;
begin
  TapAssertTrue(Self, 'Smallest non-degenerate case with odd diamond side length', '  A  ' + #10 + ' B B ' + #10 + 'C   C' + #10 + ' B B ' + #10 + '  A  ', Diamond.rows('C'));
end;

// e0c19a95-9888-4d05-86a0-fa81b9e70d1d
procedure DiamondTest.smallest_non_degenerate_case_with_even_diamond_side_length;
begin
  TapAssertTrue(Self, 'Smallest non-degenerate case with even diamond side length', '   A   ' + #10 + '  B B  ' + #10 + ' C   C ' + #10 + 'D     D' + #10 + ' C   C ' + #10 + '  B B  ' + #10 + '   A   ', Diamond.rows('D'));
end;

// 82ea9aa9-4c0e-442a-b07e-40204e925944
procedure DiamondTest.largest_possible_diamond;
begin
  TapAssertTrue(Self, 'Largest possible diamond', '                         A                         ' + #10 + '                        B B                        ' + #10 + '                       C   C                       ' + #10 + '                      D     D                      ' + #10 + '                     E       E                     ' + #10 + '                    F         F                    ' + #10 + '                   G           G                   ' + #10 + '                  H             H                  ' + #10 + '                 I               I                 ' + #10 + '                J                 J                ' + #10 + '               K                   K               ' + #10 + '              L                     L              ' + #10 + '             M                       M             ' + #10 + '            N                         N            ' + #10 + '           O                           O           ' + #10 + '          P                             P          ' + #10 + '         Q                               Q         ' + #10 + '        R                                 R        ' + #10 + '       S                                   S       ' + #10 + '      T                                     T      ' + #10 + '     U                                       U     ' + #10 + '    V                                         V    ' + #10 + '   W                                           W   ' + #10 + '  X                                             X  ' + #10 + ' Y                                               Y ' + #10 + 'Z                                                 Z' + #10 + ' Y                                               Y ' + #10 + '  X                                             X  ' + #10 + '   W                                           W   ' + #10 + '    V                                         V    ' + #10 + '     U                                       U     ' + #10 + '      T                                     T      ' + #10 + '       S                                   S       ' + #10 + '        R                                 R        ' + #10 + '         Q                               Q         ' + #10 + '          P                             P          ' + #10 + '           O                           O           ' + #10 + '            N                         N            ' + #10 + '             M                       M             ' + #10 + '              L                     L              ' + #10 + '               K                   K               ' + #10 + '                J                 J                ' + #10 + '                 I               I                 ' + #10 + '                  H             H                  ' + #10 + '                   G           G                   ' + #10 + '                    F         F                    ' + #10 + '                     E       E                     ' + #10 + '                      D     D                      ' + #10 + '                       C   C                       ' + #10 + '                        B B                        ' + #10 + '                         A                         ', Diamond.rows('Z'));
end;

initialization
RegisterTest(DiamondTest);

end.
