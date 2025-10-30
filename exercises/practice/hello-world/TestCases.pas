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

// af9ffe10-dc13-42d8-a742-e7bdafac449d
procedure HelloWorldTest.SayHi;
begin
  TapAssertTrue(Self, 'Say Hi!', 'Hello, World!', HelloWorld.SayHi());
end;

initialization
RegisterTest(HelloWorldTest);

end.
