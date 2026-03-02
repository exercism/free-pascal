unit TestCases;

{$mode ObjFPC}{$H+}

interface

uses Classes, SysUtils, FPCUnit, TestRegistry, FPCUnitTestUtils;

type
  TwoBucketTest = class(TTestCase)
  published
    procedure measure_using_bucket_one_of_size_3_and_bucket_two_of_size_5___start_with_bucket_one;
    procedure measure_using_bucket_one_of_size_3_and_bucket_two_of_size_5___start_with_bucket_two;
    procedure measure_using_bucket_one_of_size_7_and_bucket_two_of_size_11___start_with_bucket_one;
    procedure measure_using_bucket_one_of_size_7_and_bucket_two_of_size_11___start_with_bucket_two;
    procedure measure_one_step_using_bucket_one_of_size_1_and_bucket_two_of_size_3___start_with_bucket_two;
    procedure measure_using_bucket_one_of_size_2_and_bucket_two_of_size_3___start_with_bucket_one_and_end_with_bucket_two;
    procedure measure_using_bucket_one_much_bigger_than_bucket_two;
    procedure measure_using_bucket_one_much_smaller_than_bucket_two;
    procedure not_possible_to_reach_the_goal;
    procedure with_the_same_buckets_but_a_different_goal_then_it_is_possible;
    procedure goal_larger_than_both_buckets_is_impossible;
  end;

implementation

uses TwoBucket;

procedure TapAssertExpectionMessage(
  ACase                      : TTestCase ;
  const AMessage             : string    ;
  const expected             : string    ;
  bucketOne, bucketTwo, goal : UInt64    ;
  startBucket                : BucketId
);
var
  JsonMsg : string;
  actual  : string;
begin
  actual := '';
  try
    TwoBucket.measure(bucketOne, bucketTwo, goal, startBucket)
  except
    on E: Exception do actual := E.Message;
  end;
  JsonMsg := EncodeJsonMessage(AMessage, expected, actual);
  ACase.AssertTrue(JsonMsg, expected = actual);
end;

// a6f2b4ba-065f-4dca-b6f0-e3eee51cb661
procedure TwoBucketTest.measure_using_bucket_one_of_size_3_and_bucket_two_of_size_5___start_with_bucket_one;
var
  result : TResult;
begin
  result := TwoBucket.measure(3, 5, 1, One);
  TapAssertTrue(Self, 'Measure using bucket one of size 3 and bucket two of size 5 - start with bucket one', 4, result.moves);
  TapAssertTrue(Self, 'Measure using bucket one of size 3 and bucket two of size 5 - start with bucket one', true, result.goalBucket = one);
  TapAssertTrue(Self, 'Measure using bucket one of size 3 and bucket two of size 5 - start with bucket one', 5, result.otherBucket);
end;

// 6c4ea451-9678-4926-b9b3-68364e066d40
procedure TwoBucketTest.measure_using_bucket_one_of_size_3_and_bucket_two_of_size_5___start_with_bucket_two;
var
  result : TResult;
begin
  result := TwoBucket.measure(3, 5, 1, Two);
  TapAssertTrue(Self, 'Measure using bucket one of size 3 and bucket two of size 5 - start with bucket two', 8, result.moves);
  TapAssertTrue(Self, 'Measure using bucket one of size 3 and bucket two of size 5 - start with bucket two', true, result.goalBucket = two);
  TapAssertTrue(Self, 'Measure using bucket one of size 3 and bucket two of size 5 - start with bucket two', 3, result.otherBucket);
end;

// 3389f45e-6a56-46d5-9607-75aa930502ff
procedure TwoBucketTest.measure_using_bucket_one_of_size_7_and_bucket_two_of_size_11___start_with_bucket_one;
var
  result : TResult;
begin
  result := TwoBucket.measure(7, 11, 2, One);
  TapAssertTrue(Self, 'Measure using bucket one of size 7 and bucket two of size 11 - start with bucket one', 14, result.moves);
  TapAssertTrue(Self, 'Measure using bucket one of size 7 and bucket two of size 11 - start with bucket one', true, result.goalBucket = one);
  TapAssertTrue(Self, 'Measure using bucket one of size 7 and bucket two of size 11 - start with bucket one', 11, result.otherBucket);
end;

// fe0ff9a0-3ea5-4bf7-b17d-6d4243961aa1
procedure TwoBucketTest.measure_using_bucket_one_of_size_7_and_bucket_two_of_size_11___start_with_bucket_two;
var
  result : TResult;
begin
  result := TwoBucket.measure(7, 11, 2, Two);
  TapAssertTrue(Self, 'Measure using bucket one of size 7 and bucket two of size 11 - start with bucket two', 18, result.moves);
  TapAssertTrue(Self, 'Measure using bucket one of size 7 and bucket two of size 11 - start with bucket two', true, result.goalBucket = two);
  TapAssertTrue(Self, 'Measure using bucket one of size 7 and bucket two of size 11 - start with bucket two', 7, result.otherBucket);
end;

// 0ee1f57e-da84-44f7-ac91-38b878691602
procedure TwoBucketTest.measure_one_step_using_bucket_one_of_size_1_and_bucket_two_of_size_3___start_with_bucket_two;
var
  result : TResult;
begin
  result := TwoBucket.measure(1, 3, 3, Two);
  TapAssertTrue(Self, 'Measure one step using bucket one of size 1 and bucket two of size 3 - start with bucket two', 1, result.moves);
  TapAssertTrue(Self, 'Measure one step using bucket one of size 1 and bucket two of size 3 - start with bucket two', true, result.goalBucket = two);
  TapAssertTrue(Self, 'Measure one step using bucket one of size 1 and bucket two of size 3 - start with bucket two', 0, result.otherBucket);
end;

// eb329c63-5540-4735-b30b-97f7f4df0f84
procedure TwoBucketTest.measure_using_bucket_one_of_size_2_and_bucket_two_of_size_3___start_with_bucket_one_and_end_with_bucket_two;
var
  result : TResult;
begin
  result := TwoBucket.measure(2, 3, 3, One);
  TapAssertTrue(Self, 'Measure using bucket one of size 2 and bucket two of size 3 - start with bucket one and end with bucket two', 2, result.moves);
  TapAssertTrue(Self, 'Measure using bucket one of size 2 and bucket two of size 3 - start with bucket one and end with bucket two', true, result.goalBucket = two);
  TapAssertTrue(Self, 'Measure using bucket one of size 2 and bucket two of size 3 - start with bucket one and end with bucket two', 2, result.otherBucket);
end;

// 58d70152-bf2b-46bb-ad54-be58ebe94c03
procedure TwoBucketTest.measure_using_bucket_one_much_bigger_than_bucket_two;
var
  result : TResult;
begin
  result := TwoBucket.measure(5, 1, 2, One);
  TapAssertTrue(Self, 'Measure using bucket one much bigger than bucket two', 6, result.moves);
  TapAssertTrue(Self, 'Measure using bucket one much bigger than bucket two', true, result.goalBucket = one);
  TapAssertTrue(Self, 'Measure using bucket one much bigger than bucket two', 1, result.otherBucket);
end;

// 9dbe6499-caa5-4a58-b5ce-c988d71b8981
procedure TwoBucketTest.measure_using_bucket_one_much_smaller_than_bucket_two;
var
  result : TResult;
begin
  result := TwoBucket.measure(3, 15, 9, One);
  TapAssertTrue(Self, 'Measure using bucket one much smaller than bucket two', 6, result.moves);
  TapAssertTrue(Self, 'Measure using bucket one much smaller than bucket two', true, result.goalBucket = two);
  TapAssertTrue(Self, 'Measure using bucket one much smaller than bucket two', 0, result.otherBucket);
end;

// 449be72d-b10a-4f4b-a959-ca741e333b72
procedure TwoBucketTest.not_possible_to_reach_the_goal;
begin
  TapAssertExpectionMessage(Self, 'Not possible to reach the goal', 'impossible', 6, 15, 5, One);
end;

// aac38b7a-77f4-4d62-9b91-8846d533b054
procedure TwoBucketTest.with_the_same_buckets_but_a_different_goal_then_it_is_possible;
var
  result : TResult;
begin
  result := TwoBucket.measure(6, 15, 9, One);
  TapAssertTrue(Self, 'With the same buckets but a different goal, then it is possible', 10, result.moves);
  TapAssertTrue(Self, 'With the same buckets but a different goal, then it is possible', true, result.goalBucket = two);
  TapAssertTrue(Self, 'With the same buckets but a different goal, then it is possible', 0, result.otherBucket);
end;

// 74633132-0ccf-49de-8450-af4ab2e3b299
procedure TwoBucketTest.goal_larger_than_both_buckets_is_impossible;
begin
  TapAssertExpectionMessage(Self, 'Goal larger than both buckets is impossible', 'impossible', 5, 7, 8, One);
end;

initialization
RegisterTest(TwoBucketTest);

end.
