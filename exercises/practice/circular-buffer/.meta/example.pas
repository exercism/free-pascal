unit CircularBuffer;

{$mode ObjFPC}{$H+}

interface

type
  generic TCircularBuffer<T> = class
  private
    fData     : array of T;
    fCapacity : integer;
    fSize     : integer;
    fWritePos : integer;
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
  fCapacity := aCapacity;
  fSize     := 0;
  fWritePos := 0;
  SetLength(fData, aCapacity);
end;

function TCircularBuffer.Read : T;
var
  readPos : integer;
begin
  if fSize = 0 then
    raise Exception.Create('buffer is empty');

  readPos := (fWritePos + fCapacity - fSize) mod fCapacity;
  result  := fData[readPos];
  Dec(fSize);
end;

procedure TCircularBuffer.Write(const aItem : T);
begin
  if fSize = fCapacity then
    raise Exception.Create('buffer is full');

  fData[fWritePos] := aItem;
  fWritePos        := (fWritePos + 1) mod fCapacity;
  Inc(fSize);
end;

procedure TCircularBuffer.Overwrite(const aItem : T);
begin
  if fSize = fCapacity then
    Dec(fSize);

  Write(aItem);
end;

procedure TCircularBuffer.Clear;
begin
  fSize := 0;
end;

end.
