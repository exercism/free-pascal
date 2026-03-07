unit LinkedList;

{$mode ObjFPC}{$H+}

interface

type
  TLinkedList = class
  private
    { Please implement your solution. }
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

constructor TLinkedList.Create;
begin
  raise ENotImplemented.Create('Please implement your solution.');
end;

destructor TLinkedList.Destroy;
begin
  raise ENotImplemented.Create('Please implement your solution.');
  inherited;
end;

procedure TLinkedList.Push(const aValue : Integer);
begin
  if aValue = aValue then
    raise ENotImplemented.Create('Please implement your solution.');
end;

function TLinkedList.Pop: Integer;
begin
  raise ENotImplemented.Create('Please implement your solution.');
  result := 0;
end;

procedure TLinkedList.Unshift(const aValue : Integer);
begin
  if aValue = aValue then
    raise ENotImplemented.Create('Please implement your solution.');
end;

function TLinkedList.Shift: Integer;
begin
  raise ENotImplemented.Create('Please implement your solution.');
  result := 0;
end;

procedure TLinkedList.Delete(const aValue : Integer);
begin
  if aValue = aValue then
    raise ENotImplemented.Create('Please implement your solution.');
end;

function TLinkedList.Count: Integer;
begin
  raise ENotImplemented.Create('Please implement your solution.');
  result := 0;
end;

end.
