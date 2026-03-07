unit TestCases;

{$mode ObjFPC}{$H+}

interface

uses Classes, SysUtils, FPCUnit, TestRegistry, FPCUnitTestUtils;

type
  BinarySearchTreeTest = class(TTestCase)
  published
    procedure data_is_retained;
    procedure smaller_number_at_left_node;
    procedure same_number_at_left_node;
    procedure greater_number_at_right_node;
    procedure can_create_complex_tree;
    procedure can_sort_single_number;
    procedure can_sort_if_second_number_is_smaller_than_first;
    procedure can_sort_if_second_number_is_same_as_first;
    procedure can_sort_if_second_number_is_greater_than_first;
    procedure can_sort_complex_tree;
  end;

implementation

uses BinarySearchTree;

// e9c93a78-c536-4750-a336-94583d23fafa
procedure BinarySearchTreeTest.data_is_retained;
var
  tree : TBinarySearchTree;
begin
  tree := TBinarySearchTree.Create;
  tree.Insert(4);
  TapAssertTrue(Self, 'data is retained', true, tree.Root <> nil);
  TapAssertTrue(Self, 'data is retained', 4, tree.Root.Data);
  TapAssertTrue(Self, 'data is retained', true, tree.Root.Left = nil);
  TapAssertTrue(Self, 'data is retained', true, tree.Root.Right = nil);
  tree.Free;
end;

// 7a95c9e8-69f6-476a-b0c4-4170cb3f7c91
procedure BinarySearchTreeTest.smaller_number_at_left_node;
var
  tree : TBinarySearchTree;
begin
  tree := TBinarySearchTree.Create;
  tree.Insert(4);
  tree.Insert(2);
  TapAssertTrue(Self, 'smaller number at left node', true, tree.Root <> nil);
  TapAssertTrue(Self, 'smaller number at left node', 4, tree.Root.Data);
  TapAssertTrue(Self, 'smaller number at left node', true, tree.Root.Left <> nil);
  TapAssertTrue(Self, 'smaller number at left node', 2, tree.Root.Left.Data);
  TapAssertTrue(Self, 'smaller number at left node', true, tree.Root.Left.Left = nil);
  TapAssertTrue(Self, 'smaller number at left node', true, tree.Root.Left.Right = nil);
  TapAssertTrue(Self, 'smaller number at left node', true, tree.Root.Right = nil);
  tree.Free;
end;

// 22b89499-9805-4703-a159-1a6e434c1585
procedure BinarySearchTreeTest.same_number_at_left_node;
var
  tree : TBinarySearchTree;
begin
  tree := TBinarySearchTree.Create;
  tree.Insert(4);
  tree.Insert(4);
  TapAssertTrue(Self, 'same number at left node', true, tree.Root <> nil);
  TapAssertTrue(Self, 'same number at left node', 4, tree.Root.Data);
  TapAssertTrue(Self, 'same number at left node', true, tree.Root.Left <> nil);
  TapAssertTrue(Self, 'same number at left node', 4, tree.Root.Left.Data);
  TapAssertTrue(Self, 'same number at left node', true, tree.Root.Left.Left = nil);
  TapAssertTrue(Self, 'same number at left node', true, tree.Root.Left.Right = nil);
  TapAssertTrue(Self, 'same number at left node', true, tree.Root.Right = nil);
  tree.Free;
end;

// 2e85fdde-77b1-41ed-b6ac-26ce6b663e34
procedure BinarySearchTreeTest.greater_number_at_right_node;
var
  tree : TBinarySearchTree;
begin
  tree := TBinarySearchTree.Create;
  tree.Insert(4);
  tree.Insert(5);
  TapAssertTrue(Self, 'greater number at right node', true, tree.Root <> nil);
  TapAssertTrue(Self, 'greater number at right node', 4, tree.Root.Data);
  TapAssertTrue(Self, 'greater number at right node', true, tree.Root.Left = nil);
  TapAssertTrue(Self, 'greater number at right node', true, tree.Root.Right <> nil);
  TapAssertTrue(Self, 'greater number at right node', 5, tree.Root.Right.Data);
  TapAssertTrue(Self, 'greater number at right node', true, tree.Root.Right.Left = nil);
  TapAssertTrue(Self, 'greater number at right node', true, tree.Root.Right.Right = nil);
  tree.Free;
end;

// dd898658-40ab-41d0-965e-7f145bf66e0b
procedure BinarySearchTreeTest.can_create_complex_tree;
var
  tree : TBinarySearchTree;
begin
  tree := TBinarySearchTree.Create;
  tree.Insert(4);
  tree.Insert(2);
  tree.Insert(6);
  tree.Insert(1);
  tree.Insert(3);
  tree.Insert(5);
  tree.Insert(7);
  TapAssertTrue(Self, 'can create complex tree', true, tree.Root <> nil);
  TapAssertTrue(Self, 'can create complex tree', 4, tree.Root.Data);
  TapAssertTrue(Self, 'can create complex tree', true, tree.Root.Left <> nil);
  TapAssertTrue(Self, 'can create complex tree', 2, tree.Root.Left.Data);
  TapAssertTrue(Self, 'can create complex tree', true, tree.Root.Left.Left <> nil);
  TapAssertTrue(Self, 'can create complex tree', 1, tree.Root.Left.Left.Data);
  TapAssertTrue(Self, 'can create complex tree', true, tree.Root.Left.Left.Left = nil);
  TapAssertTrue(Self, 'can create complex tree', true, tree.Root.Left.Left.Right = nil);
  TapAssertTrue(Self, 'can create complex tree', true, tree.Root.Left.Right <> nil);
  TapAssertTrue(Self, 'can create complex tree', 3, tree.Root.Left.Right.Data);
  TapAssertTrue(Self, 'can create complex tree', true, tree.Root.Left.Right.Left = nil);
  TapAssertTrue(Self, 'can create complex tree', true, tree.Root.Left.Right.Right = nil);
  TapAssertTrue(Self, 'can create complex tree', true, tree.Root.Right <> nil);
  TapAssertTrue(Self, 'can create complex tree', 6, tree.Root.Right.Data);
  TapAssertTrue(Self, 'can create complex tree', true, tree.Root.Right.Left <> nil);
  TapAssertTrue(Self, 'can create complex tree', 5, tree.Root.Right.Left.Data);
  TapAssertTrue(Self, 'can create complex tree', true, tree.Root.Right.Left.Left = nil);
  TapAssertTrue(Self, 'can create complex tree', true, tree.Root.Right.Left.Right = nil);
  TapAssertTrue(Self, 'can create complex tree', true, tree.Root.Right.Right <> nil);
  TapAssertTrue(Self, 'can create complex tree', 7, tree.Root.Right.Right.Data);
  TapAssertTrue(Self, 'can create complex tree', true, tree.Root.Right.Right.Left = nil);
  TapAssertTrue(Self, 'can create complex tree', true, tree.Root.Right.Right.Right = nil);
  tree.Free;
end;

// 9e0c06ef-aeca-4202-b8e4-97f1ed057d56
procedure BinarySearchTreeTest.can_sort_single_number;
const
  expect : TIntArray = (2);
var
  tree : TBinarySearchTree;
  actual : TIntArray;
begin
  tree := TBinarySearchTree.Create;
  tree.Insert(2);
  actual := tree.SortedData;
  TapAssertTrue(Self, 'can sort single number', expect, actual);
  tree.Free;
end;

// 425e6d07-fceb-4681-a4f4-e46920e380bb
procedure BinarySearchTreeTest.can_sort_if_second_number_is_smaller_than_first;
const
  expect : TIntArray = (1, 2);
var
  tree : TBinarySearchTree;
  actual : TIntArray;
begin
  tree := TBinarySearchTree.Create;
  tree.Insert(2);
  tree.Insert(1);
  actual := tree.SortedData;
  TapAssertTrue(Self, 'can sort if second number is smaller than first', expect, actual);
  tree.Free;
end;

// bd7532cc-6988-4259-bac8-1d50140079ab
procedure BinarySearchTreeTest.can_sort_if_second_number_is_same_as_first;
const
  expect : TIntArray = (2, 2);
var
  tree : TBinarySearchTree;
  actual : TIntArray;
begin
  tree := TBinarySearchTree.Create;
  tree.Insert(2);
  tree.Insert(2);
  actual := tree.SortedData;
  TapAssertTrue(Self, 'can sort if second number is same as first', expect, actual);
  tree.Free;
end;

// b6d1b3a5-9d79-44fd-9013-c83ca92ddd36
procedure BinarySearchTreeTest.can_sort_if_second_number_is_greater_than_first;
const
  expect : TIntArray = (2, 3);
var
  tree : TBinarySearchTree;
  actual : TIntArray;
begin
  tree := TBinarySearchTree.Create;
  tree.Insert(2);
  tree.Insert(3);
  actual := tree.SortedData;
  TapAssertTrue(Self, 'can sort if second number is greater than first', expect, actual);
  tree.Free;
end;

// d00ec9bd-1288-4171-b968-d44d0808c1c8
procedure BinarySearchTreeTest.can_sort_complex_tree;
const
  expect : TIntArray = (1, 2, 3, 5, 6, 7);
var
  tree : TBinarySearchTree;
  actual : TIntArray;
begin
  tree := TBinarySearchTree.Create;
  tree.Insert(2);
  tree.Insert(1);
  tree.Insert(3);
  tree.Insert(6);
  tree.Insert(7);
  tree.Insert(5);
  actual := tree.SortedData;
  TapAssertTrue(Self, 'can sort complex tree', expect, actual);
  tree.Free;
end;

initialization
RegisterTest(BinarySearchTreeTest);

end.
