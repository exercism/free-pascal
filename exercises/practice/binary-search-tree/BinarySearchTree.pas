unit BinarySearchTree;

{$mode ObjFPC}{$H+}

interface

type
  TIntArray = Array of Integer;

  TNode = class
    Data  : Integer;
    Left  : TNode;
    Right : TNode;
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

uses SysUtils;

constructor TBinarySearchTree.Create;
begin
  raise ENotImplemented.Create('Please implement your solution.');
end;

destructor TBinarySearchTree.Destroy;
begin
  raise ENotImplemented.Create('Please implement your solution.');
  inherited;
end;

procedure TBinarySearchTree.Insert(const aValue : Integer);
begin
  if aValue = aValue then
    raise ENotImplemented.Create('Please implement your solution.');
end;

function TBinarySearchTree.SortedData : TIntArray;
begin
  raise ENotImplemented.Create('Please implement your solution.');
  result := [];
end;

end.
