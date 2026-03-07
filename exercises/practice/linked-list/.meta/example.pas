unit LinkedList;

{$mode ObjFPC}{$H+}

interface

type
  TLinkedList = class
  private
    type
      TNode = class
        Value : Integer;
        Prev  : TNode;
        Next  : TNode;
        constructor Create(const aValue : Integer);
      end;
    var
      fSentinel : TNode;
    function RemoveNode(const aNode : TNode) : Integer;
  public
    constructor Create;
    destructor Destroy; override;
    procedure Push(const aValue : Integer);
    function  Pop: Integer;
    procedure Unshift(const aValue : Integer);
    function  Shift: Integer;
    procedure Delete(const aValue : Integer);
    function  Count: Integer;
  end;

implementation

uses SysUtils;

{ TLinkedList.TNode }

constructor TLinkedList.TNode.Create(const aValue : Integer);
begin
  Value := aValue;
  Prev  := nil;
  Next  := nil;
end;

{ TLinkedList }

constructor TLinkedList.Create;
begin
  fSentinel      := TNode.Create(0);
  fSentinel.Next := fSentinel;
  fSentinel.Prev := fSentinel;
end;

destructor TLinkedList.Destroy;
var
  current, next : TNode;
begin
  current := fSentinel.Next;
  while current <> fSentinel do
    begin
      next := current.Next;
      current.Free;
      current := next;
    end;
  fSentinel.Free;
  inherited;
end;

procedure TLinkedList.Push(const aValue : Integer);
var
  node : TNode;
begin
  node                := TNode.Create(aValue);
  node.Prev           := fSentinel.Prev;
  node.Next           := fSentinel;
  fSentinel.Prev.Next := node;
  fSentinel.Prev      := node;
end;

function TLinkedList.RemoveNode(const aNode : TNode) : Integer;
begin
  result          := aNode.Value;
  aNode.Prev.Next := aNode.Next;
  aNode.Next.Prev := aNode.Prev;
  aNode.Free;
end;

function TLinkedList.Pop: Integer;
begin
  if fSentinel.Prev = fSentinel then
    raise Exception.Create('empty list');
  result := RemoveNode(fSentinel.Prev);
end;

procedure TLinkedList.Unshift(const aValue : Integer);
var
  node : TNode;
begin
  node                := TNode.Create(aValue);
  node.Next           := fSentinel.Next;
  node.Prev           := fSentinel;
  fSentinel.Next.Prev := node;
  fSentinel.Next      := node;
end;

function TLinkedList.Shift: Integer;
begin
  if fSentinel.Next = fSentinel then
    raise Exception.Create('empty list');
  result := RemoveNode(fSentinel.Next);
end;

procedure TLinkedList.Delete(const aValue : Integer);
var
  current : TNode;
begin
  current := fSentinel.Next;
  while current <> fSentinel do
    begin
      if current.Value = aValue then
        begin
          RemoveNode(current);
          exit;
        end;
      current := current.Next;
    end;
end;

function TLinkedList.Count: Integer;
var
  current : TNode;
begin
  result  := 0;
  current := fSentinel.Next;
  while current <> fSentinel do
    begin
      result  := result + 1;
      current := current.Next;
    end;
end;

end.
