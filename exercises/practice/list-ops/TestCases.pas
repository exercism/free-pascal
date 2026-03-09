unit TestCases;

{$mode ObjFPC}{$H+}

interface

uses Classes, SysUtils, FPCUnit, TestRegistry, FPCUnitTestUtils;

type
  ListOpsTest = class(TTestCase)
  published
    procedure append_empty_lists;
    procedure append_list_to_empty_list;
    procedure append_empty_list_to_list;
    procedure append_non_empty_lists;
    procedure concat_empty_list;
    procedure concat_list_of_lists;
    procedure filter_empty_list;
    procedure filter_non_empty_list;
    procedure length_empty_list;
    procedure length_non_empty_list;
    procedure map_empty_list;
    procedure map_non_empty_list;
    procedure foldl_empty_list;
    procedure foldl_direction_independent_function_applied_to_non_empty_list;
    procedure foldr_empty_list;
    procedure foldr_direction_independent_function_applied_to_non_empty_list;
    procedure reverse_empty_list;
    procedure reverse_non_empty_list;
    procedure reverse_list_of_lists_is_not_flattened;
    procedure foldl_direction_dependent_function_applied_to_non_empty_list;
    procedure foldr_direction_dependent_function_applied_to_non_empty_list;
    procedure map_strings_to_upper_case;
    procedure filter_non_upper_case_strings;
    procedure reverse_strings;
  end;

implementation

uses ListOps;

type
  TIntListOps    = specialize TListOps<integer>;
  TIntArrListOps = specialize TListOps<TIntArray>;
  TStrListOps    = specialize TListOps<string>;

function IsOdd(const el: integer): boolean;
begin
  result := (el mod 2) = 1;
end;

function PlusOne(const el: integer): integer;
begin
  result := el + 1;
end;

function Add(const acc, el: integer): integer;
begin
  result := acc + el;
end;

function Multiply(const acc, el: integer): integer;
begin
  result := acc * el;
end;

function Divide(const acc, el: integer): integer;
begin
  result := el div acc;
end;

function ToUpper(const el: string): string;
begin
  result := UpperCase(el);
end;

function IsNotAllUpper(const el: string): boolean;
begin
  result := UpperCase(el) <> el;
end;

// 485b9452-bf94-40f7-a3db-c3cf4850066a
procedure ListOpsTest.append_empty_lists;
var
  actual: TIntArray;
begin
  actual := TIntListOps.append(nil, nil);
  TapAssertTrue(Self, 'empty lists', TIntArray([]), actual);
end;

// 2c894696-b609-4569-b149-8672134d340a
procedure ListOpsTest.append_list_to_empty_list;
const
  list2: TIntArray = (1, 2, 3, 4);
var
  actual: TIntArray;
begin
  actual := TIntListOps.append(nil, list2);
  TapAssertTrue(Self, 'list to empty list', TIntArray([1, 2, 3, 4]), actual);
end;

// e842efed-3bf6-4295-b371-4d67a4fdf19c
procedure ListOpsTest.append_empty_list_to_list;
const
  list1: TIntArray = (1, 2, 3, 4);
var
  actual: TIntArray;
begin
  actual := TIntListOps.append(list1, nil);
  TapAssertTrue(Self, 'empty list to list', TIntArray([1, 2, 3, 4]), actual);
end;

// 71dcf5eb-73ae-4a0e-b744-a52ee387922f
procedure ListOpsTest.append_non_empty_lists;
const
  list1: TIntArray = (1, 2);
  list2: TIntArray = (2, 3, 4, 5);
var
  actual: TIntArray;
begin
  actual := TIntListOps.append(list1, list2);
  TapAssertTrue(Self, 'non-empty lists', TIntArray([1, 2, 2, 3, 4, 5]), actual);
end;

// 28444355-201b-4af2-a2f6-5550227bde21
procedure ListOpsTest.concat_empty_list;
begin
  TapAssertTrue(Self, 'empty list', TIntArray([]), TIntListOps.concat(nil));
end;

// 331451c1-9573-42a1-9869-2d06e3b389a9
procedure ListOpsTest.concat_list_of_lists;
const
  sublist0: TIntArray = (1, 2);
  sublist1: TIntArray = (3);
  sublist3: TIntArray = (4, 5, 6);
var
  lists: TIntArray2D;
  actual: TIntArray;
begin
  lists := nil;
  SetLength(lists, 4);
  lists[0] := sublist0;
  lists[1] := sublist1;
  lists[2] := nil;
  lists[3] := sublist3;
  actual := TIntListOps.concat(lists);
  TapAssertTrue(Self, 'list of lists', TIntArray([1, 2, 3, 4, 5, 6]), actual);
end;

// 0524fba8-3e0f-4531-ad2b-f7a43da86a16
procedure ListOpsTest.filter_empty_list;
var
  actual: TIntArray;
begin
  actual := TIntListOps.filter(nil, @IsOdd);
  TapAssertTrue(Self, 'empty list', TIntArray([]), actual);
end;

// 88494bd5-f520-4edb-8631-88e415b62d24
procedure ListOpsTest.filter_non_empty_list;
const
  list: TIntArray = (1, 2, 3, 5);
var
  actual: TIntArray;
begin
  actual := TIntListOps.filter(list, @IsOdd);
  TapAssertTrue(Self, 'non-empty list', TIntArray([1, 3, 5]), actual);
end;

// 1cf0b92d-8d96-41d5-9c21-7b3c37cb6aad
procedure ListOpsTest.length_empty_list;
begin
  TapAssertTrue(Self, 'empty list', 0, TIntListOps.len(nil));
end;

// d7b8d2d9-2d16-44c4-9a19-6e5f237cb71e
procedure ListOpsTest.length_non_empty_list;
const
  list: TIntArray = (1, 2, 3, 4);
begin
  TapAssertTrue(Self, 'non-empty list', 4, TIntListOps.len(list));
end;

// c0bc8962-30e2-4bec-9ae4-668b8ecd75aa
procedure ListOpsTest.map_empty_list;
var
  actual: TIntArray;
begin
  actual := TIntListOps.map(nil, @PlusOne);
  TapAssertTrue(Self, 'empty list', TIntArray([]), actual);
end;

// 11e71a95-e78b-4909-b8e4-60cdcaec0e91
procedure ListOpsTest.map_non_empty_list;
const
  list: TIntArray = (1, 3, 5, 7);
var
  actual: TIntArray;
begin
  actual := TIntListOps.map(list, @PlusOne);
  TapAssertTrue(Self, 'non-empty list', TIntArray([2, 4, 6, 8]), actual);
end;

// 36549237-f765-4a4c-bfd9-5d3a8f7b07d2
procedure ListOpsTest.foldl_empty_list;
var
  actual: integer;
begin
  actual := TIntListOps.foldl(nil, 2, @Multiply);
  TapAssertTrue(Self, 'empty list', 2, actual);
end;

// 7a626a3c-03ec-42bc-9840-53f280e13067
procedure ListOpsTest.foldl_direction_independent_function_applied_to_non_empty_list;
const
  list: TIntArray = (1, 2, 3, 4);
var
  actual: integer;
begin
  actual := TIntListOps.foldl(list, 5, @Add);
  TapAssertTrue(Self, 'direction independent function applied to non-empty list', 15, actual);
end;

// 17214edb-20ba-42fc-bda8-000a5ab525b0
procedure ListOpsTest.foldr_empty_list;
var
  actual: integer;
begin
  actual := TIntListOps.foldr(nil, 2, @Multiply);
  TapAssertTrue(Self, 'empty list', 2, actual);
end;

// e1c64db7-9253-4a3d-a7c4-5273b9e2a1bd
procedure ListOpsTest.foldr_direction_independent_function_applied_to_non_empty_list;
const
  list: TIntArray = (1, 2, 3, 4);
var
  actual: integer;
begin
  actual := TIntListOps.foldr(list, 5, @Add);
  TapAssertTrue(Self, 'direction independent function applied to non-empty list', 15, actual);
end;

// 94231515-050e-4841-943d-d4488ab4ee30
procedure ListOpsTest.reverse_empty_list;
var
  actual: TIntArray;
begin
  actual := TIntListOps.reverse(nil);
  TapAssertTrue(Self, 'empty list', TIntArray([]), actual);
end;

// fcc03d1e-42e0-4712-b689-d54ad761f360
procedure ListOpsTest.reverse_non_empty_list;
const
  list: TIntArray = (1, 3, 5, 7);
var
  actual: TIntArray;
begin
  actual := TIntListOps.reverse(list);
  TapAssertTrue(Self, 'non-empty list', TIntArray([7, 5, 3, 1]), actual);
end;

// 40872990-b5b8-4cb8-9085-d91fc0d05d26
procedure ListOpsTest.reverse_list_of_lists_is_not_flattened;
const
  input0: TIntArray = (1, 2);
  input1: TIntArray = (3);
  input3: TIntArray = (4, 5, 6);
  expected0: TIntArray = (4, 5, 6);
  expected2: TIntArray = (3);
  expected3: TIntArray = (1, 2);
var
  list: TIntArray2D;
  actual: TIntArray2D;
  expected: TIntArray2D;
begin
  list := nil;
  SetLength(list, 4);
  list[0] := input0;
  list[1] := input1;
  SetLength(list[2], 0);
  list[3] := input3;
  actual := TIntArray2D(TIntArrListOps.reverse(list));
  expected := nil;
  SetLength(expected, 4);
  expected[0] := expected0;
  SetLength(expected[1], 0);
  expected[2] := expected2;
  expected[3] := expected3;
  TapAssertTrue(Self, 'list of lists is not flattened', expected, actual);
end;

procedure ListOpsTest.foldl_direction_dependent_function_applied_to_non_empty_list;
const
  list: TIntArray = (25, 20, 39, 41);
var
  actual: integer;
begin
  actual := TIntListOps.foldl(list, 5, @Divide);
  TapAssertTrue(Self, 'direction dependent function applied to non-empty list', 4, actual);
end;

procedure ListOpsTest.foldr_direction_dependent_function_applied_to_non_empty_list;
const
  list: TIntArray = (25, 20, 39, 41);
var
  actual: integer;
begin
  actual := TIntListOps.foldr(list, 5, @Divide);
  TapAssertTrue(Self, 'direction dependent function applied to non-empty list', 5, actual);
end;

procedure ListOpsTest.map_strings_to_upper_case;
const
  list: TStrArray = ('The', 'heart', 'has', 'its', 'reasons', 'which', 'reason', 'knows', 'not');
var
  actual: TStrArray;
begin
  actual := TStrListOps.map(list, @ToUpper);
  TapAssertTrue(Self, 'strings to upper case', TStrArray(['THE', 'HEART', 'HAS', 'ITS', 'REASONS', 'WHICH', 'REASON', 'KNOWS', 'NOT']), actual);
end;

procedure ListOpsTest.filter_non_upper_case_strings;
const
  list: TStrArray = ('Kind', 'words', 'DO', 'not', 'cost', 'MUCH', 'Yet', 'THEY', 'accomplish', 'MUCH');
var
  actual: TStrArray;
begin
  actual := TStrListOps.filter(list, @IsNotAllUpper);
  TapAssertTrue(Self, 'non upper case strings', TStrArray(['Kind', 'words', 'not', 'cost', 'Yet', 'accomplish']), actual);
end;

procedure ListOpsTest.reverse_strings;
const
  list: TStrArray = ('when', 'intuition', 'and', 'logic', 'agree', 'you', 'are', 'always', 'right');
var
  actual: TStrArray;
begin
  actual := TStrListOps.reverse(list);
  TapAssertTrue(Self, 'strings', TStrArray(['right', 'always', 'are', 'you', 'agree', 'logic', 'and', 'intuition', 'when']), actual);
end;

initialization
RegisterTest(ListOpsTest);

end.
