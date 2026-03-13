unit TestCases;

{$mode ObjFPC}{$H+}

interface

uses Classes, SysUtils, FPCUnit, TestRegistry, FPCUnitTestUtils;

type
  FlattenArrayTest = class(TTestCase)
  published
    procedure empty;
    procedure no_nesting;
    procedure flattens_a_nested_array;
    procedure flattens_array_with_just_integers_present;
    procedure _5_level_nesting;
    procedure _6_level_nesting;
    procedure null_values_are_omitted_from_the_final_result;
    procedure consecutive_null_values_at_the_front_of_the_array_are_omitted_from_the_final_result;
    procedure consecutive_null_values_in_the_middle_of_the_array_are_omitted_from_the_final_result;
    procedure _6_level_nested_array_with_null_values;
    procedure all_values_in_nested_array_are_null;
  end;

implementation

uses FlattenArray;

type
  TIntElement = class(TInterfacedObject, IElement)
    fValue : integer;
    constructor create(const v : integer);
    function isArray : boolean;
    function asInt   : integer;
    function asArr   : TIElements;
  end;

  TArrElement = class(TInterfacedObject, IElement)
    fElements : TIElements;
    constructor create(const e : array of IElement);
    function isArray : boolean;
    function asInt   : integer;
    function asArr   : TIElements;
  end;

constructor TIntElement.create(const v : integer);
begin
  fValue := v;
end;

function TIntElement.isArray : boolean;
begin
  result := false;
end;

function TIntElement.asInt : integer;
begin
  result := fValue;
end;

function TIntElement.asArr : TIElements;
begin
  result := nil;
end;

constructor TArrElement.create(const e : array of IElement);
var
  i : integer;
begin
  fElements := nil;
  SetLength(fElements, length(e));
  for i := Low(e) to High(e) do
    fElements[i] := e[i];
end;

function TArrElement.isArray : boolean;
begin
  result := true;
end;

function TArrElement.asInt : integer;
begin
  result := 0;
end;

function TArrElement.asArr : TIElements;
begin
  result := fElements;
end;

function intEl(const value : integer) : IElement;
begin
  result := TIntElement.create(value);
end;

function arrEl(const elements : array of IElement) : IElement;
begin
  result := TArrElement.create(elements);
end;

// 8c71dabd-da60-422d-a290-4a571471fb14
procedure FlattenArrayTest.empty;
const
  expect : TIntArray = ();
var
  arr    : TIElements;
  actual : TIntArray;
begin
  arr := [];
  actual := FlattenArray.flatten(arr);
  TapAssertTrue(Self, 'empty', expect, actual);
end;

// d268b919-963c-442d-9f07-82b93f1b518c
procedure FlattenArrayTest.no_nesting;
const
  expect : TIntArray = (0, 1, 2);
var
  arr    : TIElements;
  actual : TIntArray;
begin
  arr := [
    intEl(0),
    intEl(1),
    intEl(2)
  ];
  actual := FlattenArray.flatten(arr);
  TapAssertTrue(Self, 'no nesting', expect, actual);
end;

// 3f15bede-c856-479e-bb71-1684b20c6a30
procedure FlattenArrayTest.flattens_a_nested_array;
const
  expect : TIntArray = ();
var
  arr    : TIElements;
  actual : TIntArray;
begin
  arr := [
    arrEl([
      arrEl([])
    ])
  ];
  actual := FlattenArray.flatten(arr);
  TapAssertTrue(Self, 'flattens a nested array', expect, actual);
end;

// c84440cc-bb3a-48a6-862c-94cf23f2815d
procedure FlattenArrayTest.flattens_array_with_just_integers_present;
const
  expect : TIntArray = (1, 2, 3, 4, 5, 6, 7, 8);
var
  arr    : TIElements;
  actual : TIntArray;
begin
  arr := [
    intEl(1),
    arrEl([
      intEl(2),
      intEl(3),
      intEl(4),
      intEl(5),
      intEl(6),
      intEl(7)
    ]),
    intEl(8)
  ];
  actual := FlattenArray.flatten(arr);
  TapAssertTrue(Self, 'flattens array with just integers present', expect, actual);
end;

// d3d99d39-6be5-44f5-a31d-6037d92ba34f
procedure FlattenArrayTest._5_level_nesting;
const
  expect : TIntArray = (0, 2, 2, 3, 8, 100, 4, 50, -2);
var
  arr    : TIElements;
  actual : TIntArray;
begin
  arr := [
    intEl(0),
    intEl(2),
    arrEl([
      arrEl([
        intEl(2),
        intEl(3)
      ]),
      intEl(8),
      intEl(100),
      intEl(4),
      arrEl([
        arrEl([
          arrEl([
            intEl(50)
          ])
        ])
      ])
    ]),
    intEl(-2)
  ];
  actual := FlattenArray.flatten(arr);
  TapAssertTrue(Self, '5 level nesting', expect, actual);
end;

// d572bdba-c127-43ed-bdcd-6222ac83d9f7
procedure FlattenArrayTest._6_level_nesting;
const
  expect : TIntArray = (1, 2, 3, 4, 5, 6, 7, 8);
var
  arr    : TIElements;
  actual : TIntArray;
begin
  arr := [
    intEl(1),
    arrEl([
      intEl(2),
      arrEl([
        arrEl([
          intEl(3)
        ])
      ]),
      arrEl([
        intEl(4),
        arrEl([
          arrEl([
            intEl(5)
          ])
        ])
      ]),
      intEl(6),
      intEl(7)
    ]),
    intEl(8)
  ];
  actual := FlattenArray.flatten(arr);
  TapAssertTrue(Self, '6 level nesting', expect, actual);
end;

// 0705a8e5-dc86-4cec-8909-150c5e54fa9c
procedure FlattenArrayTest.null_values_are_omitted_from_the_final_result;
const
  expect : TIntArray = (1, 2);
var
  arr    : TIElements;
  actual : TIntArray;
begin
  arr := [
    intEl(1),
    intEl(2),
    nil
  ];
  actual := FlattenArray.flatten(arr);
  TapAssertTrue(Self, 'null values are omitted from the final result', expect, actual);
end;

// bc72da10-5f55-4ada-baf3-50e4da02ec8e
procedure FlattenArrayTest.consecutive_null_values_at_the_front_of_the_array_are_omitted_from_the_final_result;
const
  expect : TIntArray = (3);
var
  arr    : TIElements;
  actual : TIntArray;
begin
  arr := [
    nil,
    nil,
    intEl(3)
  ];
  actual := FlattenArray.flatten(arr);
  TapAssertTrue(Self, 'consecutive null values at the front of the array are omitted from the final result', expect, actual);
end;

// 6991836d-0d9b-4703-80a0-3f1f23eb5981
procedure FlattenArrayTest.consecutive_null_values_in_the_middle_of_the_array_are_omitted_from_the_final_result;
const
  expect : TIntArray = (1, 4);
var
  arr    : TIElements;
  actual : TIntArray;
begin
  arr := [
    intEl(1),
    nil,
    nil,
    intEl(4)
  ];
  actual := FlattenArray.flatten(arr);
  TapAssertTrue(Self, 'consecutive null values in the middle of the array are omitted from the final result', expect, actual);
end;

// dc90a09c-5376-449c-a7b3-c2d20d540069
procedure FlattenArrayTest._6_level_nested_array_with_null_values;
const
  expect : TIntArray = (0, 2, 2, 3, 8, 100, -2);
var
  arr    : TIElements;
  actual : TIntArray;
begin
  arr := [
    intEl(0),
    intEl(2),
    arrEl([
      arrEl([
        intEl(2),
        intEl(3)
      ]),
      intEl(8),
      arrEl([
        arrEl([
          intEl(100)
        ])
      ]),
      nil,
      arrEl([
        arrEl([
          nil
        ])
      ])
    ]),
    intEl(-2)
  ];
  actual := FlattenArray.flatten(arr);
  TapAssertTrue(Self, '6 level nested array with null values', expect, actual);
end;

// 51f5d9af-8f7f-4fb5-a156-69e8282cb275
procedure FlattenArrayTest.all_values_in_nested_array_are_null;
const
  expect : TIntArray = ();
var
  arr    : TIElements;
  actual : TIntArray;
begin
  arr := [
    nil,
    arrEl([
      arrEl([
        arrEl([
          nil
        ])
      ])
    ]),
    nil,
    nil,
    arrEl([
      arrEl([
        nil,
        nil
      ]),
      nil
    ]),
    nil
  ];
  actual := FlattenArray.flatten(arr);
  TapAssertTrue(Self, 'all values in nested array are null', expect, actual);
end;

initialization
RegisterTest(FlattenArrayTest);

end.
