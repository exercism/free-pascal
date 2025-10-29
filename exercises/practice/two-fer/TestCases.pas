unit TestCases;

{$mode ObjFPC}{$H+}

interface

uses Classes, SysUtils, FPCUnit, TestRegistry, FPCUnitTestUtils;

type
  TwoFerTest = class(TTestCase)
  published
    procedure no_name_given;
    procedure a_name_given;
    procedure another_name_given;
  end;

implementation

uses TwoFer;

// 1cf3e15a-a3d7-4a87-aeb3-ba1b43bc8dce
procedure TwoFerTest.no_name_given;
const expected = 'One for you, one for me.';
var
  actual  : string;
  message : string;
begin
  actual  := TwoFer.TwoFer('');
  message := EncodeJsonMessage('no name given', expected, actual);
  AssertTrue(message, expected = actual);
end;

// b4c6dbb8-b4fb-42c2-bafd-10785abe7709
procedure TwoFerTest.a_name_given;
const expected = 'One for Alice, one for me.';
var
  actual  : string;
  message : string;
begin
  actual  := TwoFer.TwoFer('Alice');
  message := EncodeJsonMessage('a name given', expected, actual);
  AssertTrue(message, expected = actual);
end;

// 3549048d-1a6e-4653-9a79-b0bda163e8d5
procedure TwoFerTest.another_name_given;
const expected = 'One for Bob, one for me.';
var
  actual  : string;
  message : string;
begin
  actual  := TwoFer.TwoFer('Bob');
  message := EncodeJsonMessage('another name given', expected, actual);
  AssertTrue(message, expected = actual);
end;

initialization
RegisterTest(TwoFerTest);

end.
