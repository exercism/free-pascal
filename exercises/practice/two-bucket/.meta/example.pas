unit TwoBucket;

{$mode ObjFPC}{$H+}

interface

type
  BucketId = (One, Two);

  TResult = record
    moves: UInt64;
    goalBucket: BucketId;
    otherBucket: UInt64;
  end;

function measure(bucketOne, bucketTwo, goal : UInt64; startBucket: BucketId) : TResult;

implementation

uses SysUtils;

function GCD(a, b : UInt64) : UInt64;
var
  c : UInt64;
begin
  c := a mod b;
  while c <> 0 do
    begin
      a := b;
      b := c;
      c := a mod b;
    end;
  result := b;
end;

function measure(bucketOne, bucketTwo, goal : UInt64; startBucket: BucketId) : TResult;
var
  capacitySource : UInt64;
  capacitySink : UInt64;
  contentsSource : UInt64 = 0;
  contentsSink : UInt64 = 0;
  transfer : UInt64;
begin
  if ((goal > bucketOne) and (goal > bucketTwo)) or (goal mod GCD(bucketOne, bucketTwo) <> 0) then
    raise ENotImplemented.Create('impossible');

  result.moves := 0;
  if startBucket = One then
    begin
      capacitySource := bucketOne;
      capacitySink := bucketTwo;
    end
  else
    begin
      capacitySource := bucketTwo;
      capacitySink := bucketOne;
    end;

  while (contentsSource <> goal) and (contentsSink <> goal) do
    begin
      result.moves := result.moves + 1;
      if contentsSource = 0 then
        contentsSource := capacitySource
      else if contentsSink = capacitySink then
        contentsSink := 0
      else if capacitySink = goal then
        contentsSink := capacitySink
      else
        begin
          if contentsSource + contentsSink < capacitySink then
            transfer := contentsSource
          else
            transfer := capacitySink - contentsSink;
          contentsSource := contentsSource - transfer;
          contentsSink := contentsSink + transfer;
        end;
    end;

  if contentsSource = goal then
    begin
      if startBucket = One then
        result.goalBucket := One
      else
        result.goalBucket := Two;
      result.otherBucket := contentsSink;
    end
  else
    begin
      if startBucket = One then
        result.goalBucket := Two
      else
        result.goalBucket := One;
      result.otherBucket := contentsSource;
    end;
end;

end.
