unit TestCases;

{$mode ObjFPC}{$H+}

interface

uses Classes, SysUtils, FPCUnit, TestRegistry, FPCUnitTestUtils;

type
  SatelliteTest = class(TTestCase)
  published
    procedure empty_tree;
    procedure tree_with_one_item;
    procedure tree_with_many_items;
    procedure reject_traversals_of_different_length;
    procedure reject_inconsistent_traversals_of_same_length;
    procedure reject_traversals_with_repeated_items;
    procedure a_degenerate_binary_tree;
    procedure another_degenerate_binary_tree;
    procedure tree_with_many_more_items;
  end;

implementation

uses Satellite;

procedure TapAssertExpectionMessage(
  ACase             : TTestCase ;
  const AMessage    : string    ;
  const expected    : string    ;
  const preorder    : TStrArray ;
  const inorder     : TStrArray
);
var
  JsonMsg : string;
  actual  : string;
begin
  actual := '';
  try
    Satellite.treeFromTraversals(preorder, inorder);
  except
    on E: Exception do actual := E.Message;
  end;
  JsonMsg := EncodeJsonMessage(AMessage, expected, actual);
  ACase.AssertTrue(JsonMsg, expected = actual);
end;

procedure FreeTree(p : PNode);
begin
  if p = nil then
    exit;

  FreeTree(p^.Left);
  FreeTree(p^.Right);
  Dispose(p);
end;

// 8df3fa26-811a-4165-9286-ff9ac0850d19
procedure SatelliteTest.empty_tree;
const
  preorder : TStrArray = ();
  inorder  : TStrArray = ();
var
  tree : PNode;
begin
  tree := Satellite.treeFromTraversals(preorder, inorder);
  TapAssertTrue(Self, 'Empty tree', true, tree = nil);
  FreeTree(tree);
end;

// f945ccfc-05e3-47d7-825b-0270559d43ad
procedure SatelliteTest.tree_with_one_item;
const
  preorder : TStrArray = ('a');
  inorder  : TStrArray = ('a');
var
  tree : PNode;
begin
  tree := Satellite.treeFromTraversals(preorder, inorder);
  TapAssertTrue(Self, 'Tree with one item', true, tree <> nil);
  TapAssertTrue(Self, 'Tree with one item', 'a', tree^.Data);
  TapAssertTrue(Self, 'Tree with one item', true, tree^.Left = nil);
  TapAssertTrue(Self, 'Tree with one item', true, tree^.Right = nil);
  FreeTree(tree);
end;

// a0121d5f-37b0-48dd-9c64-cba4c4464135
procedure SatelliteTest.tree_with_many_items;
const
  preorder : TStrArray = ('a','i','x','f','r');
  inorder  : TStrArray = ('i','a','f','x','r');
var
  tree : PNode;
begin
  tree := Satellite.treeFromTraversals(preorder, inorder);
  TapAssertTrue(Self, 'Tree with many items', true, tree <> nil);
  TapAssertTrue(Self, 'Tree with many items', 'a', tree^.Data);
  TapAssertTrue(Self, 'Tree with many items', true, tree^.Left <> nil);
  TapAssertTrue(Self, 'Tree with many items', 'i', tree^.Left^.Data);
  TapAssertTrue(Self, 'Tree with many items', true, tree^.Left^.Left = nil);
  TapAssertTrue(Self, 'Tree with many items', true, tree^.Left^.Right = nil);
  TapAssertTrue(Self, 'Tree with many items', true, tree^.Right <> nil);
  TapAssertTrue(Self, 'Tree with many items', 'x', tree^.Right^.Data);
  TapAssertTrue(Self, 'Tree with many items', true, tree^.Right^.Left <> nil);
  TapAssertTrue(Self, 'Tree with many items', 'f', tree^.Right^.Left^.Data);
  TapAssertTrue(Self, 'Tree with many items', true, tree^.Right^.Left^.Left = nil);
  TapAssertTrue(Self, 'Tree with many items', true, tree^.Right^.Left^.Right = nil);
  TapAssertTrue(Self, 'Tree with many items', true, tree^.Right^.Right <> nil);
  TapAssertTrue(Self, 'Tree with many items', 'r', tree^.Right^.Right^.Data);
  TapAssertTrue(Self, 'Tree with many items', true, tree^.Right^.Right^.Left = nil);
  TapAssertTrue(Self, 'Tree with many items', true, tree^.Right^.Right^.Right = nil);
  FreeTree(tree);
end;

// 6074041f-4891-4d81-a128-401050c2a3b0
procedure SatelliteTest.reject_traversals_of_different_length;
const
  preorder : TStrArray = ('a','b');
  inorder  : TStrArray = ('b','a','r');
begin
  TapAssertExpectionMessage(Self, 'Reject traversals of different length', 'traversals must have the same length', preorder, inorder);
end;

// 27916ce4-45f3-4d8b-8528-496fedc157ca
procedure SatelliteTest.reject_inconsistent_traversals_of_same_length;
const
  preorder : TStrArray = ('x','y','z');
  inorder  : TStrArray = ('a','b','c');
begin
  TapAssertExpectionMessage(Self, 'Reject inconsistent traversals of same length', 'traversals must have the same elements', preorder, inorder);
end;

// d86a3d72-76a9-43b5-9d3a-e64cb1216035
procedure SatelliteTest.reject_traversals_with_repeated_items;
const
  preorder : TStrArray = ('a','b','a');
  inorder  : TStrArray = ('b','a','a');
begin
  TapAssertExpectionMessage(Self, 'Reject traversals with repeated items', 'traversals must contain unique items', preorder, inorder);
end;

// af31ae02-7e5b-4452-a990-bccb3fca9148
procedure SatelliteTest.a_degenerate_binary_tree;
const
  preorder : TStrArray = ('a','b','c','d');
  inorder  : TStrArray = ('d','c','b','a');
var
  tree : PNode;
begin
  tree := Satellite.treeFromTraversals(preorder, inorder);
  TapAssertTrue(Self, 'A degenerate binary tree', true, tree <> nil);
  TapAssertTrue(Self, 'A degenerate binary tree', 'a', tree^.Data);
  TapAssertTrue(Self, 'A degenerate binary tree', true, tree^.Left <> nil);
  TapAssertTrue(Self, 'A degenerate binary tree', 'b', tree^.Left^.Data);
  TapAssertTrue(Self, 'A degenerate binary tree', true, tree^.Left^.Left <> nil);
  TapAssertTrue(Self, 'A degenerate binary tree', 'c', tree^.Left^.Left^.Data);
  TapAssertTrue(Self, 'A degenerate binary tree', true, tree^.Left^.Left^.Left <> nil);
  TapAssertTrue(Self, 'A degenerate binary tree', 'd', tree^.Left^.Left^.Left^.Data);
  TapAssertTrue(Self, 'A degenerate binary tree', true, tree^.Left^.Left^.Left^.Left = nil);
  TapAssertTrue(Self, 'A degenerate binary tree', true, tree^.Left^.Left^.Left^.Right = nil);
  TapAssertTrue(Self, 'A degenerate binary tree', true, tree^.Left^.Left^.Right = nil);
  TapAssertTrue(Self, 'A degenerate binary tree', true, tree^.Left^.Right = nil);
  TapAssertTrue(Self, 'A degenerate binary tree', true, tree^.Right = nil);
  FreeTree(tree);
end;

// ee54463d-a719-4aae-ade4-190d30ce7320
procedure SatelliteTest.another_degenerate_binary_tree;
const
  preorder : TStrArray = ('a','b','c','d');
  inorder  : TStrArray = ('a','b','c','d');
var
  tree : PNode;
begin
  tree := Satellite.treeFromTraversals(preorder, inorder);
  TapAssertTrue(Self, 'Another degenerate binary tree', true, tree <> nil);
  TapAssertTrue(Self, 'Another degenerate binary tree', 'a', tree^.Data);
  TapAssertTrue(Self, 'Another degenerate binary tree', true, tree^.Left = nil);
  TapAssertTrue(Self, 'Another degenerate binary tree', true, tree^.Right <> nil);
  TapAssertTrue(Self, 'Another degenerate binary tree', 'b', tree^.Right^.Data);
  TapAssertTrue(Self, 'Another degenerate binary tree', true, tree^.Right^.Left = nil);
  TapAssertTrue(Self, 'Another degenerate binary tree', true, tree^.Right^.Right <> nil);
  TapAssertTrue(Self, 'Another degenerate binary tree', 'c', tree^.Right^.Right^.Data);
  TapAssertTrue(Self, 'Another degenerate binary tree', true, tree^.Right^.Right^.Left = nil);
  TapAssertTrue(Self, 'Another degenerate binary tree', true, tree^.Right^.Right^.Right <> nil);
  TapAssertTrue(Self, 'Another degenerate binary tree', 'd', tree^.Right^.Right^.Right^.Data);
  TapAssertTrue(Self, 'Another degenerate binary tree', true, tree^.Right^.Right^.Right^.Left = nil);
  TapAssertTrue(Self, 'Another degenerate binary tree', true, tree^.Right^.Right^.Right^.Right = nil);
  FreeTree(tree);
end;

// 87123c08-c155-4486-90a4-e2f75b0f3e8f
procedure SatelliteTest.tree_with_many_more_items;
const
  preorder : TStrArray = ('a','b','d','g','h','c','e','f','i');
  inorder  : TStrArray = ('g','d','h','b','a','e','c','i','f');
var
  tree : PNode;
begin
  tree := Satellite.treeFromTraversals(preorder, inorder);
  TapAssertTrue(Self, 'Tree with many more items', true, tree <> nil);
  TapAssertTrue(Self, 'Tree with many more items', 'a', tree^.Data);
  TapAssertTrue(Self, 'Tree with many more items', true, tree^.Left <> nil);
  TapAssertTrue(Self, 'Tree with many more items', 'b', tree^.Left^.Data);
  TapAssertTrue(Self, 'Tree with many more items', true, tree^.Left^.Left <> nil);
  TapAssertTrue(Self, 'Tree with many more items', 'd', tree^.Left^.Left^.Data);
  TapAssertTrue(Self, 'Tree with many more items', true, tree^.Left^.Left^.Left <> nil);
  TapAssertTrue(Self, 'Tree with many more items', 'g', tree^.Left^.Left^.Left^.Data);
  TapAssertTrue(Self, 'Tree with many more items', true, tree^.Left^.Left^.Left^.Left = nil);
  TapAssertTrue(Self, 'Tree with many more items', true, tree^.Left^.Left^.Left^.Right = nil);
  TapAssertTrue(Self, 'Tree with many more items', true, tree^.Left^.Left^.Right <> nil);
  TapAssertTrue(Self, 'Tree with many more items', 'h', tree^.Left^.Left^.Right^.Data);
  TapAssertTrue(Self, 'Tree with many more items', true, tree^.Left^.Left^.Right^.Left = nil);
  TapAssertTrue(Self, 'Tree with many more items', true, tree^.Left^.Left^.Right^.Right = nil);
  TapAssertTrue(Self, 'Tree with many more items', true, tree^.Left^.Right = nil);
  TapAssertTrue(Self, 'Tree with many more items', true, tree^.Right <> nil);
  TapAssertTrue(Self, 'Tree with many more items', 'c', tree^.Right^.Data);
  TapAssertTrue(Self, 'Tree with many more items', true, tree^.Right^.Left <> nil);
  TapAssertTrue(Self, 'Tree with many more items', 'e', tree^.Right^.Left^.Data);
  TapAssertTrue(Self, 'Tree with many more items', true, tree^.Right^.Left^.Left = nil);
  TapAssertTrue(Self, 'Tree with many more items', true, tree^.Right^.Left^.Right = nil);
  TapAssertTrue(Self, 'Tree with many more items', true, tree^.Right^.Right <> nil);
  TapAssertTrue(Self, 'Tree with many more items', 'f', tree^.Right^.Right^.Data);
  TapAssertTrue(Self, 'Tree with many more items', true, tree^.Right^.Right^.Left <> nil);
  TapAssertTrue(Self, 'Tree with many more items', 'i', tree^.Right^.Right^.Left^.Data);
  TapAssertTrue(Self, 'Tree with many more items', true, tree^.Right^.Right^.Left^.Left = nil);
  TapAssertTrue(Self, 'Tree with many more items', true, tree^.Right^.Right^.Left^.Right = nil);
  TapAssertTrue(Self, 'Tree with many more items', true, tree^.Right^.Right^.Right = nil);
  FreeTree(tree);
end;

initialization
RegisterTest(SatelliteTest);

end.
