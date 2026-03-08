unit Satellite;

{$mode ObjFPC}{$H+}

interface

type
  TStrArray = Array of String;

  PNode = ^TNode;

  TNode = record
    Data  : string;
    Left  : PNode;
    Right : PNode;
  end;

function treeFromTraversals(const preorder, inorder : TStrArray) : PNode;

implementation

uses SysUtils;

function treeFromTraversals(const preorder, inorder : TStrArray) : PNode;
var
  preIndex, inIndex : integer;

  function contains(const haystack : TStrArray; aFrom, aTo : integer;
                    const needle : string) : boolean;
  var
    k : integer;
  begin
    for k := aFrom to aTo do
      if haystack[k] = needle then
        exit(true);

    result := false;
  end;

  procedure validate;
  var
    i : integer;
  begin
    for i := Low(preorder) to High(preorder) do
      if contains(preorder, 0, i - 1, preorder[i]) then
        raise Exception.Create('traversals must contain unique items');

    for i := Low(inorder) to High(inorder) do
      if contains(inorder, 0, i - 1, inorder[i]) then
        raise Exception.Create('traversals must contain unique items');

    if Length(preorder) <> Length(inorder) then
      raise Exception.Create('traversals must have the same length');

    for i := Low(inorder) to High(inorder) do
      if not contains(preorder, Low(preorder), High(preorder), inorder[i]) then
        raise Exception.Create('traversals must have the same elements');
  end;

  function build(const stopBefore : string) : PNode;
  begin
    if (inIndex > High(inorder)) or (inorder[inIndex] = stopBefore) then
      exit(nil);

    New(result);
    result^.Data  := preorder[preIndex];
    Inc(preIndex);
    result^.Left  := build(result^.Data);
    Inc(inIndex);
    result^.Right := build(stopBefore);
  end;

begin
  validate;

  if Length(preorder) = 0 then
    exit(nil);

  preIndex := 0;
  inIndex  := 0;
  result := build('');
end;

end.
