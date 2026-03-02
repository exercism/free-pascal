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

function measure(bucketOne, bucketTwo, goal : UInt64; startBucket: BucketId) : TResult;
begin
  raise ENotImplemented.Create('Please implement your solution.');
  result.moves := bucketOne + bucketTwo;
  result.goalBucket := startBucket;
  result.otherBucket := goal;
end;

end.
