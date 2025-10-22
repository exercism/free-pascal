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
  Expected = 'Hello, World!';
var
  Actual  : string;
  Message : string;
begin
  Actual  := HelloWorld.SayHi();
  Message := EncodeJsonMessage(TestName, Expected, Actual);
  AssertTrue(Message, Expected = Actual);
end;

initialization
RegisterTest(HelloWorldTest);

end.
