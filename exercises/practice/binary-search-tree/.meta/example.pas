unit BinarySearchTree;

{$mode ObjFPC}{$H+}

interface

type
  TIntArray = Array of Integer;

  TNode = class
    Data  : Integer;
    Left  : TNode;
    Right : TNode;
    constructor Create(const aData : Integer);
    destructor Destroy; override;
  end;

  TBinarySearchTree = class
  private
    fRoot : TNode;
  public
    constructor Create;
    destructor Destroy; override;
    procedure Insert(const aValue : Integer);
    function  SortedData : TIntArray;
    property  Root : TNode read fRoot;
  end;

implementation

{ TNode }

constructor TNode.Create(const aData : Integer);
begin
  Data  := aData;
  Left  := nil;
  Right := nil;
end;

destructor TNode.Destroy;
begin
  Left.Free;
  Right.Free;
  inherited;
end;

{ TBinarySearchTree }

constructor TBinarySearchTree.Create;
begin
  fRoot := nil;
end;

destructor TBinarySearchTree.Destroy;
begin
  fRoot.Free;
  inherited;
end;

procedure TBinarySearchTree.Insert(const aValue : Integer);

  procedure InsertNode(var aNode : TNode);
  begin
    if aNode = nil then
      aNode := TNode.Create(aValue)
    else if aValue <= aNode.Data then
      InsertNode(aNode.Left)
    else
      InsertNode(aNode.Right);
  end;

begin
  InsertNode(fRoot);
end;

function TBinarySearchTree.SortedData : TIntArray;

  procedure InOrder(const aNode : TNode);
  begin
    if aNode = nil then
      exit;

    InOrder(aNode.Left);
    System.Insert(aNode.Data, result, Length(result));
    InOrder(aNode.Right);
  end;

begin
  result := [];
  InOrder(fRoot);
end;

end.
