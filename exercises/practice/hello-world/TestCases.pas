unit TestCases;

{$mode ObjFPC}{$H+}

interface

uses Classes, SysUtils, FPCUnit, TestRegistry, FPCUnitTestUtils;

type
  HelloWorldTest = class(TTestCase)
  published
    procedure SayHi;
  end;

implementation

uses HelloWorld;

procedure HelloWorldTest.SayHi;
const
  expected = 'Hello, World!';
var
  actual  : string;
  message : string;
begin
  // af9ffe10-dc13-42d8-a742-e7bdafac449d
  actual  := HelloWorld.SayHi();
  message := EncodeJsonMessage('Say Hi!', expected, actual);
  AssertTrue(message, expected = actual);
end;

initialization
RegisterTest(HelloWorldTest);

end.
