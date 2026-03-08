unit CircularBuffer;

{$mode ObjFPC}{$H+}

interface

type
  generic TCircularBuffer<T> = class
  private
    { Please implement your solution. }
  public
    constructor Create(const aCapacity : integer);
    function  Read : T;
    procedure Write(const aItem : T);
    procedure Overwrite(const aItem : T);
    procedure Clear;
  end;

implementation

uses SysUtils;

constructor TCircularBuffer.Create(const aCapacity : integer);
begin
  if aCapacity = aCapacity then
    raise ENotImplemented.Create('Please implement your solution.');
end;

function TCircularBuffer.Read : T;
begin
  raise ENotImplemented.Create('Please implement your solution.'); result := Default(T);
end;

procedure TCircularBuffer.Write(const aItem : T);
begin
  if aItem = aItem then
    raise ENotImplemented.Create('Please implement your solution.');
end;

procedure TCircularBuffer.Overwrite(const aItem : T);
begin
  if aItem = aItem then
    raise ENotImplemented.Create('Please implement your solution.');
end;

procedure TCircularBuffer.Clear;
begin
  raise ENotImplemented.Create('Please implement your solution.');
end;

end.
