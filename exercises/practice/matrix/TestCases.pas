unit TestCases;

{$mode ObjFPC}{$H+}

interface

uses Classes, SysUtils, FPCUnit, TestRegistry, FPCUnitTestUtils;

type
  MatrixTest = class(TTestCase)
  published
    procedure extract_row_from_one_number_matrix;
    procedure can_extract_row;
    procedure extract_row_where_numbers_have_different_widths;
    procedure can_extract_row_from_non_square_matrix_with_no_corresponding_column;
    procedure extract_column_from_one_number_matrix;
    procedure can_extract_column;
    procedure can_extract_column_from_non_square_matrix_with_no_corresponding_row;
    procedure extract_column_where_numbers_have_different_widths;
  end;

implementation

uses Matrix;

// ca733dab-9d85-4065-9ef6-a880a951dafd
procedure MatrixTest.extract_row_from_one_number_matrix;
begin
  TapAssertTrue(Self, 'extract row from one number matrix', [1], Matrix.row('1', 1));
end;

// 5c93ec93-80e1-4268-9fc2-63bc7d23385c
procedure MatrixTest.can_extract_row;
begin
  TapAssertTrue(Self, 'can extract row', [3, 4], Matrix.row('1 2\n3 4', 2));
end;

// 2f1aad89-ad0f-4bd2-9919-99a8bff0305a
procedure MatrixTest.extract_row_where_numbers_have_different_widths;
begin
  TapAssertTrue(Self, 'extract row where numbers have different widths', [10, 20], Matrix.row('1 2\n10 20', 2));
end;

// 68f7f6ba-57e2-4e87-82d0-ad09889b5204
procedure MatrixTest.can_extract_row_from_non_square_matrix_with_no_corresponding_column;
begin
  TapAssertTrue(Self, 'can extract row from non-square matrix with no corresponding column', [8, 7, 6], Matrix.row('1 2 3\n4 5 6\n7 8 9\n8 7 6', 4));
end;

// e8c74391-c93b-4aed-8bfe-f3c9beb89ebb
procedure MatrixTest.extract_column_from_one_number_matrix;
begin
  TapAssertTrue(Self, 'extract column from one number matrix', [1], Matrix.column('1', 1));
end;

// 7136bdbd-b3dc-48c4-a10c-8230976d3727
procedure MatrixTest.can_extract_column;
begin
  TapAssertTrue(Self, 'can extract column', [3, 6, 9], Matrix.column('1 2 3\n4 5 6\n7 8 9', 3));
end;

// ad64f8d7-bba6-4182-8adf-0c14de3d0eca
procedure MatrixTest.can_extract_column_from_non_square_matrix_with_no_corresponding_row;
begin
  TapAssertTrue(Self, 'can extract column from non-square matrix with no corresponding row', [4, 8, 6], Matrix.column('1 2 3 4\n5 6 7 8\n9 8 7 6', 4));
end;

// 9eddfa5c-8474-440e-ae0a-f018c2a0dd89
procedure MatrixTest.extract_column_where_numbers_have_different_widths;
begin
  TapAssertTrue(Self, 'extract column where numbers have different widths', [1903, 3, 4], Matrix.column('89 1903 3\n18 3 1\n9 4 800', 2));
end;

initialization
RegisterTest(MatrixTest);

end.
