unit TestCases;

{$mode ObjFPC}{$H+}

interface

uses Classes, SysUtils, FPCUnit, TestRegistry, FPCUnitTestUtils;

type
  SquareRootTest = class(TTestCase)
  published
    procedure root_of_1;
    procedure root_of_4;
    procedure root_of_25;
    procedure root_of_81;
    procedure root_of_196;
    procedure root_of_65025;
  end;

implementation

uses SquareRoot;

var message : string;

// 9b748478-7b0a-490c-b87a-609dacf631fd
procedure SquareRootTest.root_of_1;
const expected = 1;
var actual : integer;
begin
  actual  := SquareRoot.SquareRoot(1);
  message := EncodeJsonMessage('root of 1', expected, actual);
  AssertTrue(message, expected = actual);
end;

// 7d3aa9ba-9ac6-4e93-a18b-2e8b477139bb
procedure SquareRootTest.root_of_4;
const expected = 2;
var actual : integer;
begin
  actual  := SquareRoot.SquareRoot(4);
  message := EncodeJsonMessage('root of 4', expected, actual);
  AssertTrue(message, expected = actual);
end;

// 6624aabf-3659-4ae0-a1c8-25ae7f33c6ef
procedure SquareRootTest.root_of_25;
const expected = 5;
var actual : integer;
begin
  actual  := SquareRoot.SquareRoot(25);
  message := EncodeJsonMessage('root of 25', expected, actual);
  AssertTrue(message, expected = actual);
end;

// 93beac69-265e-4429-abb1-94506b431f81
procedure SquareRootTest.root_of_81;
const expected = 9;
var actual : integer;
begin
  actual  := SquareRoot.SquareRoot(81);
  message := EncodeJsonMessage('root of 81', expected, actual);
  AssertTrue(message, expected = actual);
end;

// fbddfeda-8c4f-4bc4-87ca-6991af35360e
procedure SquareRootTest.root_of_196;
const expected = 14;
var actual : integer;
begin
  actual  := SquareRoot.SquareRoot(196);
  message := EncodeJsonMessage('root of 196', expected, actual);
  AssertTrue(message, expected = actual);
end;

// c03d0532-8368-4734-a8e0-f96a9eb7fc1d
procedure SquareRootTest.root_of_65025;
const expected = 255;
var actual : integer;
begin
  actual  := SquareRoot.SquareRoot(65025);
  message := EncodeJsonMessage('root of 65025', expected, actual);
  AssertTrue(message, expected = actual);
end;

initialization
RegisterTest(SquareRootTest);

end.
