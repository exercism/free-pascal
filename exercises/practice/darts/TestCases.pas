unit TestCases;

{$mode ObjFPC}{$H+}

interface

uses Classes, SysUtils, FPCUnit, TestRegistry, FPCUnitTestUtils;

type
  DartsTest = class(TTestCase)
  published
    procedure missed_target;
    procedure on_the_outer_circle;
    procedure on_the_middle_circle;
    procedure on_the_inner_circle;
    procedure exactly_on_center;
    procedure near_the_center;
    procedure just_within_the_inner_circle;
    procedure just_outside_the_inner_circle;
    procedure just_within_the_middle_circle;
    procedure just_outside_the_middle_circle;
    procedure just_within_the_outer_circle;
    procedure just_outside_the_outer_circle;
    procedure asymmetric_position_between_the_inner_and_middle_circles;
  end;

implementation

uses Darts;

var message : string;

// 9033f731-0a3a-4d9c-b1c0-34a1c8362afb
procedure DartsTest.missed_target;
const expected = 0;
var actual : single;
begin
  actual  := Darts.score(-9, 9);
  message := EncodeJsonMessage('Missed target', expected, actual);
end;

// 4c9f6ff4-c489-45fd-be8a-1fcb08b4d0ba
procedure DartsTest.on_the_outer_circle;
const expected = 1;
var actual : single;
begin
  actual  := Darts.score(0, 10);
  message := EncodeJsonMessage('On the outer circle', expected, actual);
end;

// 14378687-ee58-4c9b-a323-b089d5274be8
procedure DartsTest.on_the_middle_circle;
const expected = 5;
var actual : single;
begin
  actual  := Darts.score(-5, 0);
  message := EncodeJsonMessage('On the middle circle', expected, actual);
  AssertTrue(message, expected = actual);
end;

// 849e2e63-85bd-4fed-bc3b-781ae962e2c9
procedure DartsTest.on_the_inner_circle;
const expected = 10;
var actual : single;
begin
  actual  := Darts.score(0, -1);
  message := EncodeJsonMessage('On the inner circle', expected, actual);
  AssertTrue(message, expected = actual);
end;

// 1c5ffd9f-ea66-462f-9f06-a1303de5a226
procedure DartsTest.exactly_on_center;
const expected = 10;
var actual : single;
begin
  actual  := Darts.score(0, 0);
  message := EncodeJsonMessage('Exactly on center', expected, actual);
  AssertTrue(message, expected = actual);
end;

// b65abce3-a679-4550-8115-4b74bda06088
procedure DartsTest.near_the_center;
const expected = 10;
var actual : single;
begin
  actual  := Darts.score(-0.1, -0.1);
  message := EncodeJsonMessage('Near the center', expected, actual);
  AssertTrue(message, expected = actual);
end;

// 66c29c1d-44f5-40cf-9927-e09a1305b399
procedure DartsTest.just_within_the_inner_circle;
const expected = 10;
var actual : single;
begin
  actual  := Darts.score(0.7, 0.7);
  message := EncodeJsonMessage('Just within the inner circle', expected, actual);
  AssertTrue(message, expected = actual);
end;

// d1012f63-c97c-4394-b944-7beb3d0b141a
procedure DartsTest.just_outside_the_inner_circle;
const expected = 5;
var actual : single;
begin
  actual  := Darts.score(0.8, -0.8);
  message := EncodeJsonMessage('Just outside the inner circle', expected, actual);
  AssertTrue(message, expected = actual);
end;

// ab2b5666-b0b4-49c3-9b27-205e790ed945
procedure DartsTest.just_within_the_middle_circle;
const expected = 5;
var actual : single;
begin
  actual  := Darts.score(-3.5, 3.5);
  message := EncodeJsonMessage('Just within the middle circle', expected, actual);
  AssertTrue(message, expected = actual);
end;

// 70f1424e-d690-4860-8caf-9740a52c0161
procedure DartsTest.just_outside_the_middle_circle;
const expected = 1;
var actual : single;
begin
  actual  := Darts.score(-3.6, -3.6);
  message := EncodeJsonMessage('Just outside the middle circle', expected, actual);
  AssertTrue(message, expected = actual);
end;

// a7dbf8db-419c-4712-8a7f-67602b69b293
procedure DartsTest.just_within_the_outer_circle;
const expected = 1;
var actual : single;
begin
  actual  := Darts.score(-7.0, 7.0);
  message := EncodeJsonMessage('Just within the outer circle', expected, actual);
  AssertTrue(message, expected = actual);
end;

// e0f39315-9f9a-4546-96e4-a9475b885aa7
procedure DartsTest.just_outside_the_outer_circle;
const expected = 0;
var actual : single;
begin
  actual  := Darts.score(7.1, -7.1);
  message := EncodeJsonMessage('Just outside the outer circle', expected, actual);
  AssertTrue(message, expected = actual);
end;

// 045d7d18-d863-4229-818e-b50828c75d19
procedure DartsTest.asymmetric_position_between_the_inner_and_middle_circles;
const expected = 5;
var actual : single;
begin
  actual  := Darts.score(0.5, -4);
  message := EncodeJsonMessage('Asymmetric position between the inner and middle circles', expected, actual);
  AssertTrue(message, expected = actual);
end;

initialization
RegisterTest(DartsTest);

end.
