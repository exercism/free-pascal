unit TestCases;

{$mode ObjFPC}{$H+}

interface

uses Classes, SysUtils, FPCUnit, TestRegistry, FPCUnitTestUtils;

type
  ResistorColorDuoTest = class(TTestCase)
  published
    procedure brown_and_black;
    procedure blue_and_grey;
    procedure yellow_and_violet;
    procedure white_and_red;
    procedure orange_and_orange;
    procedure ignore_additional_colors;
    procedure black_and_brown_one_digit;
  end;

implementation

uses ResistorColorDuo;

// ce11995a-5b93-4950-a5e9-93423693b2fc
procedure ResistorColorDuoTest.brown_and_black;
const expected = 10;
var
  actual  : int8;
  message : string;
begin
  actual  := ResistorColorDuo.value(['brown', 'black']);
  message := EncodeJsonMessage('Brown and black', expected, actual);
  AssertTrue(message, expected = actual);
end;

// 7bf82f7a-af23-48ba-a97d-38d59406a920
procedure ResistorColorDuoTest.blue_and_grey;
const expected = 68;
var
  actual  : int8;
  message : string;
begin
  actual  := ResistorColorDuo.value(['blue', 'grey']);
  message := EncodeJsonMessage('Blue and grey', expected, actual);
  AssertTrue(message, expected = actual);
end;

// f1886361-fdfd-4693-acf8-46726fe24e0c
procedure ResistorColorDuoTest.yellow_and_violet;
const expected = 47;
var
  actual  : int8;
  message : string;
begin
  actual  := ResistorColorDuo.value(['yellow', 'violet']);
  message := EncodeJsonMessage('Yellow and violet', expected, actual);
  AssertTrue(message, expected = actual);
end;

// b7a6cbd2-ae3c-470a-93eb-56670b305640
procedure ResistorColorDuoTest.white_and_red;
const expected = 92;
var
  actual  : int8;
  message : string;
begin
  actual  := ResistorColorDuo.value(['white', 'red']);
  message := EncodeJsonMessage('White and red', expected, actual);
  AssertTrue(message, expected = actual);
end;

// 77a8293d-2a83-4016-b1af-991acc12b9fe
procedure ResistorColorDuoTest.orange_and_orange;
const expected = 33;
var
  actual  : int8;
  message : string;
begin
  actual  := ResistorColorDuo.value(['orange', 'orange']);
  message := EncodeJsonMessage('Orange and orange', expected, actual);
  AssertTrue(message, expected = actual);
end;

// 0c4fb44f-db7c-4d03-afa8-054350f156a8
procedure ResistorColorDuoTest.ignore_additional_colors;
const expected = 51;
var
  actual  : int8;
  message : string;
begin
  actual  := ResistorColorDuo.value(['green', 'brown', 'orange']);
  message := EncodeJsonMessage('Ignore additional colors', expected, actual);
  AssertTrue(message, expected = actual);
end;

// 4a8ceec5-0ab4-4904-88a4-daf953a5e818
procedure ResistorColorDuoTest.black_and_brown_one_digit;
const expected = 1;
var
  actual  : int8;
  message : string;
begin
  actual  := ResistorColorDuo.value(['black', 'brown']);
  message := EncodeJsonMessage('Black and brown, one-digit', expected, actual);
  AssertTrue(message, expected = actual);
end;

initialization
RegisterTest(ResistorColorDuoTest);

end.
