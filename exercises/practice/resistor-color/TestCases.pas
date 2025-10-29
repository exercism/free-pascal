unit TestCases;

{$mode ObjFPC}{$H+}

interface

uses Classes, SysUtils, FPCUnit, TestRegistry, FPCUnitTestUtils;

type
  ResistorColorTest = class(TTestCase)
  published
    procedure black;
    procedure white;
    procedure orange;
    procedure colors;
  end;

implementation

uses ResistorColor;

type
  TStrArray = Array Of String;

var message : string;

// 49eb31c5-10a8-4180-9f7f-fea632ab87ef
procedure ResistorColorTest.black;
const expected = 0;
var actual : int8;
begin
  actual  := ResistorColor.ColorCode('black');
  message := EncodeJsonMessage('Black', expected, actual);
  AssertTrue(message, expected = actual);
end;

// 0a4df94b-92da-4579-a907-65040ce0b3fc
procedure ResistorColorTest.white;
const expected = 9;
var actual : int8;
begin
  actual  := ResistorColor.ColorCode('white');
  message := EncodeJsonMessage('White', expected, actual);
  AssertTrue(message, expected = actual);
end;

// 5f81608d-f36f-4190-8084-f45116b6f380
procedure ResistorColorTest.orange;
const expected = 3;
var actual : int8;
begin
  actual  := ResistorColor.ColorCode('orange');
  message := EncodeJsonMessage('Orange', expected, actual);
  AssertTrue(message, expected = actual);
end;

// 581d68fa-f968-4be2-9f9d-880f2fb73cf7
procedure ResistorColorTest.colors;
const expected : TStrArray = ('black', 'brown', 'red', 'orange', 'yellow', 'green', 'blue', 'violet', 'grey', 'white');
var actual : TStrArray;
begin
  actual  := ResistorColor.colors;
  message := EncodeJsonMessage('Colors', expected, actual);
  AssertTrue(message, CompareArrays(expected, actual));
end;

initialization
RegisterTest(ResistorColorTest);

end.
