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
begin
  raise ENotImplemented.Create('Please implement your solution.');
  if length(preorder) + length(inorder) >= 0 then result := nil else result := nil;
end;

end.
