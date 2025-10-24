unit TestCases;

{$mode ObjFPC}{$H+}

interface

uses Classes, SysUtils, FPCUnit, TestRegistry, FPCUnitTestUtils;

type
  GigasecondTest = class(TTestCase)
  published
    procedure date_only_specification_of_time;
    procedure second_test_for_date_only_specification_of_time;
    procedure third_test_for_date_only_specification_of_time;
    procedure full_time_specified;
    procedure full_time_with_day_roll_over;
  end;

implementation

uses Gigasecond;

var message : string;

procedure GigasecondTest.date_only_specification_of_time;
const expected = '2043-01-01T01:46:40';
var actual : string;
begin
  // 92fbe71c-ea52-4fac-bd77-be38023cacf7
  actual  := Gigasecond.add('2011-04-25');
  message := EncodeJsonMessage('date only specification of time', expected, actual);
  AssertTrue(message, expected = actual);
end;

procedure GigasecondTest.second_test_for_date_only_specification_of_time;
const expected = '2009-02-19T01:46:40';
var actual : string;
begin
  // 6d86dd16-6f7a-47be-9e58-bb9fb2ae1433
  actual  := Gigasecond.add('1977-06-13');
  message := EncodeJsonMessage('second test for date only specification of time', expected, actual);
  AssertTrue(message, expected = actual);
end;

procedure GigasecondTest.third_test_for_date_only_specification_of_time;
const expected = '1991-03-27T01:46:40';
var actual : string;
begin
  // 77eb8502-2bca-4d92-89d9-7b39ace28dd5
  actual  := Gigasecond.add('1959-07-19');
  message := EncodeJsonMessage('third test for date only specification of time', expected, actual);
  AssertTrue(message, expected = actual);
end;

procedure GigasecondTest.full_time_specified;
const expected = '2046-10-02T23:46:40';
var actual : string;
begin
  // c9d89a7d-06f8-4e28-a305-64f1b2abc693
  actual  := Gigasecond.add('2015-01-24T22:00:00');
  message := EncodeJsonMessage('full time specified', expected, actual);
  AssertTrue(message, expected = actual);
end;

procedure GigasecondTest.full_time_with_day_roll_over;
const expected = '2046-10-03T01:46:39';
var actual : string;
begin
  // 09d4e30e-728a-4b52-9005-be44a58d9eba
  actual  := Gigasecond.add('2015-01-24T23:59:59');
  message := EncodeJsonMessage('full time with day roll-over', expected, actual);
  AssertTrue(message, expected = actual);
end;

initialization
RegisterTest(GigasecondTest);

end.
